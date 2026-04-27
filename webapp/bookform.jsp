<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Room</title>
<link rel="stylesheet" href="style.css">
</head>

<body>

<!-- NAVBAR -->
<%@ include file="navbar.jsp" %>

<div class="content">
<div class="box">

<h2>Enter Your Details</h2>

<%
String roomId = request.getParameter("roomId");

if(roomId == null || roomId.trim().isEmpty()) {
%>

    <p style="color:red; text-align:center;">
        Invalid Room Selection. Please try again.
    </p>

    <div style="text-align:center;">
        <a href="search.jsp" class="back-btn"> Back to Search</a>
    </div>

<%
} else {
%>

<form action="BookRoomServlet" method="post">

    <!-- CORRECT PARAMETER -->
    <input type="hidden" name="roomId" value="<%= roomId %>">

    <!-- USER DETAILS -->
    <input type="text" name="name" placeholder="Your Name" required>
    <input type="text" name="phone" placeholder="Phone Number" required>
    <input type="email" name="email" placeholder="Email Address" required>

    <button type="submit">Confirm Booking</button>

</form>

<%
}
%>

</div>
</div>

<!-- FOOTER -->
<div class="footer">
    &copy; 2026 RentalRoomFinder
</div>

</body>
</html>
