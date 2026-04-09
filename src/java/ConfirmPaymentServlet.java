/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

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

@WebServlet("/ConfirmPaymentServlet")
public class ConfirmPaymentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String reg_id = request.getParameter("reg_id");

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3307/event_management",
                    "root",
                    "");

            PreparedStatement ps = con.prepareStatement(
                    "UPDATE eventregisterstud SET payment_status='Paid' WHERE reg_id=?");

            ps.setInt(1, Integer.parseInt(reg_id));
            ps.executeUpdate();

            con.close();

            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            out.println("<html><body style='text-align:center;font-family:Arial;'>");
            out.println("<h2 style='color:green;'>Payment Successful ✅</h2>");
            out.println("<a href='MyRegistrations.jsp'>Go Back</a>");
            out.println("</body></html>");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}