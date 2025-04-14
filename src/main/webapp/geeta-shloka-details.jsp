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
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trikalsandhya", "root", "");
                ps = con.prepareStatement("SELECT * FROM geeta_shlok WHERE adhyay = ? AND shlok_number = ?");
                ps.setInt(1, adhyay);
                ps.setInt(2, shlok);
                rs = ps.executeQuery();
                if (rs.next()) {
        %>
        <h2 class="fw-bold">BG <%= adhyay %>.<%= shlok %></h2>
        <p class="shloka-text"><%= rs.getString("shlok_text") %></p>
        <p class="translation-text text-muted">Gujarati: <%= rs.getString("translation_gujarati") %></p>
        <p class="meaning-text"><strong>English:</strong> <%= rs.getString("translation_english") %></p>
        <%
                } else {
                    out.print("<p>Shloka not found in database.</p>");
                }
            } catch(Exception e) {
                out.println("Error: " + e.getMessage());
            } finally {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            }
        %>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>
