 <%-- 
    Document   : Login_customer
    Created on : 19 Feb, 2022, 11:58:38 AM
    Author     : hp
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>    
<html>    

<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot Password</title>
    

<style>
    
     body{
        font-family: 'Baloo Bhai 2', cursive;
        margin: 0px;
        padding: 0px;
        height: 100%;
        background:url(bg.jpg);
        background-repeat: no-repeat;
        background-size: cover;
    }
    
    .btn{
        margin: 0px 9px;
        background-color:darkcyan;
        color: white;
        padding: 2px 5px;
        border: 2px solid rgb(90, 89, 89);
        border-radius: 10px;
        cursor: pointer;
    }

    .container{
        border: 2px transparent;
        margin-left: 580px;
        margin-top: 150px;
        padding: 42px 42px;
        width: 20%;
        border-radius: 26px;
        background:url(bg3.jpg);
        background-repeat: no-repeat;
        background-size: 390px 530px;
    }

    .form-group input{
        text-align: center;
        display: block;
        width: 310px;
        padding: 1px;
        border: 2px solid gray;
        margin: 6px auto;
        border-radius: 10px;
        font-size: 15px;
        font-family: 'Baloo Bhai 2', cursive;
    }

    .container h2{
        text-align: center;
    }

    .container button{
        display: block;
        width: 33%;
        margin: 17px auto;
        font-size: 14px;
        font-family:'Baloo Bhai 2', cursive;
    
    }
    .container label
    {  
    width: 300px;  
    height: 30px;  
    border: none;  
    border-radius: 3px;  
    padding-left: 8px;  
    text-align: center;

    }
   
</style>

</head>
<body >
      <div class="container">
          <h2>FORGOT PASSWORD</h2>
        <form >
            <div class="form-group">
                <label><b>Username</b></label>
                <input type="email" name="email1"  placeholder="Enter your email" required>  
                
            </div>
            <div class="form-group">
                <label><b>Birth Place</b></label>
                <input type="text" name="answer" placeholder="Enter your birth place " required>
            </div>
            
            <div class="form-group">
                <label><b>New Password</b></label>
                <input type="Password" name="pass1" placeholder="Enter New Password" required>
            </div>
            <div class="form-group">
                <label><b>Confirm Password</b></label>
                <input type="Password" name="pass2" id="Pass" placeholder="Confirm Password" required>  
                
            </div>
            <br>
            <button class="btn" name="btn_submit">Submit</button>
            
            
            
        </form> 
    </div>  
</body>
</html>
<%
    try{
        if(request.getParameter("btn_submit")!=null)
        {
            String ans = request.getParameter("answer");   
            String email2 = request.getParameter("email1"); 
            String password1 = request.getParameter("pass1");   
            String password2 = request.getParameter("pass2");
            Connection conn=null;
            Statement stat=null;
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
            stat=conn.createStatement();
            ResultSet rs=stat.executeQuery("select security_ques from customer where email='"+email2+"'");
            
            while(rs.next())
            {
                String s=rs.getString(1);
            int j=1;
            if(ans.equalsIgnoreCase(s) )    
            {
                
                if(password1.equals(password2))
            {
            
            
            
            PreparedStatement pst1 = conn.prepareStatement("update customer set password=? where email=?" );
            pst1.setString(1, password1);
            pst1.setString(2, email2);
            int i = pst1.executeUpdate();  
            if(i>0)     
            {
                out.print("<script>alert('Password changed Successfully')</script>");
                response.sendRedirect("Login_customer.jsp");
            }
            else
            {
               out.print("<script>alert('Error in updation . Retry !!!')</script>");
                
            }
        } 
            
      else
            {
                %>
                <script type="text/javascript">
                    alert("Password do not match !!!!");
                </script>
                <%
                
            }
            
            }
            else
            {
                %>
                <script type="text/javascript">
                    alert("Wrong Answer !!!!");
                </script>
                <%
                
            }}
        
}  
    }catch(Exception ex ){ex.printStackTrace();}

%>







