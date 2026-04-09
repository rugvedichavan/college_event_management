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
import java.io.*;
import java.sql.*;

/**
 *
 * @author Admin
 */
@WebServlet(urlPatterns = {"/ApproveRequestServlet"})
public class ApproveRequestServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int reg_id = Integer.parseInt(request.getParameter("reg_id"));
        String action = request.getParameter("action");

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3307/event_management",
                "root",
                "");

            String status = "";

            if(action.equals("approve")){
                status = "Approved";
            } else {
                status = "Rejected";
            }

            PreparedStatement ps = (PreparedStatement) con.prepareStatement(
                "UPDATE eventregisterstud SET status=? WHERE reg_id=?");

            ps.setString(1, status);
            ps.setInt(2, reg_id);

            ps.executeUpdate();

            response.sendRedirect("approveevents.jsp");

        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
