import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddShlokServlet")
public class AddShlokServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Get data from the form
        String category = request.getParameter("category");
        int adhyayNumber = Integer.parseInt(request.getParameter("adhyay_number"));
        String shlok = request.getParameter("shlok");
        String translationGujarati = request.getParameter("translation_gujarati");
        String translationEnglish = request.getParameter("translation_english");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trikalsandhya", "root", "");

            String query = "INSERT INTO shlokas (category, adhyay_number, shlok, translation_gujarati, translation_english) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, category);
            ps.setInt(2, adhyayNumber);
            ps.setString(3, shlok);
            ps.setString(4, translationGujarati);
            ps.setString(5, translationEnglish);

            int rowsInserted = ps.executeUpdate();
            ps.close();
            con.close();

            if (rowsInserted > 0) {
                response.sendRedirect("add_shlok.jsp?success=Shloka Added Successfully");
            } else {
                response.sendRedirect("add_shlok.jsp?error=Failed to Add Shloka");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("add_shloka.jsp?error=" + e.getMessage());
        }
    }
}
