/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.model;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/eventorganizerservlate")
public class eventorganizerservlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            // DB connection (use your own DB name, user, password)
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3307/event_management", "root", "");

            String sql = "SELECT * FROM event_organizer_login WHERE username=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // login success
                HttpSession session = request.getSession();
                session.setAttribute("event_organizer_login", username);
                response.sendRedirect("eventorganizerdashboard.html");
            } else {
                // login failed
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.println("<script>");
                out.println("alert('Invalid Username or Password');");
                out.println("location='eventorganizer.html';");
                out.println("</script>");
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
