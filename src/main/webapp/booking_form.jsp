<%@ include file="customer_navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Create Booking - MegaCityCab</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .booking-container {
            max-width: 600px;
            margin: auto;
            padding: 30px;
        }
        .booking-card {
            border: none;
            border-radius: 12px;
            padding: 25px;
            background: white;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
            transition: 0.3s;
        }
        .booking-card:hover {
            transform: translateY(-5px);
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.15);
        }
        .booking-card .card-title {
            font-size: 22px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 15px;
        }
        .form-control {
            border-radius: 8px;
        }
        .form-label {
            font-weight: bold;
        }
        .btn-custom {
            background-color: #007bff;
            color: white;
            border-radius: 25px;
            font-size: 16px;
            padding: 10px 20px;
            transition: 0.3s;
            width: 100%;
        }
        .btn-custom:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <!-- Booking Container -->
    <div class="booking-container">

        <!-- Create Booking Header -->
        <div class="text-center mb-4">
            <h2><i class="fa-solid fa-taxi"></i> Create a Booking</h2>
            <p class="text-muted">Fill in the details below to book your ride.</p>
        </div>

        <!-- Success/Error Messages -->
        <% if(request.getParameter("error") != null) { %>
            <div class="alert alert-danger"><i class="fa-solid fa-exclamation-circle"></i> Error Creating Booking</div>
        <% } else if(request.getParameter("success") != null) { %>
            <div class="alert alert-success"><i class="fa-solid fa-check-circle"></i> Booking Created Successfully</div>
        <% } %>

        <!-- Booking Form -->
        <div class="card booking-card">
            <div class="card-body">
                <h5 class="card-title"><i class="fa-solid fa-clipboard-list"></i> Booking Details</h5>
                <hr>

                <form action="BookingServlet" method="post">
                    <input type="hidden" name="action" value="create"> <!-- Specify the action as 'create' -->

                    <!-- Customer ID -->
                    <div class="mb-3">
                        <label for="customerID" class="form-label"><i class="fa-solid fa-user"></i> Customer ID</label>
                        <input type="number" id="customerID" name="customerID" class="form-control" required>
                    </div>

                    <!-- Driver ID -->
                    <div class="mb-3">
                        <label for="driverID" class="form-label"><i class="fa-solid fa-id-card"></i> Driver ID</label>
                        <input type="number" id="driverID" name="driverID" class="form-control" required>
                    </div>

                    <!-- Pickup Location -->
                    <div class="mb-3">
                        <label for="pickupLocation" class="form-label"><i class="fa-solid fa-map-marker-alt"></i> Pickup Location</label>
                        <input type="text" id="pickupLocation" name="pickupLocation" class="form-control" required>
                    </div>

                    <!-- Destination -->
                    <div class="mb-3">
                        <label for="destination" class="form-label"><i class="fa-solid fa-map"></i> Destination</label>
                        <input type="text" id="destination" name="destination" class="form-control" required>
                    </div>

                    <!-- Total Amount -->
                    <div class="mb-3">
                        <label for="totalAmount" class="form-label"><i class="fa-solid fa-money-bill-wave"></i> Total Amount (LKR)</label>
                        <input type="number" id="totalAmount" name="totalAmount" class="form-control" required>
                    </div>

                    <!-- Submit Button -->
                    <button type="submit" class="btn btn-custom"><i class="fa-solid fa-check"></i> Book Now</button>
                </form>
            </div>
        </div>

    </div> <!-- End of booking container -->

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

</body>
</html>
