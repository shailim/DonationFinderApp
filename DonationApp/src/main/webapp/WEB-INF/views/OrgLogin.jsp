<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html>
<head>
<title>Organization</title>
<%@ include file="header.html" %>
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