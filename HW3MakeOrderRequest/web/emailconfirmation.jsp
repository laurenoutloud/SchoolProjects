<%-- 
    Document   : emailserver
    Created on : Oct 22, 2017, 12:06:02 PM
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
        <h1>Email Confirmation</h1>
        <p> Thank you for your order. An email confirmation has been sent to <%=orderrequest.getEmail()%> </p>
        <b>Order Confirmation </b> <br>
            <% 
                out.println(orderrequest.getConfirmation());
            
            %>
             
         <input type="Submit" value ="Submit"/>
         <br />
    </body>
</html>
