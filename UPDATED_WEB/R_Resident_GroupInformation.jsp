
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resident Group Information</title>
    </head>
    <body>
        <h2 align="center"><font><strong>Data Read</strong></font></h2>
        <table align="center" cellpadding="3" cellspacing="3" border="1">
        <tr>

        </tr>
        <tr bgcolor="#A52A2A">
        <td><b>Group ID</b></td>
        <td><b>Group leader ID</b></td>
        <td><b>Group Member ID</b></td>
        </tr>
        <%
            try{
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?zeroDateTimeBehavior=convertToNull","root","p@ssword");
            
            /* Here is to initialize an SQL statement that JSP can use to INTERACT with the database */
            Statement st= con.createStatement();
            
            String sql = "SELECT * FROM resident_group_has_resident_user";
            
            ResultSet resultSet = st.executeQuery(sql);
            while(resultSet.next()){
        %>
        
        <tr bgcolor="#DEB887">

        <%    /* maybe not getString but getInt()? since ID */ %>
        <td><%=resultSet.getString("resident_group_group_id") %></td>
        <td><%=resultSet.getString("group_leader_id") %></td>
        <td><%=resultSet.getString("resident_user_id_user") %></td>
        
        </tr>
        <%
                }
            }
            catch(Exception e){
            e.printStackTrace();
            }
        %>
        </table>
        <br>
        <br>
        <p><a href="R_Resident_CreateGroup.html">Click Here to create your group (if you don't have a group yet). </a></p>
        <p><a href="R_Resident_UpdateMember.html">Click Here to go update members this group. </a></p>
        <p><a href="R_Resident_DeleteGroup.html">Click Here to go delete this group. </a></p>
    </body>
</html>
