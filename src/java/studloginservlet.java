/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */
package com.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/studloginservlet")
public class studloginservlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            // Load Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // DB Connection (change port/db if needed)
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3307/event_management", "root", "");

            String sql = "SELECT * FROM students WHERE email=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                // Create session
                HttpSession session = request.getSession();
                session.setAttribute("student_login", email);

                
                response.sendRedirect("studentdashboard.html");

            } else {

                // Login failed
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.println("<script>");
                out.println("alert('Invalid Email or Password');");
                out.println("location='studlogin.html';");
                out.println("</script>");
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
