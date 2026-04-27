package com.roomfinder;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/BookRoomServlet")
public class BookRoomServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int roomId = Integer.parseInt(req.getParameter("roomId"));
        String name = req.getParameter("name");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");

        try {
            Connection con = DBConnection.getConnection();

            // 🔒 1. CHECK if already booked
            PreparedStatement check = con.prepareStatement(
                "SELECT status FROM rooms WHERE id=?"
            );
            check.setInt(1, roomId);

            ResultSet rs = check.executeQuery();

            if (rs.next() && "rented".equalsIgnoreCase(rs.getString("status"))) {
                res.sendRedirect("search.jsp?msg=Room Already Booked");
                return;
            }

            // 📝 2. SAVE BOOKING DETAILS
            PreparedStatement ps1 = con.prepareStatement(
                "INSERT INTO bookings(room_id, name, phone, email) VALUES(?,?,?,?)"
            );

            ps1.setInt(1, roomId);
            ps1.setString(2, name);
            ps1.setString(3, phone);
            ps1.setString(4, email);

            ps1.executeUpdate();

            // 🔄 3. UPDATE ROOM STATUS
            PreparedStatement ps2 = con.prepareStatement(
                "UPDATE rooms SET status='rented' WHERE id=?"
            );

            ps2.setInt(1, roomId);
            ps2.executeUpdate();

            // ✅ 4. REDIRECT WITH MESSAGE
            res.sendRedirect("search.jsp?msg=Booking Successful");

        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect("search.jsp?msg=Error Occurred");
        }
    }
}
