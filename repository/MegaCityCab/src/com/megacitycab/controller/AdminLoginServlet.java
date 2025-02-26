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

@WebServlet("/AdminLoginServlet") // This automatically maps the servlet to /AdminLoginServlet
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get username and password from form
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // DB connection and validation
        try (Connection conn = DBConnection.getConnection()) {
            // SQL query to check for matching username and password in the Admin table
            String query = "SELECT * FROM Admin WHERE Username=? AND Password=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            // Check if valid login credentials were found
            if (rs.next()) {
                // Create a session and store user information
                HttpSession session = request.getSession();
                session.setAttribute("adminID", rs.getInt("AdminID"));
                session.setAttribute("username", rs.getString("Username"));
                session.setAttribute("fullName", rs.getString("FullName"));

                // Redirect to the admin dashboard
                response.sendRedirect("/MegaCityCab/dashboard.jsp");
            } else {
                // If login fails, redirect back with an error message
                response.sendRedirect("/MegaCityCab/admin_login.jsp?error=Invalid Credentials");
            }
        } catch (Exception e) {
            // Print the exception stack trace for debugging
            e.printStackTrace();
            response.sendRedirect("/MegaCityCab/admin_login.jsp?error=Error During Login");
        }
    }
}
