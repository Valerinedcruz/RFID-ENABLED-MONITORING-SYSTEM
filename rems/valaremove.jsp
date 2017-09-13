<html>
    <body>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="javax.sql.*"%>
<%
String user=request.getParameter("uname"); 
session.putValue("uname",user); 

Class.forName("com.mysql.jdbc.Driver");

java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rems","root","root");
Statement stmt=con.createStatement();

int i=stmt.executeUpdate("DELETE FROM `rems`.`help` WHERE `uname`='"+user+"';");  
 
if(i!=0)
       { %>   
    <center><h2>Administrator Remove</h2>
       <a href="aaddrem.jsp">Click here to Remove more</a></center>
       <% }
else
{%><center>
<h2>Unsuccessful removal of Administrator</h2>
       <a href="aaddrem.jsp">Click here to try again</a></center>
       <%
stmt.close();
con.close();
}%>
       </body>
       </html>