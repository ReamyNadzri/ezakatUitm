/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zakat.model;

/**
 *
 * @author user
 */
public class ZakatMakanan extends ZakatCategory {
    private String cafe;

    public ZakatMakanan() {
    }

    public ZakatMakanan(String zakatID, String zakatName, String description, String cafe) {
        super(zakatID, zakatName, description);
        this.cafe = cafe;
    }

    public String getCafe() {
        return this.cafe;
    }

    public void setCafe(String cafe) {
        this.cafe = cafe;
    }

    @Override
    public String toString() {
        return "{" +
            " cafe='" + getCafe() + "'" +
            "}";
    }
    
    

    
    
}
