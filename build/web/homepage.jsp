

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Food Delivery Services | Dazzle 'n Dine.com</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" media="screen and (max-width:900px)" href="css/phone.css">
    <link href="https://fonts.googleapis.com/css2?family=Baloo+Tamma+2&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Bree+Serif&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a2d8927283.js" crossorigin="anonymous"></script>
</head>

<body>
    <nav id="navbar">
        <div id="logo">
            <img src="Dazzle 'n Dine.png" alt="Dazzle 'n Dine.com">
        </div>

        <ul>
            <li><a href="#home">Home</a></li>
            <li><a href="#about-us">About Us</a></li>
            <li><a href="#services-cont">Specialities</a></li>
            <li><a href="#client-section">Reviews</a></li>
            <li><a href="#contact">Contact Us</a></li>
            <li><a href="dummyMenu.jsp">Menu</a></li>
            <li><a href="">Login
                    <span class="arrow">&#x25BC;</span>
                </a>
                <ul class="submenu">
                    <li><a href="login_admin.jsp">Admin</a></li>
                    <li><a href="login_employee.jsp">Employee</a></li>
                    <li><a href="Login_customer.jsp">Customer</a></li>
                </ul>
            </li>

            <li><a href="#">Register
                    <span class="arrow">&#x25BC;</span>
                </a>
                <ul class="submenu">
                    <li><a href="register_admin.jsp">Admin</a></li>
                    <li><a href="register_customer.jsp">Customer</a></li>
                </ul>
            </li>
        </ul>
    </nav>


    <section id="home">
        <h1 class="h-primary">
            Welcome to Dazzle 'n Dine
        </h1>
        <p>To all the food lovers out there we are here to give you an amazing food experience</p>
        <p>Nothing is more magical and healing than a scumptious meal</p>
        <p>So what are you waiting for?</p>
    </section>



    <section id="about-us">
        <h1 class="h-primary">About Us</h1>
        <div id="about-box">
            <p>Delicious and fresh food is something we as Indians always look forward to.</p>
            <p>With this vision Dazzle 'n Dine, a fine dining restaurant was opened in Delhi 2009.</p>
            <p>It has won various awards in hospitality sector in various categories over the years.</p>
            <p>Amidst the pandemic, in order to ensure the health of our customers & employees,</p>
            <p>Dazzle 'n Dine has intrduced its e-food ordering services through a easy process.</p>
        </div>
    </section>



    <section id="services-cont">
        <h1 class="h-primary">Specialities</h1>
        <div id="services">
            <div class="box">
                <img src="speciality1.jpg" alt="">
                <h2 class="h-secondary ">Cheese Burst Pizza</h2>
            </div>

            <div class="box">
                <img src="speciality5.jpg" alt="">
                <h2 class="h-secondary ">Masala Dosa</h2>
            </div>

            <div class="box">
                <img src="speciality3.jpg" alt="">
                <h2 class="h-secondary ">Kesar Jalebi</h2>
            </div>
            <div class="box">
                <img src="speciality4.jpg" alt="">
                <h2 class="h-secondary ">Malai Kofta</h2>
            </div>
        </div>
    </section>

    <section id="client-section">
        <h1 class="h-primary">Reviews</h1>
        <div id="clients">
            <div class="box1">
                <img src="4_star.jpg" alt="">
                <p>A very good place to order food from for any occasions. Delicious food, quick service & easy process
                    <b><i>~ Dinesh Kumar</i></b></p>
            </div>

            <div class="box1">
                <img src="4_star.jpg" alt="">
                <p>Delicious food served at your doorstep within minutes. A must try place for all the foodies out
                    there. <b><i> ~ Supriya Malik</i></b></p>
            </div>

            <div class="box1">
                <img src="4_star.jpg" alt="">
                <p>Huge discounts, delicious food and quick delivery. Nothing could beat the services of Dazzle 'n
                    Dine.<b><i> ~ Rahul Upadhyay</i></b> </p>
            </div>

            <div class="box1">
                <img src="4_star.jpg" alt="">
                <p>Huge discounts, delicious food and quick delivery. Nothing could beat the services of Dazzle 'n Dine.
                    <b><i> ~ Aviral Mehra</i></b></p>
            </div>
        </div>
    </section>

    <section id="contact">
        <h1 class="h-primary">Contact Us</h1>
        <div id="contact-box">
            <p><i class="fa-solid fa-phone"></i>&nbsp&nbspPhone number : +91 00 0000 0000</p>
            <p><i class="fa-solid fa-envelope"></i>&nbsp&nbspEmail : dazzlendine@gmail.com</p>
            <p><i class="fa-solid fa-location-dot"></i>&nbsp&nbspLocation : Cannaught Place, New Delhi, India</p>
            <p><i class="fa-solid fa-clock"></i>&nbsp&nbspTimings : 10.00 am-10.00 pm</p>

        </div>
    </section>

    <footer>
        <div class="center">
            copyright &copy; www.Dazzle 'n Dine.com. All rights reserved.
        </div>
    </footer>
</body>

</html>