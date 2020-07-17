<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<html>
<head>
<title>DonationFinder</title>
<%@ include file="header.html" %>
 <link rel="stylesheet" href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css"
   integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ=="
   crossorigin=""/>
 <script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js"
   integrity="sha512-gZwIG9x3wUXg2hdXF6+rVkLF/0Vi9U8D2Ntg4Ga5I5BZpVkVxlJWbSQtXPSiUTtC0TjtGOmxa1AJPuV0CPthew=="
   crossorigin=""></script> 
<style>
	body {
		font-family: 'Open Sans', sans-serif; 
		font-size: 15px; 
		position: relative; 
		top: 100px; 
	}
	#mapid {
		border-radius: 12px;  
	}
	#info {
		margin-top: 15px; 
		border-radius: 15px; 
		background-color: #fbaf08;
		/*#94f0f1*/ 
	}
	#info details {
		padding: 13px; 
	}
	#info summary:focus {
		outline: none;
	}
	#info pre {
		background: white; 
		border: none; 
		line-height: 30px; 
		font-family: 'Rubik', sans-serif; 
	}
</style>
</head>
<body>
<form class="container" action="/donator.do" method="post"> 
<p>Enter the item to donate: </p>
<input class="well well-sm" type="text" placeholder="Search for an item..." name="query"> 
<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
</form>
<div class="container" id="mapid" style="height:400px"></div> 
<div class="container" id="info">
	<b>Results: </b>
	<span>  ${noneMessage}</span>
</div>
   
<script>

getCoords(); 
async function getCoords() {
let url = ""; 
let response = ""; 
let data = ""; 
var coords = []; 
<c:forEach items="${matches}" var="match">
url = `http://www.mapquestapi.com/geocoding/v1/address?key=fYtboNsDq86CQX6l0VrXHTsckvnYy00u&location=${match.address}`; 
response = await fetch(url);
data = await response.json();  
console.log(data);  
coords.push({
	"lat": data.results[0].locations[0].latLng.lat,
	"long": data.results[0].locations[0].latLng.lng
}); 
</c:forEach> 
console.log(coords); 
createMap(coords); 
}

function createMap(coords) {
var mymap = L.map('mapid').setView([33.1507, -96.82], 10);
L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1Ijoic20yMDAwIiwiYSI6ImNrYnY5ZzBoeDAzdWgzMXFseDF2em1sbXMifQ.5FYP7T__mOa-gRLYT2QEDw', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    maxZoom: 18,
    id: 'mapbox/streets-v11',
    tileSize: 512,
    zoomOffset: -1,
    accessToken: 'your.mapbox.access.token'
}).addTo(mymap); 
var i = 0; 
<c:forEach items="${matches}" var="match">
var marker = L.marker([coords[i].lat, coords[i].long]).addTo(mymap);
marker.bindPopup("${match.name}").openPopup(); 
i++; 
</c:forEach> 
} 

addInfo(); 
function addInfo() {
let details; 
let summary; 
let pre;
<c:forEach items="${matches}" var="match"> 
details = document.createElement("details"); 
summary = document.createElement('summary');
pre = document.createElement('pre'); 
summary.innerHTML = `${match.name}`; 
pre.innerHTML = 
`Address: ${match.address}
Phone: ${match.phone}
Email: ${match.email}`; 
details.appendChild(summary); 
details.appendChild(pre); 
document.getElementById("info").appendChild(details); 
</c:forEach>
}

</script>
</body>
<%@ include file="footer.html" %>
</html>