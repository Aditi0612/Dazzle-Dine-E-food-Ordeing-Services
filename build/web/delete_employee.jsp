<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>    
<html>    

<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Employee</title>
    

<style>
    
   body{
        font-family: 'Baloo Bhai 2', cursive;
        margin: 0px;
        padding: 0px;
        z-index: -1;
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
        border: 2px solid black;
        margin-left: 630px;
        margin-top: 230px;
        padding: 10px 10px;
        width: 25%;
        border-radius: 20px;
        background:url(bg2.jpg);
        background-repeat: no-repeat;
        background-size: 100%;
        align-items: center;
        justify-content: center;
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
        <h2>DELETE EMPLOYEE</h2>
        <form >
            
            
            <div class="form-group">
                <label><b>Employee Email </b></label>
                <input type="email" name="email" placeholder="Enter Employee Email">
            </div>
            
            
          
            <button class="btn" name="btn_del">Delete</button>
            
        </form> 
    </div>  
</body>
</html>


<%
    try{
        if(request.getParameter("btn_del")!=null)
        {
            
            Connection conn=null;
            Statement stat=null;
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
            stat=conn.createStatement();
            String user = request.getParameter("email");
            String query="delete from employee where email like '%"+user+"%'";
            String queryToFindEmp = "Select * from employee where email like '%"+user+"%'";
       
            Statement statementForFind=conn.createStatement();
            ResultSet rsd=statementForFind.executeQuery(queryToFindEmp);
            boolean status=rsd.next();
            if(!status)
            { 
                out.print("<script>alert('Employee record do not exist !!!')</script>");
            }
            else
            {
                
            
            int i=stat.executeUpdate(query);
            if(i>0)
            {
                out.print("<script>alert('Deleted Successfully')</script>");
                
            }
            else  out.print("<script>alert('Error in deletion')</script>");
        }}
    }catch(Exception ex ){ex.printStackTrace();}

%>