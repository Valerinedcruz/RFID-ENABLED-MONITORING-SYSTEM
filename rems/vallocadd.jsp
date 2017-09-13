<html>
    <body>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="javax.sql.*"%>
<%
String cit=request.getParameter("cit"); 
String loc=request.getParameter("loc"); 

Class.forName("com.mysql.jdbc.Driver");

java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/exam","root","root");
Statement stmt=con.createStatement();

int i=stmt.executeUpdate("INSERT INTO `exam`.`ncenter` (`"+cit+"`) VALUES ('"+loc+"');");  
 
if(i!=0)
       { %>   
    <center><h2>Locality Added</h2>
       <a href="aaddloc.jsp">Click here to Add more</a></center>
       <% }
else
{%><center>
<h2>Unsuccessful</h2>
       <a href="aaddloc.jsp">Click here to try again</a></center>
       <%
stmt.close();
con.close();
}%>
       </body>
       </html>