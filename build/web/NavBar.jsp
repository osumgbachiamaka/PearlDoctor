<%-- 
    Document   : NavBar
    Created on : 25-Aug-2017, 15:50:09
    Author     : Chiamaka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assests/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assests/css/bootstrap-theme.min.css" />
        <script src="assests/js/bootstrap.min.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-default">
            <div class="container">

                <!-- Div For The Brand Name -->
                <div class="navbar-header">
                    <a class="navbar-brand" ><img src="assests/images/Logo.png" alt="PearlDoctor" style="width: 250px; height: 200px; margin-top: -45px;"></a>
                </div>
                <!-- Div For The Brand Name Ends Here -->

                <!-- This Div Contains Items In the Nav Bar -->
                <div>
                    <!-- Menu Items On The Left -->
                    <ul class="nav navbar-nav">
                        <li><a href="index.html"> Home </a></li>
                        <li><a href="About.jsp"> About </a></li>
                        <li class="active"><a href="#"> Patient </a></li>
                    </ul>
                    <!-- End Of Menu Items On The Left -->

                    <!-- Start Of Menu Items On The Right -->
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="index.html"> Logout </a></li>
                    </ul>
                    <!-- End O fMenu Items On The Right -->
                </div>
                <!-- Div For Nav Bar Items Ends here -->

            </div>
        </nav>
    </body>

</html>
