
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
	String fId=request.getParameter("fId");
	String fname=request.getParameter("fname");
	String lname=request.getParameter("lname");
	String email=request.getParameter("email");
	String mobileNumber=request.getParameter("mobileNumber");
	String location=request.getParameter("location");
	String password=request.getParameter("password");
	String cpassword=request.getParameter("cpassword");
	
	
	try
	{
		 Connection con=ConnectionProvider.getCon();
		 PreparedStatement ps=con.prepareStatement("insert into farmer values(?,?,?,?,?,?,?,?)");
		 ps.setString(1,fId);
		 ps.setString(2,fname);
		 ps.setString(3,lname);
		 ps.setString(4,email);
		 ps.setString(5,mobileNumber);
		 ps.setString(6,location);
		 ps.setString(7,password);
		 ps.setString(8,cpassword);
		 ps.executeUpdate();
		 response.sendRedirect("Farmer_register.jsp?msg=valid");
	}
	catch(Exception e)
	{
		System.out.println(e);
		response.sendRedirect("Farmer_register.jsp?msg=Invalid");
		
	}
	
%>