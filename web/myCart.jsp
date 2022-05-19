<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.lang.*"%>
<%@include file="header.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>
<%
    String msg = request.getParameter("msg");
    if("notPossible".equals(msg))
    {
%>
<h3 class="alert">There is only one Quantity! So click on remove!</h3>
<% } 
%>

<%
    if("inc".equals(msg))
    {
%>
<h3 class="alert">Quantity  Increased Successfully!</h3>
<% } 
%>

<%
    if("dec".equals(msg))
    {
%>
<h3 class="alert">Quantity  Decreased Successfully!</h3>
<% } 
%>

<%
    if("removed".equals(msg))
    {
%>
<h3 class="alert">Product Successfully Removed!</h3>
<% } 
%>
<table>
<thead
    <%
     int total=0;
     int sno=0;
try
{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
    Statement stmt = conn.createStatement();
    ResultSet rs1 = stmt.executeQuery("Select sum(total) from mycart where email='"+email+"' ");
    while(rs1.next())
    {
        total=rs1.getInt(1);
    }
%>
        <tr>
        <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i> <% out.println(total); %></th>
        <% if(total>0) { %>   
        <th scope="col"><a href="bill.jsp">Proceed to order</a></th> <% } %>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
            <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody>
      
            <% ResultSet rs = stmt.executeQuery("select * from food_items inner join mycart on food_items.Fname=mycart.fname and mycart.email='"+email+"'");
            while(rs.next())
            {
            %>
            
          <tr>
              <% sno = sno + 1;%>
           <td><% out.println(sno); %></td>
           <td><%=rs.getString(1)%></td>
            <td><%=rs.getString(3)%></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(2)%></td>
            <td><a href="quantityAction.jsp?id=<%=rs.getString(1) %>&quantity=inc"><i class='fas fa-plus-circle'></i></a> <%=rs.getString(8)%> <a href="quantityAction.jsp?id=<%=rs.getString(1) %>&quantity=dec"><i class='fas fa-minus-circle'></i></a></td>
            <td><i class="fa fa-inr"></i><%=rs.getInt(9)%> </td>
            <td><a href="removeItem.jsp?id=<%=rs.getString(1) %>">Remove <i class='fas fa-trash-alt'></i></a></td>
          </tr>
          <%
              }
}
catch(Exception e){}
%>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>