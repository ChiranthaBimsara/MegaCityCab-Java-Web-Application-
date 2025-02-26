<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Register Customer</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>Register Customer</h2>
        
        <!-- Display success or error message based on request parameters -->
        <% if(request.getParameter("error") != null) { %>
            <div class="alert alert-danger">Error Adding Customer</div>
        <% } else if(request.getParameter("success") != null) { %>
            <div class="alert alert-success">Customer Added Successfully</div>
        <% } %>
        
        <!-- Form to capture customer registration details -->
         <form action="<%=request.getContextPath()%>/CustomerServlet" method="post">

            <div class="mb-3">
                <label for="name">Name</label>
                <input type="text" name="name" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="address">Address</label>
                <input type="text" name="address" class="form-control">
            </div>
            <div class="mb-3">
                <label for="nic">NIC</label>
                <input type="text" name="nic" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="phoneNumber">Phone Number</label>
                <input type="text" name="phoneNumber" class="form-control" required>
            </div>
            <!-- Add username and password fields if required -->
            <div class="mb-3">
                <label for="username">Username</label>
                <input type="text" name="username" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="password">Password</label>
                <input type="password" name="password" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary">Register</button>
        </form>
    </div>
</body>
</html>
