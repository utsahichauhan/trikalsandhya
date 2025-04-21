<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
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
            <%
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver"); 
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/trikalsandhya", "root", "");

                    String query = "SELECT DISTINCT adhyay FROM geeta_shlok ORDER BY adhyay ASC";
                    stmt = conn.prepareStatement(query);
                    rs = stmt.executeQuery();

                    while (rs.next()) {
                        int adhyay = rs.getInt("adhyay");
            %>
                        <div class="col-md-6 mb-4">
                            <div class="adhyay-card">
                                <span class="adhyay-chapter">Chapter <%= adhyay %></span>
                                <h5 class="adhyay-title">अध्याय: <%= adhyay %></h5>
                                <p class="adhyay-description">This chapter of the Bhagavad Gita explores deep philosophical concepts and teachings.</p>
                                <a href="geeta-shlok.jsp?adhyay=<%= adhyay %>" class="text-decoration-none">📜 View Shlokas</a>
                            </div>
                        </div>
            <%
                    }
                } catch (Exception e) {
                    out.println("<p class='text-danger'>Error: " + e.getMessage() + "</p>");
                } finally {
                    if (rs != null) try { rs.close(); } catch (Exception e) {}
                    if (stmt != null) try { stmt.close(); } catch (Exception e) {}
                    if (conn != null) try { conn.close(); } catch (Exception e) {}
                }
            %>
        </div>
    </div>

    <!-- Include Footer -->
    <%@ include file="footer.jsp" %>
</body>
</html>
