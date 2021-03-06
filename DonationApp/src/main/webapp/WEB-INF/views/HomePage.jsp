<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html>
<head>
<title>Donation Finder</title>
<%@ include file="header.html" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://cdn.zingchart.com/zingchart.min.js"></script>
<style>
body {
	font-family: 'Open Sans', sans-serif; 
	position: relative; 
	top: 50px; 
}
#first-block {   
	position: relative; 
	height: 550px; 
	z-index: 1;
	background-color: white; 
}
#bg {
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
	top: 20%; 
	left: 20%; 
	text-align: center; 
}
.circle {
	width: 100px; 
	height: 100px; 
	border-radius: 50px; 
	position: relative; 
	display: inline-block; 
	z-index: -1;  
}
.gold {
	background-color: gold;
}
.blue {
	background-color: #CCFFFF; 
}
.pink {
	background-color: #FFCCCC;
}
#gobtn, h2, p {
	text-align: center; 
	position: relative; 
	top: 12%; 
	line-height: 40px; 
}
#gobtn {
	top: 20%; 
}
#title h2 {
	line-height: 60px; 
	font-size: 45px; 
	font-weight: 800; 
	background: -webkit-linear-gradient(left, #ff2400, #fbaf08);
	-webkit-background-clip: text; 
	-webkit-text-fill-color: transparent;  
}
#second-block {
	background-image: linear-gradient(to bottom, #FFFFFF 5%, #fbaf08 100%); 
	height: 700px;
	 
}
</style>
</head>
<body>
<div id="first-block" class="container-fluid">
	<div id="bg">
		<div class="circle gold"></div>
		<div class="circle pink"></div>
		<div class="circle gold"></div>
		<div class="circle gold"></div>
		<div class="circle gold"></div>
		<div class="circle pink"></div>
		<div class="circle gold"></div>
		<div class="circle pink"></div>
	</div>
	<div id="title">
	<h2>Search. Locate. Donate.</h2> <br>
	<p style="font-size: 18px">Look up any item you want to donate and find the exact location of matching organizations in seconds. 
		Save yourself hours of browsing the web and go the easier route with DonationFinder.</p> <br>
	</div>  
	<div id="gobtn"> <a href="/welcome.do"><button type="submit"class="btn btn-primary btn-lg" style="background: #fbaf08;border:none;color:#444444">Get Started</button></a> </div>  
</div> 
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script>
	var circles = document.querySelectorAll(".circle"); 
	for (var i = 0; i < circles.length; i++) {
		var circle = circles[i]; 
		animateCircles(circle); 
	}
	
	function animateCircles(circle) {
		circle.animate([
			{
				opacity: 0,
				transform: "translate3d(" + (Math.random() * 600) + "px, " + (Math.random() * 500) + "px, 0px)"
			},
			{
				opacity: 1,
				transform: "translate3d(" + (Math.random() * 600) + "px, " + (Math.random() * 500) + "px, 0px)"
			},
			{
				opacity: 0,
				transform: "translate3d(" + (Math.random() * 600) + "px, " + (Math.random() * 500) + "px, 0px)"
			},
			{
				opacity: 1,
				transform: "translate3d(" + (Math.random() * 600) + "px, " + (Math.random() * 500) + "px, 0px)"
			},
			{
				opacity: 0,
				transform: "translate3d(" + (Math.random() * 600) + "px, " + (Math.random() * 500) + "px, 0px)"
			}], 
			{
				duration: 10000,
				fill: "forwards",
				easing: "ease-out",
				iterations: Infinity
			}
		); 
	}
</script>
</body>
</html>