<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="style.css">
</head>

<body>

<!-- NAVBAR -->
<%@ include file="navbar.jsp" %>

<!-- MAIN CONTENT -->
<div class="content">

<div class="box">

<h2>Login</h2>

<form action="<%=request.getContextPath()%>/LoginServlet" method="post">

    <input type="email" name="email" placeholder="Enter Email" required>
    <input type="password" name="password" placeholder="Enter Password" required>

    <button type="submit">Login</button>

</form>

</div>

</div>

<!-- FOOTER -->
<div class="footer">
    © 2026 RentalRoomFinder
</div>

</body>
</html>
