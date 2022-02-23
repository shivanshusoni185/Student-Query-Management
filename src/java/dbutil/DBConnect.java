/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbutil;
import java.sql.*;
public class DBConnect {
    
    Connection conn;
    public DBConnect() throws Exception
    {
        
            Class.forName("oracle.jdbc.OracleDriver");
        conn = DriverManager.getConnection(
                   "jdbc:oracle:thin:@localhost:1521:XE",
                "hr","hr");
            
       
    }
   
    public void queryExecuter(String sql) 
            throws Exception
    {
        Statement stat = conn.createStatement();
        stat.execute(sql);
        stat.close();
        conn.close();
    }
    public ResultSet queryReturner(String sql) 
            throws Exception
    {
        
        Statement stat =conn.createStatement();
        ResultSet rs=stat.executeQuery(sql);
        return rs;
    }
    
}
