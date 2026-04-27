<%@ page import="java.sql.*,com.roomfinder.DBConnection" %>

<%
    String idParam = request.getParameter("id");

    if(idParam != null){
        try {
            int id = Integer.parseInt(idParam);

            Connection con = DBConnection.getConnection();

            // Check if already rented (optional but professional)
            PreparedStatement check = con.prepareStatement(
                "SELECT status FROM rooms WHERE id=?"
            );
            check.setInt(1, id);

            ResultSet rs = check.executeQuery();

            if(rs.next()){
                String status = rs.getString("status");

                if("available".equals(status)) {

                    // Update to rented
                    PreparedStatement ps = con.prepareStatement(
                        "UPDATE rooms SET status='rented' WHERE id=?"
                    );

                    ps.setInt(1, id);
                    ps.executeUpdate();

                }
            }

            // Always redirect back to results page
            response.sendRedirect("search.jsp");

        } catch(Exception e){
            out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
        }
    } else {
        out.println("<h3 style='color:red;'>Invalid Request</h3>");
    }
%>
