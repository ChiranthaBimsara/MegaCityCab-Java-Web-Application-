<%@ include file="navbar.jsp" %>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page import="com.megacitycab.db.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>View Customers</title>
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
            max-width: 900px;
            margin: auto;
        }
        .customer-icon {
            color: #007bff;
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center"><i class="fas fa-users customer-icon"></i> All Customers</h2>

        <div class="table-container">
            <table class="table table-bordered table-striped mt-3">
                <thead>
                    <tr>
                        <th>Customer ID</th>
                        <th>Name</th>
                        <th>Address</th>
                        <th>NIC</th>
                        <th>Phone Number</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Connection conn = null;
                        PreparedStatement ps = null;
                        ResultSet rs = null;
                        try {
                            conn = DBConnection.getConnection();
                            String query = "SELECT * FROM Customers";
                            ps = conn.prepareStatement(query);
                            rs = ps.executeQuery();
                            while (rs.next()) {
                    %>
                    <tr>
                        <td><i class="fas fa-id-badge"></i> <%= rs.getInt("CustomerID") %></td>
                        <td><i class="fas fa-user"></i> <%= rs.getString("Name") %></td>
                        <td><i class="fas fa-map-marker-alt"></i> <%= rs.getString("Address") %></td>
                        <td><i class="fas fa-id-card"></i> <%= rs.getString("NIC") %></td>
                        <td><i class="fas fa-phone"></i> <%= rs.getString("PhoneNumber") %></td>
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
