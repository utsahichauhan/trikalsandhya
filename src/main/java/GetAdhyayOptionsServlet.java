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
import java.util.HashSet;
import java.util.Set;

@WebServlet("/GetAdhyayOptionsServlet")
public class GetAdhyayOptionsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String category = request.getParameter("category");
        Set<Integer> usedAdhyays = new HashSet<>();
        
        // Query the database to find all adhyay numbers for the selected category
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/trikalsandhya", "root", "");
            PreparedStatement ps = conn.prepareStatement("SELECT DISTINCT adhyay_number FROM shlokas WHERE category = ?");
            ps.setString(1, category);
            ResultSet rs = ps.executeQuery();
            
            // Collect all used adhyay numbers in the current category
            while (rs.next()) {
                usedAdhyays.add(rs.getInt(1));
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Generate missing adhyay numbers (up to 20 in this example)
        StringBuilder adhyayOptions = new StringBuilder();
        for (int i = 1; i <= 20; i++) {
            if (!usedAdhyays.contains(i)) {
                adhyayOptions.append("<option value=\"").append(i).append("\">Adhyay ").append(i).append("</option>");
            }
        }

        // Send the response back with the available adhyay options
        response.setContentType("text/html");
        response.getWriter().write(adhyayOptions.toString());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
