<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bhagavad Geeta - Adhyays</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link href="css/styles.css" rel="stylesheet" type="text/css">
    
    <style>
        .adhyay-card {
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            background: #fff;
            transition: transform 0.3s ease;
        }
        .adhyay-card:hover {
            transform: translateY(-5px);
        }
        .adhyay-title {
            font-weight: bold;
            font-size: 1.2rem;
        }
        .adhyay-chapter {
            color: #ff9800;
            font-weight: bold;
        }
        .adhyay-description {
            color: #6c757d;
        }
    </style>
</head>
<body>
    <!-- Include Navbar -->
    <%@ include file="navbar.jsp" %>

    <div class="container mt-4">
        <h1 class="mb-4 text-center">📖 Bhagavad Geeta - Adhyays</h1>
        <div class="row">
            <% for(int i = 1; i <= 14; i++) { %>
                <div class="col-md-6 mb-4">
                    <div class="adhyay-card">
                        <span class="adhyay-chapter">Chapter <%= i %></span>
                        <h5 class="adhyay-title">अध्याय: <%= i %></h5>
                        <p class="adhyay-description">This chapter of the Bhagavad Gita explores deep philosophical concepts and teachings.</p>
                        <a href="geeta-shlok.jsp?adhyay=<%= i %>" class="text-decoration-none">📜 View Shlokas</a>
                    </div>
                </div>
            <% } %>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
