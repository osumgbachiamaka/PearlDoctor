<%-- 
    Document   : Doctor
    Created on : 12-Jun-2017, 20:41:27
    Author     : Chiamaka
--%>

<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Doctor</title>
        <% String referer = request.getHeader("referer");
            if (referer == null || referer.equalsIgnoreCase(request.getContextPath() + "/Doctor Login.jsp") || referer.equalsIgnoreCase(request.getContextPath() + "/Registration.jsp")) {
                out.println("INVALID REQUEST");
                out.println("<br>");
                out.println("PAGE MUST BE REQUESTED FROM A LOGIN PAGE");
                out.println("<meta-cont");
            } else { %>
        <style>
            body{
                background-image: url("assests/images/medical.png");
                background-size: cover;
                background-repeat: no-repeat;
            }
            .bd{
                background-color: rgba(211, 220, 220, .6);
                z-index: 4;
                border-radius: 20px;
                margin-top: 20px;
            }
            .splash{
                width: 650px;
                min-height: 300px;
                margin-top: 20px;
                margin-bottom: 20px;
                margin-left: 25%;
                margin-right: 25%;
                box-shadow: #6B6B6B 2px 3px 2px 3px;
            }
        </style>
    </head>
    <body>
        <!--This Houses The Whole Nav Bar -->
        <nav class="navbar navbar-inverse">
            <div class="container">

                <!-- Div For The Brand Name -->
                <div class="navbar-header">
                    <a class="navbar-brand" >MEDICAL DIAGNOSTIC SYSTEM</a>
                </div>
                <!-- Div For The Brand Name Ends Here -->

                <!-- This Div Contains Items In the Nav Bar -->
                <div>
                    <!-- Menu Items On The Left -->
                    <ul class="nav navbar-nav">
                        <li><a href="index.html"> Home </a></li>
                        <li><a href="About.jsp"> About </a></li>
                        <li><a href="Dash Board.jsp"> Patient </a></li>
                        <li class="active"><a href="#"> Doctor </a></li>
                    </ul>
                    <!-- End Of Menu Items On The Left -->

                    <!-- Start Of Menu Items On The Right -->
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="Administrative Login.jsp"> Login </a></li>
                    </ul>
                    <!-- End O fMenu Items On The Right -->
                </div>
                <!-- Div For Nav Bar Items Ends here -->

            </div>
        </nav>
        <!-- The Whole Nav Bar Ends Here -->

        <!-- Div For The Body Content Starts Here -->
        <div class="container">
            <div class="bd">
                <div class="splash">
                    <%
                        String url = "jdbc:mysql://localhost:3306/doctor";
                        String username = "root";
                        String password = "";

                        try {
                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                        } catch (ClassNotFoundException ex) {

                        } catch (InstantiationException ex) {

                        } catch (IllegalAccessException ex) {

                        }

                    %>
                    <%  String userPass = (String) session.getAttribute("usr");
                        String passUser = (String) session.getAttribute("pwd");

                        Connection connection = DriverManager.getConnection(url, username, password);
                        Statement mysqlStatement = connection.createStatement();
                        String selectQuery = "SELECT * FROM doctors_registration WHERE username ='%s' AND password ='%s'";
                        selectQuery = String.format(selectQuery, userPass, passUser);
                        ResultSet resultSet = mysqlStatement.executeQuery(selectQuery);
                        // collecting username and password from database

                        while (resultSet.next()) {
                            String firstname = resultSet.getString("FirstName");
                            String lastname = resultSet.getString("LastName");
                            String user = resultSet.getString("Username");
                            String pass = resultSet.getString("Password");
                            
                        %>
                        Doctors Name: <%= firstname + " "+ lastname%>
                        Doctors Username: <%= user%>
                        Populate Symptoms: <textarea cols="35" rows="8"name="Popoluate Symptoms"></textarea>
                        Possible Disease: <input type="text" />
                        Doctors Prescription: <textarea cols="35" rows="8" name="Doctors Prescription"></textarea>
                        
                        <%}%>
                </div>
            </div>
        </div>
    </body>
    <link rel="stylesheet" href="assests/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assests/css/bootstrap-theme.min.css" />
    <script src="assests/js/bootstrap.min.js"></script>
    <%}%>
</html>
