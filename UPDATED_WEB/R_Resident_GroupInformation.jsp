
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resident Group Information</title>
    </head>
    <body>
        <p>Group ID:</p>
        <p>Leader:</p> 
        <p>Members:</p>
        <br>
        <%
            // REPLACE INFO WITH GROUP INFO = GROUP ID, LEADER, MEMBERS
            try
            {
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?zeroDateTimeBehavior=convertToNull","root","p@ssword");
            
            /* Here is to initialize an SQL statement that JSP can use to INTERACT with the database */
            Statement st= con.createStatement();
            ResultSet rs;
            
            int i =st.executeUpdate("select * from supplier_user (id_user)values");
           
            }
            catch (Exception e)
            {
                out.println(e.toString());
            }
            
        %>
        <br>
        <% /* if user has no group*/ %>
        <p><a href="R_Resident_CreateGroup.html">Click Here to create your group. </a></p>
        <% /* end ng if something something */ %>
        <p><a href="R_Resident_UpdateMember.html">Click Here to go update members this group. </a></p>
        <p><a href="R_Resident_DeleteGroup.html">Click Here to go delete this group. </a></p>
    </body>
</html>
