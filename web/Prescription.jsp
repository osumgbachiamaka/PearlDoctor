<%-- 
    Document   : Prescription
    Created on : 11-Jun-2017, 06:55:04
    Author     : Chiamaka
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Patient Diagnosis</title>
        <link rel="shortcut icon" href="assests/images/Logo.png" />
        <link rel="stylesheet" href="assests/css/global.css" />
        <% String referer = request.getHeader("referer");
            if (referer == null || referer.equalsIgnoreCase(request.getContextPath() + "/Login.jsp") || referer.equalsIgnoreCase(request.getContextPath() + "/Registration")) {
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
            input, select{
                padding-right: 2px;
                background-color: #ebebeb;
                height: 25px;
            }
            .bd{
                background-color: rgba(226, 232, 232, .6);
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
            .splash p{
                color:  #3366cc;
            }
        </style>

    </head>
    <body>
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
                    request.getSession(true);
                    String usr = (String) session.getAttribute("usr");
                    String pwd = (String) session.getAttribute("pwd");

                    try {
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                    } catch (ClassNotFoundException ex) {

                    } catch (InstantiationException ex) {

                    } catch (IllegalAccessException ex) {

                    }

                %>
                <%  Connection connection = DriverManager.getConnection(url, username, password);
                    Statement mysqlStatement = connection.createStatement();
                    String selectStatement = "Select * from history where username = '%s' and password = '%s'";
                    selectStatement = String.format(selectStatement, usr, pwd);
                    ResultSet resultHistory = mysqlStatement.executeQuery(selectStatement);


                %>
                <div class="row">
                    <div class="col-md-3">
                        <%@include file="Float.jsp" %>
                    </div>
                    <div class="splash">
                        <table class="table table-striped" border="1px" style="width: 95%;margin-left: 3%;">
                            <thead>
                            <h4>History and Drug prescription</h4>
                            </thead>
                            <tr>
                                <th>Date of Previous Visit</th>
                                <th>Symptoms you Input </th>
                                <th>Possible Diagnosis</th>
                            </tr>
                            <tbody>
                                <tr>
                                    <%                                    String dis = "";
                                        while (resultHistory.next()) {
                                            String daTe = resultHistory.getString("date_of_previous_visit");
                                            String symptomFirst = resultHistory.getString("first_symptoms");
                                            String symptomSecond = resultHistory.getString("second_symptoms");
                                            String symptomThird = resultHistory.getString("third_symptoms");
                                            String symptominput = resultHistory.getString("symptomsInput");
                                            String disease = resultHistory.getString("diseases");
                                            dis += "\n" + disease;

                                    %>
                                    <td>
                                        <%=daTe%>
                                    </td>
                                    <td>
                                        <%=symptominput%>
                                    </td>
                                    <td>
                                        <%=disease%>
                                    </td>

                                </tr>


                                <%// end of while statement 
                                } %>
                            </tbody>
                        </table>
                        <h4> To get your prescription input the diseases you where diagnosed of one at a time</h4>

                        <form method="post" action="#" name="Sercch_Diseases">
                            <div style="min-height: 200px;">
                                <%
                                    String search_disease = request.getParameter("SEARCH");
                                    String retrieve_disease = "SELECT * FROM symptoms_diseases WHERE diseases = '%s'";
                                    retrieve_disease = String.format(retrieve_disease, search_disease);
                                    ResultSet resultDisease = mysqlStatement.executeQuery(retrieve_disease);

                                %>
                                <input type="search" name="SEARCH"placeholder="Enter the Disease" style="top: 10px; width: 250px;height: 30px;" /><br />
                                <input type="submit" name="SUBMIT" value="Search" style="padding-bottom: 10px;"/>
                            </div>
                            <div style="width: 350px; margin-right: 30px; margin-top: -22%;float: right;">
                                <fieldset><legend>Prescription</legend>

                                    <% if (resultDisease.next()) {
                                    %>
                                    <b>Other Symptoms of <i><%=search_disease%></i> includes:</b>
                                    <%out.println(resultDisease.getString("symptoms") + "\n");
                                    %>
                                    <br /> <b>Drug Prescription</b><br />
                                    <%out.println(resultDisease.getString("prescription"));%>
                                </fieldset> 
                                <%} else {
                                        out.println("Disease does not exist in the DataBase ");
                                    }
                                %>
                            </div>

                        </form>
                    </div>
                </div>
                <div style="margin-top: -3%;"><%@include file="footer.jsp" %></div>
            </div>

    </body>
    <link rel="stylesheet" href="assests/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assests/css/bootstrap-theme.min.css" />
    <script src="assests/js/bootstrap.min.js"></script>
    <%}%>
</html>
