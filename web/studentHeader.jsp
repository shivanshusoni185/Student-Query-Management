
<%@page import="dbutil.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <table width="100%">
    <tr>
        <td width="30%">
            
            <%
                String email = session.getAttribute("email").toString();
                String sql = "select uphoto from reg where email='"+
                        email+"'";
                DBConnect x = new DBConnect();
                ResultSet rs = x.queryReturner(sql);
                rs.next();
                String fileName = "userimages/" +rs.getString(1);
                        
                
                %>
            
            <img src="<%= fileName %>" 
                 height="150" width="150"/>
             <h2>Student </h2>
        </td>
        <td width="70%">
            <a href="studentHome.jsp">Home</a>
            <a href="studentprofile.jsp">Profile</a>
            <a href="changephoto.jsp">Change Photo</a>
            <a href="studentQuery.jsp">Ask a Question</a>
            <a href="studentviewquery.jsp">View Answer</a>
            <a href="signout.jsp">Sign Out</a>
            
            
            
            
        </td>
    </tr>
    
</table>

        <hr>
        <p>
       
    </body>
</html>
