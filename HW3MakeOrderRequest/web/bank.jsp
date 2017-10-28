<%-- 
    Document   : bank
    Created on : Oct 23, 2017, 2:43:43 AM
    Author     : Lauren
--%>

<jsp:useBean id="orderrequest" class="orderrequest.OrderRequestBean" scope="session"/> <%--use javabean object to store and retrieve information --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Bank</h1>
        Is this a verified credit card?
        <%
            //print out credit card number that was stored in database
            out.println(orderrequest.getCardNumber());
        %>
        <br>

        <%--Used yes or no radio buttons for user (bank actor) to select whether or not the credit card on file is valid --%>
        <form action="bankprocess.jsp"> <%--Form redirects to bankprocess.jsp upon submission --%>

            <input type="radio" name="authorized" value="yes" checked>Yes</input><br>
            <input type="radio" name="authorized" value="no">No</input><br>

            <input type='submit' value='Submit'>
            <%--Store input from actor in java bean object under authorized variable --%>
            <jsp:setProperty name="orderrequest" property="*"/> 
        </form>

    </body>
</html>
