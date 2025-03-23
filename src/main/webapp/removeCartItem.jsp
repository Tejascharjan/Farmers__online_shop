<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
	String id=request.getParameter("id");
	
	try{
		Connection con=ConnectionProvider.getCon();
		Statement st=con.createStatement();
		st.executeUpdate("Delete from cart where pid='"+id+"'");
		response.sendRedirect("displayCart.jsp?msg=Successfully removed");
	}
	catch(Exception e)
	{
		System.out.println(e);
		response.sendRedirect("displayCart.jsp?msg=Something Went Wrong");
	}

%>