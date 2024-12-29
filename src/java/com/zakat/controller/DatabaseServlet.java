import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DatabaseServlet")
public class DatabaseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        // JDBC connection parameters
        String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe"; // Adjust according to your DB settings
        String dbUser = "zakatdb"; // Replace with your DB username
        String dbPassword = "zakatdb"; // Replace with your DB password

        try {
            // Load Oracle JDBC Driver
            Class.forName("oracle.jdbc.OracleDriver");

            // Establish connection
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // Execute SQL query
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM STUDENT");

            // Display results
            out.println("<html><body><h2>Student Records:</h2><table border='1'>");
            out.println("<tr><th>Student ID</th><th>Name</th></tr>");
            while (resultSet.next()) {
                out.println("<tr><td>" + resultSet.getInt("studentID") + "</td><td>" + resultSet.getString("name") + "</td></tr>");
            }
            out.println("</table></body></html>");

            // Close resources
            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
    }
}
