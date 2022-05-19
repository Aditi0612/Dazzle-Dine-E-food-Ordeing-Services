<%-- 
    Document   : orderf
    Created on : 17 Mar, 2022, 5:12:21 PM
    Author     : HP
--%>

<%@page import="java.sql.*"%>
<%@page import="java.awt.event.*"%>
<%@page import="javax.swing.*"%>
<%@page import="java.lang.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            JFrame p1;
            JLabel Rno;
            p1=new JFrame();
            Rno=new JLabel("Enter the Roll Number");
            Rno.setBounds(10,50,150,20);
            p1.add(Rno);
        %>
    </body>
</html>
