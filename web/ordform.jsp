
<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.lang.*"%>
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
        <select name="category" id="category" onchange="this.form.submit();">
            <option value="-1">----Select Category----</option>
            <%
                try
                {                    
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                    Statement stmt = conn.createStatement();
                    String str = "Select * from food_items";
                    ResultSet rs = stmt.executeQuery(str);
                    while (rs.next()) 
                    {
                        %>
                        <option value="<%=rs.getString("category")%>"
                                <% 
                                    if(request.getParameter("category") != null)
                                    {
                                        if(rs.getInt("fid")==Integer.parseInt(request.getParameter("category")))
                                        {
                                            out.print("selected");
                                        }
                                    }
                                %>
                                ><%=rs.getString("category")%></option>
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
        
        <label style="margin-right: 10px;">Food Item : </label>
        <select class="form-control" style="width: 250px;">
            <option value="-1">----Select Food Item----</option>
            <%
                try
                {  
                    String str = "Select * from food_items where category=?";
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                    Statement stmt = conn.createStatement();
                    PreparedStatement psmt=conn.prepareStatement(str);
                    psmt.setString(1,request.getParameter("category"));
                    ResultSet rs = psmt.executeQuery(str);
                    while (rs.next()) 
                    {
                        %>
                        <option value="<%=rs.getString("fname")%>"><%=rs.getString("fname")%></option>
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
