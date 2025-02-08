<%@ page contentType="text/html; charset=UTF-8" %>
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
    	.carousel-item img {
            width: 100%;
            height: 500px; /* Adjust this to your desired height */
            object-fit: cover; /* Ensures the images cover the area without stretching */
        }

        /* Optionally, add padding to the text within the carousel for better readability */
        .carousel-caption {
            background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent background */
            padding: 10px;
            border-radius: 5px;
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
                <img src="img/bg.png" class="d-block w-100" alt="Slide 1">
                <div class="carousel-caption d-none d-md-block">
                    <h5>Explore Ramayan</h5>
                    <p>Discover the life and teachings of Lord Rama.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="img/bg2.png" class="d-block w-100" alt="Slide 2">
                <div class="carousel-caption d-none d-md-block">
                    <h5>Explore Geeta</h5>
                    <p>Learn the teachings of Lord Krishna in the Bhagavad Gita.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="img/geeta1.png" class="d-block w-100" alt="Slide 3">
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

    <!-- Content Section -->
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
                        <p class="card-text">Understand the deep wisdom of the Bhagavad Gita and how it relates to life's struggles and choices.</p>
                        <a href="mahabharat.jsp" class="btn btn-outline-primary">Read More</a>
                    </div>
                </div>
            </div>

            <!-- Mahabharat Card -->
            <div class="col">
                <div class="card shadow-lg">
                    <img src="img/mahabharat.png" class="card-img-top" alt="Mahabharat">
                    <div class="card-body">
                        <h5 class="card-title">Mahabharat</h5>
                        <p class="card-text">Unravel the story of the greatest epic battle and the moral lessons it teaches about life and war.</p>
                        <a href="mahabharat.jsp" class="btn btn-outline-primary">Read More</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <%@ include file="footer.jsp" %>

</body>
</html>
