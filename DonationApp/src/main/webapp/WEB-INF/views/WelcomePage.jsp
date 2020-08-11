<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<head>
<meta charset="UTF-8" lang="en-US"> 
<title>DonationFinder</title> 
<%@ include file="header.html" %>
<style>
	body {
		background: linear-gradient(180deg, #ff2400, orange, #fbaf08, yellow, #9ACD32);
		background-size: 100% 400%; 
		position: relative; 
		top: 200px; 
		font-family: 'Open Sans', sans-serif; 
		animation: gradient 5s linear infinite alternate; 
	}
	@keyframes gradient {
		0% {background-position: 50% 0%}
		100% {background-position: 50% 100%}
	}
	div {
		text-align: center; 
		font-size: 26px; 
		line-height: 45px; 
		z-index: 1; 
	}
	button { 
		width: 250px;
		height: 60px; 
		font-size: 22px; 
		border-radius: 9px; 
		margin-bottom: 40px; 
	}
</style>
</head>
<body>
<div>
<p>Are you an</p> 
<a href="/orglogin.do"><button type="submit" style="background: white;border:none;color:#444444">Organization</button></a>
<p>Or a</p> 
<a href="/donator.do"><button type="submit" style="background: white;border:none;color:#444444">Donator</button></a>
</div> 
</body> 
</html>