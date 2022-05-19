<%@page import="java.sql.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.lang.*"%>
<html>  
<body>  

<table class="table sticky">
            <thead>
                <tr>
                  
                    <th>email</th>
                    <th>fname</th>
                    <th>price</th>
                    <th>category</th>
                    <th>order_status</th>
                    <th>time</th>
                </tr>
            </thead>
              <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                    Statement stmt = conn.createStatement();
                    String query="SELECT * FROM mycart where Order_status like('Pending') ORDER BY Time_of_order_placed ASC ";
                    ResultSet rs =stmt.executeQuery(query);  
                    rs.first();
            %>
            <tbody>
                <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getString(5)%></td>
                    <td><%=rs.getString(6)%></td>
                    
                </tr>
            </tbody>
            <%}
            
                 catch (Exception e) {
                    out.println(e);
                }


            %>
        </table>
</body>  
</html>  