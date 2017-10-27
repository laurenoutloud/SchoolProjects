<%-- 
    Document   : bank
    Created on : Oct 23, 2017, 2:43:43 AM
    Author     : Lauren
--%>

<jsp:useBean id="orderrequest" class="orderrequest.OrderRequestBean" scope="session"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:setProperty name="orderrequest" property="*"  />
        <h1>Bank</h1>
        Is this a verified credit card?
        <%
            
            out.println(orderrequest.getCardNumber());
        %>
        <br>
        <form action="bankprocess.jsp">
            
            <input type="radio" name="authorized" value="yes" checked>Yes</input><br>
            <input type="radio" name="authorized" value="no">No</input><br>
            
            <input type='submit' value='Submit'>
            
            <jsp:setProperty name="orderrequest" property="*"/> 
        </form>
        
        
        
        
    </body>
</html>
