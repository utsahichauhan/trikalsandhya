<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ramayan - MyWebsite</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link href="css/styles.css" rel="stylesheet" type="text/css">
</head>
<body>

    <!-- Include Navbar -->
    <%@ include file="navbar.jsp" %>


    <!-- Content Section -->
    <div class="container content-section">
        <h2 class="text-center mb-4">Chapters of Ramayan</h2>

        <div class="row">
            <!-- Ram-Seeta Milan -->
            <div class="col-md-6">
                <div class="card shadow-lg">
                    <img src="img/ramayan1.png" class="card-img-top img-fluid w-50 mx-auto" alt="Ram-Seeta Milan">
                    <div class="card-body">
                        <h5 class="card-title">Ram-Seeta Milan</h5>
                        <p class="card-text">The divine love story of Lord Ram and Goddess Sita.</p>
                        <a href="ram-seeta-milan.jsp" class="btn btn-primary">Read More</a>
                    </div>
                </div>
            </div>

            <!-- Vanvas -->
            <div class="col-md-6">
                <div class="card shadow-lg">
                    <img src="img/ramayan2.png" class="card-img-top img-fluid w-50 mx-auto" alt="Vanvas">
                    <div class="card-body">
                        <h5 class="card-title">Vanvas</h5>
                        <p class="card-text">The exile journey of Lord Ram, Seeta, and Lakshman.</p>
                        <a href="vanvas.jsp" class="btn btn-primary">Read More</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <%@ include file="footer.jsp" %>

</body>
</html>
