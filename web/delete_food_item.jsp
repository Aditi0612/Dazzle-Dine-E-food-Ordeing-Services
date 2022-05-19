<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>    
<html>    

<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete food item</title>
    

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
        <h2>DELETE FOOD ITEM</h2>
        <form >
            
            
            <div class="form-group">
                <label><b>Item Name</b></label>
                <input type="text" name="fname" placeholder="Enter Item Name">
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
            String str=request.getParameter("fname");
            String query="delete from food_items where fname like '%"+str+"%'";
            String queryToFindItem =" SELECT * FROM food_items where fname='"+request.getParameter("fname")+"'";
       
            Statement statementForDuplicate=conn.createStatement();
            ResultSet rsd=statementForDuplicate.executeQuery(queryToFindItem );
            boolean status=rsd.next();
            if(!status)
            { 
                out.print("<script>alert('Food item do not exist !!!')</script>");
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