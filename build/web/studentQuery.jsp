

<%@page import="dbutil.Query"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="studentHeader.jsp" />
         <h3>Welcome <%= session.getAttribute("name")  %>
         </h3>
         <p>Student Query
         <form>
             <table>
                 <tr>
                     <td>Question/Query</td>
                     <td><textarea name="t1" rows="4" 
                                   cols="20">
                         </textarea></td>
                 </tr>
                 
                 <tr>
                     <td>
                         
                     </td>
                     <td><input type="submit" 
                         value="Submit" name="b1" /></td>
                 </tr>
             </table>
         </form>
         
         <%
         if(request.getParameter("b1")!=null)
         {
          String q = request.getParameter("t1");
     String email = session.getAttribute("email").toString();
     String dept = session.getAttribute("dept").toString();
          
     Query obj = new Query();
            boolean chk= obj.insertQuery(q, email,dept);
            if(chk==true)
            {
                out.println("Question post successfully");
            }
         }
         
         %>
         
    </body>
</html>
