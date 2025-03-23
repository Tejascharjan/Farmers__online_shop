<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>


<!-- fetching data from category form -->
<%
String catId=request.getParameter("catId");
String title=request.getParameter("catTitle");

try
{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("insert into category values(?,?)");
	ps.setString(1,catId);
	ps.setString(2,title);
	ps.executeUpdate();
	response.sendRedirect("adminHome.jsp?status=done");	
	
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("adminHome.jsp?status=wrong");
}
%>