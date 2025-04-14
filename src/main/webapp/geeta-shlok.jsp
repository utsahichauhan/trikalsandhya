<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bhagavad Geeta - Shlokas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
    <style>
        .shlok-container { margin: 50px auto; max-width: 800px; }
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
    <%@ include file="navbar.jsp" %>
    <%
        int adhyay = Integer.parseInt(request.getParameter("adhyay"));
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
    %>
    <div class="container mt-4">
        <h1 class="text-center">📜 Shlokas from Adhyay <%= adhyay %></h1>
        <div class="shlok-container">
            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trikalsandhya", "root", "");
                    ps = con.prepareStatement("SELECT DISTINCT shlok_number FROM geeta_shlok WHERE adhyay = ? ORDER BY shlok_number");
                    ps.setInt(1, adhyay);
                    rs = ps.executeQuery();
                    while(rs.next()) {
                        int shlok = rs.getInt("shlok_number");
            %>
                <div class="shlok-card">
                    <a href="geeta-shloka-details.jsp?adhyay=<%= adhyay %>&shlok=<%= shlok %>">VERSE <%= shlok %></a>
                </div>
            <%
                    }
                } catch(Exception e) {
                    out.print("Error: " + e.getMessage());
                } finally {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (con != null) con.close();
                }
            %>
        </div>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>
