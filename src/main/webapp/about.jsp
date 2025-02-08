<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - MyWebsite</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link href="css/styles.css" rel="stylesheet" type="text/css">
    
</head>
<body>

    <!-- Include Navbar -->
    <%@ include file="navbar.jsp" %>


    <!-- About Section -->
    <div class="container about-section">
        <h2>Our Mission</h2>
        <p class="lead">We aim to preserve and share the sacred knowledge of Ramayan and Bhagavad Geeta through a modern digital platform.</p>
    </div>

    <!-- Team Section -->
    <div class="container team-section">
        <h2>Meet Our Team</h2>
        <div class="row mt-4">
            <!-- Team Member 1 -->
            <div class="col-md-4">
                <div class="team-card">
                    <img src="img/user2.jpg" alt="Rahul Sharma">
                    <h5>Rahul Sharma</h5>
                    <p>Founder & Developer</p>
                </div>
            </div>
            <!-- Team Member 2 -->
            <div class="col-md-4">
                <div class="team-card">
                    <img src="img/user1.jpg" alt="Priya Patel">
                    <h5>Priya Patel</h5>
                    <p>Content Creator</p>
                </div>
            </div>
            <!-- Team Member 3 -->
            <div class="col-md-4">
                <div class="team-card">
                    <img src="img/user3.jpg" alt="Amit Verma">
                    <h5>Amit Verma</h5>
                    <p>Graphic Designer</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <%@ include file="footer.jsp" %>

</body>
</html>
