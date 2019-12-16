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

            String firstId = request.getParameter("id_1");
            String secondId = request.getParameter("id_2");
            String grpID = request.getParameter("grp_id");
            
            try //TRY CATCH IMPORTANT FOR CONNECTION ISSUES WITH THE DATABASE
            {
            /* The statement below converts Java Time into SQL time */


            
            /*The next 2 lines is how we connect to our database*/
            /* "jdbc:mysql://<ADDRESS_OF_YOUR_DATABASE>:<PORT_NUMBER>/<NAME_OF_YOUR_DATABASE>?zeroDateTimeBehavior=convertToNull" , <USERNAME>, <PASSWORD> */
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?zeroDateTimeBehavior=convertToNull","root","password");
            
            /* Here is to initialize an SQL statement that JSP can use to INTERACT with the database */
            Statement st= con.createStatement();
            ResultSet rs; 
            
            /* RESIDENT GROUP ID IS SET TO NULL MUNA */
            
            //each record for each member (strictly two)
            int mem1 =st.executeUpdate("INSERT INTO resident_group_has_resident_user (resident_group_group_id, group_leader_id, resident_user_id_user) VALUES (NULL,'"+grpID+"','"+firstId+"')");    
            int mem2 =st.executeUpdate("INSERT INTO resident_group_has_resident_user (resident_group_group_id, group_leader_id, resident_user_id_user) VALUES (NULL,'"+grpID+"','"+secondId+"')"); 
            
            /* CREATE RESIDENT GROUP */
            
            int grp1 = st.executeUpdate("INSERT INTO resident_group (group_id, group_address) SELECT id_user, complete_address FROM resident_user WHERE id_user = '"+grpID+"'");
            
        
            }
            catch (Exception e)
            {
                out.println(e.toString());
            }
            
        %>
    </body>
</html>
