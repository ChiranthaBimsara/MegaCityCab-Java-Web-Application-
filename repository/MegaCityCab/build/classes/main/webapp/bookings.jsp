<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Create Booking</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>Create a Booking</h2>
        <% if(request.getParameter("error") != null) { %>
            <div class="alert alert-danger">Error Creating Booking</div>
        <% } else if(request.getParameter("success") != null) { %>
            <div class="alert alert-success">Booking Created Successfully</div>
        <% } %>
        <form action="../BookingServlet" method="post">
            <div class="mb-3">
                <label>Customer ID</label>
                <input type="number" name="customerID" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>Driver ID</label>
                <input type="number" name="driverID" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>Destination</label>
                <input type="text" name="destination" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>Total Amount</label>
                <input type="number" name="totalAmount" class="form-control" required>
            </div>
            <button class="btn btn-primary">Book Now</button>
        </form>
    </div>
</body>
</html>
