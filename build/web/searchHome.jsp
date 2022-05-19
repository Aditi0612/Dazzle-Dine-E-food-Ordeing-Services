<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.lang.*"%>
<%@include file="header.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
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
            .heading a {
      float: left;
      display: block;
      color: black;
      text-align: center;
      padding: 14px 16px;
      text-decoration: none;
      font-size: 17px;
    }
    
    .heading a:hover {
      background-color: #ddd;
      color: black;
    }
    
    .heading a.active {
      background-color: #2196F3;
      color: white;
    }
    h3{
	color: yellow;
	text-align: center;
    }

        </style>
</head>
<body>
<
<table class="table sticky">
        <thead>
          <tr>
            
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
          </tr>
        </thead>
        <tbody>
<%
    int z=0;
                try {
                    
                    String search=request.getParameter("search");
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                    Statement stmt = conn.createStatement();
                    //String str = ("Select * from food_items where fname like '%"search"%' or category like '%"search"%' ");
                    ResultSet rs = stmt.executeQuery("Select * from food_items where fname like '%"+search+"%' or category like '%"+search+"%' ");
                    while (rs.next()) {
                        z=1;
            %>
          <tr>
            <td><%=rs.getString(1)%></td>
            <td><%=rs.getString(3)%></td>
            
            <td><i class="fa fa-inr"></i><%=rs.getString(2)%></td>
            <td><a href="addToCartAction.jsp?id=<%=rs.getString(1)%>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
          </tr>
         <%}
            %>
            <%
                } catch (Exception e) {
                    out.println(e);
                }


            %>
        </tbody>
        
      </table>
            <% if(z==0) { %>
	<h1 style="color:white; text-align: center;">Nothing to show</h1>
        <% } %>

</body>
</html>