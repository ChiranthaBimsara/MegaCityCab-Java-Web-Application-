<%@ include file="customer_navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Register Customer</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 500px;
            margin-top: 50px;
        }
        .card {
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background: white;
        }
        .form-control {
            border-radius: 8px;
            padding: 10px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .btn-primary {
            padding: 10px 20px;
            border-radius: 8px;
            width: 100%;
            font-size: 16px;
            transition: 0.3s ease-in-out;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }
        .error {
            color: red;
            font-size: 14px;
            display: none;
            margin-top: 5px;
        }
    </style>

    <script>
        function validateForm() {
            let nic = document.getElementById("nic").value;
            let phone = document.getElementById("phoneNumber").value;
            let password = document.getElementById("password").value;
            let confirmPassword = document.getElementById("confirmPassword").value;
            let isValid = true;

            // NIC validation (Sri Lankan format: either 10 characters with V/X at end or 12 digits)
            let nicRegex = /^[0-9]{9}[VXvx]$|^[0-9]{12}$/;
            if (!nicRegex.test(nic)) {
                document.getElementById("nicError").style.display = "block";
                isValid = false;
            } else {
                document.getElementById("nicError").style.display = "none";
            }

            // Phone number validation (10 digits only)
            let phoneRegex = /^[0-9]{10}$/;
            if (!phoneRegex.test(phone)) {
                document.getElementById("phoneError").style.display = "block";
                isValid = false;
            } else {
                document.getElementById("phoneError").style.display = "none";
            }

            // Password length check
            if (password.length < 6) {
                document.getElementById("passwordError").style.display = "block";
                isValid = false;
            } else {
                document.getElementById("passwordError").style.display = "none";
            }

            // Password confirmation check
            if (password !== confirmPassword) {
                document.getElementById("confirmPasswordError").style.display = "block";
                isValid = false;
            } else {
                document.getElementById("confirmPasswordError").style.display = "none";
            }

            return isValid;
        }
    </script>
</head>
<body>

    <div class="container">
        <div class="card">
            <h2 class="text-center mb-4"><i class="fas fa-user-plus"></i> Register</h2>

            <!-- Display success or error messages -->
            <% if(request.getParameter("error") != null) { %>
                <div class="alert alert-danger">Error Adding Customer</div>
            <% } else if(request.getParameter("success") != null) { %>
                <div class="alert alert-success">Customer Added Successfully</div>
            <% } %>

            <!-- Registration Form -->
            <form action="<%=request.getContextPath()%>/CustomerServlet" method="post" onsubmit="return validateForm();">

                <div class="form-group">
                    <label for="name"><i class="fas fa-user"></i> Name</label>
                    <input type="text" id="name" name="name" class="form-control" required>
                </div>

                <div class="form-group">
                    <label for="address"><i class="fas fa-map-marker-alt"></i> Address</label>
                    <input type="text" id="address" name="address" class="form-control">
                </div>

                <div class="form-group">
                    <label for="nic"><i class="fas fa-id-card"></i> NIC</label>
                    <input type="text" id="nic" name="nic" class="form-control" required>
                    <span id="nicError" class="error">Invalid NIC! Must be 9 digits + V/X or 12 digits.</span>
                </div>

                <div class="form-group">
                    <label for="phoneNumber"><i class="fas fa-phone"></i> Phone Number</label>
                    <input type="text" id="phoneNumber" name="phoneNumber" class="form-control" required>
                    <span id="phoneError" class="error">Invalid Phone Number! Must be exactly 10 digits.</span>
                </div>

                <div class="form-group">
                    <label for="username"><i class="fas fa-user-tag"></i> Username</label>
                    <input type="text" id="username" name="username" class="form-control" required>
                </div>

                <div class="form-group">
                    <label for="password"><i class="fas fa-lock"></i> Password</label>
                    <input type="password" id="password" name="password" class="form-control" required>
                    <span id="passwordError" class="error">Password must be at least 6 characters long.</span>
                </div>

                <div class="form-group">
                    <label for="confirmPassword"><i class="fas fa-lock"></i> Confirm Password</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" required>
                    <span id="confirmPasswordError" class="error">Passwords do not match!</span>
                </div>

                <button type="submit" class="btn btn-primary mt-3">Register</button>
            </form>

            <div class="text-center mt-3">
                <p>Already have an account? <a href="customer_login.jsp">Login here</a></p>
            </div>
        </div>
    </div>

</body>
</html>
