<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        body {
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-container {
            max-width: 400px;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-control {
            border-radius: 8px;
            padding: 10px;
        }
        .btn-primary {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            font-size: 16px;
            transition: 0.3s ease-in-out;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }
        .text-center {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

    <div class="login-container">
        <h2 class="text-center"><i class="fas fa-user-shield"></i> Admin Login</h2>

        <!-- Display success message after login success -->
        <% if(request.getParameter("message") != null) { %>
            <script>
            window.onload = function() {
                alert('Login Successfully!');
            };
        </script>
        <% } %>
        <!-- Error message if login fails -->
        <% if(request.getParameter("error") != null) { %>
            <div class="alert alert-danger text-center">Invalid Username or Password</div>
        <% } %>

        <!-- Login Form -->
        <form action="AdminLoginServlet" method="post">
            <div class="mb-3">
                <label for="username"><i class="fas fa-user"></i> Username</label>
                <input type="text" id="username" name="username" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="password"><i class="fas fa-lock"></i> Password</label>
                <input type="password" id="password" name="password" class="form-control" required>
            </div>

            <button type="submit" class="btn btn-primary"><i class="fas fa-sign-in-alt"></i> Login</button>
        </form>
    </div>

</body>
</html>
