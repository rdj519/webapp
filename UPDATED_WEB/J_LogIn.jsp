


<!This Page Will handle or redirect the user to their respective homepages
    if supplier_user then redirects to the supplier user homepage
    if resident_user then gets redirected to the supplier user homepage
    if system_admin then get redirected to the admin homepage 
    
    
    tl:dr nothing will be displayed this file is just used to redirect the user to the appropriate
    home page>

<!Idea for the SQL statement =  
    To Check for admin: from the user & pass we determine the USER_ID then we check if the USER_ID
    is found in the table AND has the job title of "System Administrator"
    
    To Check for supplier: same as admin where we get the USER_ID and we check if it is found in the table
    of supplier user
    
    Kung none of the above then resident_user
    >
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Redirecting</title>

    <%@ page import="java.sql.*"%>
    <%@ page import ="javax.sql.*" %>
    <%
        String userid = request.getParameter("username");
        String pwd = request.getParameter("password");
        java.sql.Connection con;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?zeroDateTimeBehavior=convertToNull", "root", "p@ssword");
            Statement st= con.createStatement();
            ResultSet rs=st.executeQuery("select * from user where username='"+userid+"' and password='"+pwd+"'");

            if(rs.next())
            {
                response.sendRedirect("S_Resident_Menu.html");
            }

        }
        catch (Exception e)
        {
            out.println(e.toString());
            out.println("Database not found :(");
        }

    %>

    <title>Login Failed</title>
    </head>
    <body>
        <p>Sorry that account name, "<%out.print(userid);%>" currently does not exit.</p>
        <p>Click <a href="index.html">Here</a> to return.</p>
    </body>
</html>