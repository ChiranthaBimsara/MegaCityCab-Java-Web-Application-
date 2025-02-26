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

@WebServlet("/DeleteCustomerServlet")
public class DeleteCustomerServlet extends HttpServlet {
	
    private static final long serialVersionUID = 1L; // Unique version identifier
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int customerID = Integer.parseInt(request.getParameter("customerID"));

        try (Connection conn = DBConnection.getConnection()) {
            String query = "DELETE FROM Customers WHERE CustomerID = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, customerID);
            ps.executeUpdate();
            response.sendRedirect("pages/customers.jsp?success=Customer Deleted");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("pages/customers.jsp?error=Error Deleting Customer");
        }
    }
}
