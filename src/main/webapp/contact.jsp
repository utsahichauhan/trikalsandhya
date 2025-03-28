<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    HttpSession userSession = request.getSession(false);
    String username = (userSession != null) ? (String) userSession.getAttribute("username") : null;
    String userEmail = (userSession != null) ? (String) userSession.getAttribute("userEmail") : null;
    String success = request.getParameter("success"); // Get the 'success' parameter from URL
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 30px;
        }

        .row {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .col-md-6 {
            width: 100%;
            max-width: 600px;
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            margin-top: 50px;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }

        .contact-form input,
        .contact-form textarea {
            width: 95%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        .contact-form textarea {
            resize: vertical;
        }

        .btn-custom {
            background-color: #4CAF50;
            color: white;
            padding: 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 18px;
        }

        .btn-custom:hover {
            background-color: #45a049;
        }

        .btn-custom:active {
            background-color: #388e3c;
        }

        .toast {
            position: fixed;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            background-color: #4CAF50;
            color: white;
            padding: 16px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            opacity: 0;
            visibility: hidden;
            transition: opacity 0.5s, visibility 0.5s;
            font-size: 16px;
        }
        .toast.show {
            opacity: 1;
            visibility: visible;
        }
    </style>

    <script>
        window.onload = function() {
            var success = "<%= success != null ? success : "" %>";
            var toast = document.getElementById('toast');

            // Check if 'success' parameter is 'true' and show the toast
            if (success === 'true') {
                toast.classList.add('show'); // Add the 'show' class to display the toast
                // After 3 seconds, hide the toast
                setTimeout(function() {
                    toast.classList.remove('show');
                }, 6000);
                window.location.href = "home.jsp";
            }
        }
    </script>
</head>

<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <h1>Contact Us</h1>

            <% 
                // Check if username or userEmail is null
                if (username == null || userEmail == null || username.equals("") || userEmail.equals("")) {
            %>
                <div class="alert alert-danger text-center">Please <a href="login.jsp">login</a> to contact us.</div>
            <%
                } else {
            %>
                <form class="contact-form" action="ContactServlet" method="POST">
                    <div class="mb-3">
                        <input type="text" class="form-control" name="name" value="<%= username %>" readonly>
                    </div>
                    <div class="mb-3">
                        <input type="email" class="form-control" name="email" value="<%= userEmail %>" readonly>
                    </div>
                    <div class="mb-3">
                        <textarea class="form-control" name="message" rows="4" placeholder="Your Message" required></textarea>
                    </div>
                    <button type="submit" class="btn-custom w-100">Send Message</button>
                </form>
            <%
                }
            %>
        </div>
    </div>
</div>
<div id="toast" class="toast">
    <strong>Success!</strong> Your message has been sent successfully.
</div>

</body>
</html>
