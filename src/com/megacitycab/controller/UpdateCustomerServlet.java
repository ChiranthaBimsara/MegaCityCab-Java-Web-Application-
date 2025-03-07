package com.megacitycab.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.megacitycab.db.DBConnection;

@WebServlet("/UpdateCustomerServlet")
public class UpdateCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int customerID = Integer.parseInt(request.getParameter("customerID"));
        String username = request.getParameter("username");
        String fullName = request.getParameter("fullName");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");
        String nic = request.getParameter("nic");

        try (Connection conn = DBConnection.getConnection()) {
            String query = "UPDATE Customers SET Username=?, Name=?, Address=?, PhoneNumber=?, NIC=? WHERE CustomerID=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, fullName);
            ps.setString(3, address);
            ps.setString(4, phoneNumber);
            ps.setString(5, nic);
            ps.setInt(6, customerID);
            ps.executeUpdate();

            // Redirect back to the profile page with updated data
            response.sendRedirect("/MegaCityCab/customer_profile.jsp?success=Profile Updated");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/MegaCityCab/edit_customer_profile.jsp?error=Error Updating Profile");
        }
    }
}
