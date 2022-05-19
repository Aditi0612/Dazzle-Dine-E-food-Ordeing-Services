<%-- 
    Document   : address
    Created on : 22 Mar, 2022, 2:49:04 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirm Address</title>
    <style>
        body{
            background: url('add6.jpg') no-repeat center center/cover;
            height: 715px;
            color: rgb(17, 17, 77);
        }
         
        .form-group{
            align-items: center;
            justify-content: center;
            margin-top: 140px;
            margin-left: 580px;
            padding: 1px;
            width: 300px;
            height: 300px;
            font-size: 1.8rem;
        }

        .form-group textarea{
               border-radius: 20px;
               resize: none;
               padding: 20px;
        }
        
        h1{
            align-items: center;
            justify-content: center;
            margin-left: 490px;
            margin-top: 30px;
        }
        
        .a1{
            border: 2px solid rgb(228,159,68);
            border-radius: 30px;
            padding: 10px;
            margin-left: 660px;
            margin-right: 20px;
            text-decoration: none;
            background-color: rgb(243, 236, 224);
            font-size: 1.12rem;
            width: 40px;
        }
        .a2{
            border: 2px solid rgb(228, 159, 68);
            border-radius: 30px;
            padding: 10px;
            text-decoration: none;
            background-color: rgb(243, 236, 224);
            font-size: 1.12rem;
        }

    </style>
</head>
<body>
    
</body>
    <h1 class>Kindly confirm your delivery address</h1>
    <form action="">
        <div class="form-group">
            <label for="name">Enter your address :</label>
            <textarea name="message" id="msg" cols="43" rows="9"></textarea>
        </div>
        <a class="a1" href="#">Cancel</a>
        <a class="a2" href="#">Confirm</a>
    </form>
</html>
