<%@page import="java.sql.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.lang.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show Order</title>
        <style>
    #navbar{
    position: sticky;
    display: flex;
    align-items: center;
    top: 0px;
    left: 0px;
    height: 60px;
    width: 100%;
}

#navbar::before{
    content: "";
    height: 100%;
    background-color:rgba(100, 100, 9, 0.541); 
    width: 100%;
    position: absolute;
    z-index: -1;
    /* opacity: 0.5; */
}

/* Navigation Bar : Logo and img*/
#logo{
    margin: 7px 7px;
}

#logo img{
 height: 53px;
 margin: 7px 7px;
 width: 56px;
}


#navbar ul{
    display: flex;
    list-style: none;
}

#navbar ul li{
    font-size: 1.15rem;
    
}

#navbar ul li a{
    color: white;
    display: block;
    border-radius: 20px;
    padding: 0px 10px;
    text-decoration: none;
    font-family: 'Baloo Tamma 2', cursive;
    margin: 4px;
    position: relative;
    left : 1200px;
}
#navbar ul li a:hover{
    color: blue;
    background-color: white;
}


#navbar li:hover .submenu > li{
    display: block;
    flex-direction: column;
    top: 0px;
}
.heading{
    background-color: #cb202d;
    color: #ffffff;
    margin-bottom: 30px;
    padding: 20px 0 10px 0;
    text-align: center;
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
        <nav id="navbar">
        <div id="logo">
            <img src="Dazzle 'n Dine.png" alt="Dazzle 'n Dine.com">
        </div>
        
    </nav>
       

<div class="heading">
                <h3>&mdash; ORDER DETAILS &mdash; </h3>
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
                  String customer=request.getParameter("customer"); 
                
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                    Statement stmt = conn.createStatement();
                    PreparedStatement pst = conn.prepareStatement("Select * from mycart where email=? ");
                    pst.setString(1, customer);
            
                    ResultSet rs = pst.executeQuery();  
                    while (rs.next()) {
            %>
            <tbody>
                <tr>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    
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