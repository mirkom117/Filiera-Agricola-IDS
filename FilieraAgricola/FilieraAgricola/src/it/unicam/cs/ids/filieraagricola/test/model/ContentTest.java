package it.unicam.cs.ids.filieraagricola.test.model;

import it.unicam.cs.ids.filieraagricola.model.Content;
import it.unicam.cs.ids.filieraagricola.model.ContentState;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Unit tests for {@link Content} domain model.
 *
 * <p>Verifies constructors, getters, equality, hashCode and toString behavior.
 * The model is immutable; all fields are final and set at construction time.</p>
 */
@DisplayName("Content Model Tests")
class ContentTest {

    @Nested
    @DisplayName("Constructor Tests")
    class ConstructorTests {

        /**
         * Verifies that the main constructor with auto-generated ID initializes fields correctly.
         */
        @Test
        @DisplayName("Constructor with generated ID initializes fields")
        void constructorWithGeneratedId_initializesFields() {
            Content c = new Content("Title", "Desc", ContentState.PENDING);
            assertAll(
                    () -> assertNotNull(c.getId()),
                    () -> assertEquals("Title", c.getName()),
                    () -> assertEquals("Desc", c.getDescription()),
                    () -> assertEquals(ContentState.PENDING, c.getState())
            );
        }

        /**
         * Verifies that the constructor with specified ID uses the provided ID and values.
         */
        @Test
        @DisplayName("Constructor with specified ID uses provided values")
        void constructorWithSpecifiedId_usesProvidedValues() {
            Content c = new Content("ID-1", "Name", "Text", ContentState.APPROVED);
            assertAll(
                    () -> assertEquals("ID-1", c.getId()),
                    () -> assertEquals("Name", c.getName()),
                    () -> assertEquals("Text", c.getDescription()),
                    () -> assertEquals(ContentState.APPROVED, c.getState())
            );
        }
    }

    @Nested
    @DisplayName("Equality and HashCode Tests")
    class EqualityHashCodeTests {

        /**
         * Verifies that two contents with the same ID are equal and have same hash code.
         */
        @Test
        @DisplayName("equals/hashCode based on ID")
        void equalsHashCode_basedOnId() {
            Content a = new Content("ID-1", "A", "D", ContentState.PENDING);
            Content b = new Content("ID-1", "B", "E", ContentState.APPROVED);
            assertAll(
                    () -> assertEquals(a, b),
                    () -> assertEquals(a.hashCode(), b.hashCode())
            );
        }

        /**
         * Verifies inequality for different IDs and when compared to null/different class.
         */
        @Test
        @DisplayName("Inequality for different IDs and types")
        void inequality_checks() {
            Content a = new Content("ID-A", "A", "D", ContentState.PENDING);
            Content b = new Content("ID-B", "B", "E", ContentState.PENDING);
            assertAll(
                    () -> assertNotEquals(a, b),
                    () -> assertNotEquals(a, null),
                    () -> assertNotEquals(a, "string")
            );
        }
    }

    @Nested
    @DisplayName("ToString Tests")
    class ToStringTests {

        /**
         * Verifies that toString contains key fields for debugging.
         */
        @Test
        @DisplayName("toString contains key fields")
        void toString_containsKeyFields() {
            Content c = new Content("ID-2", "Name", "Text", ContentState.REJECTED);
            String s = c.toString();
            assertAll(
                    () -> assertTrue(s.contains("Content{")),
                    () -> assertTrue(s.contains("ID-2")),
                    () -> assertTrue(s.contains("Name")),
                    () -> assertTrue(s.contains("REJECTED"))
            );
        }
    }
}