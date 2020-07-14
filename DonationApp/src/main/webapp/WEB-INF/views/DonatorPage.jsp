<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<html>
<head>
<title>DonationFinder</title>
 <link rel="stylesheet" href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css"
   integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ=="
   crossorigin=""/>
 <script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js"
   integrity="sha512-gZwIG9x3wUXg2hdXF6+rVkLF/0Vi9U8D2Ntg4Ga5I5BZpVkVxlJWbSQtXPSiUTtC0TjtGOmxa1AJPuV0CPthew=="
   crossorigin=""></script> 
</head>
<body>
<form action="/donator.do" method="post">
<input type="text" placeholder="Search for an item..." name="query"> 
<input type="submit"> 
</form>
<h4>${noneMessage}</h4> 
<div id="mapid" style="height:400px"></div> 
<div id="info"></div>
   
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
var mymap = L.map('mapid').setView([33.1507, -96.8236], 10);
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
let p; 
<c:forEach items="${matches}" var="match"> 
p = document.createElement("p"); 
p.innerHTML = `<b>${match.name}:</b>\u00A0\u00A0\u00A0\u00A0${match.address}\u00A0\u00A0\u00A0\u00A0${match.phone}\u00A0\u00A0\u00A0\u00A0${match.email}`; 
document.getElementById("info").appendChild(p); 
</c:forEach>
}

</script>
</body>
</html>