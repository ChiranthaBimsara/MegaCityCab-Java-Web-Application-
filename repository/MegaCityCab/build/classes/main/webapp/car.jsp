<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add Car</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>Add New Car</h2>

        <% if(request.getParameter("error") != null) { %>
            <div class="alert alert-danger">Error: <%= request.getParameter("error") %></div>
        <% } else if(request.getParameter("success") != null) { %>
            <div class="alert alert-success"><%= request.getParameter("success") %></div>
        <% } %>

        <form action="CarServlet" method="post">
    <div class="mb-3">
        <label for="carModel">Car Model</label>
        <input type="text" name="carModel" class="form-control" required>
    </div>
    <div class="mb-3">
        <label for="licenseNumber">License Number</label>
        <input type="text" name="licenseNumber" class="form-control" required>
    </div>
    <div class="mb-3">
        <label for="year">Year</label>
        <input type="number" name="year" class="form-control" required>
    </div>
    <button class="btn btn-primary">Add Car</button>
</form>

<% if(request.getParameter("error") != null) { %>
    <div class="alert alert-danger"><%= request.getParameter("error") %></div>
<% } %>

<% if(request.getParameter("success") != null) { %>
    <div class="alert alert-success"><%= request.getParameter("success") %></div>
<% } %>

    </div>
</body>
</html>
