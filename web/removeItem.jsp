<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.lang.*"%>
<% 
    String email=(String)session.getAttribute("user");
    String product_id=request.getParameter("id");
    try
{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
    Statement stmt = conn.createStatement();
    stmt.executeUpdate("delete from mycart where email='"+email+"' and fname='"+product_id+"' ");
    response.sendRedirect("myCart.jsp?msg=removed");
}
catch(Exception e){
System.out.println(e);}
%>