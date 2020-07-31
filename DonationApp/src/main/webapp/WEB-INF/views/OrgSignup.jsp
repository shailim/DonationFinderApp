<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html>
<head>
<title>DonationFinder</title>
<%@ include file="header.html" %>
<style> 
body {
	position: relative; 
	top: 100px; 
	font-family: 'Open Sans', sans-serif; 
}
button {
	background: #fbaf08; 
	border: none; 
	color: #444444; 
}
h3{
	text-align: center;
}
#orginfo
{
	text-align: center;
}
p{
  	width: 90%;
}
</style>
</head>

<body>
<h3>We're glad you're using Donation Finder! Please fill out the form below to submit your information.</h3> 
<br>
<div id="orginfo">
<p>Name: </p> <input name="name" id="name" placeholder="Enter Organization Name...">
<p style="width: 92%;">Username: </p> <input name="username" id="username" placeholder="Enter username...">
<p style="width: 92%;">Password: </p> <input name="password" id="password" placeholder="Enter password...">
<p style="width: 91%;">Address: </p> <input name="address" id="address" placeholder="Enter your Address...">
<p style="width: 95%;"> Phone Number: </p> <input name="phone" id="phone" placeholder="Enter phone number...">
<p>Email: </p> <input name="email" id="email" placeholder="Enter email...">
<div id="iteminfo">
<p style="width: 105%;">Items Needed: (Feel free to add as many as you want)</p>
<input name="items[]" placeholder="enter item...">
</div>
<button id="add" onclick="addTextBox()">+</button>
</div>
<br>
<button type="submit" onclick="sendInfo()" id="last" style="background: #fbaf08;border:none;color:#444444">Submit</button>

<script>
	
	function sendInfo() { 
		let name = document.getElementById("name").value; 
		let username = document.getElementById("username").value; 
		let password = document.getElementById("password").value; 
		let address = document.getElementById("address").value;
		let phone = document.getElementById("phone").value; 
		let email = document.getElementById("email").value;  
		let form = document.getElementById("iteminfo");
		let items = [];  
		form.querySelectorAll("input").forEach((input) => {
			items.push(input.value); 
		}); 
		console.log(items); 
		let xhttp = new XMLHttpRequest(); 
		xhttp.open("POST", "orgsignup.do", true); 
		xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); 
		xhttp.send("name=" + name + "&username=" + username + "&password=" + password + "&address=" + address + 
		"&phone=" + phone + "&email=" + email + "&items=" + items);
		let btn = document.getElementById("last");
		btn.innerHTML = "Submitted!";
		btn.style.background = "green"; 
		document.getElementById("orginfo").appendChild(p);  
	}
	
	function addTextBox() {
		let newdiv = document.createElement("div");  
		let newbox = document.createElement("input"); 
		newbox.name = "items[]"; 
		newbox.placeholder = "enter item..."; 
		newdiv.appendChild(newbox); 
		let newbtn = document.createElement("button");  
		newbtn.innerHTML = "X";   
		newbtn.onclick = function() {
			this.parentNode.remove(); 
		};   
		newdiv.appendChild(newbtn); 
		document.getElementById("iteminfo").appendChild(newdiv);
	}
</script>
<%@ include file="footer.html" %>
</body>
</html>
