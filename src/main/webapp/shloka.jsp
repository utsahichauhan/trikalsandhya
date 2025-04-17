<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shloka - Ramayan</title>
    <link href="css/styles.css" rel="stylesheet" type="text/css">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        .shloka-container {
            max-width: 800px;
            margin: 50px auto;
            background: rgba(0, 0, 0, 0.7);
            padding: 30px;
            border-radius: 15px;
            text-align: center;
            color: white;
        }
        .shloka-text {
            font-size: 1.8rem;
            font-weight: bold;
            color: #ffcc00;
        }
        .translation-text {
            font-size: 1.2rem;
            margin-top: 20px;
        }
        .meaning-text {
            font-size: 1rem;
            margin-top: 20px;
            background: rgba(255, 255, 255, 0.2);
            padding: 15px;
            border-radius: 10px;
        }
        .btn-nav {
            padding: 10px 20px;
            font-size: 1.1rem;
            border-radius: 10px;
        }
    </style>
</head>
<body>

    <!-- Include Navbar -->
    <%@ include file="navbar.jsp" %>

    <div class="container shloka-container">
        <%
            int chapter = 1;
            if (request.getParameter("chapter") != null) {
                chapter = Integer.parseInt(request.getParameter("chapter"));
            }
        %>
        <h2>📜 Shlokas from Adhyay <%= chapter %></h2>

        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trikalsandhya", "root", "");

                String query = "SELECT * FROM shlokas WHERE category='Ram-Seeta Milan' AND adhyay_number=?";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setInt(1, chapter);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
        %>
                <p class="shloka-text"><%= rs.getString("shlok") %></p>
                <p class="translation-text"><strong>Gujarati:</strong> <%= rs.getString("translation_gujarati") %></p>
                <p class="meaning-text"><strong>English:</strong> <%= rs.getString("translation_english") %></p>
                <hr>
        <%
                }
                ps.close();
                con.close();
            } catch (Exception e) {
                out.println("<h3>Error: " + e.getMessage() + "</h3>");
            }

            int previousChapter = chapter - 1;
            int nextChapter = chapter + 1;
        %>

        <!-- Previous and Next Buttons -->
        <div class="d-flex justify-content-between mt-4">
            <a href="shloka.jsp?chapter=<%= previousChapter %>" 
               class="btn btn-warning btn-nav <%= (chapter <= 1) ? "disabled" : "" %>">
               ⬅️ Previous
            </a>
            <a href="shloka.jsp?chapter=<%= nextChapter %>" 
               class="btn btn-success btn-nav">
               Next ➡️
            </a>
        </div>
    </div>

    <%@ include file="footer.jsp" %>

</body>
</html>
