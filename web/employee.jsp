
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header_employee.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Employee</title>
</head>
<style>
    body {
        font-family: 'Baloo Bhai 2', cursive;
        margin: 0px;
        padding: 0px;
        color: white;
        background: url(empp.jpg) no-repeat center center/cover;
        width: 100%;
        height: 100%;
    }

    #navbar {
        display: flex;
        align-items: center;
        height: 70px;
        width: 100%;
        background-color: rgb(83, 28, 28);
    }

    #navbar h1 {
        margin-left: 410px;
        width: 100%;
        font-size: 1.7rem;
    }

    #logo {
        margin: 5px 5px;
    }

    #logo img {
        height: 58px;
        margin-top: 6px;
        margin-left: 5px;
        margin-right: 5px;
        width: 58px;
    }


    #services {
        margin: 0px 17px;
        display: flex;
        padding-top: 8px;
    }

    #services .box {
        border: 2px solid rgb(83, 28, 28);
        margin-left: 200px;
        margin-top: 100px;
        padding: 10px 10px;
        border-radius: 20px;
        height: 200px;
        width: 380px;
    }


    .box a {
        font-size: 1.21rem;
        color: rgb(83, 28, 28);
        text-decoration: none;
        align-items: center;
        justify-content: center;
        padding-top: 10px;
        margin-left: 70px;
        margin-top: 40px;
        font-weight: 540;
    }

    .box a:hover{
        color: rgb(5, 5, 161);
    }

    #services h2 {
        font-family: 'Baloo Tamma 2', cursive;
        align-items: center;
        justify-content: center;
        margin-left: 90px;
        margin-bottom: 50px;
        color: rgb(83, 28, 28);
    }
</style>


<body>

    <%--- <nav id="navbar">
        <div id="logo">
            <img src="Dazzle 'n Dine.png" alt="Dazzle 'n Dine.com">
        </div>

        <ul>
            <h1>Dazzle 'n Dine Employee Homepage</h1>
        </ul>
    </nav> ---%>


    <section id="services-cont">
        <div id="services">
            <div class="box">
                <h2 class="h-secondary ">Manage Orders</h2>
                <a href="View_order_by_employee.jsp">1. View Food Orders</a><br>
                <a href="update_payment_status.jsp">2. Update Payment Status</a><br>
                <a href="view_customer_by_employee.jsp">3. View Customer Details</a><br>
            </div>
        </div>
    </section>
</body>

</html>