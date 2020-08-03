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
#add{
	display: block;
        background: #fbaf08; 
	border: none;
        color: white;
        border-radius: 4px;
        cursor: pointer;
}  
#last {
	background: #fbaf08; 
	border: none; 
	padding: 12px 18px;
        color: white;
        border-radius: 4px;
        cursor: pointer;
        Margin-top: 10px;
         Font-size: 13px;

}
#welcomeStatement{
		text-align: center;
        color: #b35900;
}
Input{
Width: 325px;
Height: 25px;
margin-bottom: 30px;

}
#orginfo
{
	padding-left: 60px;
        padding-top: 20px;
        padding-bottom: 20px;
        Background-color: #f3f3f3;
}
p{
  	width: 90%;
	Padding: 5px;
}
#formStyle
{
 Width : 50%;
Margin: auto;
Padding-bottom: 40px;

}
label {
	display: block;
	font-weight: normal;
}
.iteminput {
	margin-bottom: 5px; 
}
</style>
</head>

<body>
<h3 id = "welcomeStatement">We're glad you're using Donation Finder! Please fill out the form below to submit your information.</h3> 
<br>
<div id = "formStyle">
<div id="orginfo">
<h3> Sign Up </h3><br>
<form action="/orgsignup.do" method="post">
<label>Name: </label> <input type="text" name="name" id="name" placeholder="Enter Organization Name...">
<label>Username: </label> <input type="text" name="username" id="username" placeholder="Enter username...">
<label>Password: </label> <input type="password" name="password" id="password" placeholder="Enter password...">
<label>Address: </label> <input type="text" name="address" id="address" placeholder="Enter your Address...">
<label> Phone Number: </label> <input type="tel" name="phone" id="phone" placeholder="Enter phone number...">
<label>Email: </label> <input type="email" name="email" id="email" placeholder="Enter email...">
<div id="iteminfo">
<label>Items Needed: (Add as many as you want)</label>
<input class="iteminput" name="items[]" placeholder="Enter item...">
</div>
<button type="button" id="add" onclick="addTextBox()">+</button>

<br>
<button type="submit" onclick="sendInfo()" id="last" style="background: #fbaf08;border:none;color:#444444">Sign Up</button>
</form>
<a style="margin-left: 140px" href="orglogin.do">Back to Log In</a>
</div>
</div>
<script>
	
	function sendInfo() { 
		/*let name = document.getElementById("name").value; 
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
		"&phone=" + phone + "&email=" + email + "&items=" + items);*/
		let btn = document.getElementById("last");
		btn.innerHTML = "Submitted!";
		btn.style.background = "lightgreen"; 
		document.getElementById("orginfo").appendChild(p);  
	}
	
	function addTextBox() {
		let newdiv = document.createElement("div");  
		let newbox = document.createElement("input"); 
		newbox.name = "items[]"; 
		newbox.placeholder = "Enter item..."; 
		newbox.setAttribute("class", "iteminput")
		newdiv.appendChild(newbox); 
		let newbtn = document.createElement("button");  
		newbtn.innerHTML = "&times;";   
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
