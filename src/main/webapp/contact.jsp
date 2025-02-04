<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<link href="css/styles.css" rel="stylesheet" type="text/css">
    
</head>
<body>

    <!-- Include Navbar -->
    <%@ include file="navbar.jsp" %>

    <div class="container">
        <h1>Contact Us</h1>
        <p>Have any questions? Reach out to us, and we'll get back to you as soon as possible!</p>

        <form class="contact-form">
            <div class="mb-3">
                <input type="text" class="form-control" placeholder="Your Name" required>
            </div>
            <div class="mb-3">
                <input type="email" class="form-control" placeholder="Your Email" required>
            </div>
            <div class="mb-3">
                <textarea class="form-control" rows="4" placeholder="Your Message" required></textarea>
            </div>
            <button type="submit" class="btn btn-custom w-100">Send Message</button>
        </form>

       
    </div>

    <%@ include file="footer.jsp" %>


</body>
</html>
