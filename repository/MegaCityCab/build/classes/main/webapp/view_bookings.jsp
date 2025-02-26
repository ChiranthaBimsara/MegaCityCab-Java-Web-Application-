<%@ include file="navbar.jsp" %>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page import="com.megacitycab.db.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>View Bookings</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>All Bookings</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Customer ID</th>
                    <th>Driver ID</th>
                    <th>Destination</th>
                    <th>Total Amount (LKR)</th>
                    <th>Booking Date</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    PreparedStatement ps = null;
                    ResultSet rs = null;
                    try {
                        conn = DBConnection.getConnection();
                        String query = "SELECT * FROM Bookings";
                        ps = conn.prepareStatement(query);
                        rs = ps.executeQuery();
                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("BookingID") %></td>
                    <td><%= rs.getInt("CustomerID") %></td>
                    <td><%= rs.getInt("DriverID") %></td>
                    <td><%= rs.getString("Destination") %></td>
                    <td>LKR <%= rs.getDouble("TotalAmount") %></td>
                    <td><%= rs.getTimestamp("BookingDate") %></td>
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
