<%@ include file="navbar.jsp" %>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page import="com.megacitycab.db.DBConnection" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    // Check if admin is logged in
    Integer adminID = (Integer) session.getAttribute("adminID");

    if (adminID == null) {
        response.sendRedirect("login.jsp"); // Redirect to login page if not logged in
        return;
    }

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String username = "", fullName = "", password = "";

    try {
        conn = DBConnection.getConnection();
        String query = "SELECT Username, FullName, Password FROM admin WHERE AdminID = ?";
        ps = conn.prepareStatement(query);
        ps.setInt(1, adminID);
        rs = ps.executeQuery();

        if (rs.next()) {
            username = rs.getString("Username");
            fullName = rs.getString("FullName");
            password = rs.getString("Password"); // Consider hashing passwords
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Edit Admin Profile</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>Edit Profile</h2>

        <!-- Display success or error messages -->
        <% if (request.getParameter("success") != null) { %>
            <div class="alert alert-success">Profile updated successfully!</div>
        <% } else if (request.getParameter("error") != null) { %>
            <div class="alert alert-danger">Error updating profile. Please try again.</div>
        <% } else if (request.getParameter("password_mismatch") != null) { %>
            <div class="alert alert-warning">Passwords do not match!</div>
        <% } %>

        <form method="post">
            <input type="hidden" name="adminID" value="<%= adminID %>">

            <div class="mb-3">
                <label class="form-label">Username</label>
                <input type="text" name="username" class="form-control" value="<%= username %>" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Full Name</label>
                <input type="text" name="fullName" class="form-control" value="<%= fullName %>" required>
            </div>

            <div class="mb-3">
                <label class="form-label">New Password (Optional)</label>
                <input type="password" name="newPassword" class="form-control" placeholder="Enter new password">
            </div>

            <div class="mb-3">
                <label class="form-label">Confirm New Password</label>
                <input type="password" name="confirmPassword" class="form-control" placeholder="Confirm new password">
            </div>

            <button type="submit" class="btn btn-primary" name="updateProfile">Save Changes</button>
        </form>
    </div>
</body>
</html>

<%
    if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("updateProfile") != null) {
        String newUsername = request.getParameter("username");
        String newFullName = request.getParameter("fullName");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        conn = null;
        ps = null;

        try {
            conn = DBConnection.getConnection();

            // Check if the user provided a new password
            if (newPassword != null && !newPassword.isEmpty()) {
                // Ensure passwords match
                if (!newPassword.equals(confirmPassword)) {
                    response.sendRedirect("edit_admin_profile.jsp?password_mismatch=true");
                    return;
                }

                // Update all fields, including password
                String updateQuery = "UPDATE admin SET Username = ?, FullName = ?, Password = ? WHERE AdminID = ?";
                ps = conn.prepareStatement(updateQuery);
                ps.setString(1, newUsername);
                ps.setString(2, newFullName);
                ps.setString(3, newPassword); // Consider hashing this password before storing
                ps.setInt(4, adminID);
            } else {
                // Update only username and full name
                String updateQuery = "UPDATE admin SET Username = ?, FullName = ? WHERE AdminID = ?";
                ps = conn.prepareStatement(updateQuery);
                ps.setString(1, newUsername);
                ps.setString(2, newFullName);
                ps.setInt(3, adminID);
            }

            int rowsUpdated = ps.executeUpdate();

            if (rowsUpdated > 0) {
                session.setAttribute("username", newUsername);
                session.setAttribute("fullName", newFullName);
                response.sendRedirect("edit_admin_profile.jsp?success=true");
            } else {
                response.sendRedirect("edit_admin_profile.jsp?error=true");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("edit_admin_profile.jsp?error=true");
        } finally {
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        }
    }
%>
