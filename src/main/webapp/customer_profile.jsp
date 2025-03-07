<%@ include file="customer_navbar.jsp" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Customer Profile - MegaCityCab</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .profile-container {
            max-width: 600px;
            margin: auto;
            padding: 30px;
        }
        .profile-card {
            border: none;
            border-radius: 12px;
            padding: 25px;
            background: white;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
            transition: 0.3s;
        }
        .profile-card:hover {
            transform: translateY(-5px);
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.15);
        }
        .profile-card .card-title {
            font-size: 22px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 15px;
        }
        .profile-info {
            font-size: 16px;
            margin-bottom: 10px;
        }
        .profile-info i {
            margin-right: 10px;
            color: #007bff;
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

    <!-- Profile Container -->
    <div class="profile-container">

        <!-- Profile Header -->
        <div class="text-center mb-4">
            <h2><i class="fa-solid fa-user-circle"></i> Welcome, <%= session.getAttribute("fullName") %>!</h2>
            <p class="text-muted">View and manage your profile details below.</p>
        </div>

        <!-- Profile Card -->
        <div class="card profile-card">
            <div class="card-body">
                <h5 class="card-title"><i class="fa-solid fa-id-badge"></i> Profile Details</h5>
                <hr>
                <p class="profile-info"><i class="fa-solid fa-id-card"></i> <strong>Customer ID:</strong> <%= session.getAttribute("customerID") %></p>
                <p class="profile-info"><i class="fa-solid fa-user"></i> <strong>Username:</strong> <%= session.getAttribute("username") %></p>
                <p class="profile-info"><i class="fa-solid fa-user-tag"></i> <strong>Name:</strong> <%= session.getAttribute("fullName") %></p>
                <p class="profile-info"><i class="fa-solid fa-map-marker-alt"></i> <strong>Address:</strong> <%= session.getAttribute("address") %></p>
                <p class="profile-info"><i class="fa-solid fa-id-card-alt"></i> <strong>NIC:</strong> <%= session.getAttribute("nic") %></p>
                <p class="profile-info"><i class="fa-solid fa-phone"></i> <strong>Phone Number:</strong> <%= session.getAttribute("phoneNumber") %></p>
            </div>
        </div>

        <!-- Edit Profile Button -->
        <div class="mt-4 text-center">
            <a href="edit_customer_profile.jsp" class="btn btn-custom"><i class="fa-solid fa-edit"></i> Edit Profile</a>
        </div>

    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

</body>
</html>
