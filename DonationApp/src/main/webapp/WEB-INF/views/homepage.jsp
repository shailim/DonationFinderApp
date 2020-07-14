<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html>
<head>
<title>Donation Finder</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
nav {
	background-color: #444444; 
}
nav a, nav span {
	color: honeydew;
	font-size: 15px;  
}
#first-block {   
	position: relative; 
	top: 50px;  
	height: 600px; 
	z-index: 1; 
}
#bg {
	background: url(https://images.pexels.com/photos/255441/pexels-photo-255441.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=1200); 
	background-repeat: no-repeat; 
	background-size: cover;
	opacity: 0.7; 
	position: absolute; 
	z-index: -1; 
	top: 0;
	bottom: 0;
	left: 0;
	right: 0; 
	width: 100%; 
	height: 100%; 
}
#title {
	width: 60%; 
	height: auto; 
	position: relative;  
	top: 25%; 
	left: 20%; 
	text-align: center; 
}
#gobtn, h2, p {
	text-align: center; 
	position: relative; 
	top: 30%; 
}
#second-block {
	background-color: honeydew; 
	height: 550px; 
}
#third-block {
	background-color: DarkOliveGreen;
	height: 550px; 
}
footer {
	position: relative; 
	bottom: 0; 
	height: 40px; 
	background-color: #444444; 
}
footer p {
	color: honeydew; 
	margin: 0; 
	padding: 0; 
}
</style>
</head>
<body>
<nav class="navbar navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
		<span class="navbar-brand">DonationFinder</span>
		</div>  
		<ul class="nav navbar-nav navbar-right">
		<li><a href="/home.do">Home</a></li>
		<li><a href="/donorsearch.do">Donator</a></li>
		<li><a href="/orglogin.do">Organization</a></li> 
		</ul> 
	</div> 
</nav> 
<div id="first-block" class="container-fluid">
	<div id="bg"></div>
	<div id="title">
	<h2 style="color:white; font-size: 45px; font-weight: bold">Donation Finder Makes It Easier and Faster</h2> <br>
	<p style="color:white; font-size: 20px">Look up any item you want to donate and find the exact location of matching organizations in seconds. 
		Save yourself hours of browsing the web and go the easier route with DonationFinder.</p> <br>
	</div>  
	<div id="gobtn"> <a href="/welcome.do"><button type="submit"class="btn btn-primary btn-lg">Get Started</button></a> </div>  
</div> 
<div id="second-block" class="container-fluid">
	<h2>Some Statistics</h2> 
</div> 
<div id="third-block" class="container-fluid">
	<h2 style="color: honeydew">Corona updates</h2> 
</div>
<footer class="container-fluid">
	<p>@2020 Copyright: DonationFinder</p> 
</footer>
</body>
</html>