


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
        <title>Redirecting...</title>
    <p>
        <a href="S_Resident_Menu.jsp">To Resident Menu</a>
    </p>
    <p>^^Temporary Remove when the JSP works^^</p>
    </head>
    <body>
        <h1></h1>
    </body>
</html>
