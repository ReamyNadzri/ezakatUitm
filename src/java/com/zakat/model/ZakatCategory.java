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
public class ZakatCategory {
    private String zakatID;
    private String zakatName;
    private String description;
    
    
    // Constructor
    public ZakatCategory() {
        this.zakatID = "";
        this.zakatName = "";
        this.description = "";
        
    }
    

    // Constructor
    public ZakatCategory(String zakatID, String zakatName, String description) {
        this.zakatID = zakatID;
        this.zakatName = zakatName;
        this.description = description;
        
    }
    

    // Getters and Setters
    public String getZakatID() {
        return zakatID;
    }

    public void setZakatID(String zakatID) {
        this.zakatID = zakatID;
    }

    public String getZakatName() {
        return zakatName;
    }

    public void setZakatName(String zakatName) {
        this.zakatName = zakatName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
