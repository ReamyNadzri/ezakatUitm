/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.zakat.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    // Database URL, username, and password
    private static final String URL = "jdbc:oracle:thin:@localhost:1521:XE"; // Change accordingly
    private static final String USERNAME = "zakatdb";  // Your username
    private static final String PASSWORD = "zakatdb";  // Your password

    // Static Connection object
    private static Connection connection;

    // Private constructor to prevent instantiation
    private DBConnection() {}

    // Method to get the database connection
    public static Connection getConnection() throws SQLException {
        if (connection == null || connection.isClosed()) {
            try {
                // Create a new connection if not already created
                connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            } catch (SQLException e) {
                System.out.println("Error connecting to database: " + e.getMessage());
                throw e;
            }
        }
        return connection;
    }

    // Method to close the connection
    public static void closeConnection() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            System.out.println("Error closing the connection: " + e.getMessage());
        }
    }
}
