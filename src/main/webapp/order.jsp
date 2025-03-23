<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="../component/navbar.jsp"%>
<%@include file="../component/common_css_js.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>
<script>
	if (window.history.forward(1) != null)
		window.history.forward(1);
</script>
</head>

<body>
	<%
	String Email = (String) session.getAttribute("email");
	int totoal=0;
	int sno=0;
	int oid=1;

	if (Email == null) {
		response.sendRedirect("index.jsp");
	}


	 try{
		 Connection con=ConnectionProvider.getCon();
		 Statement st=con.createStatement();
		 ResultSet rs2=st.executeQuery("select sum(totalprice) from cart where email='"+Email+"'");
		 while(rs2.next())
		 {
		 %>
		 <div class="container">
		 <div class="container-lg mt-4">
		 	<div class="text-center font-weight-bold m-3" style="font-size:30px;">Selected Product</div>		 
		 <table class="table">
		 	<thead>
		 		<th><a href="displayCart.jsp">Back</a></th>
		 		<th>Total Price: <%=rs2.getInt(1) %>  </th>
		 	</thead>
		 	<%} %>
		  <thead>
		    <tr>
		      <th scope="col">S.No.</th>
		      <th scope="col">Product Name</th>
		      <th scope="col">Category</th>
		      <th scope="col">Quantity</th>
		      <th scope="col">Price</th>
		      <th scope="col">Total Price</th>    
		    </tr>
		  </thead>
		 
		 <%
		 ResultSet rs=st.executeQuery("select *from product inner join cart on product.pid=cart.pid and cart.email='"+Email+"'");
		 while(rs.next())
		 {
		%>
			<tbody>
		    <tr>
		    <%sno=sno+1; %>
		      <td scope="row"><%out.print(sno); %></td>
		      <td scope="row"><%=rs.getString(2)%></td>
		      <td scope="row"><%=rs.getString(6)%></td>
		      <td scope="row"><%=rs.getString(10)%></td>
		      <td scope="row"><i class="fas fa-inr"></i><%=rs.getInt(4)%></td>
		      <td scope="row"><i class="fas fa-inr"></i><%=rs.getInt(12)%></td>
			      
		    </tr>
		    </tbody>
		
        	<%}%>
        		
		
		</table>
		</div>
		<hr>
		<%
		ResultSet rs3=st.executeQuery("select max(Order_ID) from ProductOrder");
		while(rs3.next())
		{
			oid=rs3.getInt(1);
			oid=oid+1;
		}
		 %>
		
		 
		 
		 	<div class="container mt-5">
		 	<div class="text-center font-weight-bold m-3" style="font-size:25px;">Order Details</div>
		 	
		 	<!-- __________Row for Deatils -->
		 	<form action="oderAction.jsp" method="post">
		 	 Order ID :<input type="text" name="oid" value=" <%out.print(oid);%>" style="border:none;" >
		 	<div class="row justify-content">
		 	
		 	<% ResultSet rs1=st.executeQuery("select * from registration where email='"+Email+"'");
		 while(rs1.next())
		 {
		 %>
		 	
		 	<!-- **********************Left Side***************************** -->
		
	    <div class="col-sm-6">
	    	<div class="form_group">
	    	<label>Customer Name :</label>
	      	<input type="text" value="<%=rs1.getString(1)+" "+rs1.getString(2)%>" name="name" style="border:none;">
	      </div>
	      
	      <div class="form-group">
	      <label>Email Address :</label>
	      <input type="email" value="<%=rs1.getString(3)%>" name="email" style="border:none;">
	      </div>
		 
	    </div>
	    
	    <!-- ***************************Right Side********************** -->
	    <div class="col-sm-6">
	    	<div class="form-group">
	    	<label>Mob No. :</label>
	       <input type="text" inputmode="numeric" value="<%=rs1.getString(4)%>" name="phone" style="border:none;"> 
	      </div>
	      
	      <div class="form-group">
	      <label>Enter Address</label>
	      <input type="text" name="add" >
	      
	      </div>
		 
	    </div>
		 
			 
		 </div>
		 <input type="submit" value="Order Product">
		 </form>		 
		 </div>
</div>

	<%}}
	 catch (Exception e) 
	 {
		System.out.println(e);
	}
	%>

</body>
</html>