<!-- navbar.jsp -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet"> <!-- Font Awesome for icons -->

<style>
    /* Navbar background with gradient */
    .navbar {
        background: linear-gradient(45deg, #0d6efd, #6610f2); /* Beautiful gradient from blue to purple */
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); /* Subtle shadow for 3D effect */
    }

    /* Brand name styling */
    .navbar-brand {
        font-size: 2rem;
        font-weight: bold;
        color: white !important;
    }

    /* Navbar links */
    .navbar-nav .nav-link {
        font-size: 1.1rem;
        font-weight: 500;
        padding: 12px 18px;
        color: white !important;
        transition: background 0.3s ease;
    }

    /* Hover effect on nav-links */
    .navbar-nav .nav-link:hover, 
    .navbar-nav .nav-item.active .nav-link {
        background-color: rgba(255, 255, 255, 0.1); /* Light hover effect */
        border-radius: 5px;
        color: #f8f9fa !important;
    }

    /* Active link style */
    .navbar-nav .nav-item.active .nav-link {
        font-weight: bold;
        color: #f8f9fa !important;
    }

    /* Adjusting the toggle button color */
    .navbar-toggler {
        border-color: white;
    }

    .navbar-toggler-icon {
        background-color: white;
    }

    /* Adding icons next to menu items */
    .navbar-nav .nav-item i {
        margin-right: 8px;
    }

    /* Dropdown menu */
    .dropdown-menu {
        background-color: #f8f9fa;
        border: none;
        border-radius: 0.25rem;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .dropdown-item:hover {
        background-color: #007bff;
        color: white;
    }
</style>

<nav class="navbar navbar-expand-lg navbar-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">MegaCityCab</a>
        
        <!-- Toggler button for mobile -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <!-- Navbar links -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto"> <!-- ms-auto aligns navbar to the right -->
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="dashboard.jsp"><i class="fas fa-home"></i> Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="admins.jsp"><i class="fas fa-user-shield"></i> Admins</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="customers.jsp"><i class="fas fa-users"></i> Customers</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="drivers.jsp"><i class="fas fa-taxi"></i> Drivers</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="bookings.jsp"><i class="fas fa-calendar-check"></i> Bookings</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="payment.jsp"><i class="fas fa-credit-card"></i> Payments</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="car.jsp"><i class="fas fa-car"></i> Car</a> <!-- New Car menu item -->
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Bootstrap JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
