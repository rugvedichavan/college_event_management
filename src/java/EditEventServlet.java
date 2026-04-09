package com.model;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/EditEventServlet")
public class EditEventServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("event_id");

        if(idParam == null){
            response.getWriter().println("Event ID not received");
            return;
        }

        int event_id = Integer.parseInt(idParam);

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3307/event_management",
                "root",
                "");

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM newevent WHERE event_id=?");

            ps.setInt(1, event_id);

            ResultSet rs = ps.executeQuery();

            Event event = null;

            if(rs.next()){
                event = new Event();

                event.setEventId(rs.getInt("event_id"));
                event.setEventTitle(rs.getString("event_title"));
                event.setEventCategory(rs.getString("event_category"));
                event.setEventDate(rs.getString("event_date"));
                event.setStartTime(rs.getString("start_time"));
                event.setEndTime(rs.getString("end_time"));
                event.setVenue(rs.getString("venue"));
                event.setCity(rs.getString("city"));
                event.setRegistrationFee(rs.getDouble("registration_fee"));
                event.setEventStatus(rs.getString("event_status"));
            }

            request.setAttribute("event", event);
            RequestDispatcher rd = request.getRequestDispatcher("editevent.jsp");
            rd.forward(request, response);

            con.close();

        }catch(Exception e){
            e.printStackTrace();
        }
    }
}