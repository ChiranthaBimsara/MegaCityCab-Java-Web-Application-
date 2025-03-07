package com.megacitycab.controller;

import com.megacitycab.db.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CarEditServlet")
public class CarEditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int carID = Integer.parseInt(request.getParameter("carID"));
        String carModel = request.getParameter("carModel");
        String licenseNumber = request.getParameter("licenseNumber");
        int year = Integer.parseInt(request.getParameter("year"));

        // Logging to debug
        System.out.println("Updating Car: " + carID + ", " + carModel + ", " + licenseNumber + ", " + year);

        try (Connection conn = DBConnection.getConnection()) {
            String query = "UPDATE Cars SET CarModel = ?, LicenseNumber = ?, Year = ? WHERE CarID = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, carModel);
            ps.setString(2, licenseNumber);
            ps.setInt(3, year);
            ps.setInt(4, carID);

            int rowsUpdated = ps.executeUpdate();
            if (rowsUpdated > 0) {
                response.sendRedirect("/MegaCityCab/car_details.jsp?success=Car Updated Successfully");
            } else {
                response.sendRedirect("/MegaCityCab/car_details.jsp?error=Error Updating Car");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/MegaCityCab/car_details.jsp?error=Error Updating Car");
        }
    }
}

