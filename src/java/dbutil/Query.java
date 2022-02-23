
package dbutil;

import java.sql.ResultSet;


public class Query {
    private String q;
    private String date;
    private String postbyemail;
 private String depatment;

    public String getDepatment() {
        return depatment;
    }

    public void setDepatment(String depatment) {
        this.depatment = depatment;
    }
    public String getQ() {
        return q;
    }

    public String getDate() {
        return date;
    }

    public String getPostbyemail() {
        return postbyemail;
    }
    
    public boolean insertQuery(String q,
            String email,String dept)
    {
        this.q = q;
        this.postbyemail = email;
        this.depatment = dept;
        try{
        String sql = 
       "insert into query values(queryid.NEXTVAL,"+"'"+
                q+"','"+
                email+"','"+dept+"')";
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
    
    public ResultSet getAllQuery()
    {
        ResultSet rs = null;
        try
        {
            String sql = "select * from query";
            DBConnect x = new DBConnect();
             rs = x.queryReturner(sql);
            return rs;
                    
        }
        catch(Exception ex)
        {
            System.out.println(ex);
        }
        return rs;
    }
    public ResultSet getAllQuery(String dept)
    {
        ResultSet rs = null;
        try
        {
            String sql = "select * from query where department='"+dept+"'";
            DBConnect x = new DBConnect();
             rs = x.queryReturner(sql);
            return rs;
                    
        }
        catch(Exception ex)
        {
            System.out.println(ex);
        }
        return rs;
    }
    public ResultSet getAllQuerybyStudent(String email)
    {
        ResultSet rs = null;
        try
        {
            String sql = "select * from query where askbyemail='"+
                    email+"'";
            DBConnect x = new DBConnect();
             rs = x.queryReturner(sql);
            return rs;
                    
        }
        catch(Exception ex)
        {
            System.out.println(ex);
        }
        return rs;
    }
}
