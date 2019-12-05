
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>

<% 
    try
    {
        Connection connection = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","p@ssword");
        out.println("The bluetooth device has been connected");
    }
    catch(Exception ex)
    {
        out.println("Unable to connect to database.");
    }
%>

