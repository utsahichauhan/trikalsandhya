<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vanvas Shloka - Ramayan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link href="css/styles.css" rel="stylesheet" type="text/css">
</head>
<body>
    <%@ include file="navbar.jsp" %>
    
    <div class="container mt-4">
        <h2 class="text-center">Vanvas Adhyay - Shlokas</h2>
        <form method="GET" class="mb-3">
            <label for="chapter" class="form-label">Select Adhyay:</label>
            <select name="chapter" id="chapter" class="form-select" onchange="this.form.submit()">
                <option value="">-- Select Chapter --</option>
                <% for(int i=1; i<=10; i++) { %>
                    <option value="<%= i %>" <%= request.getParameter("chapter") != null && request.getParameter("chapter").equals(String.valueOf(i)) ? "selected" : "" %>>
                        Adhyay <%= i %>
                    </option>
                <% } %>
            </select>
        </form>
        
        <% 
            String chapterParam = request.getParameter("chapter");
            if (chapterParam != null) {
                int chapterNumber = Integer.parseInt(chapterParam);
                
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/trikalsandhya", "root", "");
                    stmt = conn.prepareStatement("SELECT shlok, translation_gujarati, translation_english FROM shlokas WHERE category='Vanvas' AND adhyay_number=?");
                    stmt.setInt(1, chapterNumber);
                    rs = stmt.executeQuery();
        %>
        <div class="shloka-container mt-3">
            <% while (rs.next()) { %>
                <div class="card mb-3 shadow-lg">
                    <div class="card-body">
                        <p class="shloka-text text-center">📜 <%= rs.getString("shlok") %></p>
                        <p class="translation-text"><strong>Gujarati Translation:</strong> <%= rs.getString("translation_gujarati") %></p>
                        <p class="meaning-text"><strong>English Translation:</strong> <%= rs.getString("translation_english") %></p>
                    </div>
                </div>
            <% } %>
        </div>
        <% 
                } catch (Exception e) {
                    out.println("<p class='text-danger'>Error fetching data: " + e.getMessage() + "</p>");
                } finally {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                }
            }
        %>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>