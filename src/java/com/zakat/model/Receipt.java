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
import java.util.Date;

public class Receipt {
    private String receiptID;
    private String receiptDate;
    private double amount;
    private String donatorID;  // FK
    private String zakatID;    // FK

    public Receipt(String receiptID, String receiptDate, double amount, String donatorID, String zakatID) {
        this.receiptID = receiptID;
        this.receiptDate = receiptDate;
        this.amount = amount;
        this.donatorID = donatorID;
        this.zakatID = zakatID;
    }

    // Getters and Setters
    public String getReceiptID() { return receiptID; }
    public void setReceiptID(String receiptID) { this.receiptID = receiptID; }

    public String getReceiptDate() { return receiptDate; }
    public void setReceiptDate(String receiptDate) { this.receiptDate = receiptDate; }

    public double getAmount() { return amount; }
    public void setAmount(double amount) { this.amount = amount; }

    public String getDonatorID() { return donatorID; }
    public void setDonatorID(String donatorID) { this.donatorID = donatorID; }

    public String getZakatID() { return zakatID; }
    public void setZakatID(String zakatID) { this.zakatID = zakatID; }
}
