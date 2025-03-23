<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="../component/navbar.jsp" %>
<%@include file="../component/common_css_js.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell Product</title>
</head>
<body>
<div class="container mt-5">

	 <%
 	int id=1;
		try
		{
			Connection con=ConnectionProvider.getCon();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select max(pid) from product");
			while(rs.next())
			{
				id=rs.getInt(1);
				id=id+1;
			}
				
		}
		catch(Exception e)
		{
			out.println(e);
		}
		%>
        
        <form action="sellProductAction.jsp" method="post">
        	<div class="form-group">
      				<input type="text" class="form-conrol" name="proId" value="<%out.println(id);%>" readonly>
      		</div>
      		<!-- Product title -->
      		<div class="form-group" >
      			<input type="text" class="form-control" Placeholder="Enter Title of Product" name="pName" required/>
      		</div>
      		<!-- ******************Product Description*************** -->
      		<div class="form-group">
      			<textarea style="height:150px;" class="form-control" placeholder="Enter Product Description" name="pDesc" required></textarea>
      		</div>
      		<!--************************************* Product Price****************************************** -->
      		<div class="form-group">
      			<input type="number" class="form-control" placeholder="Enter Product Price" name="pPrice"required/>
      		</div>
      		<!-- Product Quantity -->
      		<div class="form-group">
      			<input type="number" class="form-control" placeholder="Enter Product Quantity" name="pQnty" required/>
      		</div>
      		
      		
      		<!-- Product category -->
      		<div class="form-group">
      			<select name="catTitle" class="form-control" id="">
      			<option>Select</option>
      		
      		<%
      				try
					{
						Connection con=ConnectionProvider.getCon();
						Statement st=con.createStatement();
						ResultSet rs=st.executeQuery("select categoryTitle from category");
						
							
							while(rs.next()){
								
							
					%>					
      					<option><%=rs.getString("categoryTitle")%></option>
      				<%}}
      				catch(Exception e)
      				{
      					System.out.print(e);
      				}
      		%>
      				
      			</select>
      		</div>
      		
      		<!-- Product Image -->
      		
      		<div class="form-group">
      			<label for="" id="pPic">Select Picture of Product</label> <br>
      			<input type="file" id="pPic" name="Ppic" required/>
      		
      		</div>
        
        <!-- Submit button -->
        <div class="container text-center">
        	<button class="btn btn-outline-success">Add Product</button>
        </div>
        
        </form>
        </div>

</body>
</html>