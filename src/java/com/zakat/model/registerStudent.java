/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zakat.model;

import java.io.Serializable;
/**
 *
 * @author asyraf
 */
public class registerStudent implements Serializable {

    private String matricNumber;
    private String name;
    private String icNumber;
    private String courseCode;
    private String campus;
    private String phoneNumber;
    private String email;
    private String password;
   
    public registerStudent(String matricNumber, String name, String icNumber, String courseCode, String campus, String phoneNumber, String email, String password) {
        this.matricNumber = matricNumber;
        this.name = name;
        this.icNumber = icNumber;
        this.courseCode = courseCode;
        this.campus = campus;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.password = password;
    }

    // Getter methods for each property
    
    public String getMatricNumber() {
        return matricNumber;
    }
    
    public String getName() {
        return name;
    }


    public String getIcNumber() {
        return icNumber;
    }
    
     public String getCourseCode() {
        return courseCode;
    }
     
     public String getCampus() {
        return campus;
    }
    
     public String getPhoneNumber() {
        return phoneNumber;
    }
     
     public String getEmail() {
        return email;
    }
     
     public String getPassword() {
        return password;
    }
}
