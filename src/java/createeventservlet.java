/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Date;
import java.sql.Time;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/createeventservlet")
public class createeventservlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 🔹 1. Get Form Parameters (MUST match HTML name="")
        String event_title = request.getParameter("event_title");
        String event_category = request.getParameter("event_category");

        String event_date = request.getParameter("event_date");
        String start_time = request.getParameter("start_time");
        String end_time = request.getParameter("end_time");
        String last_registration_date = request.getParameter("last_registration_date");

        String venue = request.getParameter("venue");
        String city = request.getParameter("city");

        String organizer_name = request.getParameter("organizer_name");
        String organizer_contact = request.getParameter("organizer_contact");
        String organizer_email = request.getParameter("organizer_email");

        String allowed_course = request.getParameter("allowed_course");
        String eligibility = request.getParameter("eligibility");

        String seat_type = request.getParameter("seat_type");
        String total_seats = request.getParameter("total_seats");

        String registration_fee = request.getParameter("registration_fee");
        String payment_mode = request.getParameter("payment_mode");

        String event_status = request.getParameter("event_status");

        try {

            // 🔹 2. Load MySQL Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 🔹 3. Connect DB
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3307/event_management",
                    "root",
                    ""
            );

            // 🔹 4. SQL Query (same order as DB)
            String sql = "INSERT INTO newevent ("
                    + "event_title,event_category,event_date,start_time,end_time,last_registration_date,"
                    + "venue,city,organizer_name,organizer_contact,organizer_email,"
                    + "allowed_course,eligibility,seat_type,total_seats,"
                    + "registration_fee,payment_mode,event_status"
                    + ") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            // 🔹 5. Set Values

            ps.setString(1, event_title);
            ps.setString(2, event_category);
            ps.setDate(3, Date.valueOf(event_date));
            ps.setTime(4, Time.valueOf(start_time + ":00"));
            ps.setTime(5, Time.valueOf(end_time + ":00"));
            ps.setDate(6, Date.valueOf(last_registration_date));

            ps.setString(7, venue);
            ps.setString(8, city);

            ps.setString(9, organizer_name);
            ps.setString(10, organizer_contact);
            ps.setString(11, organizer_email);

            ps.setString(12, allowed_course);
            ps.setString(13, eligibility);
            ps.setString(14, seat_type);

            // Handle total seats (if unlimited → NULL)
            if (total_seats == null || total_seats.isEmpty()) {
                ps.setNull(15, java.sql.Types.INTEGER);
            } else {
                ps.setInt(15, Integer.parseInt(total_seats));
            }

            // Handle registration fee
            if (registration_fee == null || registration_fee.isEmpty()) {
                ps.setDouble(16, 0);
            } else {
                ps.setDouble(16, Double.parseDouble(registration_fee));
            }

            ps.setString(17, payment_mode);
            ps.setString(18, event_status);

            // 🔹 6. Execute
            ps.executeUpdate();

            con.close();

            response.sendRedirect("successevent.html?msg=success");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("createevent.html?msg=error");
        }

       
    }
}
