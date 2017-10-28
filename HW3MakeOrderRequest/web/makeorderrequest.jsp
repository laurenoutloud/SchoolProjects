<%-- 
    Document   : makeorderrequest
    Created on : Oct 23, 2017, 10:41:57 AM
    Author     : Lauren
--%>

<%@page import="orderrequest.CustomerInterface" %>
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

        <h1>Make Order Request</h1>

        <%
                //create customer interface object to submit order request
                CustomerInterface customerInt = new CustomerInterface();
                String confirmation; //create string to store confirmation message

                orderrequest.setTotalPrice(orderrequest.getQuantity()); //set the total price of the order before adding to database

                //use switch statement to determine which type of order to submit
                switch (orderrequest.getRequestType()) {

                    //Case 1: User already existed in database, logged in successfully, and created an order
                    case 1: //send information from java bean object to customer interface objects's request function
                    {
                        confirmation = customerInt.request(orderrequest.getAccountId(), orderrequest.getPassword(), orderrequest.getItem(), orderrequest.getQuantity(), orderrequest.getTotalPrice());
                        orderrequest.setConfirmation(confirmation);//save order confirmation in javabean object

                        response.sendRedirect("emailconfirmation.jsp"); //redirect to email confirmation page
                        break;
                    }

                    //Case 2: User has an account and logged in successfully, but the credit card number was declined by the bank actor
                    case 2: //send information from java bean object to customer interface object's requestOrderWithNewCardNo function
                    {
                        confirmation = customerInt.requestOrderWithNewCardNo(orderrequest.getAccountId(), orderrequest.getPassword(), orderrequest.getCardNumber(), orderrequest.getEmail(), orderrequest.getItem(), orderrequest.getQuantity(), orderrequest.getTotalPrice());
                        orderrequest.setConfirmation(confirmation); //save order confirmation in java bean object

                        response.sendRedirect("emailconfirmation.jsp"); //redirect to email confirmation page
                        break;
                    }

                    //Case 3: user did not have an account and opted to create an account to complete the order
                    case 3:{
                        //send information from java bean object to the customer interface ojbect's function createAccountRequestOrder
                        confirmation = customerInt.createAccountRequestOrder(orderrequest.getAccountId(), orderrequest.getPassword(), orderrequest.getCardNumber(), orderrequest.getEmail(), orderrequest.getItem(), orderrequest.getQuantity(), orderrequest.getTotalPrice());
                        orderrequest.setConfirmation(confirmation);
                        response.sendRedirect("emailconfirmation.jsp"); //store confirmation in java bean object

                        break;
                    }
                }

            

        %>

    </body>
</html>
