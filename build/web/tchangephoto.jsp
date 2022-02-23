

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="teacherHeader.jsp" />
         <h3>Welcome <%= session.getAttribute("name")  %></h3>
     
            Select a file to upload: <br />
<form action="fileupload.jsp" method="post" enctype="multipart/form-data">
        <input type="file" name="file" size="50" />
<br />
<input type="submit" value="Upload File" />
</form>
    </body>
</html>
