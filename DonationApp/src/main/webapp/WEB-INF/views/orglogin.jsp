<html>
<head>
<title>Log In</title>
</head>
<body> 
<p style="color:red">${errorMessage}</p>
<form action="/orglogin.do" method="post">
<p>Username: </p> <input type="text" name="username">
<p>Password: </p> <input type="text" name="password"> 
<input type="submit"> 
</form> 
<a href="orgsignup.do">Create An Account</a>
</body>
</html>