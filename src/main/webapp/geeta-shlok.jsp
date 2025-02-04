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
            background: linear-gradient(to bottom, #7a0d0d, #3d0202);
            color: white;
            text-align: center;
        }
        .shlok-container {
            margin: 50px auto;
            max-width: 700px;
        }
        .shlok-card {
            background: rgba(255, 255, 255, 0.1);
            padding: 15px;
            border-radius: 10px;
            border: 2px solid #e65100;
            margin: 10px 0;
        }
        .shlok-card a {
            text-decoration: none;
            color: white;
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

    <h1 class="mt-4">📜 Shlokas from Adhyay <%= adhyay %></h1>

    <div class="shlok-container">
        <% for(int i = 1; i <= 10; i++) { %>
            <div class="shlok-card">
                <a href="geeta-shloka-details.jsp?adhyay=<%= adhyay %>&shlok=<%= i %>">श्लोक: <%= i %></a>
            </div>
        <% } %>
    </div>
<%@ include file="footer.jsp" %>


</body>
</html>
