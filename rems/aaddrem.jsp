<%-- 
    Document   : reg
    Created on : Mar 3, 2013, 9:28:34 PM
    Author     : Blazer
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    
<head>
    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  
      <title>Administrator Control</title>
 
   </head>
 
   <body>  
      
    <h2>Add checker</h2> 
   
        <form name=" checker registration" action="valaadd.jsp" method="post"><pre>
  
          Username            <input type="text" name="uname">
 
           Password            <input type="password" name="pass">
            
Confirm Password    <input type="password" name="cpass">
   
                             <input type="submit" value="Add"></pre>                        
       
 </form>
   
 <h2>Remove checkers</h2>    
      
  <form name="checker registration" action="valaremove.jsp" method="post"><pre>
      
      Username            <input type="text" name="uname">
  
                              <input type="submit" value="Remove"></pre>        
                
        </form>
  
  </body>

</html>

