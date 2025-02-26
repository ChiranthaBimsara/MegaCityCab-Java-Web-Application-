<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Payment Receipt</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>Payment Receipt</h2>
        <% if(request.getParameter("success") != null) { %>
            <div class="alert alert-success"><%= request.getParameter("success") %></div>
            <h4>Amount Paid: LKR <%= request.getParameter("amount") %></h4>
        <% } else { %>
            <div class="alert alert-danger">Payment not found</div>
        <% } %>
        <a href="customer_dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
    </div>
</body>
</html>
