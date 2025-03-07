<%@ include file="customer_navbar.jsp" %>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page import="com.megacitycab.db.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Booking Details</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
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
            margin-top: 30px;
        }
        .table th, .table td {
            text-align: center;
        }
        .alert {
            text-align: center;
        }
        .btn-custom {
            border-radius: 25px;
            padding: 6px 15px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center mb-4">Your Bookings</h2>

        <!-- Display success or error messages -->
        <% if(request.getParameter("error") != null) { %>
            <div class="alert alert-danger"><i class="fas fa-exclamation-circle"></i> Error: <%= request.getParameter("error") %></div>
        <% } else if(request.getParameter("success") != null) { %>
            <div class="alert alert-success"><i class="fas fa-check-circle"></i> <%= request.getParameter("success") %></div>
        <% } %>

        <table class="table table-bordered table-hover">
            <thead class="table-dark">
                <tr>
                    <th>Booking ID</th>
                    <th>Pickup Location</th>
                    <th>Destination</th>
                    <th>Booking Date</th>
                    <th>Total Amount (LKR)</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    PreparedStatement ps = null;
                    ResultSet rs = null;
                    Integer customerID = (Integer) session.getAttribute("customerID");

                    if (customerID == null) {
                        out.println("<tr><td colspan='7' class='text-center text-danger'>Please log in to view your bookings.</td></tr>");
                    } else {
                        try {
                            conn = DBConnection.getConnection();
                            String query = "SELECT BookingID, PickupLocation, Destination, BookingDate, TotalAmount, Status FROM bookings WHERE CustomerID=?";
                            ps = conn.prepareStatement(query);
                            ps.setInt(1, customerID);
                            rs = ps.executeQuery();
                            boolean hasBookings = false;

                            while (rs.next()) {
                                hasBookings = true;
                %>
                <tr>
                    <td><%= rs.getInt("BookingID") %></td>
                    <td><%= rs.getString("PickupLocation") %></td>
                    <td><%= rs.getString("Destination") %></td>
                    <td><%= rs.getTimestamp("BookingDate") %></td>
                    <td><strong>LKR <%= String.format("%.2f", rs.getDouble("TotalAmount")) %></strong></td>
                    <td>
                        <span class="badge 
                        <%= rs.getString("Status").equals("Booked") ? "bg-success" : (rs.getString("Status").equals("Cancelled") ? "bg-danger" : "bg-secondary") %>">
                        <%= rs.getString("Status") %>
                        </span>
                    </td>
                    <td>
                        <a href="edit_booking.jsp?bookingID=<%= rs.getInt("BookingID") %>" class="btn btn-warning btn-sm btn-custom"><i class="fas fa-edit"></i> Edit</a>
                        <button class="btn btn-danger btn-sm btn-custom" onclick="confirmDelete(<%= rs.getInt("BookingID") %>)"><i class="fas fa-trash"></i> Delete</button>
                    </td>
                </tr>
                <%
                            }
                            if (!hasBookings) {
                                out.println("<tr><td colspan='7' class='text-center text-muted'>No bookings found.</td></tr>");
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                            out.println("<tr><td colspan='7' class='text-center text-danger'>Error fetching booking details.</td></tr>");
                        } finally {
                            try {
                                if (rs != null) rs.close();
                                if (ps != null) ps.close();
                                if (conn != null) conn.close();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        }
                    }
                %>
            </tbody>
        </table>

        <!-- Back to Dashboard Button -->
        <div class="text-center mt-4">
            <a href="customer_dashboard.jsp" class="btn btn-secondary btn-custom"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
        </div>
    </div>
    
    <!-- Bootstrap JS and FontAwesome for Icons -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>
</body>
</html>
