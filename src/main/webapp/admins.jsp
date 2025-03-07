<%@ include file="navbar.jsp" %>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page import="com.megacitycab.db.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>View Admins</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style>
        .table th {
            background-color: #007bff;
            color: white;
            text-align: center;
        }
        .table td {
            text-align: center;
            vertical-align: middle;
        }
        .table-container {
            max-width: 800px;
            margin: auto;
        }
        .admin-icon {
            color: #007bff;
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center"><i class="fas fa-user-shield admin-icon"></i> All Admins</h2>

        <div class="table-container">
            <table class="table table-bordered table-striped mt-3">
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
                        <td><i class="fas fa-id-badge"></i> <%= rs.getInt("AdminID") %></td>
                        <td><i class="fas fa-user"></i> <%= rs.getString("Username") %></td>
                        <td><i class="fas fa-user-circle"></i> <%= rs.getString("FullName") %></td>
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
    </div>
</body>
</html>
