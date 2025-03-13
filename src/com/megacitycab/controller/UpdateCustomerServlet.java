package com.megacitycab.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.megacitycab.db.DBConnection;

@WebServlet("/UpdateCustomerServlet")
public class UpdateCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve updated values from the form
        int customerID = Integer.parseInt(request.getParameter("customerID"));
        String username = request.getParameter("username");
        String fullName = request.getParameter("fullName");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");
        String nic = request.getParameter("nic");

        try (Connection conn = DBConnection.getConnection()) {
            // SQL update query to update customer profile
            String query = "UPDATE Customers SET Username=?, Name=?, Address=?, PhoneNumber=?, NIC=? WHERE CustomerID=?";
            PreparedStatement ps = conn.prepareStatement(query);

            // Set the parameters for the query
            ps.setString(1, username);
            ps.setString(2, fullName);
            ps.setString(3, address);
            ps.setString(4, phoneNumber);
            ps.setString(5, nic);
            ps.setInt(6, customerID);

            int rowsAffected = ps.executeUpdate();  // Execute update and check the number of affected rows
            
            if (rowsAffected > 0) {
                // If the update is successful, update the session attributes with new data
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("fullName", fullName);
                session.setAttribute("address", address);
                session.setAttribute("phoneNumber", phoneNumber);
                session.setAttribute("nic", nic);

                // Redirect back to the profile page with a success message
                response.sendRedirect("/MegaCityCab/customer_profile.jsp?success=Profile Updated");
            } else {
                // If no rows are updated, return an error message
                response.sendRedirect("/MegaCityCab/edit_customer_profile.jsp?error=No Changes Made or Error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/MegaCityCab/edit_customer_profile.jsp?error=Error Updating Profile");
        }
    }
}
