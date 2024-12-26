package model;

/**
 * Represents a student with academic and personal information.
 */
public class Student {
    private String studentID;
    private String matricNo;
    private String password;
    private String name;
    private String email;
    private String phoneNum;
    private String sem;
    private String courseName;
    private String courseCode;
    private String academicLvl;
    private String campus;
    private String adminID; // Foreign key for administrative linkage

    // Constructor
    public Student(String studentID, String matricNo, String password, String name, String email, String phoneNum,
                   String sem, String courseName, String courseCode, String academicLvl, String campus, String adminID) {
        if (studentID == null || studentID.trim().isEmpty())
            throw new IllegalArgumentException("Student ID cannot be null or empty.");
        if (name == null || name.trim().isEmpty())
            throw new IllegalArgumentException("Name cannot be null or empty.");
        if (email == null || !email.contains("@"))
            throw new IllegalArgumentException("Invalid email address.");

        this.studentID = studentID;
        this.matricNo = matricNo;
        this.password = password;
        this.name = name;
        this.email = email;
        this.phoneNum = phoneNum;
        this.sem = sem;
        this.courseName = courseName;
        this.courseCode = courseCode;
        this.academicLvl = academicLvl;
        this.campus = campus;
        this.adminID = adminID;
    }
    
    public Student(String studentID, String name, String email, String phoneNum) {
        this.studentID = studentID;
        this.name = name;
        this.email = email;
        this.phoneNum = phoneNum;
    }

    // Getters and Setters with validation
    public String getStudentID() {
        return studentID;
    }

    public void setStudentID(String studentID) {
        if (studentID == null || studentID.trim().isEmpty()) {
            throw new IllegalArgumentException("Student ID cannot be null or empty.");
        }
        this.studentID = studentID;
    }

    public String getMatricNo() {
        return matricNo;
    }

    public void setMatricNo(String matricNo) {
        this.matricNo = matricNo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        if (password == null || password.trim().isEmpty()) {
            throw new IllegalArgumentException("Password cannot be null or empty.");
        }
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        if (name == null || name.trim().isEmpty()) {
            throw new IllegalArgumentException("Name cannot be null or empty.");
        }
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        if (email == null || !email.contains("@")) {
            throw new IllegalArgumentException("Invalid email address.");
        }
        this.email = email;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        if (phoneNum != null && !phoneNum.matches("\\d{10}")) {
            throw new IllegalArgumentException("Phone number must be a 10-digit number.");
        }
        this.phoneNum = phoneNum;
    }

    public String getSem() {
        return sem;
    }

    public void setSem(String sem) {
        this.sem = sem;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    public String getAcademicLvl() {
        return academicLvl;
    }

    public void setAcademicLvl(String academicLvl) {
        this.academicLvl = academicLvl;
    }

    public String getCampus() {
        return campus;
    }

    public void setCampus(String campus) {
        this.campus = campus;
    }

    public String getAdminID() {
        return adminID;
    }

    public void setAdminID(String adminID) {
        this.adminID = adminID;
    }

    // Overridden toString method
    @Override
    public String toString() {
        return "Student{" +
                "studentID='" + studentID + '\'' +
                ", matricNo='" + matricNo + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", phoneNum='" + phoneNum + '\'' +
                ", sem='" + sem + '\'' +
                ", courseName='" + courseName + '\'' +
                ", courseCode='" + courseCode + '\'' +
                ", academicLvl='" + academicLvl + '\'' +
                ", campus='" + campus + '\'' +
                ", adminID='" + adminID + '\'' +
                '}';
    }
}
