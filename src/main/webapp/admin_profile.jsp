<%@ include file="navbar.jsp" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin Profile</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style>
        .profile-container {
            max-width: 600px;
            margin: auto;
            padding: 20px;
        }
        .profile-card {
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        .profile-header {
            text-align: center;
            margin-bottom: 20px;
        }
        .profile-header h2 {
            color: #007bff;
        }
        .profile-card p {
            font-size: 18px;
            margin-bottom: 10px;
        }
        .profile-card i {
            margin-right: 10px;
            color: #007bff;
        }
        .edit-btn {
            display: block;
            width: 100%;
            border-radius: 25px;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="profile-container">
            <div class="profile-header">
                <h2><i class="fas fa-user-shield"></i> Welcome, <%= session.getAttribute("fullName") %>!</h2>
                <p class="text-muted">Your Admin Profile</p>
            </div>

            <div class="card profile-card">
                <div class="card-body">
                    <p><i class="fas fa-id-badge"></i> <strong>Admin ID:</strong> <%= session.getAttribute("adminID") %></p>
                    <p><i class="fas fa-user"></i> <strong>Username:</strong> <%= session.getAttribute("username") %></p>
                    <p><i class="fas fa-user-circle"></i> <strong>Full Name:</strong> <%= session.getAttribute("fullName") %></p>
                </div>
            </div>

            <!-- Edit Profile Button -->
            <div class="mt-3">
                <a href="edit_admin_profile.jsp" class="btn btn-warning edit-btn"><i class="fas fa-edit"></i> Edit Profile</a>
            </div>
        </div>
    </div>
</body>
</html>
