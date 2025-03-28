import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ViewShlokServlet")
public class ViewShlokServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        int chapter = Integer.parseInt(request.getParameter("chapter"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ramayan_db", "root", "password");

            String query = "SELECT * FROM shlokas WHERE adhyay_number = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, chapter);
            ResultSet rs = ps.executeQuery();

            out.println("<h2>Shlokas from Chapter " + chapter + "</h2>");
            while (rs.next()) {
                out.println("<h3>" + rs.getString("shlok") + "</h3>");
                out.println("<p><strong>Gujarati:</strong> " + rs.getString("translation_gujarati") + "</p>");
                out.println("<p><strong>English:</strong> " + rs.getString("translation_english") + "</p>");
                out.println("<hr>");
            }
            ps.close();
            con.close();
        } catch (Exception e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}
