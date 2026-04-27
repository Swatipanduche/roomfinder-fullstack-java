<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Room</title>
<link rel="stylesheet" href="style.css">
</head>

<body>

<!-- NAVBAR -->
<%@ include file="navbar.jsp" %>

<!-- MAIN CONTENT -->
<div class="content">

<div class="box">

<h2>Add Room</h2>

<form action="<%=request.getContextPath()%>/AddRoomServlet" method="post">

    <input type="text" name="title" placeholder="Room Title" required>
    <input type="text" name="location" placeholder="Location" required>
    <input type="number" name="price" placeholder="Price" required>
    <input type="text" name="contact" placeholder="Contact Number" required>

    <button type="submit">Add Room</button>

</form>

</div>

</div>

<!-- FOOTER -->
<div class="footer">
    &copy; 2026 RentalRoomFinder
</div>

</body>
</html>
