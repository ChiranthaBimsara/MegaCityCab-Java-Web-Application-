<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Manage Drivers</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>Add New Driver</h2>
        <% if(request.getParameter("success") != null) { %>
            <div class="alert alert-success">Driver Added Successfully</div>
        <% } else if(request.getParameter("error") != null) { %>
            <div class="alert alert-danger">Error Adding Driver</div>
        <% } %>
        <form action="DriverServlet" method="post">
            <div class="mb-3">
                <label>Name</label>
                <input type="text" name="name" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>License Number</label>
                <input type="text" name="licenseNumber" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>Phone Number</label>
                <input type="text" name="phoneNumber" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>Car ID</label>
                <input type="number" name="carID" class="form-control" required>
            </div>
            <button class="btn btn-primary">Add Driver</button>
        </form>
    </div>
</body>
</html>
