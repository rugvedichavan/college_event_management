package com.model;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/DeleteEventServlet")
public class DeleteEventServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int event_id = Integer.parseInt(request.getParameter("event_id"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3307/event_management",
                    "root",
                    "");

            PreparedStatement ps = con.prepareStatement(
                    "DELETE FROM newevent WHERE event_id=?");

            ps.setInt(1, event_id);
            ps.executeUpdate();

            con.close();

            response.sendRedirect("manageeventservlet");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}