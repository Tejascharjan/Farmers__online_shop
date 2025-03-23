<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
 <%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../component/common_css_js.jsp" %>
<title>Ordered Received</title>
</head>
<body>
	<%@include file="../component/navbar_Admin.jsp" %>
	
	<div class="container-lg">
<div class="text-center font-weight-bold m-3" style="font-size:30px;">Ordered Received</div>

	<table class="table">
  <thead>
    <tr>
      <th scope="col">Order ID</th>
      <th scope="col">Email</th>
      <th scope="col">Date</th>
      <th scope="col">Total Price</th>
      <th scope="col">Product Name</th>
      <th scope="col">Category</th>
      <th scope="col">Quantity</th>
      <th scope="col">Address</th>
    </tr>
  </thead>
  <%
  	try{
  	Connection con=ConnectionProvider.getCon();
  	Statement st=con.createStatement();
  	ResultSet rs=st.executeQuery("select p.pname,p.catTitle,c.quantity,c.price,c.totalprice,po.Order_ID,po.Oredr_Date,po.totalPrice,po.shippingAddress,po.email from product p, cart c,productorder po where p.pid=c.pid AND c.pid=po.Order_ID ");
 	while(rs.next()) 
 	{
  %>
  
  	<tbody>
    <tr>
    <td scope="row"><%=rs.getString(6)%> </td>
    <td scope="row"><%=rs.getString(10)%> </td>
    <td scope="row"><%=rs.getString(7)%> </td>
    <td scope="row"><%=rs.getString(8)%> </td>
    <td scope="row"><%=rs.getString(1)%> </td>
    <td scope="row"><%=rs.getString(2)%></td>
    <td scope="row"><%=rs.getInt(3)%></td>   
    <td scope="row"><%=rs.getString(9)%></td>  
    </tr>
    </tbody>
    
    <%}%>
    
    
   </table>
   <%
  	 }
	catch(Exception e)
	 {
	  System.out.println(e);
	 }
  %>


</div>

	

</body>
</html>