<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Login - MegaCityCab</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .login-container {
            max-width: 400px;
            margin: 50px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        .login-container h2 {
            margin-bottom: 20px;
        }
        .form-control {
            border-radius: 10px;
        }
        .btn-primary {
            border-radius: 10px;
            width: 100%;
            font-size: 18px;
        }
        .input-group-text {
            background: #007bff;
            color: white;
            border-radius: 10px 0 0 10px;
        }
        .link-text {
            text-decoration: none;
        }
        .link-text:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body class="bg-light">
    <div class="login-container">
        <h2><i class="fa-solid fa-user-circle"></i> Customer Login</h2>


<!-- Show Registration Success Message -->
<% if(request.getParameter("success") != null) { %>
    <div class="alert alert-success"><i class="fa-solid fa-circle-check"></i> <%= request.getParameter("success") %></div>
<% } %>

        <!-- Login Form -->
   <form action="<%=request.getContextPath()%>/CustomerLoginServlet" method="post">
    <div class="mb-3 input-group">
        <span class="input-group-text"><i class="fa-solid fa-user"></i></span>
        <input type="text" name="username" class="form-control" placeholder="Username" required>
    </div>
    <div class="mb-3 input-group">
        <span class="input-group-text"><i class="fa-solid fa-lock"></i></span>
        <input type="password" name="password" class="form-control" placeholder="Password" required>
    </div>
    <button type="submit" class="btn btn-primary"><i class="fa-solid fa-right-to-bracket"></i> Login</button>
</form>

<!-- Show only login success message when actual login occurs -->
<% if(request.getParameter("error") != null) { %>
    <div class="alert alert-danger"><i class="fa-solid fa-triangle-exclamation"></i> Invalid Username or Password</div>
<% } %>

    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

</body>
</html>
