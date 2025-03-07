<%@ include file="customer_navbar.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.megacitycab.db.DBConnection" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>My Bookings - MegaCityCab</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <script>
        function confirmDelete(bookingID) {
            if (confirm("Are you sure you want to delete this booking?")) {
                window.location.href = "BookingServlet?action=delete&bookingID=" + bookingID;
            }
        }
    </script>

    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 900px;
            margin-top: 50px;
        }
        .table th {
            background-color: #007bff;
            color: white;
            text-align: center;
        }
        .btn-custom {
            background-color: #007bff;
            color: white;
            border-radius: 5px;
            transition: 0.3s;
        }
        .btn-custom:hover {
            background-color: #0056b3;
        }
        .btn-danger {
            border-radius: 5px;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2 class="text-center"><i class="fa-solid fa-list"></i> My Bookings</h2>
        <p class="text-muted text-center">Here you can view, edit, and delete your bookings.</p>

        <!-- Fetch logged-in Customer ID -->
        <% 
            Integer customerID = (Integer) session.getAttribute("customerID");
            if (customerID == null) {
        %>
            <div class="alert alert-danger text-center"><i class="fa-solid fa-exclamation-circle"></i> Please log in to view your bookings.</div>
        <% 
            } else {
                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                boolean hasBookings = false;

                try {
                    conn = DBConnection.getConnection();
                    // SQL query to fetch bookings for the logged-in customer
                    String query = "SELECT BookingID, DriverID, PickupLocation, Destination, BookingDate, TotalAmount, Status FROM bookings WHERE CustomerID = ?";
                    ps = conn.prepareStatement(query);
                    ps.setInt(1, customerID);
                    rs = ps.executeQuery();
        %>

        <!-- Booking Table -->
        <table class="table table-bordered table-striped mt-4">
            <thead>
                <tr>
                    <th>#</th>
                    <th><i class="fa-solid fa-id-card"></i> Driver</th>
                    <th><i class="fa-solid fa-map-marker-alt"></i> Pickup</th>
                    <th><i class="fa-solid fa-location-arrow"></i> Destination</th>
                    <th><i class="fa-solid fa-calendar"></i> Date</th>
                    <th><i class="fa-solid fa-money-bill-wave"></i> Amount</th>
                    <th><i class="fa-solid fa-info-circle"></i> Status</th>
                    <th><i class="fa-solid fa-cog"></i> Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    while (rs.next()) { 
                        hasBookings = true;
                %>
                    <tr>
                        <td><%= rs.getInt("BookingID") %></td>
                        <td><%= rs.getInt("DriverID") %></td>
                        <td><%= rs.getString("PickupLocation") %></td>
                        <td><%= rs.getString("Destination") %></td>
                        <td><%= rs.getTimestamp("BookingDate") %></td>
                        <td><strong>LKR <%= String.format("%.2f", rs.getDouble("TotalAmount")) %></strong></td>
                        <td><%= rs.getString("Status") %></td>
                        <td class="text-center">
                            <a href="edit_booking.jsp?bookingID=<%= rs.getInt("BookingID") %>" class="btn btn-warning btn-sm">
                                <i class="fa-solid fa-pen-to-square"></i> Edit
                            </a>
                            
                        </td>
                    </tr>
                <% 
                    } 
                %>
            </tbody>
        </table>

        <% 
                if (!hasBookings) {
        %>
            <div class="alert alert-info text-center mt-4"><i class="fa-solid fa-info-circle"></i> You have no bookings yet.</div>
        <% 
                }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (ps != null) ps.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        %>
    </div>

</body>
</html>
