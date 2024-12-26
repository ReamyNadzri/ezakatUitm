/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author wafi
 */
public class Family extends Student {
    private String familyName;
    private String familyPhone;
    private String familyAddress;
    private String guardianName;
    private String guardianPhone;
    private String guardianAddress;
    private double grossIncome;

    public Family(String studentID, String matricNo, String password, String name, String email, String phoneNum, String sem, String courseName, String courseCode, String academicLvl, String campus, String adminID) {
        super(studentID, matricNo, password, name, email, phoneNum, sem, courseName, courseCode, academicLvl, campus, adminID);
    }

    

    // Constructor
    /*\public Family(String studentID, String name, String email, String phoneNum,
                  String familyName, String familyPhone, String familyAddress,
                  String guardianName, String guardianPhone, String guardianAddress, double grossIncome) {
        super(studentID, name, email, phoneNum); // Call the Student superclass constructor
        this.familyName = familyName;
        this.familyPhone = familyPhone;
        this.familyAddress = familyAddress;
        this.guardianName = guardianName;
        this.guardianPhone = guardianPhone;
        this.guardianAddress = guardianAddress;
        this.grossIncome = grossIncome;
    }*/

    // Getters and Setters for Family class
    public String getFamilyName() {
        return familyName;
    }

    public void setFamilyName(String familyName) {
        this.familyName = familyName;
    }

    public String getFamilyPhone() {
        return familyPhone;
    }

    public void setFamilyPhone(String familyPhone) {
        this.familyPhone = familyPhone;
    }

    public String getFamilyAddress() {
        return familyAddress;
    }

    public void setFamilyAddress(String familyAddress) {
        this.familyAddress = familyAddress;
    }

    public String getGuardianName() {
        return guardianName;
    }

    public void setGuardianName(String guardianName) {
        this.guardianName = guardianName;
    }

    public String getGuardianPhone() {
        return guardianPhone;
    }

    public void setGuardianPhone(String guardianPhone) {
        this.guardianPhone = guardianPhone;
    }

    public String getGuardianAddress() {
        return guardianAddress;
    }

    public void setGuardianAddress(String guardianAddress) {
        this.guardianAddress = guardianAddress;
    }

    public double getGrossIncome() {
        return grossIncome;
    }

    public void setGrossIncome(double grossIncome) {
        this.grossIncome = grossIncome;
    }

    // Overridden toString method
    @Override
    public String toString() {
        return "Family{" +
                "studentID='" + getStudentID() + '\'' + // Correct method names
                ", name='" + getName() + '\'' +
                ", email='" + getEmail() + '\'' +
                ", phoneNum='" + getPhoneNum() + '\'' +
                ", familyName='" + getFamilyName() + '\'' +
                ", familyPhone='" + getFamilyPhone() + '\'' +
                ", familyAddress='" + getFamilyAddress() + '\'' +
                ", guardianName='" + getGuardianName() + '\'' +
                ", guardianPhone='" + getGuardianPhone() + '\'' +
                ", guardianAddress='" + getGuardianAddress() + '\'' +
                ", grossIncome=" + getGrossIncome() +
                '}';
    }
}