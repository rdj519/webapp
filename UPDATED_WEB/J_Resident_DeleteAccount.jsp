

<%@ page import="java.sql.*"%>
    <%@ page import ="javax.sql.*" %>
    <%
        String submission = request.getParameter("submit");
        String email = request.getParameter("deleteMail");
        java.sql.Connection con;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?zeroDateTimeBehavior=convertToNull", "root", "p@ssword");
            Statement st= con.createStatement();
            int rs=st.executeUpdate("DELETE FROM resident_user WHERE id_user = (SELECT id_user FROM user WHERE email_adress = '"+email+"')");
            int bs = st.executeUpdate("DELETE FROM user WHERE email_adress = '"+email+"'");
          

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
        <title>Account Deletion</title>
    </head>
    <body>
        <p>Account has been successfully deleted!</p>
        <p>Click <a href="index.html">Here</a> to return to the login screen.</p>
    </body>
</html>
