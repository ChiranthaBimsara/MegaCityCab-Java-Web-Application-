<%@ include file="customer_navbar.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Customer System Usage Guide</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <style>
        /* Styling for the Guide Section */
        .guide-container {
            background-color: #f8f9fa;
            border-left: 5px solid #007bff;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }
        .guide-container h2 {
            color: #007bff;
            text-align: center;
            margin-bottom: 15px;
        }
        .guide-container h4 {
            color: #333;
            margin-top: 15px;
        }
        .guide-container p, .guide-container ul {
            font-size: 15px;
            color: #555;
        }
        .guide-container ul {
            padding-left: 20px;
        }
        .guide-container ul li {
            margin-bottom: 5px;
        }
    </style>
</head>
<body>

    <div class="container mt-4">
        <!-- System Usage Guide -->
        <div class="guide-container">
            <h2>🚖 MegaCityCab - Customer System Usage Guide 📖</h2>
            <p class="text-center">Welcome to <strong>MegaCityCab</strong>. This guide will help you navigate and use the system effectively.</p>

            <h4>🟢 1. Customer Dashboard Overview</h4>
            <p>Once logged in, you will see the <strong>Customer Dashboard</strong>. From here, you can:</p>
            <ul>
                <li>✔ <strong>Manage Your Profile</strong> – Update your personal details.</li>
                <li>✔ <strong>Manage Bookings</strong> – View, create, or cancel bookings.</li>
                <li>✔ <strong>Manage Payments</strong> – Check your payment history.</li>
                <li>✔ <strong>Customer Support</strong> – Get assistance from our support team.</li>
                <li>✔ <strong>View Available Cars</strong> – Explore cars before making a booking.</li>
                <li>✔ <strong>Logout</strong> – Securely log out of your account.</li>
            </ul>

            <h4>🔹 2. Managing Your Profile</h4>
            <p>1️⃣ Click <strong>"View Profile"</strong> to see your details.<br>
               2️⃣ Click <strong>"Edit Profile"</strong> to update your name, contact, and password.<br>
               3️⃣ Click <strong>"Save"</strong> to update your information.</p>

            <h4>🚕 3. Booking a Cab</h4>
            <p>1️⃣ Click <strong>"Create Booking"</strong> from the menu.<br>
               2️⃣ Choose your <strong>Pickup Location</strong> and <strong>Destination</strong>.<br>
               3️⃣ Select a <strong>Car Type</strong> and confirm your booking.<br>
               4️⃣ View all your <strong>Active and Past Bookings</strong> under "View Bookings".</p>

            <h4>💳 4. Managing Payments</h4>
            <p>1️⃣ Click <strong>"View Payments"</strong> to check payment history.<br>
               2️⃣ Use <strong>"Pay Now"</strong> for pending payments.</p>

            <h4>📞 5. Contacting Customer Support</h4>
            <p>1️⃣ Click <strong>"Customer Support"</strong> for assistance.<br>
               2️⃣ Choose <strong>Live Chat, Call, or Email</strong> support.</p>

            <h4>🚗 6. Viewing Available Cars</h4>
            <p>1️⃣ Click <strong>"View Available Cars"</strong> to explore options.<br>
               2️⃣ Check <strong>car type, seating capacity, and availability</strong>.</p>

            <h4>🔒 7. Logging Out Securely</h4>
            <p>1️⃣ Click <strong>"Logout"</strong> from the menu.<br>
               2️⃣ Always log out after using the system, especially on public devices.</p>

            <p><strong>💡 Tip:</strong> If you face any issues, click <strong>Customer Support</strong> or visit our FAQ section.</p>
        </div>
    </div>

</body>
</html>
