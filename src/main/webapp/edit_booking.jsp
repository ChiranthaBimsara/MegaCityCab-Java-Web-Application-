<%@ include file="navbar.jsp" %>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page import="com.megacitycab.db.DBConnection" %>

<%
    String bookingID = request.getParameter("bookingID");
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    String customerID = "", driverID = "", pickupLocation = "", destination = "";
    double totalAmount = 0.0;
    String status = "";

    try {
        conn = DBConnection.getConnection();
        String query = "SELECT * FROM bookings WHERE BookingID=?";
        ps = conn.prepareStatement(query);
        ps.setString(1, bookingID);
        rs = ps.executeQuery();

        if (rs.next()) {
            customerID = rs.getString("CustomerID");
            driverID = rs.getString("DriverID");
            pickupLocation = rs.getString("PickupLocation");
            destination = rs.getString("Destination");
            totalAmount = rs.getDouble("TotalAmount");
            status = rs.getString("Status");
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
    <title>Edit Booking - MegaCityCab</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 600px;
            margin-top: 50px;
        }
        .card {
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-control {
            border-radius: 8px;
        }
        .btn-custom {
            background-color: #007bff;
            color: white;
            border-radius: 8px;
            width: 100%;
        }
        .btn-custom:hover {
            background-color: #0056b3;
        }
        .btn-danger {
            border-radius: 8px;
            width: 100%;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2 class="text-center"><i class="fa-solid fa-pen-to-square"></i> Edit Booking</h2>

        <!-- Update Booking Form -->
        <form action="BookingServlet" method="post" class="card">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="bookingID" value="<%= bookingID %>">

            <!-- Customer ID (Read-Only) -->
            <div class="mb-3">
                <label for="customerID"><i class="fa-solid fa-user"></i> Customer ID</label>
                <input type="text" id="customerID" name="customerID" class="form-control" value="<%= customerID %>" readonly>
            </div>

            <!-- Driver ID -->
            <div class="mb-3">
                <label for="driverID"><i class="fa-solid fa-id-badge"></i> Driver ID</label>
                <input type="number" id="driverID" name="driverID" class="form-control" value="<%= driverID %>" required>
            </div>

            <!-- Pickup Location -->
            <div class="mb-3">
                <label for="pickupLocation"><i class="fa-solid fa-map-marker-alt"></i> Pickup Location</label>
                <input type="text" id="pickupLocation" name="pickupLocation" class="form-control" value="<%= pickupLocation %>" required>
            </div>

            <!-- Destination -->
            <div class="mb-3">
                <label for="destination"><i class="fa-solid fa-location-arrow"></i> Destination</label>
                <input type="text" id="destination" name="destination" class="form-control" value="<%= destination %>" required>
            </div>

            <!-- Total Amount -->
            <div class="mb-3">
                <label for="totalAmount"><i class="fa-solid fa-money-bill-wave"></i> Total Amount (LKR)</label>
                <input type="number" step="0.01" id="totalAmount" name="totalAmount" class="form-control" value="<%= totalAmount %>" required>
            </div>

            <!-- Booking Status -->
            <div class="mb-3">
                <label for="status"><i class="fa-solid fa-info-circle"></i> Status</label>
                <select id="status" name="status" class="form-control">
                    <option value="Booked" <%= "Booked".equals(status) ? "selected" : "" %>>Booked</option>
                    <option value="Cancelled" <%= "Cancelled".equals(status) ? "selected" : "" %>>Cancelled</option>
                    <option value="Completed" <%= "Completed".equals(status) ? "selected" : "" %>>Completed</option>
                </select>
            </div>

            <!-- Submit Button -->
            <button class="btn btn-custom" type="submit"><i class="fa-solid fa-save"></i> Update Booking</button>
        </form>

        <!-- Delete Booking Button -->
        <form action="BookingServlet" method="post" class="mt-3 card">
            <input type="hidden" name="action" value="delete">
            <input type="hidden" name="bookingID" value="<%= bookingID %>">
            <button class="btn btn-danger" type="submit" onclick="return confirm('Are you sure you want to delete this booking?')">
                <i class="fa-solid fa-trash"></i> Delete Booking
            </button>
        </form>
    </div>

</body>
</html>
