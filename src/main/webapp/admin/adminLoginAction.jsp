<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
	String email=request.getParameter("email");
	String password=request.getParameter("password");
	session.setAttribute("email", email);
	
		int z=0;
		try
		{
			Connection con=ConnectionProvider.getCon();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select *from admin where email='"+email+"' and password='"+password+"' ");
			while(rs.next())
			{
				z=1;
				session.setAttribute("email",email);
				response.sendRedirect("adminHome.jsp");
			}
			if(z==0)
			{
				response.sendRedirect("login.jsp?msg=notexist");
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
			response.sendRedirect("login.jsp?msg=Invalid");
			
		}
	
	
	
%>