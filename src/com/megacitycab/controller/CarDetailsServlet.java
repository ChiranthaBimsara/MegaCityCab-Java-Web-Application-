package com.megacitycab.controller;

import com.megacitycab.db.DBConnection;
import com.megacitycab.model.Car;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/CarDetailsServlet")
public class CarDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (Connection conn = DBConnection.getConnection()) {
            String query = "SELECT * FROM Cars"; // Query to fetch all cars
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            int count = 1;
            while (rs.next()) {
                Car car = new Car(
                        rs.getInt("CarID"),
                        rs.getString("CarModel"),
                        rs.getString("LicenseNumber"),
                        rs.getInt("Year")
                );
                request.setAttribute("Car" + count, car); // Set each car as a separate attribute
                count++;
            }
            request.getRequestDispatcher("/car_details.jsp").forward(request, response); // Forward to the JSP
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("/MegaCityCab/car_details.jsp?error=Error Fetching Car Details");
        }
    }
}

