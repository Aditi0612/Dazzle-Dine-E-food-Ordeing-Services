<%-- 
    Document   : cnfrm_order
    Created on : 22 Mar, 2022, 2:56:08 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirm Order</title>
    <style>
        body{
            background: url('ordr.jpg') no-repeat center center/cover;
            height: 700px;
            width: 720px;
            color: rgb(3, 41, 41);
        }
        .container{
            width: 600px;
            height: 400px;
            padding-top: 15px;
            margin-left: 580px;
        }

        .order{
            height: 200px;
            width: 230px;
            padding-top: 8px;
            margin: 30px;
            align-items: center;
        }

        .order img{
            height: 100%;
            width: 100%;
            margin-left: 600px;
        }

        /*.container p{
            text-align: center;
            font-size: 1.8rem;
            width: 550px;
            margin-bottom: 20px;
        }
        */

        .container a{
            align-items: center;
            justify-content: center;
            margin-left: 30px;
            font-size: 1.2rem;
        }
    </style>
</head>
<body>
    <div class="order">
        <img src="order.jpg" alt="">
    </div>
    <div class="container">
       <h1>Order Placed successfully!</h1>
       <a href="feedback_page.jsp">Kindly give your valuable feedback</a>
       <a href="thankyou.jsp">Skip</a>
    </div>
</body>
</html>