
<%@page import="dbutil.*"%>
<%@page import="java.sql.*"%>

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
         <p>Reply
             <%! String qid=null; %>
             <%! String q=null; %>
             <%! String askbyemail=null; %>
              <%! String qdate=null; %>
<%! String b1value=null; %>

         <hr>
 
         <%
         b1value = request.getParameter("b1");
         qid = b1value.substring(21);
        
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
    
    
    
    
    <h3>Post Answer</h3> 
    <form method='post'>
			<table class='table acomment'>
				
				
				<tr>
					<th>Answer:</th>
					<td>
						
						<script type='text/javascript' src='//cdn.inmotionhosting.com/support/components/com_pup/tinymce/js/tinymce/tinymce.min.js'></script>
						<script type='text/javascript'>
							tinymce.init({
							    selector: 'textarea.acomment_comment',
							    plugins: [
							        // 'advlist autolink lists link image charmap print preview anchor',
						        	// 'searchreplace visualblocks code fullscreen',
							        // 'insertdatetime media table contextmenu paste moxiemanager'
							    ],
							    toolbar: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image'
							});
						</script>
						<textarea class='acomment_bcomment' name='acomment_bcomment' id='acomment_bcomment' style='display:none;'></textarea>
						<textarea class='acomment_comment' name='acomment_comment' id='acomment_comment' style='width:100%;height:150;'></textarea>
					</td>
				</tr>
				<tr>
					<th></th>
					<td>
						
						<script type="text/javascript" src="https://www.google.com/recaptcha/api/challenge?k=6LeoSOcSAAAAAGEzHG3DfhwCCZTigzSlHi3Qjymt"></script>

	<noscript>
  		<br/>
  		<textarea name="recaptcha_challenge_field" rows="3" cols="40"></textarea>
  		<input type="hidden" name="recaptcha_response_field" 
                       value="manual_challenge"/>
	</noscript>
					</td>
				</tr>
				<tr>
					<th>Submit</th>
					<td style='text-align:left;'>
						<p>Please note: Your name and Answer will be displayed, but we will not show your email address.</p>
						<input type='submit' 
                                                       value='Submit Comment'
                                                name="b2" />
					</td>
				</tr>
			</table>
			</form>
    
  </section>
  <%
  if(request.getParameter("b2")!=null)
  {
      
      String sql = "insert into queryans(qid,qans,postbyname) values("+
              qid+",'"+request.getParameter("acomment_comment")+"','"+
              session.getAttribute("name")+"')";
      try
      {
          DBConnect x = new DBConnect();
          x.queryExecuter(sql);
          response.sendRedirect("TeacherReplyAns.jsp?b1="+b1value);
      }
      catch(Exception ex)
      {
          
      }
  }
  
  %>
  
         
         
         
         
    </body>
</html>
