<html>
    <body>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="javax.sql.*"%>
<%
String email=request.getParameter("email"); 
String pwd=request.getParameter("pass"); 
String name=request.getParameter("name"); 
String local=request.getParameter("local"); 
String addr=request.getParameter("address"); 
String cit=request.getParameter("city"); 


Class.forName("com.mysql.jdbc.Driver");

java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rems","root","root");
Statement stmt=con.createStatement();

String c="0";

int i=stmt.executeUpdate("insert into help values ('"+email+"','"+pwd+"','"+name+"','"+addr+"','"+cit+"','"+local+"','"+c+"','"+c+"','"+c+"')");  
 
if(i!=0)
       { 
	   response.sendRedirect("index.html");	
	   }
else
{
response.sendRedirect("index.html");	
stmt.close();
con.close();
}%>
       </body>
       </html>