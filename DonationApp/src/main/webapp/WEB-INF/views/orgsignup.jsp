<html>
<head>
<title>DonationFinder</title>
<style> 
input {
	display: inline-block; 
}
</style>
</head>

<body>
<h3>We're glad you're using Donation Finder! Please fill out the form below to submit your information.</h3> 
<div id="orginfo">
<p>Name: </p> <input name="name" id="name" placeholder="Enter Organization Name...">
<p>Username: </p> <input name="username" id="username" placeholder="Enter username..."> 
<p>Password: </p> <input name="password" id="password" placeholder="Enter password..."> 
<p>Address: </p> <input name="address" id="address" placeholder="Enter your Address..."> 
<p>Phone Number: </p> <input name="phone" id="phone" placeholder="Enter phone number...">
<p>Email: </p> <input name="email" id="email" placeholder="Enter email..."> 
<div id="iteminfo">
<p>Items Needed: (Feel free to add as many as you want)</p> 
<input name="items[]" placeholder="enter item...">
</div> 
<button id="add" onclick="addTextBox()">+</button>
</div>  
<br>  
<button type="submit" onclick="sendInfo()" id="last">Submit</button> 

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
		document.getElementById("last").remove(); 
		let p = document.createElement("p"); 
		p.innerHTML = "Thank you for submitting the form!"; 
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
</body>
</html>