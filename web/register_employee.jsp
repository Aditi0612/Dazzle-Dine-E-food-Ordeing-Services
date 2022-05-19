
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>    
<html>    

<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Registration</title>
    

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
        <h2>NEW EMPLOYEE</h2>
        <form >
            <div class="form-group">
                <label><b>User Name</b></label>
                <input type="text" name="ename" placeholder="Enter Username">
            </div>
            
            <div class="form-group">
                <label><b>Phone Number</b></label>
                <input type="text" name="ph_no" placeholder="Enter Phone Number">
            </div>
            <div class="form-group">
                <label><b>Address</b></label>
                <input type="text" name="address" placeholder="Enter Address">
            </div>
            <div class="form-group">
                <label><b>Email</b></label>
                <input type="email" name="email" placeholder="Enter Email">
            </div>
            <div class="form-group">
                <label><b>Password</b></label>
                <input type="Password" name="Pass" id="Pass" placeholder="Enter Password">  
                
            </div>
            <div class="form-group">
                <label><b>Date Of Joining</b></label>
                <input type="date" name="doj">
            </div>
            
            
            <button class="btn" name="btn_reg">Add</button>
            
            
            
            
            
            
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
            
            String query="insert into employee(ename,phone_number,address,email,password,date_of_joining)values('"+request.getParameter("ename")+"',"+request.getParameter("ph_no")+",'"+request.getParameter("address")+"','"+request.getParameter("email")+"','"+request.getParameter("Pass")+"','"+request.getParameter("doj")+"')";
            String queryToFindDuplicate =" SELECT * FROM employee where email='"+request.getParameter("email")+"'";
       
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
                out.print("<script>alert('Registered Successfully')</script>");
                
            }
            else  out.print("<script>alert('Error in insertion')</script>");
        }}
    }catch(Exception ex ){ex.printStackTrace();}

%>





