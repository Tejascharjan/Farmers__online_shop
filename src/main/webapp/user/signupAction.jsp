
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
	String fname=request.getParameter("fname");
	String lname=request.getParameter("lname");
	String email=request.getParameter("email");
	String mobileNumber=request.getParameter("mobileNumber");
	String password=request.getParameter("password");
	String cpassword=request.getParameter("cpassword");
	
	
	try
	{
		 Connection con=ConnectionProvider.getCon();
		 PreparedStatement ps=con.prepareStatement("insert into registration values(?,?,?,?,?,?)");
		 ps.setString(1,fname);
		 ps.setString(2,lname);
		 ps.setString(3,email);
		 ps.setString(4,mobileNumber);
		 ps.setString(5,password);
		 ps.setString(6,cpassword);
		 ps.executeUpdate();
		 response.sendRedirect("signup.jsp?msg=valid");
	}
	catch(Exception e)
	{
		System.out.println(e);
		response.sendRedirect("signup.jsp?msg=Invalid");
		
	}
	
%>