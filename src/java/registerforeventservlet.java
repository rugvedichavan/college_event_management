package com.college;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/registerforeventservlet")
public class registerforeventservlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        int event_id = Integer.parseInt(request.getParameter("event_id"));
        String event_title = request.getParameter("event_title");
        String student_name = request.getParameter("student_name");
        String email = request.getParameter("email");
        String prn = request.getParameter("prn");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3307/event_management",
                    "root",
                    ""
            );

            // 🔥 IMPORTANT: If JSP failed to send data, take from session
            HttpSession session = request.getSession();

            if (email == null || email.equals("")) {
                email = (String) session.getAttribute("email");
            }

            // 🔍 Fetch missing student details using email (backup)
            if (student_name == null || student_name.equals("") || prn == null || prn.equals("")) {

                PreparedStatement psFetch = con.prepareStatement(
                        "SELECT studentname, prn FROM student_registration WHERE email=?"
                );

                psFetch.setString(1, email);

                ResultSet rs = psFetch.executeQuery();

                if (rs.next()) {
                    student_name = rs.getString("student_name");
                    prn = rs.getString("prn");
                }
            }

            // ✅ Check duplicate registration
            PreparedStatement psCheck = con.prepareStatement(
                    "SELECT * FROM eventregisterstud WHERE event_id=? AND email=?"
            );

            psCheck.setInt(1, event_id);
            psCheck.setString(2, email);

            ResultSet rsCheck = psCheck.executeQuery();

            if (rsCheck.next()) {
                out.println("<h3>You have already registered for this event!</h3>");
                return;
            }

            // ✅ Insert data
            String query = "INSERT INTO eventregisterstud(event_id,event_title,student_name,email,prn) VALUES(?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, event_id);
            ps.setString(2, event_title);
            ps.setString(3, student_name);
            ps.setString(4, email);
            ps.setString(5, prn);

            int i = ps.executeUpdate();

            if (i > 0) {
                out.println("<h2>Registration Successful!</h2>");
                out.println("<a href='studentdashboard.jsp'>Back to Dashboard</a>");
            } else {
                out.println("<h2>Registration Failed</h2>");
            }

            con.close();

        } catch (Exception e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}