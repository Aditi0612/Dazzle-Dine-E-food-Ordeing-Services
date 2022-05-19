<%-- 
    Document   : admin
    Created on : 22 Mar, 2022, 12:43:34 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin</title>
</head>
<style>
    body {
        font-family: 'Baloo Bhai 2', cursive;
        margin: 0px;
        padding: 0px;
        color: white;
        background: url(adm_bg.jpg) no-repeat center center/cover;
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
        margin-left: 120px;
        margin-top: 150px;
        padding: 10px 10px;
        border-radius: 20px;
        height: 250px;
        width: 300px;
    }


    .box a {
        font-size: 1.21rem;
        color: rgb(83, 28, 28);
        text-decoration: none;
        align-items: center;
        justify-content: center;
        /* padding: 10px; */
        margin-left: 70px;
        margin-top: 40px;
    }

    .box a:hover{
        color: rgb(5, 5, 161);
    }

    #services h2 {
        font-family: 'Baloo Tamma 2', cursive;
        align-items: center;
        justify-content: center;
        margin-left: 50px;
        margin-bottom: 50px;
        color: rgb(83, 28, 28);
    }
    
</style>


<body>

    <nav id="navbar">
        <div id="logo">
            <img src="Dazzle 'n Dine.png" alt="Dazzle 'n Dine.com">
        </div>

        <ul>
            <h1>Dazzle 'n Dine Admin Homepage</h1>
        </ul>
    </nav>


    <section id="services-cont">
        <div id="services">
            <div class="box">
                <h2 class="h-secondary ">Manage Employee</h2>
                <a href="register_employee.jsp">1. Add Employee</a><br>
                <a href="delete_employee.jsp">2. Delete Employee</a><br>
                <a href="view_employee.jsp">3. View Employees</a><br>
                <a href="assign_order.jsp">4. Assign Orders</a>
            </div>

            <div class="box">
                <h2 class="h-secondary ">Manage Customers</h2>
                <a href="view_customer.jsp">1. View Customers</a><br>
                <a href="view_orders.jsp">2. View Orders</a><br>
                <a href="view_feedback.jsp">3. View Feedback</a>
            </div>

            <div class="box">
                <h2 class="h-secondary ">Manage Menu </h2>
                <a href="add_food_items.jsp">1. Add Food Item</a><br>
                <a href="delete_food_item.jsp">2. Delete Food Item</a><br>
                <a href="update_food_item.jsp">3. Modify Item</a>
                <a href="dummyMenu.jsp">4. View Menu Items</a>
            </div>
        </div>
    </section>
</body>

</html>