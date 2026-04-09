package com.model;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/ViewDepartmentsServlet")
public class ViewDepartmentsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<String[]> deptList = new ArrayList<>();

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3307/event_management",
                    "root",
                    ""
            );

            PreparedStatement ps = con.prepareStatement("SELECT * FROM departments");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                String[] dept = new String[7];

                dept[0] = rs.getString("dept_id");
                dept[1] = rs.getString("collegename");
                dept[2] = rs.getString("collegeemail");
                dept[3] = rs.getString("collegecode");
                dept[4] = rs.getString("collegeaddress");
                dept[5] = rs.getString("batch");
                dept[6] = rs.getString("course");

                deptList.add(dept);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("deptList", deptList);

        RequestDispatcher rd = request.getRequestDispatcher("ViewDepartments.jsp");
        rd.forward(request, response);
    }
}