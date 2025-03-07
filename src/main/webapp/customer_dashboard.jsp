<%@ include file="customer_navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Dashboard - MegaCityCab</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .dashboard-container {
            max-width: 900px;
            margin: auto;
            padding: 30px;
        }
        .dashboard-header {
            text-align: center;
            margin-bottom: 30px;
        }
        .dashboard-card {
            border: none;
            border-radius: 12px;
            transition: all 0.3s ease-in-out;
            background: white;
            text-align: center;
            padding: 20px;
        }
        .dashboard-card:hover {
            transform: scale(1.05);
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.1);
        }
        .dashboard-card i {
            font-size: 40px;
            color: #007bff;
            margin-bottom: 10px;
        }
        .btn-custom {
            background-color: #007bff;
            color: white;
            border-radius: 25px;
            font-size: 16px;
            padding: 10px 20px;
            transition: 0.3s;
        }
        .btn-custom:hover {
            background-color: #0056b3;
        }
        .logout-btn {
            position: absolute;
            top: 15px;
            right: 20px;
        }
    </style>
</head>
<body class="bg-light">

    <!-- Main Container -->
    <div class="dashboard-container">

        <!-- Logout Button -->
        <a href="/LogoutServlet" class="btn btn-danger logout-btn"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>

        <!-- Welcome Section -->
        <div class="dashboard-header">
            <h2><i class="fa-solid fa-user"></i> Welcome, Customer!</h2>
            <p class="lead">Manage your bookings, profile, and payments from here. Use the options below to get started.</p>
        </div>

        <!-- Dashboard Cards Section -->
        <div class="row g-4">
            <div class="col-md-4">
                <div class="dashboard-card shadow-sm">
                    <i class="fa-solid fa-user-gear"></i>
                    <h4>Manage Profile</h4>
                    <p>View and update your personal information.</p>
                    <a href="/MegaCityCab/customer_profile.jsp" class="btn btn-custom">View Profile</a>
                </div>
            </div>

            <div class="col-md-4">
                <div class="dashboard-card shadow-sm">
                    <i class="fa-solid fa-clipboard-list"></i>
                    <h4>Manage Bookings</h4>
                    <p>Check current status, view past bookings, or make new reservations.</p>
                    <a href="/MegaCityCab/bookingdetails4customer.jsp" class="btn btn-custom">View Bookings</a>
                </div>
            </div>

            <div class="col-md-4">
                <div class="dashboard-card shadow-sm">
                    <i class="fa-solid fa-money-bill-wave"></i>
                    <h4>Manage Payments</h4>
                    <p>View your payment history and billing details.</p>
                    <a href="/MegaCityCab/generatebill.jsp" class="btn btn-custom">View Payments</a>
                </div>
            </div>
        </div>

        <!-- Additional Options -->
        <div class="row mt-4 text-center">
            <div class="col-md-6">
                <div class="dashboard-card shadow-sm">
                    <i class="fa-solid fa-headset"></i>
                    <h4>Customer Support</h4>
                    <p>Need help? Reach out to our support team.</p>
                    <a href="/MegaCityCab/help.jsp" class="btn btn-custom">Get Help</a>
                </div>
            </div>

            <div class="col-md-6">
                <div class="dashboard-card shadow-sm">
                    <i class="fa-solid fa-car"></i>
                    <h4>View Available Cars</h4>
                    <p>Check our fleet of vehicles and their availability.</p>
                    <a href="/MegaCityCab/carDetails4customer.jsp" class="btn btn-custom">View Cars</a>
                </div>
            </div>
        </div>

    </div> <!-- End of container -->

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

</body>
</html>
