
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>    
<html>    

<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delivery Completed</title>
    

<style>
    
    body
    {
        font-family: 'Baloo Bhai 2', cursive;
        margin: 0px;
        padding: 0px;
        
        background:url(order_complete.png);
        background-repeat: no-repeat;
        background-size: 1300px 660px;
        
        
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

    
    
</style>

</head>
<body >
      <div class="container">
          
        <form >
            <br>
            <br>
            
            <button class="btn" name="btn_return">Return To Homepage</button>
            
            
           
        </form> 
    </div>  
</body>
</html>





<%
    try{
        if(request.getParameter("btn_return")!=null)
        {
            
                response.sendRedirect("homepage.jsp");
            
        }
        
    }catch(Exception ex ){ex.printStackTrace();}

%>



