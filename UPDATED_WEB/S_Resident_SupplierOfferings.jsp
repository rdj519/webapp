
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Supplier Offerings</title>
    </head>
    <body>
        <h1>Supplier Offerings</h1><hr><br>
   
        <p>-place supplier offerings table here from sql-</p>
        
        <%
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
        
        <form method="post" action="S_Resident_TransactionForm.html">
            <input type="submit" name="submit" value ="Place a Request" />
        </form>

        
        <p><a href="S_Resident_Menu.html">Back to Resident Menu</a></p>
    </body>
</html>
