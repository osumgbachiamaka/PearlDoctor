<%-- 
    Document   : print report
    Created on : 23-Jun-2017, 07:12:52
    Author     : Chiamaka
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Print Report</title>
        <link rel="shortcut icon" href="assests/images/Logo.png" />
        <% String referer = request.getHeader("referer");
            if (referer == null || referer.equalsIgnoreCase(request.getContextPath() + "/Login.jsp") || referer.equalsIgnoreCase(request.getContextPath() + "/Registration.jsp")) {
                out.println("INVALID REQUEST");
                out.println("<br>");
                out.println("PAGE MUST BE REQUESTED FROM A LOGIN PAGE");
                out.println("<meta-cont");
            } else { %>
        <style>

            .bd{
                background-color: rgba(211, 220, 220, .6);
                z-index: 4;
                border-radius: 20px;
                margin-top: 20px;
            }
            .order td{
                width: 200px;
                height: 40px;
            }
            .ord{
                font-weight: bold;
                text-transform: capitalize;
                padding-left: 10px;
            }
            .orde td{
                width: 250px;
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

                <%

                    String url = "jdbc:mysql://localhost:3306/doctor";
                    String username = "root";
                    String password = "";

                    Date date = new Date();
                    DateFormat dateformat = new SimpleDateFormat("E dd:MM:yyyy 'at' hh:mm:ss a");
                    String mainDate = dateformat.format(date);
                    String d = mainDate;

                    try {
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                    } catch (ClassNotFoundException ex) {

                    } catch (InstantiationException ex) {

                    } catch (IllegalAccessException ex) {

                    }

                %>
                <%                    Connection connection = DriverManager.getConnection(url, username, password);
                    Statement mysqlStatement = connection.createStatement();
                    String selectQuery = "SELECT * FROM registration WHERE username='%s' AND password='%s'";
                    request.getSession(true);
                    String usr = (String) session.getAttribute("usr");
                    String pwd = (String) session.getAttribute("pwd");
                    selectQuery = String.format(selectQuery, usr, pwd);
                    ResultSet resultSet = mysqlStatement.executeQuery(selectQuery);
                    

                %>
                <%                            if (resultSet.next()) {
                        

                %>
                <center>
                    <form>
                        <table>
                            <tr>
                            <img src ="assests/images/Logo.png" alt ="PearlDoctor" style="border: 0px;border-radius: 0px; width: 250px;height: 110px;" />
                            </tr>
                            <tr  style="background-color:#221853; color: #ffffff;text-align: center; border: 2px solid #e20a32;">
                                <td width= "900px;" height="30px;"><%= resultSet.getString("firstname")%> Medical Report</td>
                            </tr>
                            <tr height="20px;"></tr>
                        </table>
                        <table class="order" style="border: #e20a32 solid thin;" >
                            <tr>
                                <td class="ord"> User Full Name: </td> <td> <%= resultSet.getString("sur")%> <%= resultSet.getString("firstname")%> <%= resultSet.getString("middlename")%></td>
                                <td class="ord">Gender: </td> <td> <%= resultSet.getString("gender")%></td>
                            </tr>
                            <tr>
                                <td class="ord"> Age: </td> <td> <%= resultSet.getString("age")%> </td><td class="ord">Email Address: </td><td><%= resultSet.getString("email")%></td>

                            </tr>
                            <tr><td class="ord">Today is: </td><td><%= d%></td><td class="ord"> State of Origin: </td> <td> <%= resultSet.getString("state_of_origin")%> </td></tr>
                        </table>
                        <table class="orde" style="margin-top: 20px;">
                            <tr>
                                <th>Date of Previous Visits</th>
                                <th>Symptoms</th>
                                <th>Possible Diagnosis</th>

                            </tr>
                            <tbody>
                                <tr>
                                    <%
                                        String selectStatement = "Select * from history where username = '%s' and password = '%s'";
                                        selectStatement = String.format(selectStatement, usr, pwd);
                                        ResultSet resultHistory = mysqlStatement.executeQuery(selectStatement);
                                        String dis = "";
                                        while (resultHistory.next()) {

                                            String daTe = resultHistory.getString("date_of_previous_visit");
                                            String symptomFirst = resultHistory.getString("first_symptoms");
                                            String symptomSecond = resultHistory.getString("second_symptoms");
                                            String symptomThird = resultHistory.getString("third_symptoms");
                                            String outputing = resultHistory.getString("symptomsInput");
                                            String disease = resultHistory.getString("diseases");
                                            dis += "\n" + disease;

                                    %>
                                    <td><%=daTe%></td>
                                    <td>
                                        <%=outputing%>
                                    </td>
                                    <td>
                                        <%=disease%>
                                    </td>

                                </tr>


                                <%// end of while statement 
                                    } %>
                                
                            </tbody>
                        </table>
                                    <table  style="width: ">
                                        <tr style="height: 32px;"></tr>
                                <tr>
                                    <td style="margin-left: "><b>Medical Statement: </b>The report you are having was generated  from the symptoms provided by you.<br /><strong>Note: </strong>We do not encourage self medication, therefore the report you are having should be taking to a medical practitioner before use.</td>
                                </tr>
                                    </table>
                    </form>

                    <%
                        }
                    %>
                </center>
            </div>

        </div>
        <div style="height: 20px;"></div>
    </body>
    <link rel="stylesheet" href="assests/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assests/css/bootstrap-theme.min.css" />
    <script src="assests/js/bootstrap.min.js"></script>
    <% }%>
</html>
