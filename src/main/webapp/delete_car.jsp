<%@ include file="navbar.jsp" %>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement" %>
<%@ page import="com.megacitycab.db.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Delete Car</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>Delete Car</h2>
        <%
            // Retrieve carID from the URL parameters
            int carID = Integer.parseInt(request.getParameter("carID"));
            Connection conn = null;
            PreparedStatement ps = null;
            try {
                conn = DBConnection.getConnection();
                String query = "DELETE FROM Cars WHERE CarID = ?";
                ps = conn.prepareStatement(query);
                ps.setInt(1, carID);

                int rowsDeleted = ps.executeUpdate();
                if (rowsDeleted > 0) {
        %>
                    <div class="alert alert-success">Car Deleted Successfully</div>
                    <a href="car_details.jsp" class="btn btn-secondary mt-4">Back to Car Details</a>
        <%
                } else {
        %>
                    <div class="alert alert-danger">Error Deleting Car</div>
                    <a href="car_details.jsp" class="btn btn-secondary mt-4">Back to Car Details</a>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
        %>
                <div class="alert alert-danger">Error Deleting Car</div>
                <a href="car_details.jsp" class="btn btn-secondary mt-4">Back to Car Details</a>
        <%
            } finally {
                if (ps != null) try { ps.close(); } catch (Exception e) {}
                if (conn != null) try { conn.close(); } catch (Exception e) {}
            }
        %>
    </div>
</body>
</html>
