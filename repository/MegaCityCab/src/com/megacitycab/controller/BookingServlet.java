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

@WebServlet("/BookingServlet")  // This automatically maps the servlet to /BookingServlet
public class BookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int customerID = Integer.parseInt(request.getParameter("customerID"));
        int driverID = Integer.parseInt(request.getParameter("driverID"));
        String destination = request.getParameter("destination");
        double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));

        try (Connection conn = DBConnection.getConnection()) {
            String query = "INSERT INTO Bookings (CustomerID, DriverID, Destination, TotalAmount) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, customerID);
            ps.setInt(2, driverID);
            ps.setString(3, destination);
            ps.setDouble(4, totalAmount);
            ps.executeUpdate();
            response.sendRedirect("pages/bookings.jsp?success=Booking Created");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("pages/bookings.jsp?error=Error Creating Booking");
        }
    }
}
