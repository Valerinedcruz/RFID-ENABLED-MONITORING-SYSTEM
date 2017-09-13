<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    
<head>
        
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
<title>REMS</title>

</head>
<script type="text/javascript">
function validate(Form_obj)
{
var fname= document.getElementById("fname").value;
var lname= document.getElementById("lname").value;
var dob= document.getElementById("dob").value;
var phone= document.getElementById("phone").value;
var email= document.getElementById("email").value;
var password= document.getElementById("password").value;
var cpassword= document.getElementById("cpassword").value;

if(fname=="")
{
alert("Please enter your First Name"); 
return false;
}
if(lname=="")
{
alert("Please enter your Last Name"); 
return false;
}

if(dob=="")
{
alert("Please enter your Date of birth"); 
return false;
}

if(phone.length<1 || phone.length>11)
{
alert("Please enter your Phone "); 
return false;
}

if(password=="")
{
alert("Please enter your Password"); 
return false;
}
if(cpassword!=password)
{
alert("Confirmation Password and Password should be same"); 
return false;
}
 
}
</script>
<body onload=fun()>
<center><h1> Register</h1> </center>

<form name="frm" id="myform" action="valreg.jsp" method="post" onSubmit="return validate(this)">
<table width="350" border="0" cellspacing="0" cellpadding="5" align="center" bgcolor="#F4FAFF" style="border:1px solid #0099FF;">
  <tr>
    <td colspan="2" class="heading" align="center" style="border-bottom:1px solid #0099FF;">
</td>
  </tr>
  <tr>
    <td colspan="2" class="heading" align="center" height="10"></td>
  </tr>
<tr>
   <td align="left" class="txt">First Name *</td>
 <td align="right"><input type="text" name="fname" id="fname" size="28" title="First Name" class="required text" /></td>
  </tr>
  <tr>
   <td align="left" class="txt">Last Name</td>
 <td align="right"><input type="text" name="lname" id="lname" size="28" title="Last Name" /></td>
  </tr>
 <tr>
   <td align="left" class="txt">Gender *</td>
 <td align="left">
  <input type="radio" name="gender" value="Male" title="Gender" class="required"  id="gender"/>Male
  <input type="radio" name="gender" value="Female" title="Gender" class="required" id="gender"/>Female
 </td>
  </tr>
 
<tr>
<td align="left" class="txt">Date Of Birth *</td>
 <td align="right"><input type="text" name="dob" id="dob" size="28" title="Date Of Birth" class="required date" /></td>
  </tr>
  
 <tr>
   <td align="left" class="txt">Phone *</td>
 <td align="right"><input type="text" name="phone" id="phone" size="28" title="Phone" class="required regex ^\-?\d+$" /></td>
  </tr>
  <tr>
 
 <tr>
   <td align="left" class="txt">Email *</td>
 <td align="right"><input type="text" name="email" id="email" size="28" title="Email" class="required email" /></td>
  </tr>
  
<tr>
   <td align="left" class="txt">Password *</td>
 <td align="right"><input type="password" name="password" id="password" size="28" title="Password" class="required alpha min 6 max 20 match cpassword" /></td>
  </tr>
 
 <tr>
   <td align="left" class="txt">Confirm Password *</td>
 <td align="right"><input type="password" name="cpassword" id="cpassword" size="28" title="Confirm Password" class="required alpha" /></td>
  </tr>
<tr>
<td align="left" class="txt">Address *</td>
<td align="right"><textarea name="address" ></textarea></td>
</tr>
  
  <td align="left" class="txt">Country *</td>
 <td align="left">&nbsp;
  <select name="country" id="country" title="Country" class="required">
   <option value="">--- Select ---</option>
   <option value="Canada">Canada</option>
   <option value="INDIA">UK</option>
   <option value="USA">USA</option>
   <option value="Pakistan">Pakistan</option>
   <option value="Other">Other</option>
  </select>
 </td>
  </tr>
 
    <tr>
   <td align="left" class="txt">Disclaimer *</td>
 <td align="left">
  <input type="checkbox" name="disclaimer" value="1" title="Disclaimer" class="required" />
 </td>
  </tr>
  <tr>
 <td align="right" colspan="2">
  <input type="submit" name="btnSubmit" value="Submit Form">
 </td>
  </tr>

</table>
</form>
<br /><br />
</html>
