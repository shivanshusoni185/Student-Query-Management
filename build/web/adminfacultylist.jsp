
<%@page import="dbutil.DBConnect"%>
<%@page import="java.sql.*" %>"
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="adminheader.jsp" />
        <h3>Welcome Admin!</h3>
     
        <p>View All Faculty
           
            <%! String email; %>   
         <hr>
         <form action="StudentViewAns.jsp">
         <table>
             <tr>
                 <td>Email</td>
                 <td>Name</td>
                 <td>Mobile</td>
                 <td>Department/Branch</td>
                 <td>Controls</td>
             </tr>
         <%
         
             DBConnect x = new DBConnect();
             ResultSet rs = x.queryReturner(
           "Select * from reg where logintype='Faculty'");
             while(rs.next())
         {%>
           <tr>
               <% email = rs.getString(1); %>
               
               
               <td><%= email %></td>
                <td><%= rs.getString(3) %></td>
               
                 <td><%= rs.getString(4) %></td>
                 <td><%= rs.getString(7) %></td>
                               <td><input type="submit" 
                            value="accept"
                            formaction="adminstatuschange.jsp?email=<%= email %>"
                            name="b1"/>
    
                 <input type="submit" 
                            value="Reject"
                            formaction="adminreject.jsp?email=<%= email %>"
                            name="b1"/>
    
                 </td>
   
             </tr>
         
         
         <%}
         
         %>
         </table>
         </form>
        
    </body>
</html>
