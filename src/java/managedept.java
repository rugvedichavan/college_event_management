/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.model;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.model.Department;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/managedept")
public class managedept extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Department> deptList = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3307/event_management",
                    "root",
                    ""
            );

            String sql = "SELECT * FROM departments";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Department d = new Department();

                d.setDeptId(rs.getInt("dept_id"));
                d.setCourse(rs.getString("course"));
                d.setDeptCode(rs.getString("dept_code"));
                d.setDescription(rs.getString("description"));

                deptList.add(d);
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("deptList", deptList);
        request.getRequestDispatcher("managedept.jsp").forward(request, response);
    }
}
