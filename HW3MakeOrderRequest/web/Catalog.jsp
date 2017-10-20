<%-- 
    Document   : Catalog
    Created on : Oct 19, 2017, 12:20:28 PM
    Author     : Lauren
--%>

<%@ page import="orderrequest.CustomerInterface"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Catalog</h1>
        <form>
            <input type ="text" name="id">
            <input type="Submit" value ="Submit"/>
        </form>
        
        
        
        <jsp:useBean id = "customer" class = "orderrequest.CustomerAccount" />
        <jsp:setProperty name = "customer" property = "accountId" value = '<%= request.getParameter("id") %>' />
        Your Account Id is: 
        <jsp:getProperty name = "customer" property = "accountId"/>
    </body>
</html>
