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
            String old_id = request.getParameter("old_id");
            String new_id = request.getParameter("new_id");
   
            
            String confirm = request.getParameter("confimation");
            
            try //TRY CATCH IMPORTANT FOR CONNECTION ISSUES WITH THE DATABASE
            {

            
            /*The next 2 lines is how we connect to our database*/
            /* ngl i cant rly explain how Class.forName("com.mysql.jdbc.Driver"); works but it does here*/
            /* The second line is the next important part */
            /* "jdbc:mysql://<ADDRESS_OF_YOUR_DATABASE>:<PORT_NUMBER>/<NAME_OF_YOUR_DATABASE>?zeroDateTimeBehavior=convertToNull" , <USERNAME>, <PASSWORD> */
            /* IF THERE ARE ANY ISSUES TO WHY U CANT CONNECT TO THE DATABASE JSUT REFER TO THE FORMAT ABOVE */
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?zeroDateTimeBehavior=convertToNull","root","p@ssword");
            
            /* Here is to initialize an SQL statement that JSP can use to INTERACT with the database */
            Statement st= con.createStatement();
            
            int rs=st.executeUpdate("UPDATE resident_group_has_resident_user SET resident_user_id_user = '"+new_id+"' WHERE id_user = (SELECT resident_user_id_user FROM resident_group_has_resident_user WHERE resident_user_id_user = '"+old_id+"')");
            }
            catch (Exception e)
            {
                out.println(e.toString());
            }
            
        %>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Status</title>
    </head>
    <body>
        <h1>Changes have been saved!</h1>
        <hr>
        <p>New Member (ID): <% out.print(new_id);%>. </p>
        <p>Click <a href="R_Resident_GroupInformation.html"></a> to return to the group information menu.</p>
    </body>
    
</html>
