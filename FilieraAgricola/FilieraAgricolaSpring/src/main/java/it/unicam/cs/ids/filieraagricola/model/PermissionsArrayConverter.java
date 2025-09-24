package it.unicam.cs.ids.filieraagricola.model;

import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Converter;

@Converter
public class PermissionsArrayConverter implements AttributeConverter<String[], String> {


    @Override
    public String convertToDatabaseColumn(String[] strings) {
        return String.join(",",strings);
    }

    @Override
    public String[] convertToEntityAttribute(String s) {
        return s.split(",");
    }
}