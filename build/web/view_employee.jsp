<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.lang.*"%>
<%@page import="javax.servlet.ServletContext"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%--html>
<head>
    <title>Employee Details</title>
  <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <!--link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&display=swap" rel="stylesheet"-->
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700;900&family=Mukta:wght@300;400;600;700;800&family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="menustyle.css">
</head>
</html--%>
<html>
    <head>
        <title>Employee Details</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="UTF-8">
        <style>
            *{
                margin: 0px;
                padding: 0px;
            }
            /*.body{
                background-image: url(menu.jpg);
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
                height: 100vh;
            }*/            
                .heading{
                background-color: #cb202d;
                color: #ffffff;
                margin-bottom: 30px;
                padding: 120px 0 30px 0;
                grid-column: 1/-1;
                text-align: center;
            }
            h1{
                text-shadow: 1px 1px 1px blue,2px 2px 1px red;
                text-align: center;
            }
            .heading>h1{
                font-weight: 400;
                font-size: 30px;
                letter-spacing: 10px;
                margin-bottom: 10px;
            }
            .heading>h3{
                font-weight: 600;
                font-size: 22px;
                letter-spacing: 5px;
            }
            .table{
                font-family: 'Poppins',sans-serif;
                border-collapse: collapse;
            }
            .table.sticky th{
                position: sticky;
                top: 0px;
            }
            .table.sticky th::after{
                
                content: '';
                width: 100%;
                height: 2px;
                position: absolute;
                bottom: 0;
                left: 0;
                background: black;
            }
            .table.sticky{
                margin: 25px 0;
                min-width: 400px;
                border-radius: 5px 5px 0 0;
                overflow: hidden;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
            }
            .table.sticky thead tr {
                background-color: #009879;
                color: #ffffff;
                text-align: left;
                font-weight: bold;
            }
            .table.sticky th,
            .table.sticky td {
                padding: 12px 15px;
            }
            .table.sticky tbody tr {
                border-bottom: 1px solid #dddddd;
            }
            .table.sticky tbody tr:nth-of-type(even) {
                background-color: #f3f3f3;
            }
            /*.table.sticky tbody tr:last-of-type {
                 border-bottom: 2px solid #009879;
            }
            .table.sticky tbody tr.active-row {
                 font-weight: bold;
                 color: #009879;
            }*/
            .additem{
                background-color: #cb202d;
                border: none;
                color: #ffffff;
                font-size: 50px;
                font-weight: 1000;
                border-radius: 20px;
                width: 200px;
            }
            #buttonText
            {
                font-size: 280px;
                position: absolute;
                top: -9px;
                left: 9px;
                color: #FFF;
            }
            

        </style>
    </head>
    <body>
        <div class="menu">
            <div class="heading">
                <h1>Dazzle 'n Dine</h1>
                <h3>&mdash; EMPLOYEE DETAILS &mdash; </h3>
            </div>
        </div>
        <center>
            <form action="" method="get">
                <label><b>User Name</b></label>
                <input class="form-control" type="email" name="email" placeholder="Enter Username">
                

                <button class="btn" name="btn_search">Search</button>
            </form>
        
        <table  class="table sticky">
            <thead>
                <tr>
                  
                    <th>Employee Name</th>
                    <th>Phone Number</th>
                    <th>Address</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Date Of Joining</th>
                </tr>
            </thead>
            <%
                try {
                    
                    
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                    Statement stmt = conn.createStatement();
                    String str ;
                    
                    
                    String query = request.getParameter("email");
             
                    if((query!=null) && (request.getParameter("btn_search")!=null))
                    {
                        str= "Select * from employee where email like '%"+query+"%'";
                    }
                    
                    else
                    {
                      str = "Select * from employee order by ename ";
                    }
                    
                    
                    ResultSet rs = stmt.executeQuery(str);
                    while (rs.next()) {
            %>
            <tbody>
                <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getString(5)%></td>
                    <td><%=rs.getString(6)%></td>
                    
                </tr>
            </tbody>
            <%}
                
            if(!rs.first())
                    { 
                        %>
                <script type="text/javascript">
                    alert("No Record Found!!!!");
                </script>
                <%
                    }
                
                } catch (Exception e) {
                    out.println(e);
                }


            %>
        </table>
         
    </center>
       
        
      
    
    
    
</body>
</html>
 
            
            
            
  