<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../component/common_css_js.jsp" %>
<title>Products</title>
</head>
<body>
<%@include file="../component/navbar_Admin.jsp" %>

<div class="container-lg">
<div class="text-center font-weight-bold m-3" style="font-size:30px;">Products Available
<a class="btn btn-primary float-right" href="adminHome.jsp">Back</a>
<button class="btn btn-success float-right mx-3" onclick="window.print();">Print</button>
</div>

	<table class="table">
  <thead>
    <tr>
      <th scope="col">Product ID</th>
      <th scope="col">Product Name</th>
      <th scope="col" style="width:400px;">Description</th>
      <th scope="col">Price</th>
      <th scope="col">Quantity</th>
      <th scope="col">Category</th>
      <th scope="col">Image</th>
      <th scope="col">Remove</th>
      <th scope="col">Edit</th>      
    </tr>
  </thead>
  <%
  	try{
  	Connection con=ConnectionProvider.getCon();
  	Statement st=con.createStatement();
  	ResultSet rs=st.executeQuery("select *from product");
 	while(rs.next()) 
 	{
  %>
  
  	<tbody>
    <tr>
      <th scope="row"><%=rs.getInt(1)%></th>
      <td><%=rs.getString(2)%></td>
      <td><p style="width:400px;"><%=rs.getString(3)%></p></td>
      <td><%=rs.getInt(4)%></td>
      <td><%=rs.getInt(5)%></td>
      <td><%=rs.getString(6)%></td>
      <td><img src="../upload/<%=rs.getString(7)%>" alt="product Image" style="height:150px;width:150px;"></td>
      <td><a class="btn btn-danger" href="removeProduct.jsp?ID=<%=rs.getString(1)%>">Delete</a></td>
      <td><a class="btn btn-success" href="updateProduct.jsp?ID=<%=rs.getString(1)%>">Update</a></td>
    </tr>
    </tbody>
    
    <%} }
  	catch(Exception e)
 	 {
	  System.out.println(e);
	 }
    %>
    
    
   </table>


</div>




</body>
</html>