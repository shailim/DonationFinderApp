<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<head>
<meta charset="UTF-8" lang="en-US"> 
<title>DonationFinder</title> 
<%@ include file="header.html" %>
<style>
h4 {
	text-align: center; 
	position: relative; 
	top: 130px; 
}
h1 {
	text-align: center;
	position: relative; 
	top: 100px;  
}
button {
	text-align: center; 
	width: 100px; 
	height: 50px; 
	margin: 0 auto; 
}
div {
	position: relative; 
	top: 70px; 
	left: 42%; 
	display: flex; 
	flex-direction: column;
	width: 200px; 
	height: auto;  
}
</style>
</head>

<body>
<h1>Welcome to Donation Finder!</h1> 
<h4>Here we provide a faster, easier way for organizations and donators to interact with each other.
   Let'd get started!</p> 
<div>
<p>Are you an</p> 
<a href="/orglogin.do"><button type="submit">Organization</button></a>
<p>Or a</p> 
<a href="/donator.do"><button type="submit">Donator</button></a>
</div> 
</body> 
</html>