<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>


<%
	String email=(String)session.getAttribute("email");
	String id=request.getParameter("id");
	String incdec=request.getParameter("quantity");
	
	int price=0;
	int total=0;
	int quantity=0;
	int final_total=0;
	
	
	try{
		Connection con=ConnectionProvider.getCon();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select *from cart where email='"+email+"' and pid='"+id+"'");
		while(rs.next())
		{
			price=rs.getInt(4);
			total=rs.getInt(5);
			quantity=rs.getInt(3);
		}
		
		if(quantity==1 && incdec.equals("dec"))
		{
			response.sendRedirect("displayCart.jsp?msg=Quantity Can not be Zero");
		}
		else if(quantity!=1 && incdec.equals("dec")){
			total=total-price;
			quantity=quantity-1;
			st.executeUpdate("update cart set totalPrice='"+total+"',quantity='"+quantity+"' where email='"+email+"' and pid='"+id+"'");
			response.sendRedirect("displayCart.jsp?msg=dec");
		}
		else{
			total=total+price;
			quantity=quantity+1;
			st.executeUpdate("update cart set totalPrice='"+total+"',quantity='"+quantity+"' where email='"+email+"' and pid='"+id+"'");
			response.sendRedirect("displayCart.jsp?msg=inc");
		}
		
		
	}
	
		
	catch(Exception e)
	{
		System.out.println(e);
	}



%>