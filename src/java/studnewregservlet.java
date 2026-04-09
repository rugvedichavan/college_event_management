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

@WebServlet("/studnewregservlet")
public class studnewregservlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String gender = request.getParameter("gender");
        String course = request.getParameter("course");
        String password = request.getParameter("password");

        try {
            // Load MySQL Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // DB Connection (change if needed)
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3307/event_management",
                    "root",
                    ""
            );

            // Check if email already exists
            String checkQuery = "SELECT * FROM students WHERE email=?";
            PreparedStatement checkPs = con.prepareStatement(checkQuery);
            checkPs.setString(1, email);
            ResultSet rs = checkPs.executeQuery();

            if (rs.next()) {

                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.println("<script>");
                out.println("alert('Email already registered!');");
                out.println("location='studnewreg.html';");
                out.println("</script>");

            } else {

                // Insert student
                String insertQuery = "INSERT INTO students(full_name,email,mobile,gender,course,password) VALUES(?,?,?,?,?,?)";
                PreparedStatement ps = con.prepareStatement(insertQuery);

                ps.setString(1, fullname);
                ps.setString(2, email);
                ps.setString(3, mobile);
                ps.setString(4, gender);
                ps.setString(5, course);
                ps.setString(6, password);

                int i = ps.executeUpdate();

                if (i > 0) {
                    response.setContentType("text/html");
                    PrintWriter out = response.getWriter();
                    out.println("<script>");
                    out.println("alert('Registration Successful!');");
                    out.println("location='studlogin.html';");
                    out.println("</script>");
                }
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
