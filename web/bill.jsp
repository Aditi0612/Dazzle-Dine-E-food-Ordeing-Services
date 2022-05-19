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
        <title>Show Bill</title>
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


/*Navigation Bar: List Items*/
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

/*Dropdown menu css*/
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
                <h1>&mdash; Dazzle 'n Dine &mdash; </h1>
                <h4> Cannaught Place, New Delhi, India
                    <br>
                        Email : dazzlendine@gmail.com 
                        <br>
                         Contact no. +91 0000000000  </h4>
                <h2><b>&mdash; BILL &mdash;</b> </h2>
                <h4><b><span>&#42;</span> Pay by Cash on Delivery(COD)</b> </h4>
                
            </div>
<center>
    
    
    
    
    
      <table class="table sticky">
            <thead>
                
  <tr>
    <th>S.No</th>
    <th>Product Name</th>
    <th>category</th>
    <th>Price</th>
    <th>Quantity</th>
     <th>Sub Total</th>
  </tr>
  
            </thead>
            <h3>Product Details</h3>
              <%
                  String email=(String)session.getAttribute("user");
                  
                try {
                Class.forName("com.mysql.jdbc.Driver");
                  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                  Statement stmt = conn.createStatement();
                 int total=0;
                    int sno=0;
                   int gst,amt;
                    
                    PreparedStatement pstat = conn.prepareStatement("Select sum(price) from mycart where email=? ");
                    pstat.setString(1, email);
                    PreparedStatement psta = conn.prepareStatement("Select cname from customer where email=? ");
                    psta.setString(1, email);
                    
                    PreparedStatement pstaa = conn.prepareStatement("Select address from customer where email=? ");
                    pstaa.setString(1, email);
                    
                    PreparedStatement pstaaa = conn.prepareStatement("Select phone_number from customer where email=? ");
                    pstaaa.setString(1, email);
                    
                    ResultSet rss = pstat.executeQuery();
                    ResultSet rsss = psta.executeQuery();
                    while (rsss.next()) {%>
                    <p> Customer Name : <%=rsss.getString(1)%> <br></p>

            
             <% }     
                    ResultSet rsss1 = pstaa.executeQuery();
                    while (rsss1.next()) {%>
                    <p> Customer Address: <%=rsss1.getString(1)%> <br></p>

            
             <% }     
                    ResultSet rsss2 = pstaaa.executeQuery();
                    while (rsss2.next()) {%>
                    <p> Customer Contact No. : <%=rsss2.getString(1)%> <br></p>

            
             <% }    

                    ResultSet rs1 = stmt.executeQuery("Select * from food_items inner join mycart  where mycart.fname=food_items.Fname and mycart.email='"+email+"' ");
                    while (rs1.next()) {
                        sno=sno+1;
            %>
            
            <tbody>
                <tr>
                    <td><%out.println(sno);%></td>
                    <td><%=rs1.getString(1)%></td>
                    <td><%=rs1.getString(3)%></td>
                    <td><%=rs1.getString(2)%></td>
                    <td><%=rs1.getString(8)%></td>
                    <td><%=rs1.getString(9)%></td>
                    
                </tr>
            </tbody>
             
            <%}
ResultSet rs2 = stmt.executeQuery("Select sum(total) from mycart where email='"+email+"' ");
    while(rs2.next())
    {
        total=rs2.getInt(1);
    }
            while (rss.next()) {
                    gst = (total/20) ;
                    amt=total+gst;

            %>
            
            <caption style="caption-side:bottom" > <br><br> Total (in Rs.): <%out.println(total);%> /-
                            <br> TAX (in Rs.): <%=gst%> /-
                            <br> Total Payable Amount(in Rs.):<%=amt%> /-</caption> 
                        
                        <% }
                         
            %>
            <%
                } catch (Exception e) {
                    out.println(e);
                }


            %>
       
        

   
    
    
    </table> 
                    </center>
    </body>
    <h3> <center>&mdash;&mdash;&mdash; THANK YOU &mdash;&mdash;&mdash; <br><br>
        <a href="cnfrm_order.jsp">Confirm Order</a></center></h3>
</html>