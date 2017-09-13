
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="javax.sql.*"%>
<%
String cent=request.getParameter("center"); 
String user=request.getParameter("uname2"); 
session.putValue("uname",user); 

Class.forName("com.mysql.jdbc.Driver");

java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rems","root","root");
Statement stmt=con.createStatement();



int i=stmt.executeUpdate("update help set local='"+cent+"' where uname='"+user+"'");  

stmt.close();
con.close();

       
if(i!=0)
       {
                
    %>       
       
    <center><h2>Exam Center changed successfully</h2></center>
       
       <%
       }
else
{%>
       <center><a href="scenter.jsp">Unsuccessful Change<br>Click here to try again</a></center>
       <%}
%>
      