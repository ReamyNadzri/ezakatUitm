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
public class ZakatYuran extends ZakatCategory {
    private double totalYuranAmount;
    private String yuranDoc;
    private String entrySessionDoc;

    public ZakatYuran() {
    }


    public ZakatYuran(String zakatID, String zakatName, String description, double totalYuranAmount, String yuranDoc, String entrySessionDoc) {
        super(zakatID, zakatName, description);
        this.totalYuranAmount = totalYuranAmount;
        this.yuranDoc = yuranDoc;
        this.entrySessionDoc = entrySessionDoc;
    }
    public double getTotalYuranAmount() {
        return this.totalYuranAmount;
    }

    public void setTotalYuranAmount(double totalYuranAmount) {
        this.totalYuranAmount = totalYuranAmount;
    }

    public String getYuranDoc() {
        return this.yuranDoc;
    }

    public void setYuranDoc(String yuranDoc) {
        this.yuranDoc = yuranDoc;
    }

    public String getEntrySessionDoc() {
        return this.entrySessionDoc;
    }

    public void setEntrySessionDoc(String entrySessionDoc) {
        this.entrySessionDoc = entrySessionDoc;
    }

    @Override
    public String toString() {
        return "{" +
            " totalYuranAmount='" + getTotalYuranAmount() + "'" +
            ", yuranDoc='" + getYuranDoc() + "'" +
            ", entrySessionDoc='" + getEntrySessionDoc() + "'" +
            "}";
    }

}
