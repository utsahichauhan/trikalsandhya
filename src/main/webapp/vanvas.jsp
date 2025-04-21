<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vanvas - Ramayan</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link href="css/styles.css" rel="stylesheet" type="text/css">

    <style>
        .chapter-card {
            background: rgba(255, 255, 255, 0.8);
            color: black;
            text-align: center;
            padding: 20px;
            font-size: 1.5rem;
            border-radius: 10px;
            transition: 0.3s ease-in-out;
        }
        .chapter-card:hover {
            background: rgba(255, 200, 100, 0.9);
            transform: scale(1.05);
        }
        .box-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
        }
    </style>
</head>
<body>

    <!-- Include Navbar -->
    <%@ include file="navbar.jsp" %>

    <div class="container text-center">
        <h1 class="mb-4">Vanvas Adhyay (Chapters)</h1>
        <div class="box-container">
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/trikalsandhya", "root", ""
                    );
                    PreparedStatement ps = con.prepareStatement(
                        "SELECT DISTINCT adhyay_number FROM shlokas WHERE category = 'Vanvas' ORDER BY adhyay_number"
                    );
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
                        int adhyay = rs.getInt("adhyay_number");
            %>
            <a href="shloka_vanvas.jsp?category=vanvas&adhyay=<%= adhyay %>" ...>
                <div class="chapter-card shadow-lg">
                                अध्याय: <%= adhyay %>
                            </div>
                        </a>
            <%
                    }
                    rs.close();
                    ps.close();
                    con.close();
                } catch (Exception e) {
                    out.println("<div class='text-danger'>Error loading Adhyays: " + e.getMessage() + "</div>");
                }
            %>
        </div>
    </div>

    <%@ include file="footer.jsp" %>

</body>
</html>
