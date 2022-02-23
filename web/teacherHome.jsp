

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
         <%= session.getAttribute("dept")  %>
         </h3>
         <p>Home
    </body>
</html>
