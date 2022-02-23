
<%@page import="dbutil.Reg"%>
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
         <h1>Profile!</h1>
        <hr>
        <p></p>
        
        <%
        String email = session.getAttribute("email").toString();
        Reg obj = new Reg();
        obj.getReg(email);
        
        %>
        
        
        
        <form >
            <table>
                <tr>
                    <td>Email</td>
                    <td><input type="email" 
                               name="email" value="<%= email %>"
                               readonly
                               required /></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" 
                               name="pass" value="<%= obj.getPassword() %>" required /></td>
                </tr>
                
                 <tr>
                    <td>Confirm Password</td>
                    <td><input type="password" 
                               name="cpass" value="<%= obj.getPassword() %>" required /></td>
                </tr>
                 <tr>
                    <td>Name</td>
                    <td><input type="text" name="uname" 
                               required 
                               value="<%= obj.getName() %>"
                               
                               /></td>
                </tr>
                
                 <tr>
                    <td>Mobile</td>
                    <td><input type="text" name="mobile" 
                               required 
                               value="<%= obj.getMobile() %>"
                               /></td>
                </tr>
                 
                
                <tr>
                    <td></td>
                    <td><input type="Submit" value="Update" 
                               name="b1"  /></td>
                </tr>
            </table>
        </form>
        
         <%
         
         if(request.getParameter("b1")!=null)
         {
             String name =request.getParameter("uname");
             String pass =request.getParameter("pass");
             String cpass =request.getParameter("cpass");
             String mobile =request.getParameter("mobile");
             
              String useremail = 
             session.getAttribute("email").toString();
      
             Reg obj1 = new Reg();
             obj1.updateReg(useremail, name, pass, mobile);
             out.println("Record changed");
         }
         %>
    </body>
</html>
