package com.model;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


@WebServlet("/DownloadPassServlet")
public class DownloadPassServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int reg_id = Integer.parseInt(request.getParameter("reg_id"));

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3307/event_management",
                    "root",
                    "");

            PreparedStatement ps = con.prepareStatement(
                    "SELECT er.*, e.event_title, e.event_date " +
                    "FROM eventregisterstud er " +
                    "JOIN newevent e ON er.event_id = e.event_id " +
                    "WHERE er.reg_id=? AND er.payment_status='Paid'");

            ps.setInt(1, reg_id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                String studentName = rs.getString("student_name");
                String email = rs.getString("email");
                String prn = rs.getString("prn");
                String eventTitle = rs.getString("event_title");
                String eventDate = rs.getString("event_date");

                response.setContentType("text/html");
                PrintWriter out = response.getWriter();

                out.println("<html>");
                out.println("<head>");
                out.println("<title>Event Pass</title>");
       out.println("<style>");

out.println("*{margin:0;padding:0;box-sizing:border-box;font-family:Arial,Helvetica,sans-serif;}");

out.println("body{");
out.println("background:#eceff1;");
out.println("display:flex;");
out.println("justify-content:center;");
out.println("align-items:center;");
out.println("height:100vh;");
out.println("}");

out.println(".ticket{");
out.println("width:600px;");
out.println("background:white;");
out.println("border-radius:10px;");
out.println("box-shadow:0 8px 25px rgba(0,0,0,0.3);");
out.println("overflow:hidden;");
out.println("}");

out.println(".ticket-header{");
out.println("background:#1e3c72;");
out.println("background:linear-gradient(to right,#1e3c72,#2a5298);");
out.println("color:white;");
out.println("padding:20px;");
out.println("text-align:center;");
out.println("}");

out.println(".ticket-header h2{");
out.println("letter-spacing:2px;");
out.println("}");

out.println(".ticket-body{");
out.println("padding:25px;");
out.println("}");

out.println(".ticket-body p{");
out.println("font-size:16px;");
out.println("margin:10px 0;");
out.println("}");

out.println(".ticket-body b{color:#333;}");

out.println(".divider{");
out.println("border-top:2px dashed #999;");
out.println("margin:20px 0;");
out.println("}");

out.println(".pass-id{");
out.println("font-size:14px;");
out.println("color:#555;");
out.println("}");

out.println(".btn{");
out.println("background:#27ae60;");
out.println("color:white;");
out.println("padding:12px 25px;");
out.println("border:none;");
out.println("border-radius:5px;");
out.println("cursor:pointer;");
out.println("font-size:15px;");
out.println("margin-top:15px;");
out.println("}");

out.println(".btn:hover");

out.println("@media print{");
out.println("body{background:white;}");
out.println(".btn{display:none;}");
out.println("}");

out.println("</style>");
out.println("</head>");
                out.println("<body>");

                out.println("<div class='ticket'>");

out.println("<div class='ticket-header'>");
out.println("<h2>COLLEGE EVENT ENTRY PASS</h2>");
out.println("</div>");

out.println("<div class='ticket-body'>");

out.println("<p><b>Name:</b> " + studentName + "</p>");
out.println("<p><b>Email:</b> " + email + "</p>");
out.println("<p><b>PRN:</b> " + prn + "</p>");

out.println("<div class='divider'></div>");

out.println("<p><b>Event:</b> " + eventTitle + "</p>");
out.println("<p><b>Date:</b> " + eventDate + "</p>");

out.println("<div class='divider'></div>");

out.println("<p class='pass-id'><b>Pass ID:</b>" + reg_id + "</p>");

out.println("<button class='btn' onclick='downloadPass()'>Download / Print Pass</button>");

out.println("</div>");
out.println("</div>");
                out.println("<script>");
                out.println("function downloadPass(){");
                out.println("window.print();");
                out.println("}");
                out.println("</script>");

                out.println("</body></html>");

            } else {
                response.getWriter().println("<h3 style='color:red;text-align:center;'>Payment Not Completed!</h3>");
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}