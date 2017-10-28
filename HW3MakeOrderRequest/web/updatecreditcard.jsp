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
        <jsp:setProperty name="orderrequest" property="*"  /> <%--double check all java bean variables were set --%>
        
        <%--If user's credit card was denied by bank actor, they will be redirected to this page --%>
        <h1>Update Credit Card</h1>
        <p> The credit card you have on file was declined. Please enter a new card number to complete your order</p>
        
        <%--User form to store new credit card number in java bean object --%>
        <form action="makeorderrequest.jsp" method="post"> <%--Form redirects to makeorderequest.jsp when submitted --%>
            
            Credit Card Number:   <input type ='text' name ='cardNumber'></br>
            
         <input type="Submit" value ="Submit"/>
        </form>
   
        
    </body>
</html>
