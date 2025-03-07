package com.megacitycab.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.megacitycab.db.DBConnection;

@WebServlet("/DriverServlet")
public class DriverServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            addDriver(request, response);
        } else if ("update".equals(action)) {
            updateDriver(request, response);
        } else if ("delete".equals(action)) {
            deleteDriver(request, response);
        } else {
            response.sendRedirect("drivers.jsp?error=Invalid Action");
        }
    }

    // Method to add a new driver
    private void addDriver(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String licenseNumber = request.getParameter("licenseNumber");
        String phoneNumber = request.getParameter("phoneNumber");
        int carID = Integer.parseInt(request.getParameter("carID"));

        try (Connection conn = DBConnection.getConnection()) {
            String query = "INSERT INTO Drivers (Name, LicenseNumber, PhoneNumber, CarID) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, licenseNumber);
            ps.setString(3, phoneNumber);
            ps.setInt(4, carID);

            int rowsInserted = ps.executeUpdate();

            if (rowsInserted > 0) {
                response.sendRedirect("drivers.jsp?success=Driver Added Successfully");
            } else {
                response.sendRedirect("drivers.jsp?error=Error Adding Driver");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("drivers.jsp?error=Error Adding Driver");
        }
    }

    // Method to update driver details
    private void updateDriver(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int driverID = Integer.parseInt(request.getParameter("driverID"));
        String name = request.getParameter("name");
        String licenseNumber = request.getParameter("licenseNumber");
        String phoneNumber = request.getParameter("phoneNumber");
        int carID = Integer.parseInt(request.getParameter("carID"));

        try (Connection conn = DBConnection.getConnection()) {
            String query = "UPDATE Drivers SET Name=?, LicenseNumber=?, PhoneNumber=?, CarID=? WHERE DriverID=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, licenseNumber);
            ps.setString(3, phoneNumber);
            ps.setInt(4, carID);
            ps.setInt(5, driverID);

            int rowsUpdated = ps.executeUpdate();

            if (rowsUpdated > 0) {
                response.sendRedirect("drivers_details.jsp?success=Driver Updated Successfully");
            } else {
                response.sendRedirect("edit_driver.jsp?error=Error Updating Driver");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("edit_driver.jsp?error=Error Updating Driver");
        }
    }

    private void deleteDriver(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String driverIDStr = request.getParameter("driverID");

        if (driverIDStr == null || driverIDStr.isEmpty()) {
            response.sendRedirect("drivers_details.jsp?error=Invalid Driver ID");
            return;
        }

        int driverID = Integer.parseInt(driverIDStr);

        try (Connection conn = DBConnection.getConnection()) {
            String query = "DELETE FROM Drivers WHERE DriverID=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, driverID);

            int rowsDeleted = ps.executeUpdate();

            if (rowsDeleted > 0) {
                response.sendRedirect("drivers_details.jsp?success=Driver Deleted Successfully");
            } else {
                response.sendRedirect("drivers_details.jsp?error=Driver Not Found or Cannot be Deleted");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("drivers_details.jsp?error=Error Deleting Driver. Possible Foreign Key Constraint.");
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("view".equals(action)) {
            viewAllDrivers(request, response);
        } else if ("delete".equals(action)) {
            deleteDriver(request, response); // Allow delete in GET request
        } else {
            response.sendRedirect("drivers_details.jsp?error=Invalid Action");
        }
    }

    private void viewAllDrivers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (Connection conn = DBConnection.getConnection()) {
            String query = "SELECT * FROM Drivers";
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            request.setAttribute("drivers", rs);
            request.getRequestDispatcher("/drivers_details.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("drivers.jsp?error=Error Fetching Drivers");
        }
    }
}
