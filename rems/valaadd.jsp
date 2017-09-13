
<html>
    <body>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="javax.sql.*"%>
<%
String user=request.getParameter("uname"); 
session.putValue("uname",user); 
String pwd=request.getParameter("pass"); 

Class.forName("com.mysql.jdbc.Driver");

java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/exam","root","root");
Statement stmt=con.createStatement();

int i=stmt.executeUpdate("insert into help values ('"+user+"','"+pwd+"')");  
 
if(i!=0)
       { %>   
    <center><h2>checker Added</h2>
       <a href="aaddrem.jsp">Click here to Add more</a></center>
       <% }
else
{%><center>
<h2>Unsuccessful registration of checker</h2>
       <a href="aaddrem.jsp">Click here to try again</a></center>
       <%
stmt.close();
con.close();
}%>
       </body>
       </html>