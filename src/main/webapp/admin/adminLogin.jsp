<! Doctype html>
<html>
<head>
	<link rel="stylesheet" href="../css/login.css">
	<title>Login</title>
</head>
<body>
	<div class="container">
		<div class="login">
			<h1>Admin Login</h1>
			<form action="adminLoginAction.jsp" method="post">
				<input type="email" name="email" class="input_field" Placeholder="Enter Email" required>
				<input type="password" name="password" class="input_field"Placeholder="Enter Password" required>
				<input  class="btn" type="submit" value="login">
				</form>
			
	    </div>
	<div class="right_login">
	 <%
	  String msg=request.getParameter("msg");
	  if("notexist".equals(msg))
	  {
	 %>
		<h1>Incorrect UserName or Password</h1>
	 <%} %>
		
	<%if("invalid".equals(msg))
		{%>
		<h1>Some Thing Went Wrong! Try Again!</h1>
	<%} %>
 </div>
 </div>

</body>
</html>