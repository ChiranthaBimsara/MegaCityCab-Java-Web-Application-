<%@ include file="navbar.jsp" %>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page import="com.megacitycab.db.DBConnection" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>All Cars</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        body {
            background-color: #f8f9fa;
        }
        .table-container {
            max-width: 900px;
            margin: auto;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .table th, .table td {
            text-align: center;
            vertical-align: middle;
        }
        .btn-custom {
            border-radius: 5px;
        }
        .alert {
            text-align: center;
            font-weight: bold;
        }
    </style>

    <script>
        function confirmDelete(carID) {
            if (confirm("Are you sure you want to delete this car?")) {
                window.location.href = "CarServlet?action=delete&carID=" + carID;
            }
        }
    </script>
</head>

<body class="bg-light">
    <div class="container mt-5">
        <h2 class="text-center"><i class="fas fa-car"></i> All Cars</h2>

        <!-- Success & Error Messages -->
        <% if(request.getParameter("error") != null) { %>
            <div class="alert alert-danger"><i class="fas fa-exclamation-triangle"></i> <%= request.getParameter("error") %></div>
        <% } else if(request.getParameter("success") != null) { %>
            <div class="alert alert-success"><i class="fas fa-check-circle"></i> <%= request.getParameter("success") %></div>
        <% } %>

        <div class="table-container">
            <table class="table table-bordered table-hover">
                <thead class="table-primary">
                    <tr>
                        <th>Car ID</th>
                        <th>Car Model</th>
                        <th>License Number</th>
                        <th>Year</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Connection conn = null;
                        PreparedStatement ps = null;
                        ResultSet rs = null;
                        try {
                            conn = DBConnection.getConnection();
                            String query = "SELECT * FROM cars";
                            ps = conn.prepareStatement(query);
                            rs = ps.executeQuery();

                            while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getInt("CarID") %></td>
                        <td><%= rs.getString("CarModel") %></td>
                        <td><%= rs.getString("LicenseNumber") %></td>
                        <td><%= rs.getInt("Year") %></td>
                        <td>
                            <!-- Edit Button -->
                            <a href="edit_car.jsp?carID=<%= rs.getInt("CarID") %>" class="btn btn-warning btn-sm btn-custom"><i class="fas fa-edit"></i> Edit</a>

                            <!-- Delete Button -->
                            <button class="btn btn-danger btn-sm btn-custom" onclick="confirmDelete(<%= rs.getInt("CarID") %>)">
                                <i class="fas fa-trash-alt"></i> Delete
                            </button>
                        </td>
                    </tr>
                    <% 
                            }
                        } catch (Exception e) { 
                            e.printStackTrace(); 
                        } finally {
                            if (rs != null) try { rs.close(); } catch (Exception e) {}
                            if (ps != null) try { ps.close(); } catch (Exception e) {}
                            if (conn != null) try { conn.close(); } catch (Exception e) {}
                        }
                    %>
                </tbody>
            </table>
        </div>

        <!-- Button to Add New Car -->
        <div class="text-center mt-4">
            <a href="car.jsp" class="btn btn-primary btn-custom"><i class="fas fa-plus-circle"></i> Add New Car</a>
        </div>
    </div>
</body>
</html>
