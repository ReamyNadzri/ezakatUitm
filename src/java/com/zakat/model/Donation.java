package com.zakat.model;

public class Donation {
    
    private String doanteId;
    private double amount;
    private String donationDate;
    private String donationStatus;
    private String others;

    public Donation() {
    }

    public Donation(String doanteId, double amount, String donationDate, String donationStatus, String others) {
        this.doanteId = doanteId;
        this.amount = amount;
        this.donationDate = donationDate;
        this.donationStatus = donationStatus;
        this.others = others;
    }


    public String getDoanteId() {
        return this.doanteId;
    }

    public void setDoanteId(String doanteId) {
        this.doanteId = doanteId;
    }

    public double getAmount() {
        return this.amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getDonationDate() {
        return this.donationDate;
    }

    public void setDonationDate(String donationDate) {
        this.donationDate = donationDate;
    }

    public String getDonationStatus() {
        return this.donationStatus;
    }

    public void setDonationStatus(String donationStatus) {
        this.donationStatus = donationStatus;
    }

    public String getOthers() {
        return this.others;
    }

    public void setOthers(String others) {
        this.others = others;
    }
    @Override
    public String toString() {
        return "{" +
            " doanteId='" + getDoanteId() + "'" +
            ", amount='" + getAmount() + "'" +
            ", donationDate='" + getDonationDate() + "'" +
            ", donationStatus='" + getDonationStatus() + "'" +
            ", others='" + getOthers() + "'" +
            "}";
    }


}
