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
public class ZakatKolej extends ZakatCategory {
    private String kolejName;
    private double totalKolej;
    private String electronicAppliance;
    private String kolejDoc;

    public ZakatKolej() {
        kolejName = "";
        totalKolej = 0;
        electronicAppliance = "";
        kolejDoc = "";
    }

    public ZakatKolej(String zakatID, String zakatName, String description, String kolejName, double totalKolej, String electronicAppliance, String kolejDoc) {
        super(zakatID, zakatName, description);
        this.kolejName = kolejName;
        this.totalKolej = totalKolej;
        this.electronicAppliance = electronicAppliance;
        this.kolejDoc = kolejDoc;
    }

    public String getKolejName() {
        return this.kolejName;
    }

    public void setKolejName(String kolejName) {
        this.kolejName = kolejName;
    }

    public double getTotalKolej() {
        return this.totalKolej;
    }

    public void setTotalKolej(double totalKolej) {
        this.totalKolej = totalKolej;
    }

    public String getElectronicAppliance() {
        return this.electronicAppliance;
    }

    public void setElectronicAppliance(String electronicAppliance) {
        this.electronicAppliance = electronicAppliance;
    }

    public String getKolejDoc() {
        return this.kolejDoc;
    }

    public void setKolejDoc(String kolejDoc) {
        this.kolejDoc = kolejDoc;
    }

    @Override
    public String toString() {
        return "{" +
            " kolejName='" + getKolejName() + "'" +
            ", totalKolej='" + getTotalKolej() + "'" +
            ", electronicAppliance='" + getElectronicAppliance() + "'" +
            ", kolejDoc='" + getKolejDoc() + "'" +
            "}";
    }



    
}