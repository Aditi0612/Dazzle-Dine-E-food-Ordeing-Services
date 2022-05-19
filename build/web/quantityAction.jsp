<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.lang.*"%>

<%
String email=(String)session.getAttribute("user");
String id=request.getParameter("id");
String incdec=request.getParameter("quantity");
int price=0;
int total=0;
int quantity=0;
int final_total=0;
try
{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("Select * from mycart where email='"+email+"' and fname='"+id+"' ");
    while(rs.next())
    {
        price=rs.getInt(3);
        total=rs.getInt(6);
        quantity=rs.getInt(5);
    }
    if(quantity == 1 && incdec.equals("dec"))
        response.sendRedirect("myCart.jsp?msg=notPossible");
    else if(quantity != 1 && incdec.equals("dec"))
    {
        total=total-price;
        quantity=quantity-1;
        stmt.executeUpdate("update mycart set total='"+total+"',quantity='"+quantity+"' where email='"+email+"' and fname='"+id+"'");
        response.sendRedirect("myCart.jsp?msg=dec");
    }
    else
    {
        total=total+price;
        quantity=quantity+1;
        stmt.executeUpdate("update mycart set total='"+total+"',quantity='"+quantity+"' where email='"+email+"' and fname='"+id+"'");
        response.sendRedirect("myCart.jsp?msg=inc");
    }
}
catch(Exception e){
System.out.println(e);}
%>