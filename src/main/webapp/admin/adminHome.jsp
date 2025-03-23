<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
  <html>
	<head>
	 <link rel="stylesheet" href="CSS/adminHome.css">
	 <title>Admin Home</title>
	 <%@include file="../component/common_css_js.jsp" %>
	 
	 <style type="text/css">
	 	body{
	 		background:#e2e2e2;
	 	}
	 </style>
	 
	</head>
<body>
	<%@include file="../component/navbar_Admin.jsp" %>
	
	<%
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");    // Support for HTTP v 1.1
	if(session.getAttribute("email")==null)
		{
			response.sendRedirect("../index.jsp");
		}
		%>
	
	<div class="container admin">
		<div class="row mt-3">
		 <!-- First column -->
		
			<div class="col-md-4">
			
			<!-- First Box -->
				<div class="card">
					<div class="card-body text-center">
					<div class="container">
						<img style="max-width:100px;" class="img-fluid rounded-circle" src="../img/team.png" alt="user_icon">
					
					</div>
				<%
				try{
					Connection con=ConnectionProvider.getCon();
					Statement st=con.createStatement();
					ResultSet rs=st.executeQuery("Select count(fname) from registration");
					while(rs.next())
					{						
				%>
					
					<h1><%=rs.getString(1) %></h1>
					<h1>Users</h1>
					
				<%}%>
					
					</div>
				
				</div>
				<!-- End Box -->
			
			</div>
			<!-- Second Column -->
			
			<div class="col-md-4">
			<!-- Second Box -->
			
				<div class="card">
					<div class="card-body text-center">
					<div class="container">
						<img style="max-width:100px;" class="img-fluid rounded-circle" src="../img/list.png" alt="category_icon">
					
					</div>
					<%
					ResultSet rs1=st.executeQuery("Select count(catID) from category");
					while(rs1.next())
					{	
					%>
					
					<h1><%=rs1.getString(1)%></h1>
					<%}%>
					<h1>Categories</h1>
					
					
					</div>
				
				</div>
			<!-- End Second Box -->
			
			</div>
			
			<!-- Third Column -->		
		
		<div class="col-md-4">
		
		<!-- Third Box -->
			
				<div class="card">
					
					<div class="card-body text-center">
					<div class="container">
						<img style="max-width:100px;" class="img-fluid rounded-circle" src="../img/shipping.png" alt="Product_icon">
					
					</div>
					
					<%
					ResultSet rs2=st.executeQuery("Select count(pName) from product");
					while(rs2.next())
					{	
					%>
					<h1><%=rs2.getString(1) %></h1>
					<%}}
					catch(Exception e)
					{
						System.out.println(e);
					}
					%>
					<h1>Products</h1>
					
					</div>
					</div>
				
				</div>
				<!-- End of third Box -->
			
			
			</div>
		
		<!-- Second Row -->
		<div class="row mt-3">
		
		<!-- First Column -->
		<div class="col md-6" data-toggle="modal" data-target="#addCategoryModel">
			<div class="card">
					<div class="card-body text-center">
					<div class="container">
						<img style="max-width:100px;" class="img-fluid rounded-circle" src="../img/keys.png" alt="user_icon">
					
					</div>
					
					<p class="mt-2"> Click here to add new category
					<h1>Add Category</h1>
					
					
					</div>
				
				</div>
			
		
		</div>
		
		
		<!-- Second Column -->
		
		<div class="col md-6">
			
			<div class="card" data-toggle="modal" data-target="#add-product-modal">
					<div class="card-body text-center">
					<div class="container">
						<img style="max-width:100px;" class="img-fluid rounded-circle" src="../img/plus.png" alt="user_icon">
					
					</div>
					
					<p class="mt-2">Click here to add product
					<h1>Add Product</h1>
					
					
					</div>
				
				</div>
			
		
		</div>
		<div class="col md-6">
			
			<div class="card" onclick="window.location='viewOrder.jsp'" data-toggle="modal" data-target="#view-order">
					<div class="card-body text-center">
					<div class="container">
						<img style="max-width:100px;" class="img-fluid rounded-circle" src="../img/order.png" alt="user_icon">
					
					</div>
					
					<p class="mt-2">Click Here to see order
					<h1>Order Received</h1>
					
					
					</div>
				
				</div>
			
		
		</div>

		</div>
		
	
	
	<!-- |||||||||||||||||||||||||||||View Products row ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->
	
	<div class="row mt-3">
	
		<div class="col md-12">
			
			<div class="card" onclick="window.location='displayProduct.jsp'" data-toggle="tooltip" data-placement="bottom" title="Click here to view product">
					<div class="card-body text-center">
					<div class="container">
						<img style="max-width:100px;" class="img-fluid rounded-circle" src="../img/viewproduct.png" alt="user_icon">
					
					</div>
					
					<p class="mt-2">Click Here to see Products
					<h1>View Products</h1>
					
					
					</div>
				
				</div>
			
		
		</div>

		</div>
	<!-- ||||||||||||||||||||||||||||||||||||||||||End of view product|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
		
</div>

<!-- |||||||||||||||||||||||||||||||||||||||Add Category Model||||||||||||||||||||||||||||||||||||||||||||| -->

<!-- Button trigger modal -->
<!-- Modal -->
<div class="modal fade" id="addCategoryModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLongTitle">Add Category</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
      <!-- **********************Form************* -->
      
      <%
 	int catID=1;
		try
		{
			Connection con=ConnectionProvider.getCon();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select max(catID) from category");
			while(rs.next())
			{
				catID=rs.getInt(1);
				catID=catID+1;
			}
				
		}
		catch(Exception e)
		{
			out.println(e);
		}
		%>
      
		<form action="addCategoryAction.jsp" method="post">
			<div class="form-group">
				<input type="text" inputmode="numeric" class="form-control" name="catId" value="<%out.println(catID);%>">
			</div>
			
			<div class="form-group">			
				<input type="text" class="form-control" name="catTitle" Placeholder="Enter Category Name">
			
			</div>
			
			<div class="container text-center">
				<button class="btn btn-outline-success">Add Category</button>
				 <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		
		</form>      
      
      <!-- ******************End form******************************* -->
        
      </div>
      </div>
  </div>
</div>


<!-- |||||||||||||||||||||||||||||||||||||||End Category Model|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->


	
	<!-- |||||||||||||||||||||||||||||||||||Add Product Modal ||||||||||||||||||||||||||||||||||||||||||||||||||||-->
		
<!-- Modal -->
<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Product Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
        <!-- ***************************Form********************************************** -->
        		
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
        
        <form action="addNewProductA.jsp" method="post">
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
        
        <!-- **********************End Form*************************************************** -->
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
    </div>
  </div>
</div>	
	<!-- |||||||||||||||||||||||||||||||||End Product Modal ||||||||||||||||||||||||||||||||||-->
	
</body>
</html>