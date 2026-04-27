package com.roomfinder;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/AddRoomServlet")
public class AddRoomServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String title = req.getParameter("title");
        String location = req.getParameter("location");
        String price = req.getParameter("price");
        String contact = req.getParameter("contact");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO rooms(title,location,price,contact) VALUES(?,?,?,?)"
            );

            ps.setString(1, title);
            ps.setString(2, location);
            ps.setInt(3, Integer.parseInt(price));
            ps.setString(4, contact);

            ps.executeUpdate();

            res.sendRedirect("search.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Error: " + e.getMessage());
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        res.getWriter().println("Use form to add room.");
    }
}
