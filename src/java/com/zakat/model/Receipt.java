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

public class Receipt {
    private String receiptID;
    private String receiptDate;
    private double amount;

    public Receipt() {
    }

    public Receipt(String receiptID, String receiptDate, double amount) {
        this.receiptID = receiptID;
        this.receiptDate = receiptDate;
        this.amount = amount;
    }

    public String getReceiptID() {
        return this.receiptID;
    }

    public void setReceiptID(String receiptID) {
        this.receiptID = receiptID;
    }

    public String getReceiptDate() {
        return this.receiptDate;
    }

    public void setReceiptDate(String receiptDate) {
        this.receiptDate = receiptDate;
    }

    public double getAmount() {
        return this.amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }
    

    @Override
    public String toString() {
        return "{" +
            " receiptID='" + getReceiptID() + "'" +
            ", receiptDate='" + getReceiptDate() + "'" +
            ", amount='" + getAmount() + "'" +
            "}";
    }

   
}
