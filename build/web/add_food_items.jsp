<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>    
<html>    

<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add food item</title>
    

<style>
    
   body{
        font-family: 'Baloo Bhai 2', cursive;
        margin: 0px;
        padding: 0px;
        
        background:url(bg1.jpg);
        background-repeat: no-repeat;
        background-size: 100%;
    }
    
    .btn{
        margin: 0px 9px;
        margin-top: 5px;
        background-color:darkcyan;
        color: white;
        padding: 2px 5px;
        border: 2px solid rgb(90, 89, 89);
        border-radius: 10px;
        cursor: pointer;
    }

    .container{
        border: 0px transparent;
        margin-top: 160px;
        margin-left: 700px;
        padding: 11px 11px;
        width: 30%;
        border-radius: 36px;
        background:url(bg2.jpg);
        background-repeat: no-repeat;
        background-size: 100%;
        align-items: center;
        justify-content: center;
    }

    .form-group input{
        text-align: center;
        justify-content: center;
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
        <h2>ADD FOOD ITEM</h2>
        <form >
            <div class="form-group">
                <label><b>Item category </b></label>
                <input type="text" name="category" placeholder="Enter Item Category">
            </div>
            
            <div class="form-group">
                <label><b>Item Name</b></label>
                <input type="text" name="fname" placeholder="Enter Item Name">
            </div>
            <div class="form-group">
                <label><b>Price</b></label>
                <input type="text" name="price" placeholder="Enter Price">
            </div>
            
          
            <button class="btn" name="btn_add">Add</button>
            
        </form> 
    </div>  
</body>
</html>


<%
    try{
        if(request.getParameter("btn_add")!=null)
        {
            
            Connection conn=null;
            Statement stat=null;
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
            stat=conn.createStatement();
            
            String query="insert into food_items(fname,price,category)values('"+request.getParameter("fname")+"',"+request.getParameter("price")+",'"+request.getParameter("category")+"')";
            String queryToFindDuplicate =" SELECT * FROM food_items where fname='"+request.getParameter("fname")+"'";
       
            Statement statementForDuplicate=conn.createStatement();
            ResultSet rsd=statementForDuplicate.executeQuery(queryToFindDuplicate);
            boolean status=rsd.next();
            if(status)
            { 
                out.print("<script>alert('Food item already exists !!!')</script>");
            }
            else
            {
                
            
            int i=stat.executeUpdate(query);
            if(i>0)
            {
                out.print("<script>alert('Added Successfully')</script>");
                
            }
            else  out.print("<script>alert('Error in insertion')</script>");
        }}
    }catch(Exception ex ){ex.printStackTrace();}

%>