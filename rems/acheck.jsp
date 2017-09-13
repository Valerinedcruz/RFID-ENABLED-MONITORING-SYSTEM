
<%@ page language="java" import="java.sql.*"%>

<html>

<body>


<center>
     <h2>Status Not Verified Checkers</h2>    
    </center>


<div align="center" width="85%">

  <center>
   
   <form name="candverif" method="post" action="valcheckverif.jsp">

       <table border="1" borderColor="#ffe9bf" cellPadding="0" cellSpacing="0" width="658" height="63">

       <tbody>

<td bgColor="#008080" width="47" align="center" height="19">
<font color="#ffffff">
<b>SNo.</b>
</font>
</td>

<td bgColor="#008080" width="107" height="19">
<font color="#ffffff">
<b>Name</b>
</font></td>

<td bgColor="#008080" width="224" height="19">
<font color="#ffffff">
<b>Address</b>
</font>
</td>

<td bgColor="#008080" width="270" height="19">
<font color="#ffffff">
<b>eMail</b>
</font>
</td>



<td bgColor="#008080" width="107" height="19">
<font color="#ffffff">
<b>Verification Checkers</b>
</font>
</td>

<td bgColor="#008080" width="107" height="19">
<font color="#ffffff">
<b>Checker Status</b>
</font>
</td>


<%

         String DRIVER = "org.gjt.mm.mysql.Driver";

        Class.forName(DRIVER).newInstance();


String ch="0";

Connection con=null;

ResultSet rst=null;

Statement stmt=null;


Connection conup=null;

ResultSet rstup=null;

Statement stmtup=null;


try
{
  
  
String url="jdbc:mysql://localhost/rems?user=root&password=root";


int i=1;

con=DriverManager.getConnection(url);

stmt=con.createStatement();
rst=stmt.executeQuery("select * from help where status=0");


while(rst.next())
{            
   
   
 
if (i==(i/2)*2)
{

%>



<td bgColor="#ffff98" vAlign="top" width="47" align="center" height="19">
<%=i%>.</td>

<td bgColor="#ffff98" vAlign="top" width="107" height="19">
<%=rst.getString(3)%>
</td>

<td bgColor="#ffff98" vAlign="top" width="224" height="19">
<%=rst.getString(4)%>
</td>

<td bgColor="#ffff98" vAlign="top" width="270" height="19">
<%=rst.getString(5)%>
</td>
<td bgColor="#ffff98" vAlign="top" width="270" height="19">
<%=rst.getString(7)%>
</td>

<%
if(rst.getString(11).equals(ch))

{%>

            <td bgColor="#ffff98" vAlign="top" width="270" height="19">Not Uploaded</td>

            <td bgColor="#ffff98" vAlign="top" width="270" height="19">Not applicable</td>

<%}

else

{
%>
            <td bgColor="#ffff98" vAlign="top" width="270" height="19">
            <a href="upload/<%=rst.getString(10)%>" target="_top">View</a>
</td>
    
  <td bgColor="#ffff98" vAlign="top" width="270" height="19">
  <input type="checkbox" name="verifcand" value="<%=rst.getString(1)%>">Verified</td>
  
  <% }
 %></tr>

<%
}
else
{
%>

<tr>

<td bgColor="#ffff98" vAlign="top" width="47" align="center" height="19"><%=i%>.</td>

<td bgColor="#ffff98" vAlign="top" width="107" height="19">
<%=rst.getString(3)%></td>

<td bgColor="#ffff98" vAlign="top" width="224" height="19">
<%=rst.getString(4)%>
</td>
<td bgColor="#ffff98" vAlign="top" width="270" height="19">
<%=rst.getString(5)%>
</td>

<td bgColor="#ffff98" vAlign="top" width="270" height="19">
<%=rst.getString(7)%></td>

<%
if(rst.getString(11).equals(ch))

{%>

<td bgColor="#ffff98" vAlign="top" width="270" height="19">Not Uploaded</td>

<td bgColor="#ffff98" vAlign="top" width="270" height="19">Not applicable</td>

<%}

else
{
   
 %><td bgColor="#ffff98" vAlign="top" width="270" height="19">
<a href="upload/<%=rst.getString(10)%>" target="blank">View</a></td>
  
    <td bgColor="#ffff98" vAlign="top" width="270" height="19">
<input type="checkbox" name="verifcand" value="<%=rst.getString(1)%>">Verified</td>
 
     <% }
 %>

</tr>

<% }
i++;

}

rst.close();

stmt.close();

con.close();

}
       
 catch(Exception e)
{

System.out.println(e.getMessage());

}

