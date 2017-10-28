<%-- 
    Document   : loginprocess
    Created on : Oct 22, 2017, 9:19:08 PM
    Author     : Lauren
--%>

<jsp:useBean id="orderrequest" class="orderrequest.OrderRequestBean" scope="session"/> <%-- use java bean object to store/ retrieve information --%>
<%@page import="orderrequest.CustomerInterface" %> <%--Import CustomerInterface.java to create an instance of a CustomerInterface object --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1> Login Confirmation </h1>

        <jsp:setProperty name="orderrequest" property="*"  /><%--Just in case java bean properties weren't set on previous page --%>
        <%
            CustomerInterface customerInt = new CustomerInterface(); //Create an instance of a CustomerInterface object
            boolean status = customerInt.verifyAccount(orderrequest.getAccountId(), orderrequest.getPassword()); //Check to see if the username and password entered by the user exist in database
            //out.println(status);

            //if the user exits:
            if (status) {
                //get the card number from the database and store in java bean object to be used by the bank
                orderrequest.setCardNumber(customerInt.getCreditCardNumber());
                //get the email address from the database and store it in java bean object to be used by email confirmation server
                String email = customerInt.getEmail(orderrequest.getAccountId(), orderrequest.getPassword());
                orderrequest.setEmail(email);
                response.sendRedirect("bank.jsp");
            } //If username/password is incorrect or user does not exist, display error message.
            else {
                out.println("Your login was unsuccessful.");
            }

        %>

        <br>     
        <%--Give user option to try to login again or create a new account and continue with their order --%>
        <p>The username or password you entered is incorrect. Please click 
            <a href="login.jsp">here </a> to go back and try again.</p>

        <p> If you do not have an account, <a href="createaccountrequestorder.jsp"> click here </a> <%-- If user chooses to create a new acccount, they will be redirected to createaccountrequestorder.jsp--%>
            to create a new account and continue with your order </p>

    </body>
</html>
