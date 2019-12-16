
<%@ page import="java.sql.*"%>
    <%@ page import ="javax.sql.*" %>
    <%
        String submission = request.getParameter("submit");
        String group_id = request.getParameter("deleteId");
        java.sql.Connection con;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?zeroDateTimeBehavior=convertToNull","root","p@ssword");
            
            Statement st= con.createStatement();
            int drg = st.executeUpdate("DELETE FROM resident_group WHERE group_id = (SELECT resident_group_group_id FROM resident_group_has_resident_user WHERE resident_group_group_id = '"+group_id+"')");
            int dru = st.executeUpdate("DELETE FROM resident_group_has_resident_user WHERE resident_group_group_id = '"+group_id+"'");
        }
        catch (Exception e)
        {
            out.println(e.toString());
            out.println("Database not found :(");
        }

    %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Group Deletion</title>
    </head>
    <body>
        <p>Group has been successfully deleted!</p>
        <p>Click <a href="S_Resident_Menu.html">Here</a> to return to the Resident Menu.</p>
    </body>
</html>
