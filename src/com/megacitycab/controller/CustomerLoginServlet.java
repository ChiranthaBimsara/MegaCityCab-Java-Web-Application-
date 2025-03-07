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

@WebServlet("/CustomerLoginServlet") 
public class CustomerLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection conn = DBConnection.getConnection()) {
            String query = "SELECT * FROM Customers WHERE Username=? AND Password=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("customerID", rs.getInt("CustomerID"));
                session.setAttribute("username", rs.getString("Username"));
                session.setAttribute("fullName", rs.getString("Name"));
                session.setAttribute("address", rs.getString("Address"));
                session.setAttribute("nic", rs.getString("NIC"));
                session.setAttribute("phoneNumber", rs.getString("PhoneNumber"));

                // Forward to the customer profile page
                request.getRequestDispatcher("/customer_profile.jsp").forward(request, response);
            } else {
                response.sendRedirect("/MegaCityCab/customer_login.jsp?error=Invalid Credentials");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/MegaCityCab/customer_login.jsp?error=Error During Login");
        }
    }
}

