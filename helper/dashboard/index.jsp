<!DOCTYPE HTML>
<!--
	Prologue 1.2 by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<%@page import="java.sql.*,java.util.*"%>

<html>
	<head>
		<title>REMS | Helper</title>
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
							<h1 id="title">Helper</h1>
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
								<li><a href="#top" id="top-link" class="skel-panels-ignoreHref"><span class="fa fa-home">View Checker Status</span></a></li>
								<li><a href="#portfolio" id="portfolio-link" class="skel-panels-ignoreHref"><span class="fa fa-th">Upload Verification Status</span></a></li>
								<li><a href="#about" id="about-link" class="skel-panels-ignoreHref"><span class="fa fa-user">Admin Messages</span></a></li>
								<li><a href="#contact" id="contact-link" class="skel-panels-ignoreHref"><span class="fa fa-envelope">Contact Admin</span></a></li>
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
								<h2 class="alt">Welcome <strong>Helper</strong></h2>
							</header>
							<center>							
								<%
									//Get Current Data and Save it in the formay ddMMyyy eg 22032014
									java.text.DateFormat df = new java.text.SimpleDateFormat("ddMMyyyy");
									String dt=df.format(new java.util.Date());
									out.println(dt);
								%>
								<header>
								<h2>Checker Monitor Center</h2>
							</header>
							

<div align="center" width="85%">
<center>    
<table border="1" borderColor="#ffe9bf" cellPadding="0" cellSpacing="0" width="658" height="63">
<tbody>
<td bgColor="#008080" width="47" align="center" height="19"><font color="#ffffff"><b>SNo.</b></font></td>
<td bgColor="#008080" width="107" height="19"><font color="#ffffff"><b>TAG id</b></font></td>
<td bgColor="#008080" width="224" height="19"><font color="#ffffff"><b>Name</b></font></td>
<td bgColor="#008080" width="270" height="19"><font color="#ffffff"><b>Gender</b></font></td>
<td bgColor="#008080" width="270" height="19"><font color="#ffffff"><b>Address</b></font></td>
<td bgColor="#008080" width="107" height="19"><font color="#ffffff"><b>Emergency</b></font></td>
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

String cookieName = "username";
Cookie cookies [] = request.getCookies ();
Cookie cookieLogin = null;

for (int i = 0; i < cookies.length; i++) 
{
if (cookies [i].getName().equals (cookieName))
{
cookieLogin = cookies[i];
break;
}
}
try{
    
String url="jdbc:mysql://localhost/rems?user=root&password=root";

int i=1;
con=DriverManager.getConnection(url);
stmt=con.createStatement();
rst=stmt.executeQuery("select * from checker where assign='"+cookieLogin.getValue()+"'");

while(rst.next()){        
   
if (i==(i/2)*2){
%>

<tr>
<td bgColor="#ffff98" vAlign="top" width="47" align="center" height="19"><%=i%>.</td>
<td bgColor="#ffff98" vAlign="top" width="107" height="19"><%=rst.getString(1)%></td>
<td bgColor="#ffff98" vAlign="top" width="224" height="19"><%=rst.getString(2)%></td>
<td bgColor="#ffff98" vAlign="top" width="270" height="19"><%=rst.getString(3)%></td>
<td bgColor="#ffff98" vAlign="top" width="270" height="19"><%=rst.getString(4)%></td>
<%if(rst.getString(6).equals(dt))
{%>
<td bgColor="#ffff98" vAlign="top" width="270" height="19">No Emergency</td>
<td bgColor="#ffff98" vAlign="top" width="270" height="19">Logged In</td>
<%}
else
{
    %><td bgColor="#ffff98" vAlign="top" width="270" height="19">Emergency</td>
	<td bgColor="#ffff98" vAlign="top" width="270" height="19">Not Logged In</td>
    <% } %>
</tr>
<%
}else{
%>
<tr>
<td bgColor="#ffff98" vAlign="top" width="47" align="center" height="19"><%=i%>.</td>
<td bgColor="#ffff98" vAlign="top" width="107" height="19"><%=rst.getString(1)%></td>
<td bgColor="#ffff98" vAlign="top" width="224" height="19"><%=rst.getString(2)%></td>
<td bgColor="#ffff98" vAlign="top" width="270" height="19"><%=rst.getString(3)%></td>
<td bgColor="#ffff98" vAlign="top" width="270" height="19"><%=rst.getString(4)%></td>
<%if(rst.getString(6).equals(dt))
{%>
<td bgColor="#ffff98" vAlign="top" width="270" height="19">No Emergency</td>
<td bgColor="#ffff98" vAlign="top" width="270" height="19">Logged In</td>
<%}
else
{
    %><td bgColor="#ffff98" vAlign="top" width="270" height="19">Emergency</td>
<td bgColor="#ffff98" vAlign="top" width="270" height="19">Not Logged In</td>
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
							</center>
						</div>
					</section>
					
				<!-- Portfolio -->
					<section id="portfolio" class="two">
						<div class="container">
					<%
							 String DRIVER2 = "org.gjt.mm.mysql.Driver";
        Class.forName(DRIVER2).newInstance();
        Connection con2=null;
        ResultSet rst2=null;
        Statement stmt2=null;
		String urlSend="jdbc:mysql://localhost/rems?user=root&password=root";
		
        con2=DriverManager.getConnection(urlSend);
        stmt2=con2.createStatement();
        rst2=stmt2.executeQuery("select * from help where email='"+cookieLogin.getValue()+"'");        
        
            while(rst2.next())
            {
                %>
            <h2>Name:                     <%=rst2.getString(3)%><br>
			Address:                  <%=rst2.getString(4)%><br>
			eMail:                    <%=rst2.getString(1)%><br>
			City:                     <%=rst2.getString(5)%><br>
			Local:     <%=rst2.getString(6)%></h2>
            <%if(rst2.getString(7).equals(ch))
                {
                %><pre><h1>Status:             Candidate Not Verified</h1></pre><%  
                
                                if(rst2.getString(9).equals(ch))
                                         {
                                         %><FORM  ENCTYPE="multipart/form-data" ACTION="valUpload.jsp" METHOD=POST>
                                            <h1>Upload Helper verification credentials (.jpg/.jpeg)</h1>
                                            <h2>Choose the file to upload <INPUT NAME="F1" TYPE="file"> <INPUT TYPE="submit" VALUE="Upload" >
                                            </h2></FORM><%
                                         }
                                    else
                                        {
                                         %>
                                            <pre><h1>Verifying submitted credentials</h1></pre>
                                        <%
                                        }
                                
                      }
                
            else
                {
				%>
					<h1>Status:            Helper Verified</h1>                
				<%  
                }
              }%>

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