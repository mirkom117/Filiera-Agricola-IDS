package it.unicam.cs.ids.filieraagricola.test.service;

import it.unicam.cs.ids.filieraagricola.model.Content;
import it.unicam.cs.ids.filieraagricola.model.ContentState;
import it.unicam.cs.ids.filieraagricola.service.ContentService;
import it.unicam.cs.ids.filieraagricola.service.exception.NotFoundException;
import it.unicam.cs.ids.filieraagricola.service.exception.ValidationException;
import org.junit.jupiter.api.*;

import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Unit tests for {@link ContentService}.
 *
 * <p>Covers creation, approval/rejection workflow, queries (find, pending, rejected, social),
 * counts, and validation with proper exceptions.</p>
 */
@DisplayName("ContentService Tests")
class ContentServiceTest {

    private ContentService service;

    @BeforeEach
    void setUp() {
        service = new ContentService();
    }

    @Test
    @DisplayName("createContent validates and stores new PENDING content")
    void createContent_validatesAndStores() {
        Content c = service.createContent("T", "D");
        assertAll(
                () -> assertNotNull(c.getId()),
                () -> assertEquals(ContentState.PENDING, c.getState()),
                () -> assertEquals(1, service.getAllContents().size())
        );
    }

    @Test
    @DisplayName("createContent rejects null/blank name or description")
    void createContent_invalidArgs_throwValidationException() {
        assertAll(
                () -> assertThrows(ValidationException.class, () -> service.createContent(null, "d")),
                () -> assertThrows(ValidationException.class, () -> service.createContent(" ", "d")),
                () -> assertThrows(ValidationException.class, () -> service.createContent("n", null)),
                () -> assertThrows(ValidationException.class, () -> service.createContent("n", " "))
        );
    }

    @Test
    @DisplayName("approveContentById transitions PENDING->APPROVED and returns flags")
    void approveContentById_transitionsAndFlags() {
        Content c = service.createContent("T", "D");
        boolean changed = service.approveContentById(c.getId());
        assertTrue(changed);
        assertEquals(ContentState.APPROVED,
                service.findContentById(c.getId()).orElseThrow().getState());

        // idempotent
        assertFalse(service.approveContentById(c.getId()));
    }

    @Test
    @DisplayName("approveContentById validates id and throws NotFound when missing")
    void approveContentById_validationAndNotFound() {
        assertAll(
                () -> assertThrows(ValidationException.class, () -> service.approveContentById(null)),
                () -> assertThrows(ValidationException.class, () -> service.approveContentById(" ")),
                () -> assertThrows(NotFoundException.class, () -> service.approveContentById("missing"))
        );
    }

    @Test
    @DisplayName("rejectContentById transitions PENDING->REJECTED and returns flags")
    void rejectContentById_transitionsAndFlags() {
        Content c = service.createContent("T", "D");
        boolean changed = service.rejectContentById(c.getId());
        assertTrue(changed);
        assertEquals(ContentState.REJECTED,
                service.findContentById(c.getId()).orElseThrow().getState());

        // idempotent
        assertFalse(service.rejectContentById(c.getId()));
    }

    @Test
    @DisplayName("rejectContentById validates id and throws NotFound when missing")
    void rejectContentById_validationAndNotFound() {
        assertAll(
                () -> assertThrows(ValidationException.class, () -> service.rejectContentById(null)),
                () -> assertThrows(ValidationException.class, () -> service.rejectContentById(" ")),
                () -> assertThrows(NotFoundException.class, () -> service.rejectContentById("missing"))
        );
    }

    @Test
    @DisplayName("showSocialContent returns only APPROVED contents")
    void showSocialContent_returnsApprovedOnly() {
        Content a = service.createContent("A", "D");
        Content b = service.createContent("B", "D");
        service.approveContentById(a.getId());
        List<Content> result = service.showSocialContent();
        assertAll(
                () -> assertEquals(1, result.size()),
                () -> assertEquals(ContentState.APPROVED, result.get(0).getState())
        );
    }

    @Test
    @DisplayName("findContentById validates id and returns Optional")
    void findContentById_validatesAndReturnsOptional() {
        Content c = service.createContent("T", "D");
        Optional<Content> found = service.findContentById(c.getId());
        assertTrue(found.isPresent());
        assertThrows(ValidationException.class, () -> service.findContentById(null));
    }

    @Test
    @DisplayName("countContentsByState counts correctly and validates non-null state")
    void countContentsByState_countsAndValidates() {
        service.createContent("A", "D");
        service.createContent("B", "D");
        assertEquals(2, service.countContentsByState(ContentState.PENDING));
        assertThrows(NullPointerException.class, () -> service.countContentsByState(null));
    }

    @Test
    @DisplayName("getPendingContent and getRejectedContent filter correctly")
    void pendingAndRejected_filters() {
        Content p = service.createContent("P", "D");
        Content r = service.createContent("R", "D");
        service.rejectContentById(r.getId());
        assertAll(
                () -> assertEquals(1, service.getPendingContent().size()),
                () -> assertEquals(1, service.getRejectedContent().size())
        );
    }

    @Test
    @DisplayName("getAllContents returns an unmodifiable snapshot")
    void getAllContents_returnsSnapshot() {
        service.createContent("T", "D");
        List<Content> list = service.getAllContents();
        assertEquals(1, list.size());
    }
}