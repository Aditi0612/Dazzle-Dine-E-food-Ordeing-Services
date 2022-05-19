<%-- 
    Document   : dummyMenu
    Created on : 7 Apr, 2022, 1:15:21 AM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.lang.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%--html>
<head>
    <title>Restaurant Menu</title>
  <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <!--link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&display=swap" rel="stylesheet"-->
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700;900&family=Mukta:wght@300;400;600;700;800&family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="menustyle.css">
</head>
</html--%>
<html>
    <head>
        <title>Restaurant Menu</title>
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
                font-size: 30px;
                position: absolute;
                top: -9px;
                left: 9px;
                color: #FFF;
            }
            .table.sticky tbody tr td a{
                color: blue;
                border-radius: 20px;
                padding: 0px 10px;
                text-decoration: none;
                font-family: 'Baloo Tamma 2', cursive;
                margin: 4px;
                display: block;
                background-color: greenyellow; 
            }
            

        </style>
    </head>
    <body>
        <div class="menu">
            <div class="heading">
                <h1>Dazzle 'n Dine</h1>
                <h3>&mdash; MENU &mdash; </h3>
            </div>
        </div>
    <center>
        <table class="table sticky">
            <thead>
                <tr>
                    
                    <th>Item Name</th>
                    <th>Price(in Rs.)</th>
                    <th>Category</th>
                </tr>
            </thead>
            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                    Statement stmt = conn.createStatement();
                    String str = "Select * from food_items";
                    ResultSet rs = stmt.executeQuery(str);
                    while (rs.next()) {
                        String id = rs.getString("fname");
            %>
            <tbody>
                <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    
                </tr>
            </tbody>
            <%}
            %>
            <%
                } catch (Exception e) {
                    out.println(e);
                }


            %>
        </table>
        
    </center>
</body>
</html>
