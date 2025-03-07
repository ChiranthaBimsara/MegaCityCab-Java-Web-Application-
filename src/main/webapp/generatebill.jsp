<%@ include file="customer_navbar.jsp" %>
<%@ page import="java.sql.*, java.text.DecimalFormat" %>
<%@ page import="com.megacitycab.db.DBConnection" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Calculate Bill - MegaCityCab</title>
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
            background-color: white;
        }
        .table th, .table td {
            text-align: left;
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
    </style>
</head>
<body>

    <div class="container">
        <h2 class="text-center"><i class="fa-solid fa-file-invoice-dollar"></i> Booking Bill</h2>

        <div class="card">
            <% 
                Integer customerID = (Integer) session.getAttribute("customerID");
                if (customerID == null) {
            %>
                <div class='alert alert-danger text-center'><i class="fa-solid fa-triangle-exclamation"></i> Please log in to view your bill.</div>
            <% 
                } else {
                    Connection conn = null;
                    PreparedStatement ps = null;
                    ResultSet rs = null;
                    
                    double totalAmount = 0.0;  // Initialize total amount
                    DecimalFormat df = new DecimalFormat("0.00");  // Format numbers to 2 decimal places

                    try {
                        conn = DBConnection.getConnection();
                        String query = "SELECT TotalAmount FROM bookings WHERE CustomerID = ?";
                        ps = conn.prepareStatement(query);
                        ps.setInt(1, customerID);
                        rs = ps.executeQuery();
                        
                        while (rs.next()) {
                            totalAmount += rs.getDouble("TotalAmount");  // Sum the TotalAmount
                        }

                        // Example: Apply a 10% tax and a 5% discount
                        double taxAmount = totalAmount * 0.10;  // 10% tax
                        double discountAmount = totalAmount * 0.05;  // 5% discount
                        double finalAmount = totalAmount + taxAmount - discountAmount;
            %>

            <!-- Bill Table -->
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th><i class="fa-solid fa-receipt"></i> Details</th>
                        <th class="text-end"><i class="fa-solid fa-money-bill-wave"></i> Amount (LKR)</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Total Booking Amount</td>
                        <td class="text-end"><%= df.format(totalAmount) %> LKR</td>
                    </tr>
                    <tr>
                        <td>Tax (10%)</td>
                        <td class="text-end"><%= df.format(taxAmount) %> LKR</td>
                    </tr>
                    <tr>
                        <td>Discount (5%)</td>
                        <td class="text-end"><%= df.format(discountAmount) %> LKR</td>
                    </tr>
                    <tr>
                        <td><strong>Final Bill Amount</strong></td>
                        <td class="text-end"><strong><%= df.format(finalAmount) %> LKR</strong></td>
                    </tr>
                </tbody>
            </table>

            <% 
                    } catch (Exception e) {
                        e.printStackTrace();
                        out.println("<div class='alert alert-danger'>Error fetching booking details.</div>");
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

        <div class="text-center mt-3">
            <a href="customer_dashboard.jsp" class="btn btn-custom"><i class="fa-solid fa-arrow-left"></i> Back to Dashboard</a>
        </div>
    </div>

</body>
</html>
