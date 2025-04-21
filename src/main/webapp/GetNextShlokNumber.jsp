<%@ page import="java.sql.*" %>
<%
    int adhyay = Integer.parseInt(request.getParameter("adhyay"));
    int nextNumber = 1;

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/trikalsandhya", "root", "");

        String query = "SELECT MAX(shlok_number) FROM geeta_shlok WHERE adhyay = ?";
        stmt = conn.prepareStatement(query);
        stmt.setInt(1, adhyay);
        rs = stmt.executeQuery();

        if (rs.next()) {
            int maxNumber = rs.getInt(1);
            nextNumber = maxNumber + 1;
        }
    } catch (Exception e) {
        nextNumber = 1;
    } finally {
        if (rs != null) try { rs.close(); } catch (Exception e) {}
        if (stmt != null) try { stmt.close(); } catch (Exception e) {}
        if (conn != null) try { conn.close(); } catch (Exception e) {}
    }

    out.print(nextNumber);
%>
