<!DOCTYPE HTML>
<!--
	Prologue 1.2 by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<%@ page language="java" import="java.sql.*"%>

<html>
	<head>
		<title>REMS | Admin</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600" rel="stylesheet" type="text/css" />
		<!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
		<script src="js/jquery.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/skel-panels.min.js"></script>
		<script src="js/init.js"></script>
		<noscript>
			<link rel="stylesheet" href="css/skel-noscript.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/style-wide.css" />
		</noscript>
		<!--[if lte IE 9]><link rel="stylesheet" href="css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="css/ie8.css" /><![endif]-->
	</head>
	<body>

		<!-- Header -->
			<div id="header" class="skel-panels-fixed">

				<div class="top">

					<!-- Logo -->
						<div id="logo">
							<h1 id="title">Administrator</h1>
							<span class="byline">Dashboard</span>
						</div>

					<!-- Nav -->
						<nav id="nav">
							<!--
							
								Prologue's nav expects links in one of two formats:
								
								1. Hash link (scrolls to a different section within the page)
								
								   <li><a href="#foobar" id="foobar-link" class="skel-panels-ignoreHref"><span class="fa fa-whatever-icon-you-want">Foobar</span></a></li>

								2. Standard link (sends the user to another page/site)

								   <li><a href="http://foobar.tld"><span class="fa fa-whatever-icon-you-want">Foobar</span></a></li>
							
							-->
							<ul>
								<li><a href="#top" id="top-link" class="skel-panels-ignoreHref"><span class="fa fa-home">Add Checker</span></a></li>
								<li><a href="#portfolio" id="portfolio-link" class="skel-panels-ignoreHref"><span class="fa fa-th">Verify Helper</span></a></li>
								<li><a href="#about" id="about-link" class="skel-panels-ignoreHref"><span class="fa fa-user">Helper Messages</span></a></li>
								<li><a href="#contact" id="contact-link" class="skel-panels-ignoreHref"><span class="fa fa-envelope">Contact Helper</span></a></li>
							</ul>
						</nav>
						
				</div>
				
				<div class="bottom">

				
				</div>
			
			</div>

		<!-- Main -->
			<div id="main">
			
				<!-- Intro -->
					<section id="top" class="one">
						<div class="container">

							<header>
								<h2 class="alt">Welcome <strong>Admin</strong></h2>
							</header>
							<center>							
							<form name="registration" action="addCheck.jsp" method="post">
								id         <input type="text" name="id"><br>
								Name         <input type="text" name="name"><br>
										Gender (M/F)<input type="text" name="gender"><br>
										Address           <input type="text" name="address"><br>
										<select name="assign">
										<%
									String url3="jdbc:mysql://localhost/rems?user=root&password=root";							
					Connection con3=null;
					Statement stmt3=null;
					con3=DriverManager.getConnection(url3);                
					stmt3=con3.createStatement();
					ResultSet rst3=null;
					rst3=stmt3.executeQuery("Select email from help where status=1;");
					while(rst3.next()){ %>              
						<option><%=rst3.getString(1)%></option> 
						   
						<%}%>
				 </select><br>
				 
								<input type="submit" value="Submit"> 
											
							</form>
					</center>
						</div>
					</section>
					
				<!-- Portfolio -->
					<section id="portfolio" class="two">
						<div class="container">
					
							<header>
								<h2>Status Not Verified Helpers</h2>
							</header>
							

<div align="center" width="85%">
<center>
    <form name="candverif" method="post" action="valHelpVerif.jsp">
<table border="1" borderColor="#ffe9bf" cellPadding="0" cellSpacing="0" width="658" height="63">
<tbody>
<td bgColor="#008080" width="47" align="center" height="19"><font color="#ffffff"><b>SNo.</b></font></td>
<td bgColor="#008080" width="107" height="19"><font color="#ffffff"><b>Name</b></font></td>
<td bgColor="#008080" width="224" height="19"><font color="#ffffff"><b>Address</b></font></td>
<td bgColor="#008080" width="270" height="19"><font color="#ffffff"><b>eMail</b></font></td>
<td bgColor="#008080" width="270" height="19"><font color="#ffffff"><b>City</b></font></td>
<td bgColor="#008080" width="107" height="19"><font color="#ffffff"><b>Verification Credentials</b></font></td>
<td bgColor="#008080" width="107" height="19"><font color="#ffffff"><b>Helper Status</b></font></td>

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

