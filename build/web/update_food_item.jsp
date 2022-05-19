<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>    
<html>    

<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update food item</title>
    

<style>
    
    body{
        font-family: 'Baloo Bhai 2', cursive;
        margin: 0px;
        padding: 0px;
        
        background:url(bg1.jpg);
        background-repeat: no-repeat;
        background-size: 1300px 720px;
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
        margin: 120.7px 650px;
        padding: 38px 38px;
        width: 35%;
        border-radius: 26px;
        background:url(bg2.jpg);
        background-repeat: no-repeat;
        background-size: 520px 380px;
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
        <h2>UPDATE FOOD ITEM</h2>
        <form >
            <div class="form-group">
                <label><b>Item Name</b></label>
                <input type="text" name="name" placeholder="Enter Name">
            </div>
            
            <div class="form-group">
                <label><b>Item Price</b></label>
                <input type="text" name="price" placeholder="Enter Price">
            </div>
            <div class="form-group">
                <label><b>Item Category</b></label>
                <input type="text" name="category" placeholder="Enter Category">
            </div>
            
            
            
            <button class="btn" name="btn_upd">UPDATE</button>
            
            
            
            
            
            
        </form> 
    </div>  
</body>
</html>


<%
    String uname=request.getParameter("name");
    String uprice=request.getParameter("price");
    String ucategory=request.getParameter("category");
    try{
        if(request.getParameter("btn_upd")!=null)
        {
            
            Connection conn=null;
            Statement stat=null;
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
            PreparedStatement ps=conn.prepareStatement("update food_items set price=?,category=? where fname=?");
            ps.setString(3, uname);
            ps.setString(2, ucategory);
            ps.setString(1, uprice);
            int i=ps.executeUpdate();
            if(i>0)
            {
                out.print("<script>alert('Item Updated Successfully')</script>");
                
            }
            else  out.print("<script>alert('Error in updation')</script>");
        
       }
    }
    
        catch(Exception ex ){ex.printStackTrace();}

%>