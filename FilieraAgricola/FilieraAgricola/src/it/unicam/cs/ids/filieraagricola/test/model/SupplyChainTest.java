package it.unicam.cs.ids.filieraagricola.test.model;

import it.unicam.cs.ids.filieraagricola.model.Product;
import it.unicam.cs.ids.filieraagricola.model.SupplyChain;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Unit tests for {@link SupplyChain} domain model.
 *
 * <p>This test class verifies constructors, getters/setters, copy behavior,
 * equals/hashCode, and toString contract. The model is intentionally simple
 * and focuses on data representation; business logic is covered in the
 * corresponding service tests.</p>
 */
@DisplayName("SupplyChain Model Tests")
class SupplyChainTest {

    private SupplyChain base;
    private List<Product> products;

    @BeforeEach
    void setUp() {
        products = new ArrayList<>();
        products.add(new Product());
        base = new SupplyChain("Local Chain", products);
    }

    @Test
    @DisplayName("Default constructor initializes id, products list, and creation date")
    void defaultConstructor_initializesFields() {
        SupplyChain sc = new SupplyChain();
        assertAll(
                () -> assertNotNull(sc.getId()),
                () -> assertNotNull(sc.getProducts()),
                () -> assertNotNull(sc.getCreationDate())
        );
    }

    @Test
    @DisplayName("Main constructor sets name, description default, products copy, and area default")
    void mainConstructor_setsFields() {
        SupplyChain sc = new SupplyChain("Terra Viva", products);
        assertAll(
                () -> assertEquals("Terra Viva", sc.getName()),
                () -> assertEquals("Supply chain for Terra Viva", sc.getDescription()),
                () -> assertEquals(1, sc.getProducts().size()),
                () -> assertEquals("default", sc.getTerritorialArea())
        );
        assertNotSame(products, sc.getProducts(), "Products list should be copied defensively");
    }

    @Test
    @DisplayName("Full constructor accepts explicit values and normalizes id when null/blank is replaced earlier")
    void fullConstructor_acceptsExplicitValues() {
        LocalDateTime now = LocalDateTime.now();
        SupplyChain sc = new SupplyChain(null, "Chain", "Desc", products, now, "Area");
        assertAll(
                () -> assertNotNull(sc.getId()),
                () -> assertEquals("Chain", sc.getName()),
                () -> assertEquals("Desc", sc.getDescription()),
                () -> assertEquals(now, sc.getCreationDate()),
                () -> assertEquals("Area", sc.getTerritorialArea()),
                () -> assertEquals(1, sc.getProducts().size())
        );
    }

    @Test
    @DisplayName("Copy constructor creates distinct instance with same data and copies list")
    void copyConstructor_createsDefensiveCopy() {
        SupplyChain copy = new SupplyChain(base);
        assertAll(
                () -> assertEquals(base.getId(), copy.getId()),
                () -> assertEquals(base.getName(), copy.getName()),
                () -> assertEquals(base.getDescription(), copy.getDescription()),
                () -> assertEquals(base.getCreationDate(), copy.getCreationDate()),
                () -> assertEquals(base.getTerritorialArea(), copy.getTerritorialArea()),
                () -> assertNotSame(base, copy),
                () -> assertNotSame(base.getProducts(), copy.getProducts()),
                () -> assertEquals(base.getProducts().size(), copy.getProducts().size())
        );
    }

    @Test
    @DisplayName("Getters and setters update and return fields correctly")
    void gettersSetters_workAsExpected() {
        SupplyChain sc = new SupplyChain();
        sc.setId("id");
        sc.setName("name");
        sc.setDescription("desc");
        sc.setProducts(products);
        LocalDateTime ts = LocalDateTime.now();
        sc.setCreationDate(ts);
        sc.setTerritorialArea("area");

        assertAll(
                () -> assertEquals("id", sc.getId()),
                () -> assertEquals("name", sc.getName()),
                () -> assertEquals("desc", sc.getDescription()),
                () -> assertEquals(1, sc.getProducts().size()),
                () -> assertEquals(ts, sc.getCreationDate()),
                () -> assertEquals("area", sc.getTerritorialArea())
        );
    }

    @Test
    @DisplayName("equals/hashCode are based on id")
    void equalsHashCode_basedOnId() {
        SupplyChain a = new SupplyChain("A", products);
        SupplyChain b = new SupplyChain(a);
        assertAll(
                () -> assertEquals(a, b),
                () -> assertEquals(a.hashCode(), b.hashCode())
        );
    }

    @Test
    @DisplayName("toString contains key fields")
    void toString_containsKeyFields() {
        String s = base.toString();
        assertAll(
                () -> assertTrue(s.contains("SupplyChain{")),
                () -> assertTrue(s.contains("id='")),
                () -> assertTrue(s.contains("name='Local Chain'"))
        );
    }
}

