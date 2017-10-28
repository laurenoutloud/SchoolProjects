<%-- 
    Document   : createaccountrequestorder
    Created on : Oct 22, 2017, 11:54:38 AM
    Author     : Lauren
--%>


<jsp:useBean id="orderrequest" class="orderrequest.OrderRequestBean" scope="session"/> <%--use java bean object to store/ retrieve information --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%--If user tried to create an order without an account, they will be directed to this page --%>
        <jsp:setProperty name="orderrequest" property="*"  />
        <h1>Create Account Request Order</h1>

        <%--Form is used to store account information in java bean object --%>
        <p>Please enter your information so we can proceed with your order request.</p>
        <form action="makeorderrequest.jsp" method="post"> <%--When account information is submitted, form redirects to makeorderrequest.jsp --%>
            First Name: <input type = "text" name = "accountId"> </br>
            Password:   <input type ='text' name ='password'></br>
            Email: <input type="text" name='email'> </br>
            Credit Card Number:   <input type ='text' name ='cardNumber'></br>

            <input type="Submit" value ="Submit"/>
        </form>
        <br />
        <%
            //request type flag variable is set to 3
            orderrequest.setRequestType(3);

        %>
    </body>
</html>
