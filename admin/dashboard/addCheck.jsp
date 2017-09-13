<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="javax.sql.*"%>
<%
String id=request.getParameter("id"); 
String name=request.getParameter("name"); 
String gender=request.getParameter("gender"); 
String address=request.getParameter("address"); 
String assign=request.getParameter("assign"); 

Class.forName("com.mysql.jdbc.Driver");

java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rems","root","root");
Statement stmt=con.createStatement();

int i=stmt.executeUpdate("insert into checker values ('"+id+"','"+name+"','"+gender+"','"+address+"','"+assign+"')");  
 
if(i!=0)
{
response.sendRedirect("index.jsp?status=0");		
}
else
{
response.sendRedirect("index.jsp?status=1");
stmt.close();
con.close();
}%>