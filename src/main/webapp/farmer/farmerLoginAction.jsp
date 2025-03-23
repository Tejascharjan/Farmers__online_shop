<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
	String email=request.getParameter("email");
	String password=request.getParameter("password");
	if("admin@gmail.com".equals(email)&&"admin".equals(password))
	{
		response.sendRedirect("farmerLogin.jsp?msg=something went wrong");
	}
	else
	{
		int z=0;
		try
		{
			Connection con=ConnectionProvider.getCon();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select *from farmer where email='"+email+"' and password='"+password+"' ");
			while(rs.next())
			{
				z=1;
				session.setAttribute("email",email);
				response.sendRedirect("farmerHome.jsp");
			}
			if(z==0)
			{
				response.sendRedirect("farmerLogin.jsp?msg=notexist");
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
			response.sendRedirect("farmerLogin.jsp?msg=Invalid");
			
		}
	}
	
	
%>