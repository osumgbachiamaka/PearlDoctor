/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author AMAKA
 */
@WebServlet(name = "Query_DataBase_Servlet", urlPatterns = {"/postToDataBase"})
public class Query_DataBase_Servlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Query_DataBase_Servlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Query_DataBase_Servlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        out.println("DATA SENT FROM PAGE");

        if (request.getParameterMap().isEmpty()) {
            out.println("INVALID OPERATION. PAGE MUST BE CALLED FROM A LOGIN PAGE.");
            out.println("YOU WILL BE REDIRECTED IN 10seconds");
            out.println("<meta http-equiv='refresh' content='10;main_login.jsp'/>");
            //response.sendRedirect("main_login.jsp");
        } else {

            String urlString = "jdbc:mysql://localhost:3306/doctor";
            String username = "root";
            String password = "";
            //Requested Values

            Date newDate = new Date();
            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            String maindate = dateFormat.format(newDate);

            DateFormat newTimeFormat = new SimpleDateFormat("hh:mm:ss");
            String maintime = newTimeFormat.format(newDate);

            String surname = request.getParameter("Surname");
            String firstname = request.getParameter("Firstname");
            String middlename = request.getParameter("Middlename");
            String age = request.getParameter("Age");
            String gender = request.getParameter("Gender");
            String birthMonth = request.getParameter("BirthMonth");
            String birthDay = request.getParameter("BirthDay");
            String birthYear = request.getParameter("BirthYear");
            String birthCollection = "birthMonth + birthDay + birthYear";
            String date = maindate;
            String time = maintime;
            String stateOrigin = request.getParameter("State");
            String marital = request.getParameter("MaritalStatus");
            String email = request.getParameter("Email");
            String userPass = request.getParameter("Using");
            String passUser = request.getParameter("Passing");

            //Here we get connection to the database
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
            } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | IllegalArgumentException ex) {
                Logger.getLogger(Query_DataBase_Servlet.class.getName()).log(Level.SEVERE, null, ex);
                out.println("THERE WAS AN EXCEPTION: " + ex.getLocalizedMessage());
            }
            try {
                Connection connection = DriverManager.getConnection(urlString, username, password);
                Statement mySqlStatement = connection.createStatement();
                String insertQuery = "INSERT INTO registration(sur, firstname, middlename, age, gender, email, state_of_origin, date_of_birth, today_date, time, marital_status, username, password) VALUES ('%s', '%s','%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s')";
                insertQuery = String.format(insertQuery, surname, firstname, middlename, age, gender, email, stateOrigin, birthCollection, date, maintime, marital, userPass, passUser);
                mySqlStatement.execute(insertQuery);

                //out.println("Registration Successfull");
                request.getSession(true).setAttribute("usr", userPass);
                request.getSession(true).setAttribute("pwd", passUser);

                response.sendRedirect("Dash Board.jsp");

            
            } catch (SQLException e) {
                Logger.getLogger(Query_DataBase_Servlet.class.getName()).log(Level.SEVERE, null, e);
                out.println("THERE WAS AN EXCEPTION: " + e.getLocalizedMessage());
            }

            //processRequest(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
