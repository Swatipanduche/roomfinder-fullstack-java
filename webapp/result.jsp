<%@ page import="java.sql.*,com.roomfinder.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Results</title>
<link rel="stylesheet" href="style.css">
</head>

<body>

<!-- NAVBAR -->
<%@ include file="navbar.jsp" %>

<div class="content">
<div class="section">

<h2>Available Rooms</h2>

<%
String location = request.getParameter("location");

if(location != null && !location.trim().isEmpty()) {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    boolean found = false;

    try {
        con = DBConnection.getConnection();

        String sql = "SELECT * FROM rooms WHERE location LIKE ?";
        ps = con.prepareStatement(sql);
        ps.setString(1, "%" + location + "%");

        rs = ps.executeQuery();

        while(rs.next()) {
            found = true;

            int roomId = rs.getInt("id");
            String status = rs.getString("status");
%>

<!-- ROOM CARD -->
<div class="room-card">

    <h3><%= rs.getString("title") %></h3>

    <p><b>Location:</b> <%= rs.getString("location") %></p>
    <p><b>Price:</b> <%= rs.getInt("price") %></p>

    <p>
        <b>Status:</b>
        <% if("rented".equalsIgnoreCase(status)) { %>
            <span class="status-rented">Not Available</span>
        <% } else { %>
            <span class="status-available">Available</span>
        <% } %>
    </p>

    <!-- UPDATED BOOKFORM LINK -->
    <% if("available".equalsIgnoreCase(status)) { %>
        <a href="bookform.jsp?roomId=<%= roomId %>" class="book-btn">
            Rent Now
        </a>
    <% } else { %>
        <button class="disabled-btn" disabled>
            Already Booked
        </button>
    <% } %>

</div>

<%
        }

        if(!found) {
%>
            <p style="text-align:center; margin-top:20px;">
                No rooms found for "<%= location %>"
            </p>
<%
        }

    } catch(Exception e) {
%>
        <p style="color:red; text-align:center;">
            Error: <%= e.getMessage() %>
        </p>
<%
    } finally {
        if(rs != null) try { rs.close(); } catch(Exception e) {}
        if(ps != null) try { ps.close(); } catch(Exception e) {}
        if(con != null) try { con.close(); } catch(Exception e) {}
    }

} else {
%>
    <p style="text-align:center; margin-top:20px;">
        Please enter a location.
    </p>
<%
}
%>

<br><br>

<div style="text-align:center;">
    <a href="search.jsp" class="back-btn"> Back to Search</a>
</div>

</div>
</div>

<!-- FOOTER -->
<div class="footer">
    &copy; 2026 RentalRoomFinder
</div>

</body>
</html>
