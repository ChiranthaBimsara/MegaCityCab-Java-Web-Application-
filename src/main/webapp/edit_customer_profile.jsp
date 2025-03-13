<%@ include file="customer_navbar.jsp" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Edit Customer Profile - MegaCityCab</title>
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
        .edit-profile-card {
            border: none;
            border-radius: 12px;
            padding: 25px;
            background: white;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
            transition: 0.3s;
        }
        .edit-profile-card:hover {
            transform: translateY(-5px);
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.15);
        }
        .edit-profile-card .card-title {
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

    <!-- Profile Container -->
    <div class="profile-container">

        <!-- Edit Profile Header -->
        <div class="text-center mb-4">
            <h2><i class="fa-solid fa-user-edit"></i> Edit Your Profile</h2>
            <p class="text-muted">Update your personal details below.</p>
        </div>

        <!-- Edit Profile Form -->
        <div class="card edit-profile-card">
            <div class="card-body">
                <h5 class="card-title"><i class="fa-solid fa-user"></i> Profile Information</h5>
                <hr>

                <form action="UpdateCustomerServlet" method="post">
                    <input type="hidden" name="customerID" value="<%= session.getAttribute("customerID") %>">

                    <!-- Username -->
                    <div class="mb-3">
                        <label for="username" class="form-label"><i class="fa-solid fa-user"></i> Username</label>
                        <input type="text" id="username" name="username" class="form-control" value="<%= session.getAttribute("username") %>" required>
                    </div>

                    <!-- Full Name -->
                    <div class="mb-3">
                        <label for="fullName" class="form-label"><i class="fa-solid fa-user-tag"></i> Full Name</label>
                        <input type="text" id="fullName" name="fullName" class="form-control" value="<%= session.getAttribute("fullName") %>" required>
                    </div>

                    <!-- Address -->
                    <div class="mb-3">
                        <label for="address" class="form-label"><i class="fa-solid fa-map-marker-alt"></i> Address</label>
                        <input type="text" id="address" name="address" class="form-control" value="<%= session.getAttribute("address") %>" required>
                    </div>

                    <!-- Phone Number -->
                    <div class="mb-3">
                        <label for="phoneNumber" class="form-label"><i class="fa-solid fa-phone"></i> Phone Number</label>
                        <input type="text" id="phoneNumber" name="phoneNumber" class="form-control" value="<%= session.getAttribute("phoneNumber") %>" required>
                    </div>

                    <!-- NIC -->
                    <div class="mb-3">
                        <label for="nic" class="form-label"><i class="fa-solid fa-id-card"></i> NIC</label>
                        <input type="text" id="nic" name="nic" class="form-control" value="<%= session.getAttribute("nic") %>" required>
                    </div>

                    <!-- Submit Button -->
                    <button type="submit" class="btn btn-custom"><i class="fa-solid fa-save"></i> Save Changes</button>
                </form>
            </div>
        </div>

    </div> <!-- End of profile container -->

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

</body>
</html>
