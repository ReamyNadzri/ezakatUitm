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
public class Application {

        private String applyID;
        private String studentId;
        private String bantuanMakan;
        private String bantuanKewangan;
        private String bantuanKewanganNama;
        private String bantuanKewanganNilai;
        private int gradYear;
        private String studentLetter;
        private String transcriptDoc;
        private String icDoc;
        private String bankNo;
        private String bankName;

        ZakatCategory zakatcategory;


    public Application() {
        applyID = "";
        studentId = "";
        bantuanMakan = "";
        bantuanKewangan = "";
        bantuanKewanganNama = "";
        bantuanKewanganNilai = "";
        gradYear = 0;
        studentLetter = "";
        transcriptDoc = "";
        icDoc = "";
        bankNo = "";
        bankName = "";

        zakatcategory = new ZakatCategory();
    }

    public Application(String applyID, String studentId, String bantuanMakan, String bantuanKewangan, String bantuanKewanganNama, String bantuanKewanganNilai, int gradYear, String studentLetter, String transcriptDoc, String icDoc, String bankNo, String bankName, ZakatCategory zakatcategory) {
        
        this.applyID = applyID;
        this.studentId = studentId;
        this.bantuanMakan = bantuanMakan;
        this.bantuanKewangan = bantuanKewangan;
        this.bantuanKewanganNama = bantuanKewanganNama;
        this.bantuanKewanganNilai = bantuanKewanganNilai;
        this.gradYear = gradYear;
        this.studentLetter = studentLetter;
        this.transcriptDoc = transcriptDoc;
        this.icDoc = icDoc;
        this.bankNo = bankNo;
        this.bankName = bankName;
        this.zakatcategory = zakatcategory;
    }

    public String getApplyID() {
        return this.applyID;
    }

    public void setApplyID(String applyID) {
        this.applyID = applyID;
    }

    public String getStudentId() {
        return this.studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getBantuanMakan() {
        return this.bantuanMakan;
    }

    public void setBantuanMakan(String bantuanMakan) {
        this.bantuanMakan = bantuanMakan;
    }

    public String getBantuanKewangan() {
        return this.bantuanKewangan;
    }

    public void setBantuanKewangan(String bantuanKewangan) {
        this.bantuanKewangan = bantuanKewangan;
    }

    public String getBantuanKewanganNama() {
        return this.bantuanKewanganNama;
    }

    public void setBantuanKewanganNama(String bantuanKewanganNama) {
        this.bantuanKewanganNama = bantuanKewanganNama;
    }

    public String getBantuanKewanganNilai() {
        return this.bantuanKewanganNilai;
    }

    public void setBantuanKewanganNilai(String bantuanKewanganNilai) {
        this.bantuanKewanganNilai = bantuanKewanganNilai;
    }

    public int getGradYear() {
        return this.gradYear;
    }

    public void setGradYear(int gradYear) {
        this.gradYear = gradYear;
    }

    public String getStudentLetter() {
        return this.studentLetter;
    }

    public void setStudentLetter(String studentLetter) {
        this.studentLetter = studentLetter;
    }

    public String getTranscriptDoc() {
        return this.transcriptDoc;
    }

    public void setTranscriptDoc(String transcriptDoc) {
        this.transcriptDoc = transcriptDoc;
    }

    public String getIcDoc() {
        return this.icDoc;
    }

    public void setIcDoc(String icDoc) {
        this.icDoc = icDoc;
    }

    public String getBankNo() {
        return this.bankNo;
    }

    public void setBankNo(String bankNo) {
        this.bankNo = bankNo;
    }

    public String getBankName() {
        return this.bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    @Override
    public String toString() {
        return "{" +
            " applyID='" + getApplyID() + "'" +
            ", studentId='" + getStudentId() + "'" +
            ", bantuanMakan='" + getBantuanMakan() + "'" +
            ", bantuanKewangan='" + getBantuanKewangan() + "'" +
            ", bantuanKewanganNama='" + getBantuanKewanganNama() + "'" +
            ", bantuanKewanganNilai='" + getBantuanKewanganNilai() + "'" +
            ", gradYear='" + getGradYear() + "'" +
            ", studentLetter='" + getStudentLetter() + "'" +
            ", transcriptDoc='" + getTranscriptDoc() + "'" +
            ", icDoc='" + getIcDoc() + "'" +
            ", bankNo='" + getBankNo() + "'" +
            ", bankName='" + getBankName() + "'" +
            "}";
    }




 }




   