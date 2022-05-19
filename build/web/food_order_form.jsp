<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.lang.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Form</title>
        <style>
            select{
                height: 25px;
                width: 250px;
            }
        </style>
    </head>
    <body>
        <br><br><br>
    <center>
        <label style="margin-right: 10px;">Category : </label>
        <select name="item_category" >
            <option >----Select Category----</option>
            <%
                try
                {       
                    
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                    Statement stmt = conn.createStatement();
                    String str = "Select distinct ltrim(category)  from food_items";
                    ResultSet rs = stmt.executeQuery(str);
                    while (rs.next()) 
                    {
                        
                        
                        %>
                        <option><%=rs.getString(1)%></option>
                        <%
                    }
                }
                catch(Exception ex)
                {
                    ex.printStackTrace();
                    out.println("Error "+ex.getMessage());
                }
                
                
            %>
        </select>
        
        
           
    </center>
    </body>
</html>