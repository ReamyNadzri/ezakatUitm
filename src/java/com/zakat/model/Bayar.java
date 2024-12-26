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
public class Bayar {
    private String bank;
    private Double amaun;
    private String tarikh;
    private String lainlain;
    
    public Bayar (String bank, Double amaun, String tarikh, String lainlain)
    {
        this.bank = bank;
        this.amaun = amaun;
        this.tarikh = tarikh;
        this.lainlain = lainlain;
    }
    
    
    /**
     * @return the bank
     */
    public String getBank() {
        return bank;
    }

    /**
     * @param bank the bank to set
     */
    public void setBank(String bank) {
        this.bank = bank;
    }

    /**
     * @return the amaun
     */
    public Double getAmaun() {
        return amaun;
    }

    /**
     * @param amaun the amaun to set
     */
    public void setAmaun(Double amaun) {
        this.amaun = amaun;
    }

    /**
     * @return the tarikh
     */
    public String getTarikh() {
        return tarikh;
    }

    /**
     * @param tarikh the tarikh to set
     */
    public void setTarikh(String tarikh) {
        this.tarikh = tarikh;
    }

    /**
     * @return the lainlain
     */
    public String getLainlain() {
        return lainlain;
    }

    /**
     * @param lainlain the lainlain to set
     */
    public void setLainlain(String lainlain) {
        this.lainlain = lainlain;
    }
    
    
}
