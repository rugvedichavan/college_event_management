package com.model;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet("/manageeventservlet")
public class manageeventservlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Event> eventList = new ArrayList<>();

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3307/event_management",
                "root",
                "");

            PreparedStatement ps = con.prepareStatement("SELECT * FROM newevent");
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                Event e = new Event();

                e.setEventId(rs.getInt("event_id"));
                e.setEventTitle(rs.getString("event_title"));
                e.setEventCategory(rs.getString("event_category"));
                e.setEventDate(rs.getString("event_date"));
                e.setStartTime(rs.getString("start_time"));
                e.setEndTime(rs.getString("end_time"));
                e.setVenue(rs.getString("venue"));
                e.setCity(rs.getString("city"));
                e.setRegistrationFee(rs.getDouble("registration_fee"));
                e.setEventStatus(rs.getString("event_status"));

                eventList.add(e);
            }

            request.setAttribute("eventList", eventList);
            RequestDispatcher rd = request.getRequestDispatcher("manageevent.jsp");
            rd.forward(request, response);

            con.close();

        }catch(Exception e){
            e.printStackTrace();
        }
    }
}