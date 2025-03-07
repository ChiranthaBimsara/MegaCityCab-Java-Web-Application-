<%@ include file="navbar.jsp" %>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page import="com.megacitycab.db.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Drivers Details</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
        }
        .table {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        th {
            background-color: #007bff;
            color: white;
            text-align: center;
        }
        td {
            text-align: center;
        }
        .btn-sm {
            font-size: 14px;
            padding: 5px 10px;
        }
        .btn-primary {
            border-radius: 20px;
        }
        .btn-danger {
            border-radius: 20px;
        }
        .action-buttons {
            display: flex;
            gap: 5px;
            justify-content: center;
        }
        .table-hover tbody tr:hover {
            background-color: #e9ecef;
        }
        .modal-footer .btn {
            min-width: 100px;
        }
    </style>

    <script>
        function confirmDelete(driverID) {
            document.getElementById("deleteDriverID").value = driverID;
            var myModal = new bootstrap.Modal(document.getElementById('deleteModal'));
            myModal.show();
        }
    </script>
</head>
<body>

    <div class="container">
        <h2 class="text-center mb-4"><i class="fas fa-id-card"></i> Drivers Details</h2>

        <% if(request.getParameter("success") != null) { %>
            <div class="alert alert-success text-center"><i class="fas fa-check-circle"></i> <%= request.getParameter("success") %></div>
        <% } else if(request.getParameter("error") != null) { %>
            <div class="alert alert-danger text-center"><i class="fas fa-exclamation-triangle"></i> <%= request.getParameter("error") %></div>
        <% } %>

        <% 
            try {
                Connection conn = DBConnection.getConnection();
                String query = "SELECT * FROM Drivers";
                PreparedStatement ps = conn.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
        %>

        <table class="table table-hover table-bordered mt-3">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>License Number</th>
                    <th>Phone Number</th>
                    <th>Car ID</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% while (rs.next()) { %>
                <tr>
                    <td><%= rs.getInt("DriverID") %></td>
                    <td><%= rs.getString("Name") %></td>
                    <td><%= rs.getString("LicenseNumber") %></td>
                    <td><%= rs.getString("PhoneNumber") %></td>
                    <td><%= rs.getInt("CarID") %></td>
                    <td class="action-buttons">
                        <!-- Edit Button -->
                        <a href="edit_driver.jsp?driverID=<%= rs.getInt("DriverID") %>" class="btn btn-warning btn-sm"><i class="fas fa-edit"></i> Edit</a>

                        <!-- Delete Button (Now uses a modal for confirmation) -->
                        <button class="btn btn-danger btn-sm" onclick="confirmDelete(<%= rs.getInt("DriverID") %>)">
                            <i class="fas fa-trash-alt"></i> Delete
                        </button>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <% 
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </div>

    <!-- Delete Confirmation Modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteModalLabel"><i class="fas fa-trash-alt"></i> Confirm Deletion</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Are you sure you want to delete this driver? This action cannot be undone.
                </div>
                <div class="modal-footer">
                    <form action="DriverServlet" method="get">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" id="deleteDriverID" name="driverID">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-danger"><i class="fas fa-trash"></i> Delete</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

</body>
</html>
