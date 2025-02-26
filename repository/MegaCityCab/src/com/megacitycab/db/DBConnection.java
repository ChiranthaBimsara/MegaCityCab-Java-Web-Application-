package com.megacitycab.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    
    // Method to get a database connection
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        // Database credentials
        String username = "root"; // Your MySQL username
        String password = "";     // Your MySQL password
        
        // Ensure the MySQL JDBC driver is loaded (optional for modern versions)
        Class.forName("com.mysql.cj.jdbc.Driver"); // This loads the driver class
        
        // Database URL with proper settings
        String url = "jdbc:mysql://localhost:3306/megacitycab?useSSL=false&serverTimezone=UTC";
        
        // Establish and return the connection
        return DriverManager.getConnection(url, username, password);
    }

    // Main method to test the connection
    public static void main(String[] args) {
        try {
            // Get the connection and check if it works
            Connection conn = DBConnection.getConnection();
            if (conn != null) {
                System.out.println("Database connected successfully!");
            }
        } catch (ClassNotFoundException | SQLException e) {
            // Print any exception that occurs
            e.printStackTrace();
        }
    }
}
