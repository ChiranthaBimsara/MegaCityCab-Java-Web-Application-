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

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
	
    private static final long serialVersionUID = 1L; // Unique version identifier

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookingID = Integer.parseInt(request.getParameter("bookingID"));
        int customerID = Integer.parseInt(request.getParameter("customerID"));
        double distance = Double.parseDouble(request.getParameter("distance"));
        String paymentMethod = request.getParameter("paymentMethod");

        // Fare Calculation: Base fare + Per KM Charge
        double baseFare = 200.0; // LKR
        double perKMRate = 50.0; // LKR
        double totalAmount = baseFare + (perKMRate * distance);

        try (Connection conn = DBConnection.getConnection()) {
            String query = "INSERT INTO Payments (BookingID, CustomerID, AmountPaid, PaymentMethod) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, bookingID);
            ps.setInt(2, customerID);
            ps.setDouble(3, totalAmount);
            ps.setString(4, paymentMethod);
            ps.executeUpdate();
            response.sendRedirect("pages/payment_receipt.jsp?success=Payment Successful&amount=" + totalAmount);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("pages/payment.jsp?error=Payment Failed");
        }
    }
}
