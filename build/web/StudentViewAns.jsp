
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
       <jsp:include page="studentHeader.jsp" />
        <h3>Welcome <%= session.getAttribute("name")  %></h3>
     <p>Reply
             <%! String qid=null; %>
             <%! String q=null; %>
             <%! String askbyemail=null; %>
              <%! String qdate=null; %>
<%! String b1value=null; %>

         <hr>
 
         <%
         b1value = request.getParameter("b1");
         qid = b1value.substring(24);
        
         try{
         String sql = "select * from query where qid="+qid;
         DBConnect x = new DBConnect();
         ResultSet rs =x.queryReturner(sql);
         rs.next();
         q = rs.getString(2);
         askbyemail = rs.getString(3);
         qdate = rs.getString(4);
         
         }
         catch(Exception ex)
         {
         out.println(ex);    
         }
         
        
         
         %>
         
       <article>
  <header>
      
    <h1>Question No - <%= qid  %>  </h1>
    <p>Published:<span style="color:red"> 
            <time pubdate 
                  datetime=<%= qdate%> ><%= qdate%></time></span></p>
  </header>
  <p>Description -<span style="color:blue"><%= q%> </span> </p>
  <section>
    <h2>Answer</h2>  
    <%
    String qans=null;
    String postbyname = null;
    String postDate = null;
    try{
    String sql = "select * from queryans where qid="+qid;
    DBConnect x1 = new DBConnect();
    ResultSet rs1 = x1.queryReturner(sql);
    while(rs1.next())
    {
        qans = rs1.getString(2);
        postbyname = rs1.getString(3);
        postDate = rs1.getString(4);
        %>
        
        <article>
      <header>
      <h3>Posted by: <%= postbyname %></h3>
      <p><time pubdate datetime=
               <%= postDate %>>~<%= postDate %></time></p>
    </header>
    <p>Answer - <%= qans %></p>
    </article>
        
   <% }
    
    
    }
    catch(Exception ex)
    {
        
    }
    %>
    
    <p>
    <p></p>
    <hr>
    
    
    
    
    
         
         
    </body>
</html>
