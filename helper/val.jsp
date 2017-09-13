<%@page import="java.sql.*,java.util.*"%>
<%
String userid=request.getParameter("uname");
String pwd=request.getParameter("pass"); 

String DRIVER = "org.gjt.mm.mysql.Driver";
Class.forName(DRIVER).newInstance();

Connection con=null;
ResultSet rst=null;
Statement stmt=null;

String url="jdbc:mysql://localhost/rems?user=root&password=root";
con=DriverManager.getConnection(url);
stmt=con.createStatement();

rst=stmt.executeQuery("select * from help where email='"+userid+"'");
if(rst.next()) 
{ 
if(rst.getString(2).equals(pwd)) 
{ 
    Cookie cookie = new Cookie ("username",userid);
response.addCookie(cookie);
response.sendRedirect("dashboard/index.jsp");
} 
else 
{ 
response.sendRedirect("loginErr.html");
} 
} 
%>
