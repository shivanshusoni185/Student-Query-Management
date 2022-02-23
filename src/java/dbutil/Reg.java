
package dbutil;
import java.sql.*;

public class Reg {
    
    private String email;
 private String password;
    private String name;
    private String mobile;
    private String logintype;
    private String department;

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }
    
    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getName() {
        return name;
    }

    public String getMobile() {
        return mobile;
    }

    public String getLogintype() {
        return logintype;
    }
   
    
    
    
    
    public boolean insertReg(String email,
            String pass,String name,String mobile,
            String logintype,String department)
    {
        
        this.email = email;
        this.password = pass;
        
        this.name = name;
        this.mobile = mobile;
        this.logintype = logintype;
        this.department = department;
        try{
        String sql = 
                "insert into reg values('"+
                email+"','"+
                pass+"','"+
                name+"','"+
                mobile+"','"+
                logintype+"','nophoto.jpg','"+
                department+"')";
        
        DBConnect x = new DBConnect();
        x.queryExecuter(sql);
        return true;
        }
        catch(Exception ex)
        {
            System.out.println(ex);
            
        }
        return false;
        
        
    }
    
    public void getReg(String email) throws Exception
    {
        String sql = "select * from reg where email='"
                +email+"'";
        DBConnect x = new DBConnect();
        ResultSet rs = x.queryReturner(sql);
        if(rs.next())
        {
            
            this.password = rs.getString(2);
            this.name = rs.getString(3);
            this.mobile = rs.getString(4);
            this.department = rs.getString(7);
        }
    }
    
    public void getAllFaculty()
    {
        
    }
    public void getAllStudent()
    {
        
    }
    public void updateReg(String email,String name,String pass,String mobile)
    
    {
    try
    {
        String sql = "update reg set password='"+
                pass+"', name='"+
                name+"',mobile='"+
                mobile+"' where email='"+
                email+"'";
         System.out.println(sql);
        DBConnect x =new DBConnect();
        x.queryExecuter(sql);
               
                
    }
    catch(Exception ex)
    {
        System.out.println(ex);
    }
    }
    public String checkUser(String email,String pass) throws Exception
    {
        String type="NotValid";
        String sql = "select * from reg where email='"
                +email+"' and password='"+pass+"'";
        DBConnect x = new DBConnect();
        ResultSet rs = x.queryReturner(sql);
        if(rs.next())
        {
            this.name = rs.getString(3);
            this.department = rs.getString(7);
            type = rs.getString(5);
            
        }
        return type;
    }
}
