<%@ include file="navbar.jsp" %>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page import="com.megacitycab.db.DBConnection" %>
<%@ page import="com.megacitycab.model.Car" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Edit Car</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <script>
        function validateForm() {
            let license = document.getElementById("licenseNumber").value;
            let year = document.getElementById("year").value;
            let licenseRegex = /^[A-Z0-9-]+$/;
            let yearRegex = /^[0-9]{4}$/;

            if (!licenseRegex.test(license)) {
                alert("Invalid License Number! Only uppercase letters, numbers, and dashes are allowed.");
                return false;
            }

            if (!yearRegex.test(year) || year < 1900 || year > new Date().getFullYear()) {
                alert("Invalid Year! Enter a valid 4-digit year.");
                return false;
            }
            return true;
        }
    </script>

    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 600px;
            margin-top: 30px;
        }
        .card {
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background: white;
        }
        .form-control {
            border-radius: 8px;
        }
        .btn-custom {
            border-radius: 25px;
            width: 100%;
        }
        .alert {
            text-align: center;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="card">
            <h2 class="text-center mb-3"><i class="fas fa-car"></i> Edit Car Details</h2>

            <%-- Display success or error message based on request parameters --%>
            <% if(request.getParameter("error") != null) { %>
                <div class="alert alert-danger"><i class="fas fa-exclamation-circle"></i> <%= request.getParameter("error") %></div>
            <% } else if(request.getParameter("success") != null) { %>
                <div class="alert alert-success"><i class="fas fa-check-circle"></i> <%= request.getParameter("success") %></div>
            <% } %>

            <%
                int carID = Integer.parseInt(request.getParameter("carID"));
                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                Car car = null;
                try {
                    conn = DBConnection.getConnection();
                    String query = "SELECT * FROM Cars WHERE CarID = ?";
                    ps = conn.prepareStatement(query);
                    ps.setInt(1, carID);
                    rs = ps.executeQuery();

                    if (rs.next()) {
                        car = new Car(
                            rs.getInt("CarID"),
                            rs.getString("CarModel"),
                            rs.getString("LicenseNumber"),
                            rs.getInt("Year")
                        );
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) try { rs.close(); } catch (Exception e) {}
                    if (ps != null) try { ps.close(); } catch (Exception e) {}
                    if (conn != null) try { conn.close(); } catch (Exception e) {}
                }
            %>

            <!-- Car Update Form -->
            <form action="CarEditServlet" method="post" onsubmit="return validateForm();">
                <input type="hidden" name="carID" value="<%= car.getCarID() %>">

                <div class="mb-3">
                    <label><i class="fas fa-car"></i> Car Model</label>
                    <input type="text" name="carModel" class="form-control" value="<%= car.getCarModel() %>" required>
                </div>

                <div class="mb-3">
                    <label><i class="fas fa-id-card"></i> License Number</label>
                    <input type="text" id="licenseNumber" name="licenseNumber" class="form-control" value="<%= car.getLicenseNumber() %>" required>
                </div>

                <div class="mb-3">
                    <label><i class="fas fa-calendar"></i> Year</label>
                    <input type="number" id="year" name="year" class="form-control" value="<%= car.getYear() %>" required>
                </div>

                <button type="submit" class="btn btn-primary btn-custom"><i class="fas fa-save"></i> Update Car</button>
            </form>

            <!-- Back to Car Details Button -->
            <div class="text-center mt-3">
                <a href="car_details.jsp" class="btn btn-secondary btn-custom"><i class="fas fa-arrow-left"></i> Back to Car List</a>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and FontAwesome -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>
</body>
</html>
