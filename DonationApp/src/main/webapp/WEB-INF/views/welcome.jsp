<head>
<meta charset="UTF-8" lang="en-US"> 
<title>DonationFinder</title> 
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
form {
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
<form method="POST">
<p>Are you an</p> 
<button type="submit" name="choose" value="org">Organization</button> 
<p>Or a</p> 
<button type="submit" name="choose" value="donor">Donator</button> 
</form> 
</body> 
</html>