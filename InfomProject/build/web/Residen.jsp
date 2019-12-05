<%-- 
    Document   : Residen
    Created on : 12 5, 19, 10:56:24 AM
    Author     : Johann Gonzales
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome User</title>
    </head>
    <body>
        <%
          
            String firstname = request.getParameter("fname");
            String lastname = request.getParameter("lname");
            String email = request.getParameter("email");
            String username = request.getParameter("userid");
            String password = request.getParameter("pwd");
            String bday = request.getParameter("bday");
            String gender = request.getParameter("gender");
            String address = request.getParameter("address");
            
            // add code here to INSERT this guy into the database
            
            
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
