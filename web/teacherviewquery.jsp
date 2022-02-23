
<%@page import="dbutil.*" %>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <jsp:include page="teacherHeader.jsp" />
         <h3>Welcome <%= session.getAttribute("name")  %>
         </h3>
         <p>View All Question
             <%! String qid=null; %>
         <hr>
         <form action="TeacherReplyAns.jsp">
         <table>
             <tr>
                 <td>Question No</td>
                 <td>Query</td>
                 <td>Posted by</td>
                 <td>Date</td>
                 <td>Post Answer</td>
             </tr>
         <%
         String dept1 = session.getAttribute("dept").toString();
         Query obj = new Query();
         ResultSet rs = obj.getAllQuery(dept1);
         while(rs.next())
         {%>
           <tr>
               <% qid = rs.getString(1); %>
               
               
               <td><%= qid %></td>
                <td><%= rs.getString(2) %></td>
               
                 <td><%= rs.getString(3) %></td>
                 <td><%= rs.getString(4) %></td>
                 <td><input type="submit" 
                            value="Reply to question no <%= qid %>"
                            name="b1"/>
                 </td>
             </tr>
         
         
         <%}
         
         %>
         </table>
         </form>
    </body>
</html>
