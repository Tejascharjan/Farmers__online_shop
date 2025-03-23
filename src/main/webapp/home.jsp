<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*"%>
<%@include file="../component/common_css_js.jsp" %>


<html>
<head>
	
	<link rel="stylesheet" type="text/css" href="css/home.css">	
	<title>Home</title>
</head>
<body>

	
	
				<%@include file="../component/navbar.jsp" %>	
					<!-- Show Products -->
				<div class="col-md-12">
				
					<!--|||||||| row|||||||||||| -->
					<div class="row mt-4 justify-content-center">
					
						<div class="col-md-10">
						<div class="card-columns">
						
						<!-- |||||||||||||||||||||||||Traversing Products||||||||||||||||||||||||||||||||| -->
						
						
				<%
							    
		
				try{
					Connection con=ConnectionProvider.getCon();
					Statement st=con.createStatement();
					ResultSet rs=st.executeQuery("select *from product ");
					while(rs.next())
					{%>
				<!-- ************************************Reapiting the product******************************************* -->	
								<div class="card">
								<!-- ***********************Product image********************* -->
								<div class="container text-center">
								
								<img src="./upload/<%=rs.getString(7)%>" class="card-img-top m-2" style="max-height:270px; max-width:90%; width:auto; " alt="Product Image">
								
								</div>
								<!-- ************end of container*********************** -->
										<div class="card-body">
									
											<h5 class="card-title"><%=rs.getString(2)%></h5>
											
											<p class="card-text"><%=rs.getString(3)%></p>
										</div>
									
										<div class="card-footer text-center">
											<a class="btn custom-bg text-white" href="addToCartAction.jsp?id=<%=rs.getString(1)%>">Buy</a>
											<button class="btn btn-outline-success">&#8377; <%=rs.getString(4)%></button>		
																		
										</div>
										
								</div>
							<!-- ||||||||||||||Card class closed|||||||||||||||||||||||||||||| -->
							
							
	
							
				<%}	}																																																													
				catch(Exception e)
				{
					System.out.println(e);
					
				 }
				%>
				</div>	
			</div>	
		</div>
		</div>	
				
			
</body>
</html>