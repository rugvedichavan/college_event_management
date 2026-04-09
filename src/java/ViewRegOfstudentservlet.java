import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;
import java.sql.*;
import java.util.*;

@WebServlet("/ViewRegOfstudentservlet")
public class ViewRegOfstudentservlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<String[]> list = new ArrayList<>();

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:330/event_management","root","");

            String query = "SELECT * FROM eventregisterstud";

            PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while(rs.next())
            {
                String data[] = new String[7];

                data[0] = rs.getString("reg_id");
                data[1] = rs.getString("event_id");
                data[2] = rs.getString("student_name");
                data[3] = rs.getString("email");
                data[4] = rs.getString("prn");
                data[5] = rs.getString("payment_status");
                data[6] = rs.getString("status");

                list.add(data);
            }

            request.setAttribute("list", list);

            RequestDispatcher rd = request.getRequestDispatcher("viewregistration.jsp");
            rd.forward(request, response);

        } 
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}