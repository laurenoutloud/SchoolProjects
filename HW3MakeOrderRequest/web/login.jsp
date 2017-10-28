<%-- 
    Document   : login
    Created on : Oct 21, 2017, 1:33:54 PM
    Author     : Lauren
--%>

<jsp:useBean id="orderrequest" class="orderrequest.OrderRequestBean" scope="session"/> <%--Use java bean object to store information --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h1>Login</h1>

        <form action="loginprocess.jsp"> <%--When submit button is clicked form will redirect to loginprocess.jsp --%>
            <%--Used text boxes to read in AccountId (for simplicity account Ids are first names as demonstrated in the assignment requirements --%>
            Account Id: <input type = "text" name = "accountId"> </br>
            Password:   <input type ='text' name ='password'></br>
            <%--Set all of the attributes of my orderrequest java bean object to match the typed values --%>
            <jsp:setProperty name="orderrequest" property="*"  /> 
            <input type="Submit" value ="Submit"/>

            <br />
            <%-- If user doesn't have an account, they can click here to first create an account and then continue with their order --%>
            <p>Don't have an account? Click <a href='createaccountrequestorder.jsp'>here.</a>

        </form>

    </body>
</html>

