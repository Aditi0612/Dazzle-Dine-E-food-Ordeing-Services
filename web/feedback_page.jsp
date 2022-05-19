<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8">
  <title>Feedback Form</title>
  <link rel="stylesheet" href="style.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
</head>

<body>
  <h1>Help us serve you better by giving your valuable feedback</h1>
  <div class="container">
    <form action="#">
      <header></header>
      <div class="rate">
        <label for="rating">Rate us on a scale of 5 :</label>
        <input type="number" id="rating" name="rating" min="1" max="5"><br><br>
      </div>
      <div class="textarea">
        <textarea cols="40"  rows="5" name="comment" placeholder="Describe your experience.."></textarea>
      </div>


      <div class="btn">
        <button type="submit" name="btn_post">Post</button>
      </div> 
      
      
    </form>
  </div>
</body>
</html>
<%
    String cust=(String)session.getAttribute("user");
    try{
        if(request.getParameter("btn_post")!=null)
        {
            int rate=Integer.parseInt(request.getParameter("rating"));
            String feedback_comment=request.getParameter("comment");
            
            
           Connection conn=null;
            Statement stat=null;
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
            stat=conn.createStatement();
            
            String query="insert into feedback values('"+cust+"',"+rate+",'"+feedback_comment+"')";
            
                
            
            int i=stat.executeUpdate(query);
            if(i>0)
            {
                out.print("<script>alert('Thank You For Your Valuable Feedback')</script>");
                response.sendRedirect("thankyou.jsp");
            }
            else  out.print("<script>alert('Error in insertion')</script>");
        }
    }catch(Exception ex ){ex.printStackTrace();}

%>







