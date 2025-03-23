
<!DOCTYPE html>
<html>
<head>
<%@include file="../component/common_css_js.jsp" %>
<title>Online Farming Shopping Site</title>
<style type="text/css">
	.contain{
	background: url(./img/back.jpg);
	background-size: auto;
	background-repeat: no-repeat;
	background-size: cover;
	width:100%;
	height:100vh;
}

</style>
</head>
<body>
 	<div class="contain">
 	<h1 class="text-center font-weight-bold text-danger"> FarmerCart</h1>
 	<p class="text-center font-weight-bold text-dark" style="font-size:20px;">Farmer's Online Shopping and Selling Website
 	<div class="row">
 	<div class="col-md-1 mt-5 ml-5">
 		<a href="user/login.jsp" class="btn btn-primary btn-lg" role="button" aria-disabled="true">Customer</a>
 	</div>
 		<div class="col-md-1 mt-5 ml-3">
 		<a href="farmer/farmerLogin.jsp" class="btn btn-success btn-lg" role="button" aria-disabled="true">Farmer</a>
 	</div>
 	<div class="col-md-1 mt-5 ml-3">
 		<a href="admin/adminLogin.jsp" class="btn btn-danger btn-lg " role="button" aria-disabled="true">Admin</a>
 	</div>
 		
 		
		</div>
 		</div>
 		
</body>
</html>