try{
    
String url="jdbc:mysql://localhost/rems?user=root&password=root";

int i=1;
con=DriverManager.getConnection(url);
stmt=con.createStatement();
rst=stmt.executeQuery("select * from help where status=0");

while(rst.next()){               
    
if (i==(i/2)*2){
%>

<tr>
<td bgColor="#ffff98" vAlign="top" width="47" align="center" height="19"><%=i%>.</td>
<td bgColor="#ffff98" vAlign="top" width="107" height="19"><%=rst.getString(3)%></td>
<td bgColor="#ffff98" vAlign="top" width="224" height="19"><%=rst.getString(4)%></td>
<td bgColor="#ffff98" vAlign="top" width="270" height="19"><%=rst.getString(1)%></td>
<td bgColor="#ffff98" vAlign="top" width="270" height="19"><%=rst.getString(5)%></td>
<%if(rst.getString(9).equals(ch))
{%>
<td bgColor="#ffff98" vAlign="top" width="270" height="19">Not Uploaded</td>
<td bgColor="#ffff98" vAlign="top" width="270" height="19">Not applicable</td>
<%}
else
{
    %><td bgColor="#ffff98" vAlign="top" width="270" height="19"><a href="upload/<%=rst.getString(8)%>" target="_top">View</a></td>
      <td bgColor="#ffff98" vAlign="top" width="270" height="19"><input type="checkbox" name="verifHelp" value="<%=rst.getString(1)%>">Verified</td>
    <% } %>
</tr>
<%
}else{
%>
<tr>
<td bgColor="#ffff98" vAlign="top" width="47" align="center" height="19"><%=i%>.</td>
<td bgColor="#ffff98" vAlign="top" width="107" height="19"><%=rst.getString(3)%></td>
<td bgColor="#ffff98" vAlign="top" width="224" height="19"><%=rst.getString(4)%></td>
<td bgColor="#ffff98" vAlign="top" width="270" height="19"><%=rst.getString(1)%></td>
<td bgColor="#ffff98" vAlign="top" width="270" height="19"><%=rst.getString(5)%></td>
<%if(rst.getString(9).equals(ch))
{%>
<td bgColor="#ffff98" vAlign="top" width="270" height="19">Not Uploaded</td>
<td bgColor="#ffff98" vAlign="top" width="270" height="19">Not applicable</td>
<%}
else
{
    %><td bgColor="#ffff98" vAlign="top" width="270" height="19"><a href="upload/<%=rst.getString(8)%>" target="blank">View</a></td>
      <td bgColor="#ffff98" vAlign="top" width="270" height="19"><input type="checkbox" name="verifHelp" value="<%=rst.getString(1)%>">Verified</td>
      <% } %>
</tr>
<% }
i++;
}
rst.close();
stmt.close();
con.close();
}
        catch(Exception e){
System.out.println(e.getMessage());
}
%>

</tbody>
</table>
<input type="submit" value="Verify Checked Candidates"><input type="reset" value="Clear Checkbox">
</form>
</center>
</div>
<br><header>
								<h2>Status Verified Helpers</h2>
							</header>

<div align="center" width="85%">
<center>
<table border="1" borderColor="#ffe9bf" cellPadding="0" cellSpacing="0" width="658" height="63">
<tbody>
<td bgColor="#008080" width="47" align="center" height="19"><font color="#ffffff"><b>SNo.</b></font></td>
<td bgColor="#008080" width="107" height="19"><font color="#ffffff"><b>Name</b></font></td>
<td bgColor="#008080" width="224" height="19"><font color="#ffffff"><b>Address</b></font></td>
<td bgColor="#008080" width="270" height="19"><font color="#ffffff"><b>eMail</b></font></td>
<td bgColor="#008080" width="270" height="19"><font color="#ffffff"><b>City</b></font></td>
<td bgColor="#008080" width="270" height="19"><font color="#ffffff"><b>Designated Locality</b></font></td>

