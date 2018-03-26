<%-- 
    Document   : About
    Created on : 07-Jun-2017, 15:30:56
    Author     : Chiamaka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About</title>
        <link rel="shortcut icon" href="assests/images/Logo.png" />
        <link rel="stylesheet" href="assests/css/global.css" />
        <style>
            body{
                background-image: url("assests/images/medical.png");
                background-size: cover;
                background-repeat: no-repeat;
            }
            input, select{
                padding-right: 2px;
                background-color: #ebebeb;
                height: 25px;
            }
            .myClass{
                background-color: rgba(211, 220, 220, .6);
                z-index: 4;
                border-radius: 20px;
            }
        </style>
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
                        <li class="active"><a href="#"> About </a></li>
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
        <!-- The Whole Nav Bar Ends Here -->

        <!-- Div For The Body Content Starts Here -->
        <div class="container">
            <div class="myClass">

                <div class="myBody" style="padding: 20px;margin-top: 2%;min-height: 70%;">
                    <h3>About MEDICAL DIAGNOSTIC SYSTEM </h3>
                    <span><h4><b>Who We Are</b></h4>
                        <strong>MEDICAL DIAGNOSTIC SYSTEM</strong>  is the provider of health information services, serving consumers, physicians, other health care professionals, employers and health plans. The online health care information, decision-support applications and communications services that we provide:
                        <ul>
                        <li>
                            Help consumers take an active role in managing their health by providing objective health care information and lifestyle information.
                        </li>
                        <li>
                            Make it easier for physicians and health care professionals to access clinical reference sources, stay abreast of the latest clinical information, learn about new treatment options, earn continuing medical education credits and communicate with peers.
                        </li>
                        <li>
                            Enable employers and health plans to provide their employees and plan members with access to personalised health and benefit information and decision support technology that helps them make informed benefit, provider and treatment choices.
                        </li>
                        </ul>
                        <h4><b> What We Do For Our Users</b></h4>
                        <strong>MEDICAL DIAGNOSTIC SYSTEM</strong> has created an organisation that we believe fulfils the promise of health information on the Internet. We provide credible information, supportive communities, and in-depth reference material about health subjects that matter to you. We are a source for original and timely health information as well as material from well known content providers. We provide:
                        <ul>
                            <li>
                                Health news for the public
                            </li>
                            <li>
                                Creating and maintaining up-to-date medical database
                            </li>
                            <li>
                                User experience
                            </li>
                            <li>
                                Interactive tools
                            </li>
                        </ul></span>

                </div>

            </div>
            <div style="margin-top: -3%;"><%@include file="footer.jsp" %></div>
        </div>

    </body>
    <link rel="stylesheet" href="assests/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assests/css/bootstrap-theme.min.css" />
    <script src="assests/js/bootstrap.min.js"></script>
</html>

