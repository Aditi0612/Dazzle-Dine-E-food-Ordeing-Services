<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.SQLException" %>
<%
String email=(String)session.getAttribute("user");
String product_name=request.getParameter("id");
int quantity=1;
int product_price=0;
int product_total=0;
int cart_total=0;
int z=0;
try{
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
    Statement stmt =con.createStatement();
    ResultSet rs = stmt.executeQuery("select * from food_items where Fname='"+product_name+"' ");
    
    while(rs.next())
    {
       product_price = rs.getInt(2);
       product_total=product_price;
    }
    ResultSet rs1 = stmt.executeQuery("select * from mycart where Fname='"+product_name+"' and email='"+email+"'  ");
    while(rs1.next())
    {
       cart_total=rs1.getInt(6);
       cart_total=cart_total+product_total;
       quantity=rs1.getInt(5);
       quantity=quantity + 1;
       z=1;
    }
    if(z==1)
    {
        stmt.executeUpdate("update mycart set total="+cart_total+",quantity="+quantity+" where Fname='"+product_name+"' and email='"+email+"'  ");
         response.sendRedirect("menutable.jsp?msg=exist");
    }
    
    if(z==0)
    {
       
           PreparedStatement ps=con.prepareStatement("insert into mycart(email,fname,price,quantity,total) values(?,?,?,?,?)");
           //ps=con.prepareStatement("insert into order(email,item_id,quantity,price,total) values(?,?,?,?,?)");
                ps.setString(1, email);
                ps.setString(2, product_name);
                ps.setInt(4, quantity);
                ps.setInt(3, product_price);
                ps.setInt(5, product_total);
                ps.executeUpdate();
                response.sendRedirect("menutable.jsp?msg=added");
            
       
                
            
    }
}
catch(Exception e)
{
   System.out.println(e); 
   response.sendRedirect("menutable.jsp?msg=invalid");
}
%>


