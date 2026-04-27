<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Rooms</title>
<link rel="stylesheet" href="style.css">
</head>

<body>

<!-- NAVBAR -->
<%@ include file="navbar.jsp" %>

<!-- HERO STYLE SEARCH -->
<div class="hero small-hero">
    <div class="hero-content">

        <h1>Search Rooms</h1>
        <p>Find rooms based on your preferred location</p>

        <form action="result.jsp" method="get" class="hero-form">
            <input type="text" name="location" placeholder="Enter Location" required>
            <button type="submit" class="btn primary">Search</button>
        </form>

    </div>
</div>

<!-- FOOTER -->
<div class="footer">
    &copy; 2026 RentalRoomFinder
</div>

</body>
</html>
