package com.megacitycab.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    
    // Method to get a database connection
    public static Connection getConnection() {
        Connection conn = null;
        try {
            // Database credentials
            String username = "root"; // Your MySQL username
            String password = "";     // Your MySQL password

            // Ensure the MySQL JDBC driver is loaded (optional for modern versions)
            Class.forName("com.mysql.cj.jdbc.Driver"); // This loads the driver class
            
            // Database URL with proper settings
            String url = "jdbc:mysql://localhost:3306/megacitycab?useSSL=false&serverTimezone=UTC";
            
            // Establish and return the connection
            conn = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException e) {
            // Handle exception if driver class is not found
            e.printStackTrace();
        } catch (SQLException e) {
            // Handle exception if there is an issue with the database connection
            e.printStackTrace();
        }
        return conn;
    }

    // Main method to test the connection
    public static void main(String[] args) {
        try {
            // Get the connection and check if it works
            Connection conn = DBConnection.getConnection();
            if (conn != null) {
                System.out.println("Database connected successfully!");
            } else {
                System.out.println("Failed to make connection!");
            }
        } catch (Exception e) {
            // Print any exception that occurs
            e.printStackTrace();
        }
    }
}
