package it.unicam.cs.ids.filieraagricola.services;

import it.unicam.cs.ids.filieraagricola.model.Content;
import it.unicam.cs.ids.filieraagricola.model.ContentState;
import it.unicam.cs.ids.filieraagricola.model.ContentType;
import it.unicam.cs.ids.filieraagricola.model.repositories.ContentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ContentService {

    @Autowired
    private ContentRepository contents;


    /**
     * Returns the list of certifications held by this producer.
     *
     * @return defensive copy of certifications list
     */
    public List<Content> getContents() {
        return contents.findAll();
    }

    /**
     * Adds a certification to this producer's certifications.
     *
     * @param certification certification to add (must not be null or empty)
     * @throws IllegalArgumentException if certification is null or empty
     */
    public void addContent(String name, String certification, ContentType type) {
        if (certification == null || certification.trim().isEmpty()) {
            throw new IllegalArgumentException("Certification cannot be null or empty");
        }
        String normalizedCert = certification.trim();
        Content content = new Content(null, name, normalizedCert, ContentState.PENDING);
        content.setType(type);
        contents.save(content);
    }
    /**
     * Deletes a content by id if present.
     *
     * @return true if removed, false otherwise
     */
    public boolean removeContent(String id) {
        Content content = getContent(id);
        if (content == null) {
            return false;
        }
        contents.delete(content);
        return true;
    }


    /**
     * Checks if this producer has any certifications.
     *
     * @return true if the producer has at least one certification
     */
    public boolean hasCertifications() {
        return contents.count() > 0;
    }

    /**
     * Checks if this producer has a specific certification.
     *
     * @param certification certification to check for
     * @return true if the producer has the specified certification
     */
    public boolean hasCertification(Content certification) {
        if (certification == null) return false;
        return contents.findById(certification.getId()).isPresent();
    }

    /** Returns a content by id or null if not found. */
    public Content getContent(String id) {
        Optional<Content> opt = contents.findById(id);
        if (opt.isPresent()) {
            return opt.get();
        }
        return null;
    }

}