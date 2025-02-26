<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h2>Admin Login</h2>
        
        
                <!-- Display success message after logout -->
        <% if(request.getParameter("message") != null) { %>
            <div class="alert alert-success text-center">
                <%= request.getParameter("message") %>
            </div>
        <% } %>
        
        <!-- Error message if login fails -->
        <% if(request.getParameter("error") != null) { %>
            <div class="alert alert-danger">Invalid Username or Password</div>
        <% } %>
        
        
        <form action="AdminLoginServlet" method="post">
    <div class="form-group">
        <label for="username">Username</label>
        <input type="text" id="username" name="username" class="form-control" required>
    </div>
    <div class="form-group">
        <label for="password">Password</label>
        <input type="password" id="password" name="password" class="form-control" required>
    </div>
    <button type="submit" class="btn btn-primary">Login</button>
</form>

    </div>
</body>
</html>
