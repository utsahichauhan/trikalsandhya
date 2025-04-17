<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Shloka Meaning - Bhagavad Geeta</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
    <style>
        body { background: #f8f9fa; text-align: center; color: #212529; }
        .shloka-container { margin: 50px auto; max-width: 900px; }
        .shloka-text { font-size: 1.8rem; color: #e65100; font-weight: bold; }
        .translation-text, .meaning-text { font-size: 1.2rem; margin-top: 10px; }
        .btn-nav { padding: 10px 25px; font-size: 1.1rem; border-radius: 10px; }
    </style>
</head>
<body>
    <%@ include file="navbar.jsp" %>

    <%
        int adhyay = Integer.parseInt(request.getParameter("adhyay"));
        int shlok = Integer.parseInt(request.getParameter("shlok"));
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
    %>

    <div class="shloka-container">
        <%
            boolean hasShlok = false;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trikalsandhya", "root", "");
                ps = con.prepareStatement("SELECT * FROM geeta_shlok WHERE adhyay = ? AND shlok_number = ?");
                ps.setInt(1, adhyay);
                ps.setInt(2, shlok);
                rs = ps.executeQuery();
                if (rs.next()) {
                    hasShlok = true;
        %>
        <h2 class="fw-bold">BG <%= adhyay %>.<%= shlok %></h2>
        <p class="shloka-text"><%= rs.getString("shlok_text") %></p>
        <p class="translation-text text-muted">Gujarati: <%= rs.getString("translation_gujarati") %></p>
        <p class="meaning-text"><strong>English:</strong> <%= rs.getString("translation_english") %></p>
        <hr>
        <%
                } else {
                    out.print("<p>Shloka not found in database.</p>");
                }
            } catch(Exception e) {
                out.println("<p>Error: " + e.getMessage() + "</p>");
            } finally {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            }

            int prevShlok = shlok - 1;
            int nextShlok = shlok + 1;
        %>

        <% if (hasShlok) { %>
        <!-- Navigation Buttons -->
        <div class="d-flex justify-content-between mt-4">
            <a href="geeta-shloka-details.jsp?adhyay=<%= adhyay %>&shlok=<%= prevShlok %>"
               class="btn btn-warning btn-nav <%= (shlok <= 1) ? "disabled" : "" %>">
               ⬅️ Previous
            </a>

            <a href="geeta-shloka-details.jsp?adhyay=<%= adhyay %>&shlok=<%= nextShlok %>" 
               class="btn btn-success btn-nav">
               Next ➡️
            </a>
        </div>
        <% } %>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
