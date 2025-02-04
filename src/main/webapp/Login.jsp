<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(135deg, #667eea, #764ba2);
        }

        .login-container {
            width: 100%;
            max-width: 400px;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }

        .input-group {
            width: 100%;
            margin-bottom: 15px;
        }

        .input-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        .btn {
            width: 100%;
            background: #667eea;
            border: none;
            padding: 10px;
            font-size: 16px;
            color: white;
            cursor: pointer;
            border-radius: 5px;
            transition: 0.3s;
        }

        .btn:hover {
            background: #5563c1;
        }

        .register-link {
            margin-top: 10px;
            display: block;
        }

        /* Responsive Design */
        @media (max-width: 500px) {
            .login-container {
                padding: 15px;
            }
        }
    </style>
    <script>
        function validateForm() {
            var user = document.getElementById("username").value;
            var pass = document.getElementById("password").value;
            if (user.trim() === "" || pass.trim() === "") {
                alert("Username and password cannot be empty!");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>

    <div class="login-container">
        <h2>Login</h2>
        <form action="loginServlet" method="post" onsubmit="return validateForm()">
            <div class="input-group">
                <input type="text" id="username" name="username" placeholder="Enter Username" required>
            </div>
            <div class="input-group">
                <input type="password" id="password" name="password" placeholder="Enter Password" required>
            </div>
            <button type="submit" class="btn">Login</button>
        </form>
        <a href="register.jsp" class="register-link">Don't have an account? Register</a>
    </div>

</body>
</html>
