package com.megacitycab.controller;

import com.megacitycab.db.DBConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CarServlet")
public class CarServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        String carModel = request.getParameter("carModel");
        String licenseNumber = request.getParameter("licenseNumber");
        int year = Integer.parseInt(request.getParameter("year"));

        // Insert the car into the database
        try (Connection conn = DBConnection.getConnection()) {
            String query = "INSERT INTO Cars (CarModel, LicenseNumber, Year) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, carModel);
            ps.setString(2, licenseNumber);
            ps.setInt(3, year);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                response.sendRedirect("pages/car.jsp?success=Car Added Successfully");
            } else {
                response.sendRedirect("pages/car.jsp?error=Error Adding Car");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("pages/car.jsp?error=Database Error: " + e.getMessage());
        }
    }
}
