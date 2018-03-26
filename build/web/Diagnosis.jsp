<%-- 
    Document   : Diagnosis
    Created on : 09-Jun-2017, 07:49:12
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
        <link rel="stylesheet" href="assests/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assests/css/bootstrap-theme.min.css" />
        <script src="assests/js/bootstrap.min.js"></script>
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
            }
            .splash{
                width: 75%;
                min-height: 300px;
                margin: 0 auto;
                float: right;
                box-shadow: #6B6B6B 2px 3px 2px 3px;
                padding: 20px;
            }
            .img{
                padding: 20px;
            }
            .img img{
                width: 100%;
                height: 550px;
                border-radius: 5px;
                border-color: #3366cc;
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
                <div class="img">
                    <%

                        String url = "jdbc:mysql://localhost:3306/doctor";
                        String username = "root";
                        String password = "";
                        request.getSession(true);
                        String usr = (String) session.getAttribute("usr");
                        String pwd = (String) session.getAttribute("pwd");

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
                    <%  Connection connection = DriverManager.getConnection(url, username, password);
                        Statement mysqlStatement = connection.createStatement();
                        String selectStatement = "Select * from symptoms_diseases";
                        ResultSet result = mysqlStatement.executeQuery(selectStatement);

                    %>
                    <div class="row">
                        <div class="col-md-3">
                            <img src="assests/images/human body.jpg" alt="The Human Body" />
                        </div>
                        <div class="splash">
                            <form method="post">
                                <h4 style="color: #ad0b34;"><Strong>Symptoms</strong></h4>
                                <div>
                                    <p><input type="checkbox" name="Symptom" value="Fever"/> Fever</p>
                                    <p><input type="checkbox" name="Symptom" value="Headache"/> Headache</p>
                                    <p><input type="checkbox" name="Symptom" value="Bitter Taste in Mouth"/> Bitter Taste in Mouth</p>
                                    <p><input type="checkbox" name="Symptom" value="Tiredness"> Tiredness</p>
                                    <p><input type="checkbox" name="Symptom" value="Vomiting"/> Vomiting</p>
                                    <p><input type="checkbox" name="Symptom" value="Easy Fatigue"/> Easy Fatigue</p>
                                    <p><input type="checkbox" name="Symptom" value="Abnormal Pain"/> Abnormal Pain</p>
                                    <p><input type="checkbox" name="Symptom" value="Neck Pain"/> Neck pain</p>
                                </div>
                                <div style="margin-right: 50%;margin-top: -44%;float: right;">
                                    <p><input type="checkbox" name="Symptom" value="Rashes"/> Rashes</p>
                                    <p><input type="checkbox" name="Symptom" value="Cough"/> Cough</p>
                                    <p><input type="checkbox" name="Symptom" value="Nausea"/> Nausea</p>
                                    <p><input type="checkbox" name="Symptom" value="Anorexia"/> Anorexia</p>
                                    <p><input type="checkbox" name="Symptom" value="Chest pain"/> Chest Pain</p> 
                                    <p><input type="checkbox" name="Symptom" value="Heart Burn"/> Heart Burn</p>
                                    <p><input type="checkbox" name="Symptom" value="Fast Breathing"/> Fast Breathing</p>
                                    <p><input type="checkbox" name="Symptom" value="Difficult in Breathing"/> Difficult in Breathing</p>
                                </div>
                                <div style="margin-right: 10%;margin-top: -48%;float: right;width: 250px;">
                                    <fieldset>
                                        <legend>Symptoms Marked</legend>
                                        <%if (!request.getParameterMap().isEmpty()) {
                                                String symptoms[] = request.getParameterValues("Symptom");

                                                if (symptoms != null) {
                                                    out.println("The following Symptoms were selected by you: ");

                                                    for (int i = 0; i < symptoms.length; i++) {
                                                        out.println(symptoms[i] + ",");
                                                    }
                                                } else {
                                                    out.println("You Have Not Checked any Symptoms");
                                                }
                                            }
                                        %>
                                    </fieldset>
                                </div>
                                <div style="margin-right: 10%;margin-top: -30%;float: right;width: 250px;">
                                    <fieldset>
                                        <legend>Diagnosis</legend>
                                        <% if (!request.getParameterMap().isEmpty()) {
                                                String symptom[] = request.getParameterValues("Symptom");

                                                /*String selectSymptoms = "SELECT DISTINCT diseases FROM symptoms_diseases where symptoms IN (";
                                                 selectSymptoms += symptom[0] + "'";
                                                 for (int i = 1; i < symptom.length; i++) {
                                                 selectSymptoms += ",'" + symptom[i] + "'";
                                                 }
                                                 selectSymptoms += ")AND ORDER BY disease ASC";*/
                                                if (symptom != null) {
                                                    for (int i = 0; i < symptom.length; i++) {
                                                        String valsymtom = symptom[i];
                                                        //out.println(valsymtom);

                                                        String selectSymptoms = "SELECT diseases FROM symptoms_diseases WHERE symptoms LIKE '%" + valsymtom + "%'";
                                                        //selectSymptoms = String.format(selectSymptoms, valsymtom);
                                                        result = mysqlStatement.executeQuery(selectSymptoms);
                                                        String historyString = "";
                                                        while (result.next()) {
                                                            String disease = result.getString("diseases");
                                                            out.println(disease);
                                                            historyString += "\n" + disease;

                                                        }
                                                        String putBack = "insert into history(date_of_previous_visit, username, password, symptomsInput, diseases)VALUES ('%s', '%s', '%s', '%s', '%s')";
                                                        putBack = String.format(putBack, d, usr, pwd, valsymtom.toString(), historyString);
                                                        mysqlStatement.execute(putBack);
                                                        break;

                                                    }
                                                } else {
                                                    out.println("No Symptoms was selected");
                                                }
                                        %>
                                    </fieldset>
                                    <% }%>
                                </div>
                                <input type="submit" value="Search" name="search" />
                                <a href="Prescription.jsp"><input type="button" name="prescribe" value="Prescription" /></a>
                            </form>
                        </div>
                    </div></div>
                <div style="margin-top: -3%;"><%@include file="footer.jsp" %></div>
            </div>
        </div>
    </body>

    <%}%>
</html>
