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

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");  // Get the action parameter from the form

        if ("create".equals(action)) {
            createBooking(request, response);  // Add the create booking functionality
        } else if ("update".equals(action)) {
            updateBooking(request, response);
        } else if ("delete".equals(action)) {
            deleteBooking(request, response);
        }
    }

    // Create a new booking
    private void createBooking(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int customerID = Integer.parseInt(request.getParameter("customerID"));
        int driverID = Integer.parseInt(request.getParameter("driverID"));
        String pickupLocation = request.getParameter("pickupLocation");
        String destination = request.getParameter("destination");
        double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));
        String status = "Booked";  // Initially setting status as "Booked"

        try (Connection conn = DBConnection.getConnection()) {
            String query = "INSERT INTO bookings (CustomerID, DriverID, PickupLocation, Destination, TotalAmount, Status) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, customerID);
            ps.setInt(2, driverID);
            ps.setString(3, pickupLocation);
            ps.setString(4, destination);
            ps.setDouble(5, totalAmount);
            ps.setString(6, status);

            int rowsInserted = ps.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("bookingdetails4customer.jsp?success=Booking Created Successfully");
            } else {
                response.sendRedirect("create_booking.jsp?error=Error Creating Booking");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("create_booking.jsp?error=Error Creating Booking");
        }
    }

    // Update an existing booking
    private void updateBooking(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int bookingID = Integer.parseInt(request.getParameter("bookingID"));
        int driverID = Integer.parseInt(request.getParameter("driverID"));
        String pickupLocation = request.getParameter("pickupLocation");
        String destination = request.getParameter("destination");
        double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));
        String status = request.getParameter("status");

        try (Connection conn = DBConnection.getConnection()) {
            String query = "UPDATE bookings SET DriverID=?, PickupLocation=?, Destination=?, TotalAmount=?, Status=? WHERE BookingID=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, driverID);
            ps.setString(2, pickupLocation);
            ps.setString(3, destination);
            ps.setDouble(4, totalAmount);
            ps.setString(5, status);
            ps.setInt(6, bookingID);

            int rowsUpdated = ps.executeUpdate();
            if (rowsUpdated > 0) {
                response.sendRedirect("bookingdetails4customer.jsp?success=Booking Updated Successfully");
            } else {
                response.sendRedirect("edit_booking.jsp?bookingID=" + bookingID + "&error=Error Updating Booking");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("edit_booking.jsp?bookingID=" + bookingID + "&error=Error Updating Booking");
        }
    }

    private void deleteBooking(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int bookingID = Integer.parseInt(request.getParameter("bookingID"));

        try (Connection conn = DBConnection.getConnection()) {
            String query = "DELETE FROM bookings WHERE BookingID=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, bookingID);
            ps.executeUpdate();
            response.sendRedirect("bookingdetails4customer.jsp?success=Booking Deleted Successfully");
        } catch (Exception e) {
            response.sendRedirect("bookingdetails4customer.jsp?error=Error Deleting Booking");
        }
    }
}
