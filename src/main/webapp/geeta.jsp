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
    
<body>

    <!-- Include Navbar -->
    <%@ include file="navbar.jsp" %>

    <h1 class="mt-4">📖 Bhagavad Geeta - Adhyays</h1>

    <div class="adhyay-container">
        <% for(int i = 1; i <= 14; i++) { %>
            <div class="adhyay-card">
                <a href="geeta-shlok.jsp?adhyay=<%= i %>">अध्याय: <%= i %></a>
            </div>
        <% } %>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
