<%-- 
    Document   : updatecreditcard
    Created on : Oct 23, 2017, 8:43:45 AM
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
        
        <h1>Update Credit Card</h1>
        <p> The credit card you have on file was declined. Please enter a new card number to complete your order</p>
        
        <form action="makeorderrequest.jsp" method="post">
            
            Credit Card Number:   <input type ='text' name ='cardNumber'></br>
            
         <input type="Submit" value ="Submit"/>
        </form>
     
        <% 
            orderrequest.setRequestType(2);
        
        %>
        
    </body>
</html>
