/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zakat.model;

/**
 *
 * @author wafi
 */
public class Family extends Student {

    private String studentId;
    private String name;
    private String fName;
    private String fWork;
    private String fPhoneNum;
    private String mName;
    private String mWork;
    private String mPhoneNum;
    private String guardianRelay;
    private String guardianWork;
    private String guardianPhoneNum;
    private String maritalStatus;
    private String address;
    private String postcode;
    private int grossIncomeM;
    private int grossIncomeF;

    public Family() {
    }

    public Family(String name, String studentId, String fName, String fWork, String fPhoneNum, String mName, String mWork, String mPhoneNum, String guardianRelay, String guardianWork, String guardianPhoneNum, String maritalStatus, String address, String postcode, int grossIncomeM, int grossIncomeF) {
        this.studentId = studentId;
        this.name = name;
        this.fName = fName;
        this.fWork = fWork;
        this.fPhoneNum = fPhoneNum;
        this.mName = mName;
        this.mWork = mWork;
        this.mPhoneNum = mPhoneNum;
        this.guardianRelay = guardianRelay;
        this.guardianWork = guardianWork;
        this.guardianPhoneNum = guardianPhoneNum;
        this.maritalStatus = maritalStatus;
        this.address = address;
        this.postcode = postcode;
        this.grossIncomeM = grossIncomeM;
        this.grossIncomeF = grossIncomeF;
    }

    public String getStudentId() {
        return this.studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }
    
    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public String getFName() {
        return this.fName;
    }

    public void setFName(String fName) {
        this.fName = fName;
    }

    public String getFWork() {
        return this.fWork;
    }

    public void setFWork(String fWork) {
        this.fWork = fWork;
    }

    public String getFPhoneNum() {
        return this.fPhoneNum;
    }

    public void setFPhoneNum(String fPhoneNum) {
        this.fPhoneNum = fPhoneNum;
    }

    public String getMName() {
        return this.mName;
    }

    public void setMName(String mName) {
        this.mName = mName;
    }

    public String getMWork() {
        return this.mWork;
    }

    public void setMWork(String mWork) {
        this.mWork = mWork;
    }

    public String getMPhoneNum() {
        return this.mPhoneNum;
    }

    public void setMPhoneNum(String mPhoneNum) {
        this.mPhoneNum = mPhoneNum;
    }

    public String getGuardianRelay() {
        return this.guardianRelay;
    }

    public void setGuardianRelay(String guardianRelay) {
        this.guardianRelay = guardianRelay;
    }

    public String getGuardianWork() {
        return this.guardianWork;
    }

    public void setGuardianWork(String guardianWork) {
        this.guardianWork = guardianWork;
    }

    public String getGuardianPhoneNum() {
        return this.guardianPhoneNum;
    }

    public void setGuardianPhoneNum(String guardianPhoneNum) {
        this.guardianPhoneNum = guardianPhoneNum;
    }

    public String getMaritalStatus() {
        return this.maritalStatus;
    }

    public void setMaritalStatus(String maritalStatus) {
        this.maritalStatus = maritalStatus;
    }

    public String getAddress() {
        return this.address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPostcode() {
        return this.postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public int getGrossIncomeM() {
        return this.grossIncomeM;
    }

    public void setGrossIncomeM(int grossIncomeM) {
        this.grossIncomeM = grossIncomeM;
    }

    public int getGrossIncomeF() {
        return this.grossIncomeF;
    }

    public void setGrossIncomeF(int grossIncomeF) {
        this.grossIncomeF = grossIncomeF;
    }
    
    
    @Override
    public String toString() {
        return "{" +
            " studentId='" + getStudentId() + "'" +
             " name='" + getName() + "'" +
            " fName='" + getFName() + "'" +
            ", fWork='" + getFWork() + "'" +
            ", fPhoneNum='" + getFPhoneNum() + "'" +
            ", mName='" + getMName() + "'" +
            ", mWork='" + getMWork() + "'" +
            ", mPhoneNum='" + getMPhoneNum() + "'" +
            ", guardianRelay='" + getGuardianRelay() + "'" +
            ", guardianWork='" + getGuardianWork() + "'" +
            ", guardianPhoneNum='" + getGuardianPhoneNum() + "'" +
            ", maritalStatus='" + getMaritalStatus() + "'" +
            ", address='" + getAddress() + "'" +
            ", postcode='" + getPostcode() + "'" +
            ", grossIncomeM='" + getGrossIncomeM() + "'" +
            ", grossIncomeF='" + getGrossIncomeF() + "'" +
            "}";
    }

}  

