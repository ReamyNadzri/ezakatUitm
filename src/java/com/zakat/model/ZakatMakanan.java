/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author user
 */
public class ZakatMakanan extends ZakatCategory {
    private String state;
    private String city;
    private double totalAmount;

    // Constructor
    public ZakatMakanan(String zakatID, String zakatName, String description, String applyID,
                        String state, String city, double totalAmount) {
        super(zakatID, zakatName, description, applyID);
        this.state = state;
        this.city = city;
        this.totalAmount = totalAmount;
    }

    // Getters and Setters
    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    
}
