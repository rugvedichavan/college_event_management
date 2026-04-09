package com.model;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

@WebServlet("/StudentRegisterServletself")

@MultipartConfig(
fileSizeThreshold = 1024 * 1024 * 2,
maxFileSize = 1024 * 1024 * 10,
maxRequestSize = 1024 * 1024 * 50
)

public class StudentRegisterServletself extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

response.setContentType("text/html");
PrintWriter out = response.getWriter();

try{

System.out.println("Servlet Started");

Part photoPart = request.getPart("photo");
Part idcardPart = request.getPart("idcard");

String collegename = request.getParameter("collegename");
String collegeemail = request.getParameter("collegeemail");
String collegecode = request.getParameter("collegecode");
String studentname = request.getParameter("studentname");
String email = request.getParameter("email");
String gender = request.getParameter("gender");
String course = request.getParameter("course");
String batch = request.getParameter("batch");
String prn = request.getParameter("prn");

System.out.println("Student Name: " + studentname);

String photoName = photoPart.getSubmittedFileName();
String idcardName = idcardPart.getSubmittedFileName();

String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";

File uploadDir = new File(uploadPath);
if(!uploadDir.exists()){
uploadDir.mkdir();
}

photoPart.write(uploadPath + File.separator + photoName);
idcardPart.write(uploadPath + File.separator + idcardName);

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3307/event_management",
"root",
""
);

System.out.println("Database Connected");

PreparedStatement ps = con.prepareStatement(
"INSERT INTO student_registration(collegename,collegeemail,collegecode,studentname,email,gender,course,batch,prn,photo,idcard) VALUES(?,?,?,?,?,?,?,?,?,?,?)"
);

ps.setString(1,collegename);
ps.setString(2,collegeemail);
ps.setString(3,collegecode);
ps.setString(4,studentname);
ps.setString(5,email);
ps.setString(6,gender);
ps.setString(7,course);
ps.setString(8,batch);
ps.setString(9,prn);
ps.setString(10,photoName);
ps.setString(11,idcardName);

int i = ps.executeUpdate();

System.out.println("Rows inserted: " + i);

if(i>0){
out.println("<h2>Student Registered Successfully</h2>");
}else{
out.println("<h2>Insert Failed</h2>");
}

con.close();

}catch(Exception e){
e.printStackTrace();
}

}
}