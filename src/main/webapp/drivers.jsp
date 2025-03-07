<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Manage Drivers</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style>
        .form-container {
            max-width: 600px;
            margin: auto;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }
        .btn-custom {
            width: 100%;
            border-radius: 25px;
        }
        .alert {
            text-align: center;
        }
        .icon {
            margin-right: 8px;
        }
    </style>

    <script>
        function validateForm() {
            let phone = document.getElementById("phoneNumber").value;
            let license = document.getElementById("licenseNumber").value;
            let phoneRegex = /^[0-9]{10}$/;
            let licenseRegex = /^[A-Z0-9-]+$/;

            if (!phoneRegex.test(phone)) {
                alert("Invalid phone number! Must be exactly 10 digits.");
                return false;
            }
            if (!licenseRegex.test(license)) {
                alert("Invalid license number! Only uppercase letters, numbers, and dashes are allowed.");
                return false;
            }
            return true;
        }
    </script>
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h2 class="text-center"><i class="fas fa-user-tie"></i> Add New Driver</h2>

        <% if(request.getParameter("success") != null) { %>
            <div class="alert alert-success"><i class="fas fa-check-circle"></i> Driver Added Successfully</div>
        <% } else if(request.getParameter("error") != null) { %>
            <div class="alert alert-danger"><i class="fas fa-exclamation-triangle"></i> Error Adding Driver</div>
        <% } %>

        <div class="form-container">
            <form action="DriverServlet" method="post" onsubmit="return validateForm();">
                <input type="hidden" name="action" value="add">

                <div class="mb-3">
                    <label><i class="fas fa-user icon"></i>Name</label>
                    <input type="text" name="name" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label><i class="fas fa-id-card icon"></i>License Number</label>
                    <input type="text" id="licenseNumber" name="licenseNumber" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label><i class="fas fa-phone icon"></i>Phone Number</label>
                    <input type="text" id="phoneNumber" name="phoneNumber" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label><i class="fas fa-car icon"></i>Car ID</label>
                    <input type="number" name="carID" class="form-control" required>
                </div>

                <button class="btn btn-primary btn-custom"><i class="fas fa-plus-circle"></i> Add Driver</button>
            </form>
        </div>

        <!-- Button to View Driver Details -->
        <div class="text-center mt-4">
            <a href="drivers_details.jsp" class="btn btn-secondary btn-custom"><i class="fas fa-list"></i> View Drivers</a>
        </div>
    </div>
</body>
</html>
