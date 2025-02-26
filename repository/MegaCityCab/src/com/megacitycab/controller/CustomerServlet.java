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

@WebServlet("/CustomerServlet")  // This maps the servlet to /CustomerServlet
public class CustomerServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String nic = request.getParameter("nic");
        String phoneNumber = request.getParameter("phoneNumber");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection conn = DBConnection.getConnection()) {
            String query = "INSERT INTO Customers (Name, Address, NIC, PhoneNumber, Username, Password) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, address);
            ps.setString(3, nic);
            ps.setString(4, phoneNumber);
            ps.setString(5, username);
            ps.setString(6, password);
            ps.executeUpdate();
            response.sendRedirect("pages/customer_login.jsp?success=Registration Successful");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("pages/customer_register.jsp?error=Error Registering Customer");
        }
    }
}
