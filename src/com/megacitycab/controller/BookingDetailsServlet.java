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
import javax.servlet.http.HttpSession;
import com.megacitycab.db.DBConnection;

@WebServlet("/BookingDetailsServlet")  // This maps the servlet to /BookingDetailsServlet
public class BookingDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer customerID = (Integer) session.getAttribute("customerID");

        if (customerID != null) {
            try (Connection conn = DBConnection.getConnection()) {
                // SQL query to retrieve bookings for the logged-in customer
                String query = "SELECT * FROM bookings WHERE CustomerID=?";
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setInt(1, customerID);
                ResultSet rs = ps.executeQuery();

                // Store booking details in a StringBuilder to display in the JSP page
                StringBuilder bookings = new StringBuilder();
                while (rs.next()) {
                    bookings.append("<tr>")
                            .append("<td>").append(rs.getInt("BookingID")).append("</td>")
                            .append("<td>").append(rs.getString("PickupLocation")).append("</td>") // Added Pickup Location
                            .append("<td>").append(rs.getString("Destination")).append("</td>")
                            .append("<td>").append(rs.getTimestamp("BookingDate")).append("</td>")
                            .append("<td>").append(rs.getDouble("TotalAmount")).append("</td>")
                            .append("<td>").append(rs.getString("Status")).append("</td>")
                            .append("<td><a href='edit_booking.jsp?bookingID=").append(rs.getInt("BookingID"))
                            .append("' class='btn btn-warning btn-sm'>Edit</a></td>")
                            .append("</tr>");
                }

                request.setAttribute("bookingDetails", bookings.toString());
                request.getRequestDispatcher("/booking_details.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("/MegaCityCab/customer_dashboard.jsp?error=Error Fetching Bookings");
            }
        } else {
            response.sendRedirect("/MegaCityCab/customer_login.jsp?error=Please login first");
        }
    }
}