<%
String DRIVER2 = "org.gjt.mm.mysql.Driver";
Class.forName(DRIVER2).newInstance();


Connection con2=null;
ResultSet rst2=null;
Statement stmt2=null;

try{
String url2="jdbc:mysql://localhost/rems?user=root&password=root";

int j=1;
con2=DriverManager.getConnection(url2);
stmt2=con2.createStatement();
rst2=stmt2.executeQuery("select * from help where status=1");
while(rst2.next()){


    
if (j==(j/2)*2){
%>
<tr>
<td bgColor="#ffff98" vAlign="top" width="47" align="center" height="19"><%=j%>.</td>
<td bgColor="#ffff98" vAlign="top" width="107" height="19"><%=rst2.getString(3)%></td>
<td bgColor="#ffff98" vAlign="top" width="224" height="19"><%=rst2.getString(4)%></td>
<td bgColor="#ffff98" vAlign="top" width="270" height="19"><%=rst2.getString(1)%></td>
<td bgColor="#ffff98" vAlign="top" width="270" height="19"><%=rst2.getString(5)%></td>
<td bgColor="#ffff98" vAlign="top" width="270" height="19"><%=rst2.getString(6)%></td>
</tr>
<%
}else{
%>
<tr>
<td bgColor="#ffff98" vAlign="top" width="47" align="center" height="19"><%=j%>.</td>
<td bgColor="#ffff98" vAlign="top" width="107" height="19"><%=rst2.getString(3)%></td>
<td bgColor="#ffff98" vAlign="top" width="224" height="19"><%=rst2.getString(4)%></td>
<td bgColor="#ffff98" vAlign="top" width="270" height="19"><%=rst2.getString(1)%></td>
<td bgColor="#ffff98" vAlign="top" width="270" height="19"><%=rst2.getString(5)%></td>
<td bgColor="#ffff98" vAlign="top" width="270" height="19"><%=rst2.getString(6)%></td>
</tr>
<%	}

j++;
}
rst2.close();
stmt2.close();
con2.close();
}catch(Exception e){
System.out.println(e.getMessage());
}
%>

</tbody>
</table>
</center>
</div>

						</div>
					</section>

				<!-- About Me -->
					<section id="about" class="three">
						<div class="container">

							<header>
								<h2>Helper Messages</h2>
							</header>

							<form method="post" action="#">
								<div class="row half">
									<div class="6u"><input type="text" class="text" name="name" placeholder="Name" /></div>
									<div class="6u"><input type="text" class="text" name="email" placeholder="Email" /></div>
								</div>
								<div class="row half">
									<div class="12u">
										<textarea name="message" placeholder="Message"></textarea>
									</div>
								</div>
								<div class="row">
									<div class="12u">
										<a href="#" class="button submit">Send Message</a>
									</div>
								</div>
							</form>

						</div>
					</section>
			
				<!-- Contact -->
					<section id="contact" class="four">
						<div class="container">

							<header>
								<h2>Contact Helper</h2>
							</header>		
							<form method="post" action="#">
								<div class="row half">
									<div class="6u"><input type="text" class="text" name="name" placeholder="Name" /></div>
									<div class="6u"><input type="text" class="text" name="email" placeholder="Email" /></div>
								</div>
								<div class="row half">
									<div class="12u">
										<textarea name="message" placeholder="Message"></textarea>
									</div>
								</div>
								<div class="row">
									<div class="12u">
										<a href="#" class="button submit">Send Message</a>
									</div>
								</div>
							</form>

						</div>
					</section>
			
			</div>

		<!-- Footer -->
			<div id="footer">
				
				<!-- Copyright -->
					<div class="copyright">
						<p>&copy; 2013 Jane Doe. All rights reserved.</p>
						<ul class="menu">
							<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
						</ul>
					</div>
				
			</div>

	</body>
</html>