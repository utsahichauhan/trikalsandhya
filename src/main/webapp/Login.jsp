<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <link href="css/styles.css" rel="stylesheet" type="text/css">
        <style>
            .toast {
                position: fixed;
                bottom: 20px;
                left: 50%;
                transform: translateX(-50%);
                background-color: #ed4b13;
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
            window.onload = function () {
                // Get the 'Admin' parameter passed in the URL
                var admin = "<%= request.getParameter("Admin") != null ? request.getParameter("Admin") : "" %>";
                var toast = document.getElementById('toast');
                
                // If the Admin parameter is set to 'true', show the toast
                if (admin === 'true') {
                    toast.classList.add('show'); // Show the toast
                    setTimeout(function () {
                        toast.classList.remove('show'); // Hide the toast after 6 seconds
                    }, 6000);
                }
            }
        </script>
    </head>
    <body>
        <%@ include file="navbar.jsp" %>

        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header text-center">
                            <h3>Login</h3>
                        </div>
                        <div class="card-body">
                            <%-- Display error message if login fails --%>
                            <% String error = request.getParameter("error"); 
                               if ("invalid".equals(error)) { %>
                                <div class="alert alert-danger text-center">Invalid email or password!</div>
                            <% } %>
                            <form action="LoginServlet" method="POST">
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email</label>
                                    <input type="email" class="form-control" id="email" name="email" required>
                                </div>
                                <div class="mb-3">
                                    <label for="password" class="form-label">Password</label>
                                    <input type="password" class="form-control" id="password" name="password" required>
                                </div>
                                <button type="submit" class="btn btn-primary w-100">Login</button>
                            </form>
                        </div>
                        <div class="card-footer text-center">
                            <p>Don't have an account? <a href="register.jsp">Register</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Toast Notification -->
        <div id="toast" class="toast">
            <strong>Warning!</strong> Admin access required to proceed.
        </div>
    </body>
</html>
