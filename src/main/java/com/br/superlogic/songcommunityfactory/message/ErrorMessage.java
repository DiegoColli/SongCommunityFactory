/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.superlogic.songcommunityfactory.message;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Diego
 */
public class ErrorMessage {

    private final List<String> errors = new ArrayList<>();

    private final String message;

    public ErrorMessage(String errorMessage) {
        this.message = errorMessage;
    }

    public void add(String error) {
        errors.add(error);
    }

    public List<String> getErrors() {
        return errors;
    }

    public String getErrorMessage() {
        return message;
    }

}
