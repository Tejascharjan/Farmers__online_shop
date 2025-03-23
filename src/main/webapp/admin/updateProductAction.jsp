<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
	String pid=request.getParameter("proId");
	String pName=request.getParameter("pName");
	String pDesc=request.getParameter("pDesc");
	String pPrice=request.getParameter("pPrice");
	String pQnty=request.getParameter("pQnty");
	
	try{
		Connection con=ConnectionProvider.getCon();
		Statement st=con.createStatement();
		st.executeUpdate("update product set pname= '"+pName+"', pDesc= '"+pDesc+"',pPrice= '"+pPrice+"',pQnty= '"+pQnty+"' where pid= '"+pid+"' ");
		response.sendRedirect("displayProduct.jsp?msg=Update Successfully");
	}
	catch(Exception e)
	{
		System.out.println(e);
		response.sendRedirect("updateProduct.jsp?msg=Something went wrong");
	}
	
%>