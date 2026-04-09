/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    public static void main(String[] args) {

        String url = "jdbc:mysql://localhost:3307/event_management";
        String user = "root";
        String password = "";

        Connection con = null;

        try {
            con = DriverManager.getConnection(url, user, password);
            System.out.println("Database Connected Successfully!");
        } catch (SQLException e) {
            System.out.println(" Connection Failed!");
            System.out.println(e.getMessage());
        }
    }
}


/**
 *
 * @author Admin
 */
