<! Doctype html>
<html>
<head>
	<link rel="stylesheet" href="../css/login.css">
	<title>Farmer Login</title>
</head>
<body>
	<div class="container">
		<div class="login">
			<h1>Farmer Login</h1>
			<form action="farmerLoginAction.jsp" method="post">
				<input type="email" name="email" class="input_field" Placeholder="Enter Email" required>
				<input type="password" name="password" class="input_field"Placeholder="Enter Password" required>
				<input  class="btn" type="submit" value="login">
				</form>
			<h5>Don't have account click<a href="Farmer_register.jsp">  here</a></h5>
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