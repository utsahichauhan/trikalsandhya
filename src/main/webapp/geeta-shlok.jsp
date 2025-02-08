<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bhagavad Geeta - Shlokas</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        body {
            background: #f8f9fa;
            color: #212529;
        }
        .shlok-container {
            margin: 50px auto;
            max-width: 800px;
        }
        .shlok-card {
            background: #fff;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin: 10px 0;
        }
        .shlok-card a {
            text-decoration: none;
            color: #e65100;
            font-weight: bold;
            font-size: 1.2rem;
        }
    </style>
</head>
<body>

    <!-- Include Navbar -->
    <%@ include file="navbar.jsp" %>

    <%
        int adhyay = Integer.parseInt(request.getParameter("adhyay"));
    %>

    <div class="container mt-4">
        <h1 class="text-center">📜 Shlokas from Adhyay <%= adhyay %></h1>
        <div class="shlok-container">
            <% for(int i = 1; i <= 10; i++) { %>
                <div class="shlok-card">
                    <a href="geeta-shloka-details.jsp?adhyay=<%= adhyay %>&shlok=<%= i %>">VERSE <%= i %></a>
                    <p class="mt-2 text-muted">This is a placeholder for the shloka content.</p>
                </div>
            <% } %>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
