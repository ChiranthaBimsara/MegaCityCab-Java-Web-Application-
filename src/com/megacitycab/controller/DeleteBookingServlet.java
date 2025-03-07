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
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookingID = request.getParameter("bookingID");

        if (bookingID != null) {
            try (Connection conn = DBConnection.getConnection()) {
                String query = "DELETE FROM bookings WHERE BookingID = ?";
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setInt(1, Integer.parseInt(bookingID));

                int rowsDeleted = ps.executeUpdate();

                if (rowsDeleted > 0) {
                    response.sendRedirect("/MegaCityCab/bookings.jsp?success=Booking Deleted Successfully");
                } else {
                    response.sendRedirect("/MegaCityCab/bookings.jsp?error=Error Deleting Booking");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("/MegaCityCab/bookings.jsp?error=Error Deleting Booking");
            }
        } else {
            response.sendRedirect("/MegaCityCab/bookings.jsp?error=Invalid Booking ID");
        }
    }
}
