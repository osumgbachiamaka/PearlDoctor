<%-- 
    Document   : Registration
    Created on : 07-Jun-2017, 23:02:43
    Author     : Chiamaka
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <link rel="shortcut icon" href="assests/images/Logo.png" />
        <script type="text/javascript" src="script/jquery.js"></script>
        <script type="text/javascript">
            var err_symbol = "Empty";
            function validate() {
                var surnameText = $("#surname").val();//to get the value entered by the textfield
                var firstnameText = $("#firstname").val();
                var middlenameText = $("#middlename").val();
                var ageText = $("#age").val();
                var emailText = $("#email").val();
                var usernameText = $("#using").val();
                var passwordText = $("#passing").val();
                var confirmPasswordText = $("#confirm").val();
                var allFieldsValidated = true;
                if (surnameText.length === 0) {
                    $("#surnameErr").text(err_symbol);
                    allFieldsValidated = false;
                }
                else {
                    $("#surnameErr").text("");
                }
                if (firstnameText.length === 0) {
                    $("#firstnameErr").text(err_symbol);
                    allFieldsValidated = false;
                }
                else {
                    $("#firstnameErr").text("");
                }
                if (middlenameText.length === 0) {
                    $("#middlenameErr").text(err_symbol);
                    allFieldsValidated = false;

                } else {
                    $("#middlenameErr").text("");
                }
                if (ageText.length === 0) {
                    $("#ageErr").text(err_symbol);
                    allFieldsValidated = false;
                }
                else {
                    $("#ageErr").text("");
                }
                if (emailText.length === 0) {
                    $("#emailErr").text(err_symbol);
                    allFieldsValidated = false;
                }
                else {
                    $("#emailErr").text("");
                }
                if (usernameText.length === 0) {
                    $("#usernameErr").text(err_symbol);
                    allFieldsValidated = false;
                }
                else {
                    $("#usernameErr").text("");
                }
                if (passwordText.length === 0) {
                    $("#passwordErr").text(err_symbol);
                    allFieldsValidated = false;
                }
                else {
                    $("#passwordErr").text("");
                }
                if (confirmPasswordText.length === 0) {
                    $("#confirmErr").text(err_symbol);
                    allFieldsValidated = false;
                }
                else {
                    $("#confirmErr").text("");
                }
                if (passwordText !== confirmPasswordText) {
                    $("#confirmErr").text("Confirm Password Not Correct");
                    allFieldsValidated = false;
                }

                if (allFieldsValidated === true) {
                    var form = document.getElementById("registration_form");
                    //form.setAttribute("action", "postToDataBase");
                    $("#registration_form").attr("action", "postToDataBase");
                    $("#registration_form").submit();
                    $("#submit").click();

                }

            }
            //End of function validate()

            function doingReset() {
                $("#surnameErr").text("");
                $("#firstnameErr").text("");
                $("#middlenameErr").text("");
                $("#ageErr").text("");
                $("#emailErr").text("");
                $("#usernameErr").text("");
                $("#passwordErr").text("");
                $("#confirmErr").text("");
            }
            //End of function doingReset()
        </script>
        <style>
            body{
                background-color: #3366cc;
                background-size: cover;
            }
            .color{
                background-color: #d2e8f4;
                margin-top: 5%;
                margin-bottom: 1%;
            }
            .input{
                width: 250px;
                height: 30px;
                text-align: center;
                border-radius: 10px;
            }
            .errorMssg{
                color:red;
                font-size:larger;
                font-weight:100;
                text-shadow:2px 0px 2px red;
            }
            .fire{
                width: 123px;
                height: 30px;
                background-color: #3366cc;
                border-radius: 10px;
            }
        </style>
    </head>
    <body>
    <center>
        <div class="color">
            <div >
                <img src="assests/images/register-icon.png" alt="Login Logo" style="width: 150px;border-radius: 30px; height: 80px;margin-top: -100px;" />
            </div>
            <form method="post" action="javascript:validate()" name ="registration_form"  id="registration_form" onsubmit="" >
                <table>

                    <tr>
                        <td>
                            <label>Surname:</label>
                        </td>
                        <td>
                            <input type="text" name="Surname" id="surname"style="border-top-left-radius: 15px;border-left-color: #a60502;width: 250px;height: 30px" />
                        </td>
                        <td width="150" class="errorMssg" id="surnameErr">
                            <!--Error messages comes here -->
                        </td>
                    </tr>
                    <tr style="height: 20px;"></tr>
                    <tr>
                        <td>
                            <label>Firstname:</label>
                        </td>
                        <td>
                            <input type="text" name="Firstname" id="firstname" class="input" />
                        </td>
                        <td class="errorMssg" id="firstnameErr">
                            <!--Error messages comes here -->
                        </td>
                    </tr>
                    <tr style="height: 20px;"></tr>
                    <tr>
                        <td>
                            <label>Middlename:</label>
                        </td>
                        <td>
                            <input type="text" name="Middlename" id="middlename" class="input" />
                        </td>
                        <td class="errorMssg" id="middlenameErr">
                            <!--Error messages comes here -->
                        </td>
                    </tr>
                    <tr style="height: 20px;"></tr>
                    <tr>
                        <td>
                            <label>Age:</label>
                        </td>
                        <td>
                            <input type="number" name="Age" id="age" min="18"/>
                        </td>
                        <td class="errorMssg" id="ageErr">
                            <!--Error messages comes here -->
                        </td>
                    </tr>
                    <tr style="height: 20px;"></tr>
                    <tr>
                        <td>
                            <label>Gender:</label>
                        </td>
                        <td>
                            <label>Male<input type="radio" name="Gender" id="male" value="Male" checked="checked" /></label>
                            <label>Female<input type="radio" name="Gender" id="male" value="Female" /></label>
                        </td>
                        <td>
                            <!--Error messages comes here -->
                        </td>
                    </tr>

                    <tr style="height: 20px;"></tr>
                    <tr>
                        <td name="TodayDate">Today is : </td>
                        <td><% Date newDate = new Date();
                            DateFormat newDateFormat = new SimpleDateFormat("E dd/MM/yyyy hh:mm:ss");
                            String todayDate = newDateFormat.format(newDate);
                                        out.println(todayDate);%></td>
                    </tr>

                    <tr style="height: 20px;"></tr>
                    <tr>
                        <td>
                            <label>State Of Origin:</label>
                        </td>
                        <td>
                            <select name="State">
                                <option>Abia</option>
                                <option>Adamawa</option>
                                <option>Akwa Ibom</option>
                                <option>Anambra</option>
                                <option>Bauchi</option>
                                <option>Bayelsa</option>
                                <option>Benue</option>
                                <option>Borno</option>
                                <option>Cross River</option> <option>Delta</option> <option> Ebonyi </option> <option>Edo</option <option>Ekiti</option>
                                <option>Enugu</option> <option>Gombe</option> <option>Imo</option> <option>Jigawa</option> <option>Kaduna</option> <option>Kano</option>
                                <option>Kastina</option> <option>Kebbi</option> <option>Kogi</option> <option>Kwara</option> <option>Lagos</option> <option>Nassarawa</option>
                                <option>Niger</option> <option>Ogun</option> <option>Ondo</option> <option>Osun</option> <option>Oyo</option> <option>Plateau</option>
                                <option>Rivers </option> <option>Sokoto</option> <option>Taraba</option> <option>Yobe</option> <option>Zamfara</option>

                            </select>
                        </td>
                        <td>
                            <!--Error messages comes here -->
                        </td>
                    </tr>
                    <tr style="height: 20px;"></tr>
                    <tr>
                        <td>
                            <label>Marital Status:</label>
                        </td>
                        <td>
                            <select name="MaritalStatus">
                                <option>Single</option>
                                <option>Married</option>
                                <option>Divorced</option>
                            </select>
                        </td>
                        <td>
                            <!--Error messages comes here -->
                        </td>
                    </tr>
                    <tr style="height: 20px;"></tr>
                    <tr>
                        <td>
                            <label>Email:</label>
                        </td>
                        <td>
                            <input type="email" name="Email" id="email" class="input" />
                        </td>
                        <td class="errorMssg" id="emailErr">
                            <!--Error messages comes here -->
                        </td>
                    </tr>
                    <tr style="height: 20px;"></tr>
                    <tr>
                        <td>
                            <label>Username:</label>
                        </td>
                        <td>
                            <input type="text" name="Using" id="using" class="input" />
                        </td>
                        <td class="errorMssg" id="usernameErr">
                            <!--Error messages comes here -->
                        </td>
                    </tr>
                    <tr style="height: 20px;"></tr>
                    <tr>
                        <td>
                            <label>Password:</label>
                        </td>
                        <td>
                            <input type="password" name="Passing" id="passing" class="input" />
                        </td>
                        <td class="errorMssg" id="passwordErr">
                            <!--Error messages comes here -->
                        </td>
                    </tr>
                    <tr style="height: 20px;"></tr>
                    <tr>
                        <td>
                            <label>Confirm Password:</label>
                        </td>
                        <td>
                            <input type="password" name="Confirm" id="confirm" class="input" />
                        </td>
                        <td class="errorMssg" id="confirmErr">
                            <!--Error messages comes here -->
                        </td>
                    </tr>
                    <tr style="height: 20px;"></tr>
                    <tr>
                        <td></td>
                        <td class="input"><input type="reset" name="Reset" id="reset" onclick="doingReset()"class="fire" />
                            <input type="submit" name="Submit" id="submit" value="Register"class="fire"  /></td>
                    </tr>
                    <tr>
                        <td></td><td>
                            <a href="Login.jsp"><input type="button" id="button" name="Button" value="Already a Member"style="background-color: #3366cc;width: 250px;height: 40px;border-bottom-right-radius: 15px;border-bottom-color: #a60502;" /></a>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </center>
</body>
</html>
