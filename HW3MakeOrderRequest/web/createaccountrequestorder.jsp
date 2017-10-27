<%-- 
    Document   : createaccountrequestorder
    Created on : Oct 22, 2017, 11:54:38 AM
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
        <h1>Create Account Request Order</h1>
        
        <p>Please enter your information so we can proceed with your order request.</p>
        <form action="makeorderrequest.jsp" method="post">
             First Name: <input type = "text" name = "accountId"> </br>
             Password:   <input type ='text' name ='password'></br>
             Email: <input type="text" name='email'> </br>
             Credit Card Number:   <input type ='text' name ='cardNumber'></br>
             
         <input type="Submit" value ="Submit"/>
        </form>
         <br />
         <% 
            orderrequest.setRequestType(3);
        
        %>
    </body>
</html>
