
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        
        <title>JSP Page</title>
    </head>
    <body>
        <h1  style="text-align: center"> New Registration!</h1>
        <hr>
        <p></p>
        
        <form style="text-align:center" action="./LoginCheck">
            <table>
                <tr>
                    <td>Email</td>
                    <td><input  type="email" 
                               name="email" required /></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" 
                               name="pass" required /></td>
                </tr>
                
                 <tr>
                    <td>Confirm Password</td>
                    <td><input type="password" 
                               name="cpass" required /></td>
                </tr>
                 <tr>
                    <td>Name</td>
                    <td><input type="text" name="uname" 
                               required /></td>
                </tr>
                
                 <tr>
                    <td>Mobile</td>
                    <td><input type="text" name="mobile" 
                               required /></td>
                </tr>
                 <tr>
                    <td>User Type</td>
                    <td> <select name="utype">
                            <option>Student</option>
                            <option>Faculty</option>
                        </select></td>
                </tr>
                
                <tr>
                    <td>Branch/Department</td>
                    <td> <select name="depart">
                            <option>CSE</option>
                            <option>MECH</option>
                            <option>EC</option>
                            <option>Civil</option>
                            <option>IT</option>
                        </select></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="Submit" value="Submit" 
                               name="b1"  /></td>
                </tr>
            </table>
        </form>
        
        
    </body>
</html>
