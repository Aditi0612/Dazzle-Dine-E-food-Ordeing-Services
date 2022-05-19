
<%@page import="java.sql.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.lang.*"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Employee Status</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="UTF-8">
<style>
    body{
        font-family: 'Baloo Bhai 2', cursive;
        margin: 0px;
        padding: 0px;
        
        background-color: rgba(255, 99, 71, 0.5);
        color: #ffffff;
    }
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
    background-color: rgba(255, 99, 71, 0.5);
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
            .enhance{
                color: blue;
                border-radius: 20px;
                padding: 0px 10px;
                text-decoration: none;
                font-family: 'Baloo Tamma 2', cursive;
                margin: 4px;
                display: block;
                background-color: greenyellow;
                border-radius: 20px;
                width: 200px;
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
        <br> <br> <br> <br> <br><br> <br> <br> <br> <br>
         
        <center> <h1>&mdash;  ORDER ASSIGNED &mdash; </h1> 
        <br>
        <br><br> <br>
        <a href="assign_order.jsp">Back To Previous Page</a><br> <br> <br>
           </center> </div>
        <%   
   
  String id=request.getParameter("id");

    try{
            float k,gst,amt=0.0f;
            String category=null;
            Connection conn=null;
            Statement stat=null;
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
            stat=conn.createStatement();
            Statement stat_to_insert=conn.createStatement();
            Statement stat_to_update=conn.createStatement();
           
            PreparedStatement pst = conn.prepareStatement("Update employee set Employee_status='Occupied' where email=?");
            pst.setString(1,id);
            
            pst.executeUpdate(); 
            
             
            String query="SELECT email FROM mycart  where Order_status like('Pending')  ";
            ResultSet rs =stat.executeQuery(query);
            rs.first();
            String cname=rs.getString(1);
            
            PreparedStatement pstat = conn.prepareStatement("Select sum(total) from mycart where email=? ");
                    
                    pstat.setString(1, cname);
                    ResultSet rss = pstat.executeQuery();
                    while (rss.next()) 
                    {
                    k=rss.getFloat(1);
                    gst=(k/20) ;
                    amt=k+gst;
                    
                    }            
            
            
            
            String query_to_insert="insert into assigned_order(employee_id,customer_id,Bill_Amount)values('"+id+"','"+cname+"',"+amt+")";
             
            int i=stat_to_insert.executeUpdate(query_to_insert);
            
            String query_to_update="Update mycart set Order_status='Assigned' where email like ('"+cname+"')";
            int j=stat_to_update.executeUpdate(query_to_update);
            
    
                   
                    
           
    
    
    
    }catch(Exception ex ){ex.printStackTrace();}

%> 
         







     



</body>
</html>