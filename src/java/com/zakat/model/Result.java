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
public class Result {
    private String resultID;
    private String resultDate;
    private String resultStatus;
    private double total;

    public Result() {
    }

    public Result(String resultID, String resultDate, String resultStatus, double total) {
        this.resultID = resultID;
        this.resultDate = resultDate;
        this.resultStatus = resultStatus;
        this.total = total;
    }

    public String getResultID() {
        return this.resultID;
    }

    public void setResultID(String resultID) {
        this.resultID = resultID;
    }

    public String getResultDate() {
        return this.resultDate;
    }

    public void setResultDate(String resultDate) {
        this.resultDate = resultDate;
    }

    public String getResultStatus() {
        return this.resultStatus;
    }

    public void setResultStatus(String resultStatus) {
        this.resultStatus = resultStatus;
    }

    public double getTotal() {
        return this.total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "{" +
            " resultID='" + getResultID() + "'" +
            ", resultDate='" + getResultDate() + "'" +
            ", resultStatus='" + getResultStatus() + "'" +
            ", total='" + getTotal() + "'" +
            "}";
    }
}
    
