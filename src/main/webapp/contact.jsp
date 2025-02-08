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
    
    <style>
        /* Contact Section */
        .contact-section {
            background: url('img/contact-bg.jpg') center/cover no-repeat;
            padding: 100px 20px;
            color: white;
            text-align: center;
            position: relative;
        }
        .contact-section::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6);
        }
        .contact-section h1, .contact-section p {
            position: relative;
            z-index: 1;
        }

        /* Form Section */
        .contact-form {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: -50px;
            position: relative;
        }
        .btn-custom {
            background-color: #007bff;
            color: white;
            padding: 10px;
            border-radius: 5px;
            transition: 0.3s;
        }
        .btn-custom:hover {
            background-color: #0056b3;
        }
        
        /* Custom Placeholder Color */
        ::placeholder {
            color: #555 !important;
            opacity: 1; /* Ensure placeholder is fully visible */
        }
    </style>
</head>
<body>

    <!-- Include Navbar -->
    <%@ include file="navbar.jsp" %>

    <!-- Contact Hero Section -->
    <div class="contact-section">
        <div class="container">
            <h1>Contact Us</h1>
            <p>Have any questions? Reach out to us, and we'll get back to you as soon as possible!</p>
        </div>
    </div>

    <!-- Contact Form Section -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
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
        </div>
    </div>

    <%@ include file="footer.jsp" %>

</body>
</html>
