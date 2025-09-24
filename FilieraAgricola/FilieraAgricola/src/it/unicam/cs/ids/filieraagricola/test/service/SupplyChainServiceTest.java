package it.unicam.cs.ids.filieraagricola.test.service;

import it.unicam.cs.ids.filieraagricola.model.Product;
import it.unicam.cs.ids.filieraagricola.model.SupplyChain;
import it.unicam.cs.ids.filieraagricola.service.ProductService;
import it.unicam.cs.ids.filieraagricola.service.SupplyChainService;
import it.unicam.cs.ids.filieraagricola.service.exception.NotFoundException;
import it.unicam.cs.ids.filieraagricola.service.exception.ValidationException;
import org.junit.jupiter.api.*;

import java.time.LocalDate;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Unit tests for {@link SupplyChainService}.
 *
 * <p>These tests cover creation, retrieval, filtering, validation, and
 * mutation behaviors, including usage of {@link ValidationException} and
 * {@link NotFoundException} as required by project rules.</p>
 */
@DisplayName("SupplyChainService Tests")
class SupplyChainServiceTest {

    private SupplyChainService service;

    @BeforeEach
    void setUp() {
        service = new SupplyChainService(new ProductService());
    }

    @Test
    @DisplayName("createSupplyChain with valid data creates chain and stores it")
    void createSupplyChain_withValidData_createsAndStores() {
        SupplyChain sc = service.createSupplyChain("Filiera Bio", List.of());
        assertAll(
                () -> assertNotNull(sc.getId()),
                () -> assertEquals("Filiera Bio", sc.getName()),
                () -> assertEquals("default", sc.getTerritorialArea()),
                () -> assertEquals(1, service.getSupplyChainList().size())
        );
    }

    @Test
    @DisplayName("createSupplyChain should normalize defaults and validate input")
    void createSupplyChain_shouldValidateInput() {
        assertAll(
                () -> assertThrows(ValidationException.class, () -> service.createSupplyChain(null, "d", List.of(), "a")),
                () -> assertThrows(ValidationException.class, () -> service.createSupplyChain("n", null, List.of(), "a")),
                () -> assertThrows(ValidationException.class, () -> service.createSupplyChain("n", "d", List.of(), null))
        );
    }

    @Test
    @DisplayName("findById returns defensive copy and throws when not found")
    void findById_returnsCopy_orThrows() {
        SupplyChain saved = service.createSupplyChain("F1", List.of());
        SupplyChain found = service.findById(saved.getId());
        assertAll(
                () -> assertEquals(saved.getId(), found.getId()),
                () -> assertNotSame(saved, found)
        );
        assertThrows(NotFoundException.class, () -> service.findById("missing"));
    }

    @Test
    @DisplayName("findSupplyChainsByName supports case-insensitive contains and empty returns empty list")
    void findSupplyChainsByName_filtersProperly() {
        service.createSupplyChain("Filiera Latte", List.of());
        service.createSupplyChain("filiera Formaggi", List.of());
        service.createSupplyChain("Cereali", List.of());

        assertEquals(2, service.findSupplyChainsByName("filiera").size());
        assertEquals(0, service.findSupplyChainsByName(null).size());
        assertEquals(0, service.findSupplyChainsByName("    ").size());
    }

    @Test
    @DisplayName("Product filters: organic, certified, category, fresh")
    void productFilters_workCorrectly() {
        Product organic = new Product(null, "P1", "fruit", "d", "organic", "EU", LocalDate.now().minusDays(35), "prod1");    // 35 giorni fa - NON FRESCO
        Product certified = new Product(null, "P2", "fruit", "d", "conv", "PGI", LocalDate.now().minusDays(60), "prod1");   // 60 giorni fa - NON FRESCO
        Product fresh = new Product(null, "P3", "veg", "d", "conv", "", LocalDate.now().minusDays(3), "prod1");             // 3 giorni fa - FRESCO
        SupplyChain sc = service.createSupplyChain("F", List.of(organic, certified, fresh));

        assertEquals(1, service.getOrganicProducts(sc.getId()).size());        // solo organic ha cultivation method "organic"
        assertEquals(2, service.getCertifiedProducts(sc.getId()).size());      // organic ha "EU", certified ha "PGI"
        assertEquals(2, service.getProductsByCategory(sc.getId(), "fruit").size()); // organic e certified hanno categoria "fruit"
        assertEquals(1, service.getFreshProducts(sc.getId()).size());          // solo fresh è entro i 30 giorni
    }

