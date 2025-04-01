
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UserManagementServlet")
public class UserManagementServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<String[]> users = new ArrayList<>();
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;

        try {
            // Load JDBC driver
            System.out.println("Loading MySQL JDBC driver...");
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish database connection
            System.out.println("Connecting to database...");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trikalsandhya", "root", "");

            // Check connection
            if (con != null) {
                System.out.println("Database connected successfully!");
            } else {
                System.out.println("Failed to connect to database.");
            }

            // Execute query to fetch users
            st = con.createStatement();
            rs = st.executeQuery("SELECT * FROM user");

            System.out.println("Executing SQL query: SELECT * FROM user");

            // Check if any users are fetched
            if (rs.next()) {
                System.out.println("User found, processing data...");
                do {
                    String id = String.valueOf(rs.getInt("id"));
                    String name = rs.getString("username");
                    String email = rs.getString("email");

                    // Print the user data in logs
                    System.out.println("Fetched User -> ID: " + id + ", Name: " + name + ", Email: " + email);
                    users.add(new String[]{id, name, email});
                } while (rs.next());
            } else {
                System.out.println("No users found in the database.");
            }

            // Set users list as an attribute
            request.setAttribute("users", users);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (st != null) st.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // Forward request to the JSP
        request.getRequestDispatcher("jsp/admin_user.jsp").forward(request, response);
    }
}
