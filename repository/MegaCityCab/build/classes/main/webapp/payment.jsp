<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Make Payment</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>Payment for Booking</h2>
        
        <!-- Display success or error message based on request parameters -->
        <% if(request.getParameter("error") != null) { %>
            <div class="alert alert-danger">Payment Failed</div>
        <% } %>

        <% if(request.getParameter("success") != null) { %>
            <div class="alert alert-success">Payment Successful</div>
        <% } %>
        
        <!-- Display the total amount if present -->
        <% 
            String totalAmountParam = request.getParameter("totalAmount");
            if (totalAmountParam != null) {
        %>
            <div class="alert alert-info">
                <strong>Total Amount:</strong> $<%= totalAmountParam %>
            </div>
        <% } %>
        
        <form action="/PaymentServlet" method="post">
            <div class="mb-3">
                <label>Booking ID</label>
                <input type="number" name="bookingID" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>Customer ID</label>
                <input type="number" name="customerID" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>Distance (KM)</label>
                <input type="number" name="distance" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>Payment Method</label>
                <select name="paymentMethod" class="form-control" required>
                    <option value="Cash">Cash</option>
                    <option value="Credit Card">Credit Card</option>
                </select>
            </div>
            <button class="btn btn-primary">Make Payment</button>
        </form>
    </div>
</body>
</html>
