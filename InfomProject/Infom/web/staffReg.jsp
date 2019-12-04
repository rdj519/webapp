
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>

<% 
    try
    {
        Connection connection = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","p@ssword");
    }
    catch(Exception ex)
    {
        out.println("Unable to connect to database.");
    }
%>

