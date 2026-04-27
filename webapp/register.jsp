<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<link rel="stylesheet" href="style.css">
</head>

<body>

<!-- NAVBAR -->
<%@ include file="navbar.jsp" %>

<!-- MAIN CONTENT -->
<div class="content">

<div class="box">

<h2>Register</h2>

<form action="<%=request.getContextPath()%>/RegisterServlet" method="post">

    <input type="text" name="name" placeholder="Enter Name" required>
    <input type="email" name="email" placeholder="Enter Email" required>
    <input type="password" name="password" placeholder="Enter Password" required>

    <button type="submit">Register</button>

</form>

<p style="margin-top:10px;">
    Already have an account? 
    <a href="login.jsp">Login</a>
</p>

</div>

</div>

<!-- FOOTER -->
<div class="footer">
    &copy; 2026 RentalRoomFinder
</div>

</body>
</html>
