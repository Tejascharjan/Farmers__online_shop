<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="../component/navbar.jsp" %>
<%@include file="../component/common_css_js.jsp" %>


<!DOCTYPE html>
<html>
<body>

<%

String Email=(String)session.getAttribute("email");
String Id=request.getParameter("id");
int total=0;
int sno=0;
		
	if(Email==null)
	{
		response.sendRedirect("index.jsp");
	}

	 try{
		 Connection con=ConnectionProvider.getCon();
		 Statement st=con.createStatement();
		 ResultSet rs=st.executeQuery("select *from product inner join cart on product.pid=cart.pid and cart.email='"+Email+"'");
		 %>
		 
		 <div class="container-lg">
		 <div class="text-center font-weight-bold m-3" style="font-size:30px;">My Cart</div>
		 <table class="table">
		  <thead>
		    <tr>
		      <th scope="col">S.No.</th>
		      <th scope="col">Product Name</th>
		      <th scope="col">Category</th>
		      <th scope="col">Quantity</th>
		      <th scope="col">Price</th>
		      <th scope="col">Total Price</th>
		      <th scope="col">Image</th>
		      <th scope="col">Action</th>
		    </tr>
		  </thead>
		 
		 <%
		 while(rs.next())
		 {
		%>
			<tbody>
		    <tr>
		    <%sno=sno+1; %>
		      <td scope="row"><%out.print(sno); %></td>
		      <td scope="row"><%=rs.getString(2)%></td>
		      <td scope="row"><%=rs.getString(6)%></td>
		      <td scope="row"><a href="incdecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=inc"><i class="fas fa-plus-circle"></i></a> <%=rs.getString(10)%> <a href="incdecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=dec"><i class="fas fa-minus-circle"></i></a></td>
		      <td scope="row"><i class="fas fa-inr"></i><%=rs.getInt(4)%></td>
		      <td scope="row"><%=rs.getInt(12)%></td>
		      <td scope="row"><img src="./upload/<%=rs.getString(7)%>" style="height:100px;width:100px"> </td>
		      <td scope="row"><a class="btn btn-danger" href="removeCartItem.jsp?id=<%=rs.getInt(1)%>">Remove</a></td>
		      
		    </tr>
		    </tbody>
		    
		
        	<%}%>
        		
		
		</table>
		<hr>
		<%
			ResultSet rs1=st.executeQuery("select sum(totalPrice) from cart where email='"+Email+"'");
		while(rs1.next())
		{
			total=rs1.getInt(1);
		}
		%>
		
		</div>
		
			<a class="btn btn-primary ml-2 mr-5" href="home.jsp">Back</a>
			Total Price: <a class="btn btn-success-outline text-center"><%out.print(total);%></a>
			<a class="btn btn-success ml-5 text-white" href="order.jsp">Place Order</a>
			
			<%}
	 
		catch (Exception e)
		 {
		 	System.out.println(e);		
		 }
		%>
</body>	
</html>																							