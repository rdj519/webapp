<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, java.text.*" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resident Create Group</title>
    </head>
    <body>
        <%
            
            /*
                String name = request.getParameter("name_of_the_field");
                ^^ THIS IS HOW YOU GET YUNG LAMAN NG FIELD AN DUMP IT INTO A STRING VARIABLE
            */
            String firstId = request.getParameter("id_1");
            String secondId = request.getParameter("id_2");
            String grpID = request.getParameter("grp_id");
            
            try //TRY CATCH IMPORTANT FOR CONNECTION ISSUES WITH THE DATABASE
            {
            /* The statement below converts Java Time into SQL time */


            
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
            
            /* RESIDENT GROUP ID IS SET TO NULL MUNA */
            
            //each for each member
            int mem1 =st.executeUpdate("insert into resident_group_has_resident_user values (1, '"+grpID+"','"+firstId+"')");    
            int mem2 =st.executeUpdate("insert into resident_group_has_resident_user values (1, '"+grpID+"','"+secondId+"')"); 
            
            /* ANYTHING INSIDE executeUpdate() IS THE SQL STATEMENT THAT JSP WILL PERFORM */
            
            int grp1 = st.executeUpdate("insert into resident_group (group_id, group_address) select NULL, complete_address from resident_user where id_user = '"+grpID+"'");
            
            //FIX BELOW
            //int a=st.executeUpdate("insert into resident_user values (LAST_INSERT_ID(), '"+address+"', 'Good Standing', NULL, NULL, NULL, NULL, NULL)");
            }
            catch (Exception e)
            {
                out.println(e.toString());
            }
            
        %>
    </body>
</html>
