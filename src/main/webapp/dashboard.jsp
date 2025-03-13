<%@ include file="navbar.jsp" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - MegaCityCab</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        body {
            background-color: #f8f9fa;
        }
        .dashboard-card {
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            transition: 0.3s ease-in-out;
        }
        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.2);
        }
        .dashboard-card .card-body {
            text-align: center;
            padding: 25px;
        }
        .dashboard-card i {
            font-size: 40px;
            margin-bottom: 10px;
            color: #007bff;
        }
        .btn-custom {
            background-color: #007bff;
            color: white;
            border-radius: 25px;
            font-size: 16px;
            transition: 0.3s ease-in-out;
        }
        .btn-custom:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }
    </style>
</head>
<body>

    <!-- Main Container -->
    <div class="container mt-5">

        <!-- Welcome Section -->
        <div class="text-center mb-4">
            <h2>Welcome, <i class="fas fa-user-shield"></i> Admin!</h2>
            <p class="lead">Manage your cab services efficiently from here.</p>
            <a href="/MegaCityCab/admin_logout.jsp" class="btn btn-danger"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>

        <!-- Dashboard Cards Section -->
        <div class="row">
        
            <!-- Manage Customers Card -->
            <div class="col-md-4">
                <div class="card dashboard-card">
                    <div class="card-body">
                        <i class="fas fa-users"></i>
                        <h4 class="card-title">Manage Customers</h4>
                        <p class="card-text">View and manage all customer profiles.</p>
                        <a href="/MegaCityCab/customers.jsp" class="btn btn-custom"><i class="fas fa-eye"></i> View Customers</a>
                    </div>
                </div>
            </div>

            <!-- Manage Drivers Card -->
            <div class="col-md-4">
                <div class="card dashboard-card">
                    <div class="card-body">
                        <i class="fas fa-id-card"></i>
                        <h4 class="card-title">Manage Drivers</h4>
                        <p class="card-text">Add and manage drivers, assign vehicles.</p>
                        <a href="/MegaCityCab/drivers.jsp" class="btn btn-custom"><i class="fas fa-car"></i> View Drivers</a>
                    </div>
                </div>
            </div>

            <!-- Manage Bookings Card -->
            <div class="col-md-4">
                <div class="card dashboard-card">
                    <div class="card-body">
                        <i class="fas fa-calendar-check"></i>
                        <h4 class="card-title">Manage Bookings</h4>
                        <p class="card-text">See all customer bookings and schedules.</p>
                        <a href="/MegaCityCab/bookings.jsp" class="btn btn-custom"><i class="fas fa-list"></i> View Bookings</a>
                    </div>
                </div>
            </div>

            <!-- Manage Cars Card -->
            <div class="col-md-4">
                <div class="card dashboard-card">
                    <div class="card-body">
                        <i class="fas fa-taxi"></i>
                        <h4 class="card-title">Manage Cars</h4>
                        <p class="card-text">Add and manage cars in your fleet.</p>
                        <a href="/MegaCityCab/car.jsp" class="btn btn-custom"><i class="fas fa-cogs"></i> Manage Cars</a>
                    </div>
                </div>
            </div>

        </div>

        <!-- Additional Options -->
        <div class="text-center mt-4">
            <p class="lead">Access more features and manage your cab service efficiently.</p>
            
            <a href="/MegaCityCab/car.jsp" class="btn btn-custom"><i class="fas fa-car-side"></i> View Cars</a>
        </div>

    </div> <!-- End of container -->

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

</body>
</html>
