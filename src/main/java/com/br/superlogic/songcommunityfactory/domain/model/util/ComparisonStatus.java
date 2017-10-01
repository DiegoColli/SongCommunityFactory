
package com.br.superlogic.songcommunityfactory.domain.model.util;

import java.io.Serializable;

/**
 *
 * @author Diego
 */
public enum ComparisonStatus implements Serializable
{
    
    EQUAL("EQUAL", 0), UNIQUE("UNIQUE", 1), DIFFERENT_NAME("DIFFERENT_NAME", 2), DIFFERENT_CONTENT("DIFFERENT_CONTENT", 3), REVERSE_UNIQUE("REVERSE_UNIQUE", 4);

    private String name;
    private int value;

    private ComparisonStatus(String name, int value) {
        this.name = name;
        this.value = value;
    }

    public static ComparisonStatus getSearchType(int value) {
        for (ComparisonStatus st : values()) {
            if (st.value == value) {
                return st;
            }
        }
        throw new IllegalArgumentException("Invalide value: " + value + " for ResourceComparisonStatus");
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return Integer.toString(this.getValue());
    }
}
