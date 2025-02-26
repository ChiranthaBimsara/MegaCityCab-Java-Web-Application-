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

@WebServlet("/DeleteBookingServlet")
public class DeleteBookingServlet extends HttpServlet {
	
    private static final long serialVersionUID = 1L; // Unique version identifier	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookingID = Integer.parseInt(request.getParameter("bookingID"));

        try (Connection conn = DBConnection.getConnection()) {
            String query = "DELETE FROM Bookings WHERE BookingID = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, bookingID);
            ps.executeUpdate();
            response.sendRedirect("pages/view_bookings.jsp?success=Booking Deleted");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("pages/view_bookings.jsp?error=Error Deleting Booking");
        }
    }
}
