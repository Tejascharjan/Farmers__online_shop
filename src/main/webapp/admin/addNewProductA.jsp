<%@page import="project.ConnectionProvider"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%
String proId=request.getParameter("proId");
String pName=request.getParameter("pName");
String pDesc=request.getParameter("pDesc");
String pPrice=request.getParameter("pPrice");
String pQnty=request.getParameter("pQnty");
String catTitle=request.getParameter("catTitle");
String Ppic=request.getParameter("Ppic");
try
{		
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("insert into product values(?,?,?,?,?,?,?)");
	ps.setString(1,proId);
	ps.setString(2,pName);
	ps.setString(3,pDesc);
	ps.setString(4,pPrice);
	ps.setString(5,pQnty);
	ps.setString(6,catTitle);
	ps.setString(7,Ppic);	
	ps.executeUpdate();
	response.sendRedirect("adminHome.jsp?msg=done");
	
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("adminHome.jsp?msg=wrong");
}

%>