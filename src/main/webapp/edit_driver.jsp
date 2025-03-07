<%@ include file="navbar.jsp" %>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page import="com.megacitycab.db.DBConnection" %>

<%
    String driverID = request.getParameter("driverID");
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    String name = "", licenseNumber = "", phoneNumber = "";
    int carID = 0;

    try {
        conn = DBConnection.getConnection();
        String query = "SELECT * FROM Drivers WHERE DriverID=?";
        ps = conn.prepareStatement(query);
        ps.setString(1, driverID);
        rs = ps.executeQuery();

        if (rs.next()) {
            name = rs.getString("Name");
            licenseNumber = rs.getString("LicenseNumber");
            phoneNumber = rs.getString("PhoneNumber");
            carID = rs.getInt("CarID");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Edit Driver</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>Edit Driver Details</h2>

        <form action="DriverServlet" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="driverID" value="<%= driverID %>">

            <div class="mb-3">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" class="form-control" value="<%= name %>" required>
            </div>

            <div class="mb-3">
                <label for="licenseNumber">License Number</label>
                <input type="text" id="licenseNumber" name="licenseNumber" class="form-control" value="<%= licenseNumber %>" required>
            </div>

            <div class="mb-3">
                <label for="phoneNumber">Phone Number</label>
                <input type="text" id="phoneNumber" name="phoneNumber" class="form-control" value="<%= phoneNumber %>" required>
            </div>

            <div class="mb-3">
                <label for="carID">Car ID</label>
                <input type="number" id="carID" name="carID" class="form-control" value="<%= carID %>" required>
            </div>

            <button class="btn btn-primary" type="submit">Update Driver</button>
        </form>
    </div>
</body>
</html>