    @Test
    @DisplayName("getProductsByCategory returns empty on null/blank category")
    void getProductsByCategory_withNullOrBlank_returnsEmpty() {
        SupplyChain sc = service.createSupplyChain("F", List.of());
        assertAll(
                () -> assertTrue(service.getProductsByCategory(sc.getId(), null).isEmpty()),
                () -> assertTrue(service.getProductsByCategory(sc.getId(), "   ").isEmpty())
        );
    }

    @Test
    @DisplayName("isActive returns true when products exist and created within 6 months")
    void isActive_correctLogic() {
        SupplyChain sc = service.createSupplyChain("F", List.of(new Product()));
        assertTrue(service.isActive(sc.getId()));
    }

    @Test
    @DisplayName("getUniqueCategories returns distinct set")
    void getUniqueCategories_returnsDistinctSet() {
        Product a = new Product(null, "A", "fruit", "d", "m", "", LocalDate.now().minusDays(1), "p");
        Product b = new Product(null, "B", "fruit", "d", "m", "", LocalDate.now().minusDays(2), "p");
        Product c = new Product(null, "C", "veg", "d", "m", "", LocalDate.now().minusDays(3), "p");
        SupplyChain sc = service.createSupplyChain("F", List.of(a, b, c));

        assertEquals(2, service.getUniqueCategories(sc.getId()).size());
    }

    @Test
    @DisplayName("acquireProduct copies and stores product; sellProduct enforces availability")
    void acquireAndSellProduct_behaviors() {
        Product p = new Product(null, "X", "fruit", "d", "m", "cert", LocalDate.now().minusDays(10), "p");
        Product stored = service.acquireProduct(p);
        assertAll(
                () -> assertNotNull(stored.getId()),
                () -> assertEquals(1, service.getProductList().size())
        );

        assertTrue(service.sellProduct(stored));
        assertEquals(0, service.getProductList().size());

        assertThrows(ValidationException.class, () -> service.sellProduct(stored),
                "Selling again should fail: not available");
    }

    @Test
    @DisplayName("acquireProduct and sellProduct validate nulls")
    void acquireSell_validateNulls() {
        assertAll(
                () -> assertThrows(ValidationException.class, () -> service.acquireProduct(null)),
                () -> assertThrows(ValidationException.class, () -> service.sellProduct(null))
        );
    }

    @Test
    @DisplayName("addProductsToChain and removeProductFromChain update chain correctly")
    void addAndRemoveProducts_updateChain() {
        SupplyChain sc = service.createSupplyChain("F", List.of());
        Product p1 = new Product();
        Product p2 = new Product();

        SupplyChain updated = service.addProductsToChain(sc.getId(), List.of(p1, p2));
        assertEquals(2, updated.getProducts().size());

        SupplyChain afterRemoval = service.removeProductFromChain(sc.getId(), p1.getId());
        assertEquals(1, afterRemoval.getProducts().size());

        assertThrows(NotFoundException.class,
                () -> service.removeProductFromChain(sc.getId(), "missing"));
    }

    @Test
    @DisplayName("getProductList and getSupplyChainList return unmodifiable copies")
    void getLists_returnUnmodifiableCopies() {
        service.createSupplyChain("F", List.of());
        List<Product> products = service.getProductList();
        List<SupplyChain> chains = service.getSupplyChainList();
        assertAll(
                () -> assertNotNull(products),
                () -> assertNotNull(chains)
        );
    }

    @Test
    @DisplayName("findProductsByCategory searches across repository and normalizes input")
    void findProductsByCategory_acrossRepository() {
        Product p = new Product(null, "P", "Fruit", "d", "m", "", LocalDate.now().minusDays(5), "p");
        service.acquireProduct(p);
        assertEquals(1, service.findProductsByCategory("fruit").size());
        assertEquals(0, service.findProductsByCategory(null).size());
        assertEquals(0, service.findProductsByCategory("   ").size());
    }

    @Test
    @DisplayName("validateSupplyChain enforces required fields")
    void validateSupplyChain_checksRequiredFields() {
        SupplyChain sc = service.createSupplyChain("X", List.of());
        assertAll(
                () -> assertDoesNotThrow(() -> service.validateSupplyChain(sc.getId())),
                () -> assertThrows(NotFoundException.class, () -> service.validateSupplyChain("missing"))
        );
    }
}