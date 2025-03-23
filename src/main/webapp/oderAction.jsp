<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>



<%
//Create a new Date object
int totalprice=0;
Date today = new Date();

// Define the date format
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");


String ID=request.getParameter("oid");
//date 
String date= dateFormat.format(today);
String email = (String) session.getAttribute("email");
String add=request.getParameter("add");
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("Select sum(totalPrice) from cart where email='"+email+"' ");
	while(rs.next())
	{
		totalprice=rs.getInt(1);
	}
	

	PreparedStatement ps=con.prepareStatement("insert into ProductOrder values(?,?,?,?,?)");
	ps.setString(1,ID);
	ps.setString(2,date);
	ps.setInt(3,totalprice);
	ps.setString(4,add);
	ps.setString(5,email);
	ps.executeUpdate();
	response.sendRedirect("order.jsp?msg=done");
	
}
	catch(Exception e)
	{
		System.out.println(e);
	}


%>





