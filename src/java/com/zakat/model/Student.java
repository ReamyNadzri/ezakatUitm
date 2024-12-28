package com.zakat.model;

/**
 * Represents a student with academic and personal information.
 */
public class Student{

    private String studentId;
    private String password;
    private String matricno;
    private String name;
    private String icnom;
    private String courceCode;
    private String courseName;
    private String campus;
    private String email;
    private String phoneNum;
    private String address;

    public Student() {
    }

    public Student(String studentId, String password, String matricno, String name, String icnom, String courceCode, String courseName, String campus, String email, String phoneNum, String address) {
        this.studentId = studentId;
        this.password = password;
        this.matricno = matricno;
        this.name = name;
        this.icnom = icnom;
        this.courceCode = courceCode;
        this.courseName = courseName;
        this.campus = campus;
        this.email = email;
        this.phoneNum = phoneNum;
        this.address = address;
    }

    public String getStudentId() {
        return this.studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMatricno() {
        return this.matricno;
    }

    public void setMatricno(String matricno) {
        this.matricno = matricno;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIcnom() {
        return this.icnom;
    }

    public void setIcnom(String icnom) {
        this.icnom = icnom;
    }

    public String getCourceCode() {
        return this.courceCode;
    }

    public void setCourceCode(String courceCode) {
        this.courceCode = courceCode;
    }

    public String getCourseName() {
        return this.courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getCampus() {
        return this.campus;
    }

    public void setCampus(String campus) {
        this.campus = campus;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNum() {
        return this.phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getAddress() {
        return this.address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "{" +
            " studentId='" + getStudentId() + "'" +
            ", password='" + getPassword() + "'" +
            ", matricno='" + getMatricno() + "'" +
            ", name='" + getName() + "'" +
            ", icnom='" + getIcnom() + "'" +
            ", courceCode='" + getCourceCode() + "'" +
            ", courseName='" + getCourseName() + "'" +
            ", campus='" + getCampus() + "'" +
            ", email='" + getEmail() + "'" +
            ", phoneNum='" + getPhoneNum() + "'" +
            ", address='" + getAddress() + "'" +
            "}";
    }


}