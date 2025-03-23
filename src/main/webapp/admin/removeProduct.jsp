<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>


<%

 String ID=request.getParameter("ID");
 String query="delete from product where pid=" +ID ;
 try{
	 Connection con=ConnectionProvider.getCon();
	 Statement st=con.createStatement();
	 st.executeUpdate(query);	 
	 response.sendRedirect("displayProduct.jsp?msg=Successfully removed");
	}
   catch(Exception e)
 {
	   System.out.println(e);
	   response.sendRedirect("displayProduct.jsp?msg=Something went wrong");
 }
 %>
 