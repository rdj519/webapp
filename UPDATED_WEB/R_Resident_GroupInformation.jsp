
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resident Group Information</title>
    </head>
    <body>
        Group ID:
        Leader: 
        Members:
        <br>
        <br>
        <% /* if user has no group*/ %>
        <p><a href="R_Resident_CreateGroup.html">Click Here to create your group. </a></p>
        <% /* end ng if something something */ %>
        <p><a href="R_Resident_UpdateMember.html">Click Here to go update members this group. </a></p>
        <p><a href="R_Resident_DeleteGroup.html">Click Here to go delete this group. </a></p>
    </body>
</html>
