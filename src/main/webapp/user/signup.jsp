<! Doctype html>
<html>
	<head>
		<link rel="stylesheet" href="../css/signup.css">
		 <script src="../js/signup.js"></script> 
		<title>Customer Registration</title>
	</head>
<body>
<div class="container">
<form action="signupAction.jsp" name="myForm" method="post" onsubmit="return validate()">
  <div class="form_box">
	<h1>Sign Up</h1>
	  <div class="input_field">
	    <label for="Fname" class="form-label">Enter First Name</label>
	    <input type="text" name="fname" class="form-control" id="Fname">
	    <span id="fNmError"> </span>
	  </div>
	  <div class="input_field">
	    <label for="Lname" class="form-label">Enter Last Name</label>
	    <input type="text" name="lname" class="form-control" id="Lname">
	    <span id="lNmError"> </span>
	  </div>
	  <div class="input_field">
	    <label for="Email" class="form-label">Enter Email Address</label>
	    <input type="email" name="email" class="form-control" id="Email" >
	    <span id="emailError"> </span>
	  </div>
	  <div class="input_field">
	  	<label for="mobileNumber" class="form-label">Enter Mobile Number</label>
	  	<input type="tel" name="mobileNumber" class="form-control" id="mobileNumber" >
	  	<span id="mobNmError"> </span>
	  </div>
	  <div class="input_field">
	    <label for="Pass" class="form-label">Password </label>
	    <input type="password" name="password" class="form-control" id="pass" >
	    <span id="passError"> </span>
	  </div>
	  <div class="input_field">
	    <label for="cpassword" class="form-label">Confirm Password</label>
	    <input type="password" name="cpassword" class="form-control" id="cpass" >
	    <span id="cPassError"> </span>
	  </div>
	  
  	<button type="submit" class="btn">Submit</button>
  	<h4>Already Registered Please <a href="login.jsp">Click Here</a></h4>
  </div>
  
</form>


<div class="errmsg">
<%
	  String msg=request.getParameter("msg");
	  if("valid".equals(msg))
	  {
	 %>
		<h1>Successfully Registered</h1>
	 <%} %>
		
	<%if("invalid".equals(msg))
		{%>
		<h1>Some Thing Went Wrong! Try Again!</h1>
	<%} %>
   
 </div>

</div>
	
		
</body>
</html>