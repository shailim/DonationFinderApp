<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html>
<head>
<title>Organization</title>
<%@ include file="header.html" %>
<style>
@import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400&display=swap');
</style>
</head>
<style>
body {
	position: relative;
	top: 100px; 
}
input[type=text], select {
  font-family: Arial;
  width: 350px;
  padding: 12px 20px;
  margin: 8px 60px;
  display:block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}
input[type=password], select {
  font-family: Arial;
  width: 350px;
  padding: 12px 20px;
  margin: 8px 60px;
  display:block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}
label{
font-family: 'Open Sans', sans-serif;
color: #4a4a4a;
margin-left: 60px;

}

pre {
color: #4a4a4a;
font-weight: 300;
margin-left: 45px;
border: none; 
background: transparent; 

}

#input1{

  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 20px 60px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-family: 'Open Sans', sans-serif;
}

form a{
    border:none;
    background:none;
    padding:0;
    cursor: pointer;
    color: #476bb3;
     font-size: 15px;
   font-family: 'Open Sans', sans-serif;
   margin: 45px 60px;
}

.form{
  display: inlineblock;
  width: 600px;
  height: 450px;
 margin: auto;
  border-radius: 5px;
  background-color: #f3f3f3;
  padding: 20px;
border-style: ridge;
border-color: #fbaf08;
border-width: 2px;



}

</style>
</head>
<body> 
<div class = "form">
<p   style="color:red">${errorMessage}</p>
<h1 style="font-family: 'Open Sans', sans-serif; color:Black; font-size: 30px; margin-left: 60px;"> Sign In </h1>
<pre   style="font-family: 'Open Sans', sans-serif; font-size: 19px;"> Sign in to your organization account to
 manage your donations list. </pre>

  <form action="/orglogin.do" method = "post">
    <label for="uname">Username</label>
    <input type="text" id="uname" name="username" placeholder="Your username">

    <label for="pwd">Password</label>
    <input type="password" id="pwd" name="password" placeholder="Your password">
    
    <input type="submit" value="Sign In" id="input1">

    <a href="orgsignup.do">Create An Account</a>


 </form>
</div>

</body>
</html>

