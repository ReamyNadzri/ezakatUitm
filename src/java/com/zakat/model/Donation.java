package com.zakat.model;

public class Donation {
    
    private int donateID;
    private String bankname;
    private double amount;
    private String donationdate;
    private String note;
    private String donationStatus;

    public Donation() {
    }
    
    public Donation(String bankname, String note, double amount) {
        this.bankname = bankname;
        this.note = note;
        this.amount = amount;
    }
    
//    public Donation(int donateID, String bankname, double amount, String donationdate,String note, String donationStatus) {
//        this.donateID = donateID;
//        this.bankname = bankname;
//        this.amount = amount;
//        this.donationdate = donationdate;
//        this.note = note;
//        this.donationStatus = donationStatus;
//    }

    /**
     * @return the donateID
     */
    public int getDonateID() {
        return donateID;
    }

    /**
     * @param donateID the donateID to set
     */
    public void setDonateID(int donateID) {
        this.donateID = donateID;
    }

    /**
     * @return the bankname
     */
    public String getBankname() {
        return bankname;
    }

    /**
     * @param bankname the bankname to set
     */
    public void setBankname(String bankname) {
        this.bankname = bankname;
    }

    /**
     * @return the amount
     */
    public double getAmount() {
        return amount;
    }

    /**
     * @param amount the amount to set
     */
    public void setAmount(double amount) {
        this.amount = amount;
    }

    /**
     * @return the donationdate
     */
    public String getDonationdate() {
        return donationdate;
    }

    /**
     * @param donationdate the donationdate to set
     */
    public void setDonationdate(String donationdate) {
        this.donationdate = donationdate;
    }

    /**
     * @return the note
     */
    public String getNote() {
        return note;
    }

    /**
     * @param note the note to set
     */
    public void setNote(String note) {
        this.note = note;
    }

    /**
     * @return the donationStatus
     */
    public String getDonationStatus() {
        return donationStatus;
    }

    /**
     * @param donationStatus the donationStatus to set
     */
    public void setDonationStatus(String donationStatus) {
        this.donationStatus = donationStatus;
    }
    
//    @Override
//    public String toString() {
//        return "{" +
//            " doanteId='" + getdonateID() + "'" +
//            ", amount='" + getAmount() + "'" +
//            ", donationDate='" + getDonationDate() + "'" +
//            ", donationStatus='" + getDonationStatus() + "'" +
//            ", others='" + getOthers() + "'" +
//            "}";
//    }
    
}
