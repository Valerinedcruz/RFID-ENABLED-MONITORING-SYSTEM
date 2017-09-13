<%-- 
    Document   : head
    Created on : Mar 3, 2013, 9:28:22 PM
    Author     : Blazer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>
 <link rel="stylesheet" type="text/css" href="style.css"/>       
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
 <title>RFID Enabled Monitoring System</title>
    
</head>
    <script type="text/javascript">
function fun()
{
alert(" Kindly enter your login credentials else register your details");
}
var my_date=new Date();
document.write(my_date.toString());
</script>

<body onload="fun()">
    
<center>
       
 <h1>RFID Enabled Monitoring System</h1>
        
<h2>Welcome</h2>
<h3>    
<br><br><br><br><br><br><a href="login.jsp"> Login</a>
<br><a href="reg.jsp"> Register</a>
<br><a href="adminlogin.jsp"> Admin</a>
</h3>
</center>
</body>

</html>
