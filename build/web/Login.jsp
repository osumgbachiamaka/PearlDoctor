<%-- 
    Document   : Login
    Created on : 07-Jun-2017, 16:37:06
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
        <title>Login</title>
        <link rel="shortcut icon" href="assests/images/Logo.png" />
        <script type="text/javascript" src="assests/js/jquery.js"></script>
        <script type="text/javascript">
            var error_symbol = "X";
            function validate() {
                var usernameText = $("#userusername").val();
                var passwordText = $("#userpassword").val();
                var validated = true;

                //username and password validation

                if (usernameText.length === 0) {
                    $("#usererror").text(error_symbol);
                    validated = false;
                } else {
                    $("#usererror").text("");
                }
                if (passwordText.length === 0) {
                    $("#passworderror").text(error_symbol);
                    validated = false;
                } else {
                    $("#passworderror").text("");

                }

                //end of validation

                //checking for username and password existence in database


                if (validated === true) {
                    $("#login_form").attr("action", "postToDataBase");
                    $("#login_form").submit();
                    $("#login").click();

                }

            }


            //if(request.getParameterMap().containsKey("action_login")){



        </script>
        <style>
            body{
                background-color: #3366cc;
                background-size: cover;
            }
            .color{
                background-color: #d2e8f4;
                margin-top: 15%;
                margin-bottom: 15%;
            }
            .user{
                width: 250px;
                height: 30px;
                background-image: url(assests/images/images-21.jpeg);
                background-position: left;
                background-size: contain;
                background-repeat: no-repeat;
                text-align: center;
            }
            .Error{
                color:red;
                font-size:larger;
                font-weight:100;
                text-shadow:2px 0px 2px red;
            }
        </style>
    </head>
    <body>
    <center>
        <div class="color">
                        <div >
                            <img src="assests/images/images-20.jpeg" alt="Login Logo" style="width: 150px;border-radius: 30px; height: 80px;margin-top: -100px;" />
                        </div>
                        <div style="margin: 0px 10px 0px 10px;">
                            <form method="post" action="#" id="login_form" name="Login_form">

                                <table>
                                    <tr>
                                        <td style=""> <input type="text" class="user" id="userusername" name="UsingUser" placeholder="USERNAME" style="margin-top: 20px; margin-bottom: 25px;border-top-left-radius: 15px;border-left-color: #a60502;"/></td>
                                        <td class="Error" id="usererror"><!--Error Message --></td>
                                    </tr>
                                    <tr>
                                        <td><input type="password" class="user" id="userpassword" name="UsingPass" placeholder="**********" style="margin-bottom: 25px;border-radius: 10px;" /></td>
                                        <td class="Error" id="passworderror"><!--Error Message --></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="submit" id="login" name="Login" value="Login" style="margin-bottom: 25px;width: 250px;height: 40px;background-color: #3366cc;border-radius: 10px;" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <a href="Registration.jsp"> <input type="button" id="register" name="Register" value="Register" style="background-color: #3366cc;width: 250px;height: 40px;border-bottom-right-radius: 15px;border-bottom-color: #a60502;"/> </a>
                                        </td>
                                    </tr>
                                    <%if (!request.getParameterMap().isEmpty()) {
                                            String userPass = request.getParameter("UsingUser");
                                            String passUser = request.getParameter("UsingPass");

                                    %>
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
                                    <%  Connection connection = DriverManager.getConnection(url, username, password);
                                        Statement mysqlStatement = connection.createStatement();
                                        String selectQuery = "SELECT * FROM registration WHERE username ='%s' AND password ='%s'";
                                        selectQuery = String.format(selectQuery, userPass, passUser);
                                        ResultSet resultSet = mysqlStatement.executeQuery(selectQuery);
                                        // collecting username and password from database

                                        if (resultSet.next()) {
                                            String user = resultSet.getString("username");
                                            String pass = resultSet.getString("password");
                                            
                                            request.getSession(true).setAttribute("usr", user);
                                            request.getSession(true).setAttribute("pwd", pass);
                                            response.sendRedirect("Dash Board.jsp");
                                        } else {%>
                                    <tr>
                                        <!--Column for Error Message -->
                                        <td style="color: #a60502;"> <%out.println("INCORRECT USERNAME OR PASSWORD");%> </td>
                                    </tr>
                                </table>
                            </form>
                            <%
                                    }
                                }%>

                        </div>
                    </div>
                
    </center>
    </body>
</html>
