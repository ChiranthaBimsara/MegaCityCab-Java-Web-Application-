<!-- Include Bootstrap & Font Awesome -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<style>
    /* Navbar Styling */
    .navbar {
        background: linear-gradient(45deg, #0d6efd, #6610f2); /* Blue to purple gradient */
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    }

    /* Brand Logo */
    .navbar-brand {
        font-size: 1.8rem;
        font-weight: bold;
        color: white !important;
        transition: transform 0.3s ease;
    }

    .navbar-brand:hover {
        transform: scale(1.1);
    }

    /* Navbar links */
    .navbar-nav .nav-link {
        font-size: 1.1rem;
        font-weight: 500;
        padding: 10px 15px;
        color: white !important;
        transition: background 0.3s ease, transform 0.2s ease-in-out;
    }

    /* Hover effects */
    .navbar-nav .nav-link:hover,
    .navbar-nav .nav-item.active .nav-link {
        background-color: rgba(255, 255, 255, 0.15);
        border-radius: 8px;
        transform: scale(1.05);
    }

    /* Active link */
    .navbar-nav .nav-item.active .nav-link {
        font-weight: bold;
        border-bottom: 3px solid white;
    }

    /* Icons next to menu items */
    .navbar-nav .nav-item i {
        margin-right: 8px;
    }

    /* Toggle button (Hamburger Menu) */
    .navbar-toggler {
        border-color: white;
    }

    .navbar-toggler-icon {
        background-color: white;
        border-radius: 3px;
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

<nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
        <!-- Brand name or logo -->
        <a class="navbar-brand" href="/MegaCityCab/customer_dashboard.jsp">
            <i class="fa-solid fa-taxi"></i> MegaCityCab
        </a>

        <!-- Mobile Toggle Button -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Navbar Items -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <!-- Home -->
                <li class="nav-item">
                    <a class="nav-link active" href="customer_dashboard.jsp">
                        <i class="fas fa-home"></i> Home
                    </a>
                </li>

                <!-- Profile -->
                <li class="nav-item">
                    <a class="nav-link" href="/MegaCityCab/customer_profile.jsp">
                        <i class="fas fa-user-circle"></i> Profile
                    </a>
                </li>

                <!-- Create Booking -->
                <li class="nav-item">
                    <a class="nav-link" href="/MegaCityCab/booking_form.jsp">
                        <i class="fas fa-calendar-plus"></i> Create Booking
                    </a>
                </li>

                <!-- View Bookings -->
                <li class="nav-item">
                    <a class="nav-link" href="/MegaCityCab/bookingdetails4customer.jsp">
                        <i class="fas fa-list-alt"></i> View Bookings
                    </a>
                </li>

                <!-- Calculate Bill -->
                <li class="nav-item">
                    <a class="nav-link" href="/MegaCityCab/generatebill.jsp">
                        <i class="fas fa-file-invoice-dollar"></i> Calculate Bill
                    </a>
                </li>

                <!-- Logout -->
                <li class="nav-item">
                    <a class="nav-link text-danger" href="/MegaCityCab/customer_logout.jsp">
                        <i class="fas fa-sign-out-alt"></i> Logout
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Bootstrap JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
