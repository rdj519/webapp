<!This page handles registering the user into the database>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date, java.text.SimpleDateFormat" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome User</title>
    </head>
    <body>
        <%
            
            /*
                String name = request.getParameter("name_of_the_field");
                ^^ THIS IS HOW YOU GET YUNG LAMAN NG FIELD AN DUMP IT INTO A STRING VARIABLE
            */
            String firstname = request.getParameter("fname");
            String lastname = request.getParameter("lname");
            String email = request.getParameter("email");
            String username = request.getParameter("userid");
            String password = request.getParameter("pwd");
            String bday = request.getParameter("bday");
            String gender = request.getParameter("gender");
            String address = request.getParameter("address");
            
            
            try //TRY CATCH IMPORTANT FOR CONNECTION ISSUES WITH THE DATABASE
            {
            /* The statement below converts Java Time into SQL time */
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date startDate = sdf.parse(bday);
            java.sql.Date dateDB = new java.sql.Date(startDate.getTime());
             
            
            /*The next 2 lines is how we connect to our database*/
            /* ngl i cant rly explain how Class.forName("com.mysql.jdbc.Driver"); works but it does here*/
            /* The second line is the next important part */
            /* "jdbc:mysql://<ADDRESS_OF_YOUR_DATABASE>:<PORT_NUMBER>/<NAME_OF_YOUR_DATABASE>?zeroDateTimeBehavior=convertToNull" , <USERNAME>, <PASSWORD> */
            /* IF THERE ARE ANY ISSUES TO WHY U CANT CONNECT TO THE DATABASE JSUT REFER TO THE FORMAT ABOVE */
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?zeroDateTimeBehavior=convertToNull","root","p@ssword");
            
            /* Here is to initialize an SQL statement that JSP can use to INTERACT with the database */
            Statement st= con.createStatement();
            ResultSet rs;
            int i=st.executeUpdate("insert into user values (NULL,'"+email+"','"+username+"','"+password+"','"+lastname+"', '"+firstname+"','"+dateDB+"' ,'"+gender+"', '"+address+"')");
            /* ANYTHING INSIDE executeUpdate() IS THE SQL STATEMENT THAT JSP WILL PERFORM */
            
            
            //FIX BELOW
            //int a=st.executeUpdate("insert into resident_user values (LAST_INSERT_ID(), '"+address+"', 'Good Standing', NULL, NULL, NULL, NULL, NULL)");
            
            }
            catch (Exception e)
            {
                out.println(e.toString());
            }
            
        %>
        <h1>Welcome!</h1>
        <hr>
        <p>Thank you for signing in <% out.print(firstname); %> <% out.print(lastname); %>!</p><br>
        <p>Account Details:</p>
        <p>Gender: <% out.print(gender); %></p>
        <p>Email Address: <% out.print(email); %></p>
        <p>Birthdate: <% out.print(bday); %></p>
        <p>Address: <% out.print(address); %></p><br>
        <p>Login Credentials:</p>
        <p>User: <% out.print(username); %></p>
        <p>Pass: <% out.print(lastname); %></p>
        <p>Remember not to share your password to anyone else!</p><br>
        <p><a href="index.html">Click Here</a> to login.</p>
        </body>
</html>
