package com.model;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/UpdateEventServlet")
public class UpdateEventServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int event_id = Integer.parseInt(request.getParameter("event_id"));

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3307/event_management",
                "root",
                "");

            PreparedStatement ps = con.prepareStatement(
                "UPDATE newevent SET event_title=?, event_category=?, event_date=?, start_time=?, end_time=?, venue=?, city=?, registration_fee=?, event_status=? WHERE event_id=?");

            ps.setString(1, request.getParameter("event_title"));
            ps.setString(2, request.getParameter("event_category"));
            ps.setString(3, request.getParameter("event_date"));
            ps.setString(4, request.getParameter("start_time"));
            ps.setString(5, request.getParameter("end_time"));
            ps.setString(6, request.getParameter("venue"));
            ps.setString(7, request.getParameter("city"));
            ps.setDouble(8, Double.parseDouble(request.getParameter("registration_fee")));
            ps.setString(9, request.getParameter("event_status"));
            ps.setInt(10, event_id);

            ps.executeUpdate();

            con.close();

response.sendRedirect("manageeventservlet?msg=updated");
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}