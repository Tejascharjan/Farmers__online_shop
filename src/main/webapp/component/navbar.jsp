<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="common_css_js.jsp" %>


<nav class="navbar navbar-expand-lg navbar-light text-white custom-bg">
  <a class="navbar-brand font-weight-bold" href="#">FarmerCart</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href=".\home.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link disabled" href="#!"></a>
      </li>
    </ul>
    
    <!-- 
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" name="srch" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
      </form>-->
      <%
       String email=(String)session.getAttribute("email");
      if(email==null)
      {
    	  response.sendRedirect("../index.jsp");
      }
      try{
      Connection con=ConnectionProvider.getCon();
      Statement st=con.createStatement();
      ResultSet rs=st.executeQuery("Select count(pid) from cart where email='"+email+"'");
      while(rs.next())
      {%>
      <ul class="navbar-nav ml-auto">
      	<li class="nav-item active">
      		<a class="nav-link mr-5" style="font-size:20px;" href="./displayCart.jsp"><i class="fas fa-cart-shopping"></i><span class="ml-1">(<%=rs.getInt(1) %>)</span></a>
      </ul>
      <%}}
      catch(Exception e)
      {
      System.out.println(e);
      }
      %> 
      
      <a class="nav-link mr-3"><i class="fas fa-user"> </i><span class="ml-1"><%out.print(email);%></span></a>
           
      <a class="btn btn-success ml-2" href="./logout.jsp" role="button">Logout</a>
      
      
      
  </div>
</nav>
