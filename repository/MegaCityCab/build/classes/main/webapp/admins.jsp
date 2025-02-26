<%@ include file="navbar.jsp" %>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page import="com.megacitycab.db.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>View Admins</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>All Admins</h2>
        <table class="table table-bordered">
        
            <thead>
                <tr>
                    <th>Admin ID</th>
                    <th>Username</th>
                    <th>Full Name</th>
                </tr>
            </thead>
            
            <tbody>
                <%
                    Connection conn = null;
                    PreparedStatement ps = null;
                    ResultSet rs = null;
                    try {
                        conn = DBConnection.getConnection();
                        String query = "SELECT AdminID, Username, FullName FROM Admin";
                        ps = conn.prepareStatement(query);
                        rs = ps.executeQuery();
                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("AdminID") %></td>
                    <td><%= rs.getString("Username") %></td>
                    <td><%= rs.getString("FullName") %></td>
                </tr>
                <% 
                        }
                    } catch (Exception e) { 
                        e.printStackTrace(); 
                    } finally {
                        if (rs != null) rs.close();
                        if (ps != null) ps.close();
                        if (conn != null) conn.close();
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
