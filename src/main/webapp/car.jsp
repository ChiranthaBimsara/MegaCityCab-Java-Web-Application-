<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add Car</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        body {
            background-color: #f8f9fa;
        }
        .form-container {
            max-width: 500px;
            margin: auto;
            padding: 25px;
            border-radius: 10px;
            background-color: white;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .btn-custom {
            width: 100%;
            border-radius: 25px;
        }
        .alert {
            text-align: center;
            font-weight: bold;
        }
        .icon {
            margin-right: 8px;
        }
        .form-control {
            border-radius: 8px;
        }
    </style>

    <script>
        function validateForm() {
            let license = document.getElementById("licenseNumber").value;
            let year = document.getElementById("year").value;
            let licenseRegex = /^[A-Z0-9-]+$/;

            if (!licenseRegex.test(license)) {
                alert("Invalid license number! Only uppercase letters, numbers, and dashes are allowed.");
                return false;
            }
            if (year < 1900 || year > new Date().getFullYear()) {
                alert("Invalid Year! Please enter a valid car manufacturing year.");
                return false;
            }
            return true;
        }
    </script>
</head>

<body class="bg-light">
    <div class="container mt-5">
        <h2 class="text-center"><i class="fas fa-car"></i> Add New Car</h2>

        <!-- Success & Error Messages -->
        <% if(request.getParameter("error") != null) { %>
            <div class="alert alert-danger"><i class="fas fa-exclamation-circle"></i> <%= request.getParameter("error") %></div>
        <% } else if(request.getParameter("success") != null) { %>
            <div class="alert alert-success"><i class="fas fa-check-circle"></i> <%= request.getParameter("success") %></div>
        <% } %>

        <div class="form-container">
            <form action="CarServlet" method="post" onsubmit="return validateForm();">
                <div class="mb-3">
                    <label for="carModel"><i class="fas fa-car-side icon"></i>Car Model</label>
                    <input type="text" id="carModel" name="carModel" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="licenseNumber"><i class="fas fa-id-card icon"></i>License Number</label>
                    <input type="text" id="licenseNumber" name="licenseNumber" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="year"><i class="fas fa-calendar icon"></i>Year</label>
                    <input type="number" id="year" name="year" class="form-control" required>
                </div>

                <button class="btn btn-primary btn-custom"><i class="fas fa-plus-circle"></i> Add Car</button>
            </form>
        </div>

        <!-- Button to View Car Details -->
        <div class="text-center mt-4">
            <a href="car_details.jsp" class="btn btn-secondary btn-custom"><i class="fas fa-list"></i> View Car Details</a>
        </div>
    </div>
</body>
</html>
