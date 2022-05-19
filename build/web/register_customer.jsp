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
        <title>Customer Registration</title>
    

<style>
    
    body{
        font-family: 'Baloo Bhai 2', cursive;
        margin: 0px;
        padding: 0px;
        
        background:url(bg1.jpg);
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
        border: 0px transparent;
       margin-left: 780px;
       margin-top: 90px;
        padding: 38px 38px;
        width: 35%;
        /*border-radius: 26px;*/
        background:url(bg2.jpg);
        background-repeat: no-repeat;
        background-size: 520px 580px;
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
    }
    

   
</style>

</head>
<body >
      <div class="container">
        <h2>SIGN UP</h2>
        <form >
            <div class="form-group">
                <label><b>User Name</b></label>
                <input type="text" name="cname" placeholder="Enter Username" required>
            </div>
            
            <div class="form-group">
                <label><b>Phone Number</b></label>
                <input type="text" name="ph_no" placeholder="Enter Phone Number" required>
            </div>
            <div class="form-group">
                <label><b>Address</b></label>
                <input type="text" name="address" placeholder="Enter Address" required>
            </div>
            <div class="form-group">
                <label><b>Email</b></label>
                <input type="email" name="email" placeholder="Enter Email" required>
            </div>
            <div class="form-group">
                <label><b>Password</b></label>
                <input type="Password" name="password" id="Pass" placeholder="Enter Password" required>  
                
            </div>
            
            <div class="form-group">
                <label><b>Security Question</b></label>
                <input type="text" name="security_ques" placeholder="What is your birth place ?" required>
            </div>
            <button type="submit" class="btn" name="btn_reg">Sign Up</button>
            
            
            
            <div style="text-align:center">
                <p align="center">Already have an account ?<a href="Login_customer.jsp" style="display:inline-block" > Login</a>
                
            </div>
            
            
        </form> 
    </div>  
</body>
</html>


<%
    try{
        if(request.getParameter("btn_reg")!=null)
        {
            
            Connection conn=null;
            Statement stat=null;
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
            stat=conn.createStatement();
            
            String query="insert into customer(cname,phone_number,address,email,password,security_ques)values('"+request.getParameter("cname")+"',"+request.getParameter("ph_no")+",'"+request.getParameter("address")+"','"+request.getParameter("email")+"','"+request.getParameter("password")+"','"+request.getParameter("security_ques")+"')";
            String queryToFindDuplicate =" SELECT * FROM customer where email='"+request.getParameter("email")+"'";
       
            Statement statementForDuplicate=conn.createStatement();
            ResultSet rsd=statementForDuplicate.executeQuery(queryToFindDuplicate);
            boolean status=rsd.next();
            if(status)
            { 
                out.print("<script>alert('Email address already registered !!!')</script>");
            }
            else
            {
                
            int i=stat.executeUpdate(query);
            if(i>0)
            {
                out.print("<script>alert('Registerd Successfully')</script>");
                response.sendRedirect("Login_customer.jsp");
            }
            else  out.print("<script>alert('Error in insertion')</script>");
        }}
        
    }catch(Exception ex ){ex.printStackTrace();}

%>




