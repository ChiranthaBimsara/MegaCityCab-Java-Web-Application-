package com.megacitycab.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.megacitycab.db.DBConnection;

@WebServlet("/CustomerServlet")
public class CustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String nic = request.getParameter("nic");
        String phoneNumber = request.getParameter("phoneNumber");
        String username = request.getParameter("username");
        String password = request.getParameter("password");  // Password is stored as plain text

        try (Connection conn = DBConnection.getConnection()) {
            // Check if username already exists
            String checkUserQuery = "SELECT * FROM Customers WHERE Username = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkUserQuery);
            checkStmt.setString(1, username);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                // Username already exists, redirect back to registration page with an error
                response.sendRedirect(request.getContextPath() + "/customer_register.jsp?error=Username already exists");
                return;
            }

            // Insert the new customer
            String query = "INSERT INTO Customers (Name, Address, NIC, PhoneNumber, Username, Password) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, address);
            ps.setString(3, nic);
            ps.setString(4, phoneNumber);
            ps.setString(5, username);
            ps.setString(6, password);  // Directly storing plain text password

            int rowsInserted = ps.executeUpdate();

            if (rowsInserted > 0) {
                // Registration successful, redirect to login page
                response.sendRedirect(request.getContextPath() + "/customer_login.jsp?success=Registration Successful");
            } else {
                // Registration failed, redirect back to registration page with an error
                response.sendRedirect(request.getContextPath() + "/customer_register.jsp?error=Registration failed, please try again");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/customer_register.jsp?error=Error Registering Customer");
        }
    }
}
