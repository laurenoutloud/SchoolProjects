<%-- 
    Document   : MakeOrderRequest
    Created on : Oct 19, 2017, 1:08:34 PM
    Author     : Lauren
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index</title>
    </head>
    <body>
        <h1>Online Shopping Store</h1>
        <p>Welcome to our online shopping store. 
            Please select an option from the menu to continue.</p>
    
        <ul>
            <li><a href="catalog.jsp">Browse Catalog</a></li>
            <li><a href="createaccount.jsp">Create Account</a></li>
            <li><a href="quit.jsp">Quit</a></li>
 
        </ul>
        
       <jsp:useBean id="custInt" class="orderrequest.CustomerInterface" scope="session"/>
        
    </body>
</html>
