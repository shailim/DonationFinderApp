<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<html>
<head>
<title>Your Organization</title> 
<%@ include file="header.html" %>
</head>
<body style="position: relative; top: 100px">
<h3></h3> 
<button onclick="showForm()">Edit Profile</button> 
<div id="form" style="display: none">
<p>Name: </p> <input name="name" id="name">
<p>Address: </p> <input name="address" id="address"> 
<p>Phone Number: </p> <input name="phone" id="phone">
<p>Email: </p> <input name="email" id="email">
<br>
<div id="itemlist">
<p>Items Needed: (Feel free to add as many as you want)</p> 
</div>
<button id="add" onclick="addTextBox()">+</button>
<br><br><br>
<button type="submit" onclick="sendInfo()" id="last">Submit</button>
</div> 

<script>

function showForm() {
	document.getElementById("form").style.display = "block"; 
}

function sendInfo() { 
		let name = document.getElementById("name").value;  
		let address = document.getElementById("address").value;
		let phone = document.getElementById("phone").value; 
		let email = document.getElementById("email").value;  
		let form = document.getElementById("itemlist");
		let items = [];  
		form.querySelectorAll("input").forEach((input) => {
			items.push(input.value); 
		}); 
		console.log(items); 
		let xhttp = new XMLHttpRequest(); 
		xhttp.open("POST", "orghome.do", true); 
		xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); 
		xhttp.send("name=" + name + "&address=" + address + "&phone=" + phone + "&email=" + email + "&items=" + items + "&id=${id}");
		document.getElementById("last").remove(); 
		let p = document.createElement("p"); 
		p.innerHTML = "Profile Saved!"; 
		document.getElementById("form").appendChild(p);  
	}
	
let dArr = []; 
<c:forEach items="${details}" var="detail">
dArr.push("${detail}"); 
</c:forEach> 
console.log(dArr); 

document.getElementsByTagName("H3")[0].innerHTML = "Hello " + dArr[0] + "!";

createForm(); 
function createForm() {
document.getElementById("name").value = dArr[0]; 
document.getElementById("address").value = dArr[1]; 
document.getElementById("phone").value = dArr[2]; 
document.getElementById("email").value = dArr[3];
let newdiv;
let input;
let btn; 
<c:forEach items="${items}" var="item"> 
		newdiv = document.createElement("div"); 
		input = document.createElement("input"); 
		input.name = "items[]"; 
		input.value = "${item}"; 
		newdiv.appendChild(input); 
		btn = document.createElement("button"); 
		btn.innerHTML = "X"; 
		btn.onclick = function() {
			this.parentNode.remove(); 
		}    
		newdiv.appendChild(btn); 
		document.getElementById("itemlist").appendChild(newdiv); 
</c:forEach>
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
		document.getElementById("itemlist").appendChild(newdiv); 
	}
</script> 
</body> 
</html>