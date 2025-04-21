import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/GetShlokNumberServlet")
public class GetShlokNumberServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String category = request.getParameter("category");
        int adhyay = Integer.parseInt(request.getParameter("adhyay"));
        int nextNumber = 1;

        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/trikalsandhya", "root", "");
            PreparedStatement ps = conn.prepareStatement("SELECT MAX(shlok_number) FROM shlokas WHERE adhyay_number = ? AND category = ?");
            ps.setInt(1, adhyay);
            ps.setString(2, category);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                nextNumber = rs.getInt(1) + 1;
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Error: " + e.getMessage());
            return;
        }

        response.setContentType("application/json");
        response.getWriter().write("{\"nextNumber\":" + nextNumber + "}");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
