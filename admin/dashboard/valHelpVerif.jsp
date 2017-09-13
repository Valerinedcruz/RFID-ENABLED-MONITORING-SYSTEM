<%@page import="java.sql.*"%>
<%
String verification="";
String cand[]=request.getParameterValues("verifHelp");
for(int i=0;i<cand.length;i++){
    verification+=cand[i]+" ";
}

        try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rems", "root", "root");
        Statement st=con.createStatement();
        int i=st.executeUpdate("update help set status='1' where email='"+verification+"'");
        if(i!=0)
		{
		response.sendRedirect("index.jsp?status=0");		
		}
		else
		{
		response.sendRedirect("index.jsp?status=1");
		}
		}
        catch(Exception e){
        System.out.println(e);
        }
%>