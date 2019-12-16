<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transaction Form</title>
    </head>
    <body>
        <%
            String id_staff = request.getParameter("supplierid");
            String duration = request.getParameter("duration");
            
            try
            {
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?zeroDateTimeBehavior=convertToNull","root","p@ssword");
            
            /* Here is to initialize an SQL statement that JSP can use to INTERACT with the database */
            Statement st= con.createStatement();
            ResultSet rs;
            
            int i =st.executeUpdate("insert into transaction (id_staff, duration, amount_due, status, penalty_fee, payment_balance)values ("+id_staff+", "+duration+", 1000, 'Pending', 0, 1000)");
            
            int j =st.executeUpdate("insert into resource (rent_status)values ('Available')");
            
            int k =st.executeUpdate("insert into equipment (options)values ('Tent')");
         
            }
            catch (Exception e)
            {
                out.println(e.toString());
            }
            
        %>
        
        <h1>Transaction Form</h1>
        <hr>
        <p>You have successfully made a request to Supplier ID <% out.print(id_staff); %>!</p><br>
        <p>Transaction Details:</p>
        <p>Duration <% out.print(duration); %></p>
        <p>Amount Due: 1000</p>
        <p>Status: Pending</p>
        <p>Penalty Fee: 0</p>
        <p>Payment Balance: 1000</p>
        <br>
        <p>Remember to pay for your request on time to avoid the penalty fee!</p>
        <br>
        <p><a href="S_Resident_Menu.html">Back to Resident Menu</a></p>
        </body>
</html>
