<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Edit Product</title>
		<%@include file="../component/common_css_js.jsp" %>
	</head>

<body>
<%
 String pid=request.getParameter("ID");


try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select *from product where pid='"+pid+"'");
	while(rs.next())
	{%>
	<%@include file="../component/navbar_Admin.jsp" %>
	<div class="container mt-4">
	<h2 class="text-center font-weight-bold">Update Product Details</h2>
	<form action="updateProductAction.jsp" method="post" target="_self">
        	<div class="form-group">
      				Product ID: <input type="text" class="form-conrol" name="proId" value="<%out.print(pid);%>" readonly=" ">
      		</div>
      		<!-- Product title -->
      		<div class="form-group" >
      			Product Name: <input type="text" class="form-control" Placeholder="Enter Title of Product" name="pName" value="<%=rs.getString(2)%>" required/>
      		</div>
      		<!-- ******************Product Description*************** -->
      		<div class="form-group">
      			Product Description: <input type="text" style="height:150px;" class="form-control" placeholder="Enter Product Description" name="pDesc" value="<%=rs.getString(3)%>" required>
      		</div>
      		<!--************************************* Product Price****************************************** -->
      		<div class="form-group">
      			Product Price:<input type="text" inputmode="numeric" class="form-control" placeholder="Enter Product Price" name="pPrice" value="<%=rs.getInt(4)%>" required/>
      		</div>
      		<!-- Product Quantity -->
      		<div class="form-group">
      			Product Quantity: <input type="text" inputmode="numeric" class="form-control" placeholder="Enter Product Quantity" name="pQnty" value="<%=rs.getInt(5)%>" required/>
      		</div>
      		<div class="container text-center">
        	<button class="btn btn-outline-success">Update Details</button>
        
        	</div>      		
      	</form>
      	<a class="btn btn-primary" href="displayProduct.jsp">Back</a>
      	
      </div>

<%
	}}
catch(Exception e)
{
	System.out.println(e);
}
%>

</body>
</html>
