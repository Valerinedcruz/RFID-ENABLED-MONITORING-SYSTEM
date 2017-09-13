
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="javax.sql.*"%>

<%


String userid=request.getParameter("uname");

String pwd=request.getParameter("pass"); 


String DRIVER = "org.gjt.mm.mysql.Driver";

Class.forName(DRIVER).newInstance();


Connection con=null;

ResultSet rst=null;

Statement stmt=null;


ResultSet rst2=null;


String url="jdbc:mysql://localhost/rems?user=root&password=root";

con=DriverManager.getConnection(url);

stmt=con.createStatement();
out.println("Welcome ");

rst2=stmt.executeQuery("select * from admin where uname='"+userid+"'");

if(rst2.next()) 

{ 

if(rst2.getString(2).equals(pwd)) 

{ 
   
 Cookie cc=new Cookie("logincredentials","userid");
    
response.addCookie(cc);



%>
<br><center><a href="admin.jsp" target="_top">Click here to enter the admin panel</a><center>

<%
} 

else 

{ 

out.println("Invalid username/password");
%>

<br><center>
       <a href="login.jsp" target="_top">Click here to try again</a><br>
         <a href="mailto:admin@abc.com">Click to send password reset request</a><center>

<% 
} 
} 

%>