<%@ page import="java.io.*,java.sql.*" %>
<%
String saveFile="";
String contentType = request.getContentType();
if((contentType != null)&&(contentType.indexOf("multipart/form-data") >= 0)){
    DataInputStream in = new DataInputStream(request.getInputStream());
    int formDataLength = request.getContentLength();
    byte dataBytes[] = new byte[formDataLength];
    int byteRead = 0;
    int totalBytesRead = 0;
    while(totalBytesRead < formDataLength){
        byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
        totalBytesRead += byteRead;
        }
    String file = new String(dataBytes);
    saveFile = file.substring(file.indexOf("filename=\"") + 10);
    saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
    saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
    int lastIndex = contentType.lastIndexOf("=");
    String boundary = contentType.substring(lastIndex + 1,contentType.length());
    int pos;
    pos = file.indexOf("filename=\"");
    pos = file.indexOf("\n", pos) + 1;
    pos = file.indexOf("\n", pos) + 1;
    pos = file.indexOf("\n", pos) + 1;
    int boundaryLocation = file.indexOf(boundary, pos) - 4;
    int startPos = ((file.substring(0, pos)).getBytes()).length;
    int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
    File ff = new File(saveFile);
    FileOutputStream fileOut = new FileOutputStream("C:/Program Files/Apache Software Foundation/Tomcat 7.0/webapps/exam/upload/"+ff);
    fileOut.write(dataBytes, startPos, (endPos - startPos));
    fileOut.flush();
    fileOut.close();

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

    Connection connection = null;
    String connectionURL = "jdbc:mysql://localhost:3306/rems";
    PreparedStatement psmnt = null;
    FileInputStream fis;
    InputStream sImage;

    try{
        Class.forName("com.mysql.jdbc.Driver");

        java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rems","root","root");
        Statement stmt=con.createStatement();
        int i=stmt.executeUpdate("update help set fstatus='1', fname='"+saveFile+"' where uname='"+cookieLogin.getValue()+"'");

        if(i!=0)
               {%>
               <center><a href="sprof.jsp">Your verification credentials have been uploaded<br>Click here to view Profile page</a></center>
               <%
                }
        else

            {%>
               <center><a href="sprof.jsp">Unsuccessful credentials upload<br>Click here to try again</a></center>
               <%
            stmt.close();
            con.close();
            }
    }
    catch(Exception e){
        e.printStackTrace();
    }
}
%>