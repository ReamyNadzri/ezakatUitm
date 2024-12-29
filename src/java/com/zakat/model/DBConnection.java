/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.zakat.model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class DBConnection {
    private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
    private static final String USER = "zakatdb";
    private static final String PASSWORD = "zakatdb";

    // Kaedah untuk mendapatkan sambungan
    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            System.err.println("Oracle JDBC Driver not found.");
            e.printStackTrace();
            throw new SQLException(e);
        }
    }

    // Kaedah untuk menutup sambungan
    public static void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
                System.out.println("Connection closed successfully.");
            } catch (SQLException e) {
                System.err.println("Failed to close connection.");
                e.printStackTrace();
            }
        }
    }

    // Kaedah untuk menutup Statement
    public static void closeStatement(Statement statement) {
        if (statement != null) {
            try {
                statement.close();
                System.out.println("Statement closed successfully.");
            } catch (SQLException e) {
                System.err.println("Failed to close statement.");
                e.printStackTrace();
            }
        }
    }

    // Kaedah untuk menutup PreparedStatement
    public static void closePreparedStatement(PreparedStatement preparedStatement) {
        if (preparedStatement != null) {
            try {
                preparedStatement.close();
                System.out.println("PreparedStatement closed successfully.");
            } catch (SQLException e) {
                System.err.println("Failed to close PreparedStatement.");
                e.printStackTrace();
            }
        }
    }

    // Kaedah untuk menutup ResultSet
    public static void closeResultSet(ResultSet resultSet) {
        if (resultSet != null) {
            try {
                resultSet.close();
                System.out.println("ResultSet closed successfully.");
            } catch (SQLException e) {
                System.err.println("Failed to close ResultSet.");
                e.printStackTrace();
            }
        }
    }
}