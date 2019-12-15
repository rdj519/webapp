<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date, java.text.SimpleDateFormat" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        
        <%
            
            /*
                String name = request.getParameter("name_of_the_field");
                ^^ THIS IS HOW YOU GET YUNG LAMAN NG FIELD AN DUMP IT INTO A STRING VARIABLE
            */
            String email = request.getParameter("updateEmail");
            String password = request.getParameter("updatePass");
            String bday = request.getParameter("updateBDay");
            String gender = request.getParameter("updateGender");
            String address = request.getParameter("updateAddress");
            
            
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
            int i =st.executeUpdate("UPDATE user SET (NULL,'"+email+"','"+username+"','"+password+"','"+lastname+"', '"+firstname+"','"+dateDB+"' ,'"+gender+"', '"+address+"')");
            
            }
            catch (Exception e)
            {
                out.println(e.toString());
            }
            
        %>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
