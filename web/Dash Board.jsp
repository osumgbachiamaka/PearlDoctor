<%-- 
    Document   : Dash Board
    Created on : 08-Jun-2017, 05:27:53
    Author     : Chiamaka
--%>

<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.text.DateFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Patient Profile</title>
        <link rel="shortcut icon" href="assests/images/Logo.png" />
        <link rel="stylesheet" href="assests/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assests/css/bootstrap-theme.min.css" />
        <script src="assests/js/bootstrap.min.js"></script>
        <% String referer = request.getHeader("referer");
            if (referer == null || referer.equalsIgnoreCase(request.getContextPath() + "/Login.jsp") || referer.equalsIgnoreCase(request.getContextPath() + "/Registration.jsp")) {
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
                padding: 20px;
            }
            .splash{
                width: 75%;
                min-height: 500px;
                margin: 0 auto;
                float: right;
                box-shadow: #6B6B6B 2px 3px 2px 3px;
                padding: 20px;
            }
            .order td{
                width: 200px;
                height: 40px;
            }
        </style>
    </head>
    <body>
        <!--This Houses The Whole Nav Bar -->
        <div>
            <%@include file="NavBar.jsp"%>
        </div>
        <!-- The Whole Nav Bar Ends Here -->

        <!-- Div For The Body Content Starts Here -->
        <div class="container">
            <div class="bd">
                <div class="row">
                    <div class="col-md-3">
                        <%@include file="Float.jsp" %>
                    </div>
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
                        <%  Connection connection = DriverManager.getConnection(url, username, password);
                            Statement mysqlStatement = connection.createStatement();

                            String usr = (String) session.getAttribute("usr");
                            String pwd = (String) session.getAttribute("pwd");

                            String selectQuery = "SELECT * FROM registration WHERE username='%s' AND password='%s'";
                            selectQuery = String.format(selectQuery, usr, pwd);
                            ResultSet resultSet = mysqlStatement.executeQuery(selectQuery);

                        %>
                        <%                            while (resultSet.next()) {
                        %>
                        <center>
                            <table class="table table-striped" border="1px" style="border: #e20a32 solid thin; height: 20px;" >
                                <tr>
                                    <td class="ord"> User Full Name: </td> <td> <%= resultSet.getString("sur")%> <%= resultSet.getString("firstname")%> <%= resultSet.getString("middlename")%></td>
                                    <td class="ord">Gender: </td> <td> <%= resultSet.getString("gender")%></td>
                                </tr>
                                <tr>
                                    <td class="ord"> Age: </td> <td> <%= resultSet.getString("age")%> </td><td class="ord">Email Address: </td><td><%= resultSet.getString("email")%></td>

                                </tr>
                                <tr>
                                    <td class="ord"> Marital Status: </td> <td> <%=resultSet.getString("marital_status")%> </td><td class="ord">State of Origin: </td><td><%= resultSet.getString("state_of_origin")%></td>

                                </tr>
                                <tr><td class="ord">Today is: </td><td><% Date date = new Date();
                                    DateFormat dateformat = new SimpleDateFormat("E dd:MM:yyyy 'at' hh:mm:ss a");
                                    String mainDate = dateformat.format(date);
                                    String d = mainDate;%><%= d%></td><td class="ord"> Username: </td> <td> <%= resultSet.getString("username")%> </td></tr>
                            </table>

                        </center>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
            <div style="margin-top: -3%;"><%@include file="footer.jsp" %></div>
        </div>
    </body>

    <%}%>
</html>
