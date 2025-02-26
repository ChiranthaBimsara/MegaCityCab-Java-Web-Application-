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

@WebServlet("/DriverServlet")
public class DriverServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
            ps.executeUpdate();
            response.sendRedirect("pages/drivers.jsp?success=Driver Added Successfully");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("pages/drivers.jsp?error=Error Adding Driver");
        }
    }
}