%>


</tbody>

</table>

<input type="submit" value="Verify Checked Checkers">
<input type="reset" value="Clear Checkbox">

</form>

</center>

</div>

<br>

<center>
<h2>Status Verified checkers</h2>
</center>


<div align="center" width="85%">

<center>

<table border="1" borderColor="#ffe9bf" cellPadding="0" cellSpacing="0" width="658" height="63">

<tbody>

<td bgColor="#008080" width="47" align="center" height="19">
<font color="#ffffff"><b>SNo.</b></font></td>

<td bgColor="#008080" width="107" height="19">
<font color="#ffffff"><b>Name</b></font></td>

<td bgColor="#008080" width="224" height="19">
<font color="#ffffff"><b>Address</b>
</font>
</td>

<td bgColor="#008080" width="270" height="19">
<font color="#ffffff"><b>eMail</b></font>
</td>

<td bgColor="#008080" width="270" height="19">
<font color="#ffffff"><b>RFID NO</b>
</font>
</td>


<%
String DRIVER2 = "org.gjt.mm.mysql.Driver";

Class.forName(DRIVER2).newInstance();



Connection con2=null;

ResultSet rst2=null;

Statement stmt2=null;


try
{

String url2="jdbc:mysql://localhost/rems?user=root&password=root";


int j=1;

con2=DriverManager.getConnection(url2);

stmt2=con2.createStatement();

rst2=stmt2.executeQuery("select * from help where status=1");

while(rst2.next())
{


    

if (j==(j/2)*2)
{
%>

<tr>

<td bgColor="#ffff98" vAlign="top" width="47" align="center" height="19"><%=j%>.</td>

<td bgColor="#ffff98" vAlign="top" width="107" height="19">
<%=rst2.getString(3)%></td>

<td bgColor="#ffff98" vAlign="top" width="224" height="19">
<%=rst2.getString(4)%></td>

<td bgColor="#ffff98" vAlign="top" width="270" height="19">
<%=rst2.getString(5)%></td>

<td bgColor="#ffff98" vAlign="top" width="270" height="19">
<%=rst2.getString(7)%></td>

<td bgColor="#ffff98" vAlign="top" width="270" height="19">
<%=rst2.getString(9)%></td>

</tr>

<%
}
else
{
%>

<tr>

<td bgColor="#ffff98" vAlign="top" width="47" align="center" height="19"><%=j%>.</td>

<td bgColor="#ffff98" vAlign="top" width="107" height="19">
<%=rst2.getString(3)%></td>

<td bgColor="#ffff98" vAlign="top" width="224" height="19">
<%=rst2.getString(4)%></td>

<td bgColor="#ffff98" vAlign="top" width="270" height="19">
<%=rst2.getString(5)%></td>

<td bgColor="#ffff98" vAlign="top" width="270" height="19">
<%=rst2.getString(7)%></td>

<td bgColor="#ffff98" vAlign="top" width="270" height="19">
<%=rst2.getString(9)%>
</td>

</tr>

<%	
}


j++;

}

rst2.close();

stmt2.close();

con2.close();

}
catch(Exception e)
{

System.out.println(e.getMessage());

}

%>


</tbody>

</table>

</center>

</div>


</body>

</html>