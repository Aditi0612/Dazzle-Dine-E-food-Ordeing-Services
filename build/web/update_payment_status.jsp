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
        <title>Update payment status</title>
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
.form-group input{
        text-align: center;
        display: block;
        width: 310px;
        padding: 1px;
        border: 2px solid gray;
        margin: 6px auto;
        border-radius: 10px;
        font-size: 15px;
        font-family: 'Baloo Tamma 2', cursive;
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
                
                <h4><b>&mdash; Collect Cash on Delivery &mdash;</b> </h4>
                
            </div>
<center>
    <br><br>
    <form >
            <div class="form-group">
                <label><b>Payment Received</b></label>
                <input type="Float" name="amount" placeholder="Enter Payment Received">
            </div>
      <br><br><br><br>
    
            <button class="btn" name="btn_proceed">Proceed to complete delivery</button>
    
    
    </form> 
</center>  






<%
    try{
        if(request.getParameter("btn_proceed")!=null)
        {
            int amt = Math.round(Float.parseFloat(request.getParameter("amount"))); 
            
            
            String employee=(String)session.getAttribute("emp");
            Connection conn=null;
            Statement stat=null;
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
            stat=conn.createStatement();
            
            PreparedStatement pst = conn.prepareStatement("Select customer_id,Bill_Amount from assigned_order where employee_id=? and payment_status like ('Not Paid')");
            pst.setString(1, employee);
            
            ResultSet rs = pst.executeQuery();
            if(!rs.next())
            {
                 %>
                <script type="text/javascript">
                    alert(" No Order Yet !!!!");
                </script>
                <%
            }
            rs.first();
            int amnt=0;
             amnt=Math.round(rs.getFloat(2));
            //out.println("Payment To Be Collected (in Rs.):"+amnt);
            
            String customer=rs.getString(1);
            %>
            <center><p>
                    Payment To Be Collected (in Rs.):<%=amnt%> /-         </p> </center>
                <%
            if(amt==amnt)     
            {
                 %>
                <script type="text/javascript">
                    alert(" Payment Received !!!!");
                </script>
                <%
                
                PreparedStatement query_to_delete=conn.prepareStatement("DELETE FROM mycart WHERE email=?");
                query_to_delete.setString(1, customer);
                query_to_delete.executeUpdate();
                
                PreparedStatement query_to_update=conn.prepareStatement("update employee set employee_status='Available' WHERE email=?");
                query_to_update.setString(1, employee);
                query_to_update.executeUpdate();
                
                PreparedStatement query_to_update_payment_status=conn.prepareStatement("update assigned_order set payment_status='Paid' WHERE customer_id=?");
                query_to_update_payment_status.setString(1, customer);
                query_to_update_payment_status.executeUpdate();
                
                response.sendRedirect("order_complete.jsp");
            }
            else
            {
                %>
                <script type="text/javascript">
                    alert("Inappropriate Payment Received !!!!");
                </script>
                <%
                
            }
        }
        
    }catch(Exception ex ){ex.printStackTrace();}

%>
</body>
</html>