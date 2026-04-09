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

@WebServlet("/attendanceservlet")
public class attendanceservlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String token = request.getParameter("token");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3307/event_management", "root", ""
            );

            
            PreparedStatement check = con.prepareStatement(
                "SELECT attendance_status FROM eventregisterstud WHERE qr_token=?"
            );
            check.setString(1, token);

            ResultSet rs = check.executeQuery();

            if (rs.next()) {

                String status = rs.getString("attendance_status");

                if (status.equalsIgnoreCase("NotMarked")) {

                    PreparedStatement update = con.prepareStatement(
                        "UPDATE eventregisterstud SET attendance_status='Marked' WHERE qr_token=?"
                    );
                    update.setString(1, token);

                    int i = update.executeUpdate();

                    if (i > 0) {
                        out.println("<h3 style='color:green;'>✅ Attendance Marked Successfully</h3>");
                    } else {
                        out.println("<h3 style='color:red;'>❌ Failed to update</h3>");
                    }

                } else {
                    out.println("<h3 style='color:orange;'>⚠ Attendance Already Marked</h3>");
                }

            } else {
                out.println("<h3 style='color:red;'>❌ Invalid QR Code</h3>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3 style='color:red;'>❌ Error Occurred</h3>");
        }
    }
}