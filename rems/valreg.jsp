<html>
  
  <body>

<%@ page language="java" import="java.sql.*"%>

<%@ page language="java" import="javax.sql.*"%>

<%

String Name=request.getParameter("fname");

String gender=request.getParameter("gender");

String phone=request.getParameter("phone");
String email=request.getParameter("email");
String uname=request.getParameter("email");
String pwd=request.getParameter("password");
String cpwd=request.getParameter("cpassword");
String addr=request.getParameter("address");
String country=request.getParameter("country");



Class.forName("com.mysql.jdbc.Driver");


Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rems","root","root");

Statement stmt=con.createStatement();
String c="0";

int i=stmt.executeUpdate("insert into help values ('"+Name+"','"+gender+"','"+phone+"','"+email+"','"+uname+"','"+pwd+"','"+cpwd+"','"+addr+"','"+country+"','"+c+"')");  

 
if(i!=0)

      
 {
   
 %>Registration Successful<br><a href="login.jsp" target="_top">>click here to login</a>
<%
}

else
       
{
  
  %>Registration Unsuccessful<br><a href="reg.jsp">Click here to Retry</a><% 
   
}
%>

       

</body>
      
 </html>