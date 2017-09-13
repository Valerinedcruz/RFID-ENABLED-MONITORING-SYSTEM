<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="javax.sql.*"%>
<%
String DRIVER = "org.gjt.mm.mysql.Driver";
Class.forName(DRIVER).newInstance();


Connection con=null;
ResultSet rs=null;
Statement stmt=null;
String ch="0";

try{
String url="jdbc:mysql://localhost/rems?user=root&password=root";

int i=1;
con=DriverManager.getConnection(url);
stmt=con.createStatement();
rs=stmt.executeQuery("select * from help WHERE status='"1"'");
%>
<html>
<body>
<center>
<h2>Registered Checkers</h2>
<table>
<tr>
<td><b>Sl.no</b></td>
<td><b> name</b></td>

<td><b>email</b></td>

<td><b>addr</b></td>
<td><b>status</b></td>



</tr>
<% 
int num=1;
while(rs.next())
{
%>
<tr><td><%=num%></td>
<td><%=rs.getObject(1).toString()%> </td>

<td><%=rs.getObject(4).toString()%></td>
<td><%=rs.getObject(8).toString()%></td>
<td><%=rs.getObject(10).toString()%></td>

</tr>
<%
num++;
}
rs.close();
stmt.close();
con.close();
}

catch(Exception e){
System.out.println(e.getMessage());
}
%>

</table>
</html>