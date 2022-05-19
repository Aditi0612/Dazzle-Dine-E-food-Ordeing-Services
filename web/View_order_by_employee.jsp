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
        <title>View Order</title>
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
                <h1>&mdash; Dazzle 'n Dine &mdash; </h1>
                <h4>&mdash; A-12, Vasant Kunj, Delhi-110095 &mdash;
                    <br>
                       &mdash; Email : dazzlendine@gmail.com &mdash;
                        <br>
                        &mdash; Contact no. +91 9298082089 &mdash; </h4>
                <h2><b>&mdash; Order &mdash;</b> </h2>
                <h4><b>&mdash; Collect Cash on Delivery &mdash;</b> </h4>
                
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
              <%
                  String employee=(String)session.getAttribute("emp");
                  
                
                try {
                    Float i,gst,amt;
                    int sno=0;
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                    Statement stmt = conn.createStatement();
                    PreparedStatement pst = conn.prepareStatement("Select customer_id from assigned_order where employee_id=? and payment_status like ('Not Paid')");
                    pst.setString(1, employee);
                    ResultSet rst = pst.executeQuery();
                    if(rst.next())
                        
                    {
                        
                    
                    rst.first();
                    String customer=rst.getString(1);
                    
                    PreparedStatement pstt = conn.prepareStatement("Select * from food_items inner join mycart  where mycart.fname=food_items.Fname and mycart.email=? ");
                    pstt.setString(1, customer);
                    PreparedStatement pstat = conn.prepareStatement("Select sum(total) from mycart where email=? ");
                    
                    pstat.setString(1, customer);
                    PreparedStatement psta = conn.prepareStatement("Select cname from customer c,assigned_order a where c.email=? and a.payment_status like('Not Paid')");
                    psta.setString(1, customer);
                    ResultSet rs = pstt.executeQuery();
                    ResultSet rss = pstat.executeQuery();
                    ResultSet rsss = psta.executeQuery();
                    
                    while (rs.next()) {
                        sno=sno+1;
            %>
            
            <tbody>
                <tr>
                    <td><%out.println(sno);%></td>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(8)%></td>
                    <td><%=rs.getString(9)%></td>
                    
                </tr>
            </tbody>
             
            <%}
            String cust_name="No order available";
            while (rss.next()) {
                    i=rss.getFloat(1);
                    gst=(i/20) ;
                    amt=i+gst;

            %>
            
            <caption style="caption-side:bottom" > <br><br> Sum (in Rs.): <%=i%> /-
                            <br> TAX (in Rs.): <%=gst%> /-
                            <br> Total Collectable Amount(in Rs.):<%=amt%> /-</caption> 
                        
                        <% }
                        
                        while (rsss.next()) {
                        cust_name=rsss.getString(1);
                        }%>
                        
                    <p> Customer Name : <%=cust_name%> <br></p>

            
             <%      
            %>
            <%
                }
else {
 %>
                <script type="text/javascript">
                    alert(" Order Not Available !!!!");
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
    <h3><center><a href="update_payment_status.jsp">&mdash;&mdash;&mdash; COLLECT CASH &mdash;&mdash;&mdash;</a> </center></h3>
</html>