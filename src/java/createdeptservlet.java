/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.college;

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

@WebServlet("/createdeptservlet")
public class createdeptservlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Get form data
        String collegename = request.getParameter("collegename");
        String collegeemail = request.getParameter("collegeemail");
        String collegecode = request.getParameter("collegecode");
        String collegeaddress = request.getParameter("collegeaddress");
        String course = request.getParameter("course");
        String batch = request.getParameter("batch");

        try {
            // Load MySQL Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Database Connection
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3307/event_management",
                    "root",
                    "");   // change password if needed

            // SQL Query
            String query = "INSERT INTO departments(collegename, collegeemail, collegecode, collegeaddress, course, batch) VALUES (?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, collegename);
            ps.setString(2, collegeemail);
            ps.setString(3, collegecode);
            ps.setString(4, collegeaddress);
            ps.setString(5, course);
            ps.setString(6, batch);

            int i = ps.executeUpdate();

            if (i > 0) {
                out.println("<h2 style='color:green;text-align:center;'>Department Created Successfully!</h2>");
                out.println("<div style='text-align:center;'><a href='admindashboard.html'>Back to Dashboard</a></div>");
            } else {
                out.println("<h2 style='color:red;text-align:center;'>Error Creating Department</h2>");
            }

            con.close();

        } catch (Exception e) 
        {
            out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
        }
        
    }
}
