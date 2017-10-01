/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.superlogic.songcommunityfactory.message;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Diego
 */
public class SuccessMessage {

    private final Map<String, String> params = new HashMap<>();

    private final String message;

    public SuccessMessage(String successMessage) {
        this.message = successMessage;
    }
    
    public SuccessMessage(String successMessage, Object key, Object param) {
        this.message = successMessage;
        params.put(key.toString(), param.toString());
    }
    
    public SuccessMessage(String successMessage, List<String> params) {
        this.message = successMessage;
        params.forEach((param) -> {
            params.add(param);
        });
    }

    public void add(Object key, Object param) {
        params.put(key.toString(), param.toString());
    }

    public Map<String, String> getParams() {
        return params;
    }

    public String getSuccessMessage() {
        return message;
    }

}
