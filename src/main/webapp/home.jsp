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
	
    </head>
<body>

    <!-- Include Navbar -->
    <%@ include file="navbar.jsp" %>

    <!-- Hero Section -->
    <div class="hero-section">
        <div>
            <h1>Welcome to MyWebsite</h1>
            <p>Explore the rich history and teachings of Ramayan & Mahabharat</p>
            <a href="ramayan.jsp" class="btn btn-primary btn-lg mt-3">Learn More</a>
        </div>
    </div>

    <!-- Content Section -->
    <div class="container text-center content-section">
        <h2>Discover Our Content</h2>
        <p class="lead">We bring you the best insights and stories from the great epics.</p>

        <div class="row mt-4">
            <!-- Ramayan Card -->
            <div class="col-md-6">
                <div class="card shadow-lg p-3">
                    <img src="img/ramayan1.png" class="img-fluid card-img-top rounded-circle" alt="Ramayan">
                    <div class="card-body">
                        <h5 class="card-title">Ramayan</h5>
                        <p class="card-text">Dive into the journey of Lord Rama and learn valuable lessons.</p>
                        <a href="ramayan.jsp" class="btn btn-outline-primary">Read More</a>
                    </div>
                </div>
            </div>

            <!-- Geeta Card -->
            <div class="col-md-6">
                <div class="card shadow-lg p-3">
                    <img src="img/geeta2.png" class="img-fluid card-img-top rounded-circle" alt="Geeta">
                    <div class="card-body">
                        <h5 class="card-title">Geeta</h5>
                        <p class="card-text">Uncover the wisdom and epic battles of Mahabharat.</p>
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
