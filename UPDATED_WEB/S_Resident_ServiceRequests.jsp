<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Service Requests</title>
    </head>
    <body>
        <%
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
        <h1>Service Requests</h1>
        
        <p><a href="S_Resident_Menu.html">Back to Resident Menu</a></p>
        </body>
    </body>
</html>
