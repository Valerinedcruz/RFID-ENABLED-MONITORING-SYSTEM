<%@page import="java.sql.*,java.util.*"%>
<h1>RFID Store</h1>
<%
String val=request.getParameter("val");

//Get Current Data and Save it in the formay ddMMyyy eg 2232014
java.text.DateFormat df = new java.text.SimpleDateFormat("ddMMyyyy");
String dt=df.format(new java.util.Date());

//Database Save
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rems", "root", "root");
Statement st=con.createStatement();
int i=st.executeUpdate("update checker set date='"+dt+"' where id='"+val+"'");

%>
