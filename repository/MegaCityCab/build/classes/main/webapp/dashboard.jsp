<%@ include file="navbar.jsp" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - MegaCityCab</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        .dashboard-card {
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1);
        }
        .dashboard-card .card-body {
            text-align: center;
        }
        .btn-custom {
            background-color: #007bff;
            color: white;
            border-radius: 25px;
            font-size: 16px;
        }
        .btn-custom:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body class="bg-light">

    <!-- Main Container -->
    <div class="container mt-5">

        <!-- Welcome Section -->
        <div class="row mb-4">
            <div class="col-12 text-center">
                <h2>Welcome, Admin!</h2>
                <p class="lead">Manage your cab services efficiently from here. Use the options below to get started.</p>
                <a href="/LogoutServlet" class="btn btn-danger">Logout</a>
            </div>
        </div>

        <!-- Dashboard Cards Section -->
        <div class="row">
            <!-- Manage Customers Card -->
            <div class="col-md-4">
                <div class="card dashboard-card">
                    <div class="card-body">
                        <h4 class="card-title">Manage Customers</h4>
                        <p class="card-text">View and manage all customer bookings, profiles, and more.</p>
                        <a href="/MegaCityCab/customers.jsp" class="btn btn-custom">View Customers</a>
                    </div>
                </div>
            </div>

            <!-- Manage Drivers Card -->
            <div class="col-md-4">
                <div class="card dashboard-card">
                    <div class="card-body">
                        <h4 class="card-title">Manage Drivers</h4>
                        <p class="card-text">Add and manage drivers, assign them vehicles, and track their performance.</p>
                        <a href="/MegaCityCab/drivers.jsp" class="btn btn-custom">View Drivers</a>
                    </div>
                </div>
            </div>

            <!-- Manage Bookings Card -->
            <div class="col-md-4">
                <div class="card dashboard-card">
                    <div class="card-body">
                        <h4 class="card-title">Manage Bookings</h4>
                        <p class="card-text">See all customer bookings, manage schedules, and more.</p>
                        <a href="/MegaCityCab/bookings.jsp" class="btn btn-custom">View Bookings</a>
                    </div>
                </div>
            </div>
            
             <!-- New Manage Car Card -->
                <div class="col-md-4">
                    <div class="card dashboard-card">
                        <div class="card-body">
                            <h4 class="card-title">Manage Car</h4>
                            <p class="card-text">Add and manage cars in your fleet, view details, and more.</p>
                            <a href="/MegaCityCab/car.jsp" class="btn btn-custom">Manage Cars</a> <!-- New "Manage Car" option -->
                        </div>
                    </div>
                </div>
        </div>

        <!-- Additional Options -->
        <div class="row mt-4">
            <div class="col-12 text-center">
                <p class="lead">Access more features and manage your cab service effectively with the options provided.</p>
                <a href="/payments.jsp" class="btn btn-custom">Manage Payments</a>
                <a href="/view_cars.jsp" class="btn btn-custom ml-3">View Cars</a>
            </div>
        </div>

    </div> <!-- End of container -->

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
