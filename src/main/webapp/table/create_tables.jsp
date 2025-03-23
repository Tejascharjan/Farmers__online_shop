<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
try
 {
   Connection con=ConnectionProvider.getCon();
   Statement st=con.createStatement();
   String q1="create table admin(email varchar(100),password varchar(20))";
   String q2="create table registration(fname varchar(30),lname varchar (20),email varchar(100) primary key, mobile varchar(20), password varchar(20), cpassword varchar(20))";
   String q3="create table farmer(fid int primary key,fname varchar(100),lname varchar(100),email varchar(100),mobilenumber varchar(20),location varchar(50), password varchar(20),ConPass varchar(20))";
   String q4="create table category(catID int primary key,categoryTitle varchar(100))";
   String q5="create table product(pid int primary key,pname varchar(200),pDesc varchar(1000),pPrice int,pQnty int,catTitle varchar(100),imgPath varchar(500))";
   String q6="create table cart(email varchar(100),pid int,quantity int,price int,totalPrice int,image varchar(100))";
   String q7="create table ProductOrder(Order_ID int primary key, Oredr_Date DATE, totalPrice int,shippingAddress varchar(200),email varchar(100))";

   //System.out.print(q1);
   System.out.print(q7);
   //System.out.println(q3);
   //System.out.println(q4);
   //System.out.println(q5);
   //st.execute(q1);
   st.execute(q7);
   //st.execute(q3);
   //st.execute(q4);
   //st.execute(q5);
   System.out.print("Table Has Been Created");
   con.close();
  }
  catch(Exception e)
  {
  	System.out.println(e);
  }
  %>