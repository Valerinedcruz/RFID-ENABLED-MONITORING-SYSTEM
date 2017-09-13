<html>
  
  <body>

<%@ page language="java" import="java.sql.*"%>

<%@ page language="java" import="javax.sql.*"%>

<%


String ch="0";
String url="jdbc:mysql://localhost/rems?user=root&password=root";


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
        
        
String DRIVER = "org.gjt.mm.mysql.Driver";
       
 Class.forName(DRIVER).newInstance();
        
Connection con=null;
        
ResultSet rst=null;
        
Statement stmt=null;
        
con=DriverManager.getConnection(url);
       
 stmt=con.createStatementrst=stmt.executeQuery("select * from help where uname='"+cookieLogin.getValue()+"'"); 
       
        
            while(rst.next())
   
         {
   
             %>
  
          <pre><h2>Name:<%=rst.getString(3)%><br>
Address:                  <%=rst.getString(4)%><br>
eMail:                    <%=rst.getString(5)%><br>
City:                     <%=rst.getString(6)%><br>
Selected Exam Center:     <%=rst.getString(7)%></h2></pre>

            
<%if(rst.getString(8).equals(ch))
               
 {
                %>
<pre><h1>Status:             Candidate Not Verified</h1></pre><%  
                
if(rst.getString(11).equals(ch))
                                        
 {
                                         %>
<FORM  ENCTYPE="multipart/form-data" ACTION="valsupload.jsp" METHOD=POST>
   
                                         <h1>Upload candidate verification credentials (.jpg/.jpeg)
<h2>Choose the file to upload <INPUT NAME="F1" TYPE="file"> 
<INPUT TYPE="submit" VALUE="Upload" >
                                          
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
             
   {%>
<pre><h1>Status:            Candidate Verified</h1></pre>
               
 <pre><h1>Candidate Register Number: <%=rst.getString(9)%></b></h1></pre>
   
             <%    
               
 }
              
}
     
                    
             
%>
   
 </body>

</html>
