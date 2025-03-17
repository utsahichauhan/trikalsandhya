<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession, java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - MyWebsite</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link href="css/styles.css" rel="stylesheet" type="text/css">

    <style>
        /* Welcome message container */
        .welcome-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: #f8f9fa;
            padding: 15px 20px;
            border-radius: 8px;
            border-left: 5px solid #007bff;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
        }

        .welcome-text {
            font-size: 18px;
            font-weight: bold;
            color: #333;
        }

        .logout-btn {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 6px;
            text-decoration: none;
            font-size: 16px;
            font-weight: bold;
            transition: background 0.3s;
        }

        .logout-btn:hover {
            background-color: #b52b37;
        }

        /* Carousel and Card Styling */
        .carousel-item img {
            width: 100%;
            height: 500px;
            object-fit: cover;
        }

        .carousel-caption {
            background-color: rgba(0, 0, 0, 0.5);
            padding: 10px;
            border-radius: 5px;
        }

        .card {
            width: 100%;
            max-width: 300px;
            margin: 0 auto;
            height: 450px;
        }

        .card-img-top {
            height: 200px;
            object-fit: cover;
        }

        .card-body {
            height: 200px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .card .btn {
            width: 100%;
        }
    </style>
</head>
<body>

    <!-- Include Navbar -->
    <%@ include file="navbar.jsp" %>


    <!-- Hero Section (Carousel) -->
    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="img/2.jpg" class="d-block w-100" alt="Slide 1">
                <div class="carousel-caption d-none d-md-block">
                    <h5>Explore Ramayan</h5>
                    <p>Discover the life and teachings of Lord Rama.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="img/1.jpg" class="d-block w-100" alt="Slide 2">
                <div class="carousel-caption d-none d-md-block">
                    <h5>Explore Geeta</h5>
                    <p>Learn the teachings of Lord Krishna in the Bhagavad Gita.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="img/3.jpg" class="d-block w-100" alt="Slide 3">
                <div class="carousel-caption d-none d-md-block">
                    <h5>Explore Mahabharat</h5>
                    <p>Uncover the wisdom from the epic battle of Kurukshetra.</p>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    <!-- Content Section (All Cards Included Here) -->
    <div class="container text-center py-5">
        <h2 class="mb-4">Discover Our Content</h2>
        <p class="lead mb-5">We bring you the best insights and stories from the great epics of Ramayan, Geeta, and Mahabharat.</p>

        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
            <!-- Ramayan Card -->
            <div class="col">
                <div class="card shadow-lg">
                    <img src="img/ramayan1.png" class="card-img-top" alt="Ramayan">
                    <div class="card-body">
                        <h5 class="card-title">Ramayan</h5>
                        <p class="card-text">Dive into the journey of Lord Rama and learn valuable lessons about righteousness and duty.</p>
                        <a href="ramayan.jsp" class="btn btn-outline-primary">Read More</a>
                    </div>
                </div>
            </div>

            <!-- Geeta Card -->
            <div class="col">
                <div class="card shadow-lg">
                    <img src="img/geeta2.png" class="card-img-top" alt="Geeta">
                    <div class="card-body">
                        <h5 class="card-title">Geeta</h5>
                        <p class="card-text">Understand the deep wisdom of the Bhagavad Gita.</p>
                        <a href="geeta.jsp" class="btn btn-outline-primary">Read More</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <%@ include file="footer.jsp" %>

</body>
</html>
