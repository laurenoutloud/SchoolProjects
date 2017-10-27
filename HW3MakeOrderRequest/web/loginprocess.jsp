<%-- 
    Document   : loginprocess
    Created on : Oct 22, 2017, 9:19:08 PM
    Author     : Lauren
--%>

<jsp:useBean id="orderrequest" class="orderrequest.OrderRequestBean" scope="session"/>
<%@page import="orderrequest.CustomerInterface" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1> Login Confirmation </h1>
        
        <jsp:setProperty name="orderrequest" property="*"  />
         <% 
            CustomerInterface customerInt = new CustomerInterface();
            boolean status = customerInt.verifyAccount(orderrequest.getAccountId(), orderrequest.getPassword());
            
            if(status){
                out.println("Your login was successful.");
                orderrequest.setCardNumber(Integer.toString(customerInt.getCreditCardNumber()));
                response.sendRedirect("bank.jsp");
                }
            
            else {
            out.println("Your login was unsuccessful.");
                    }
            %>
            
        <br>     
            
        <p>The username or password you entered is incorrect. Please click 
            <a href="login.jsp">here </a> to go back and try again.</p>
            
        <p> If you do not have an account, <a href="createaccountrequestorder.jsp"> click here </a>
            to create a new account and continue with your order </p>
         
        <%--
        <jsp:getProperty name="orderrequest" property="item"/> <br>
         <jsp:getProperty name="orderrequest" property="quantity"/> <br>
         <jsp:getProperty name="orderrequest" property="accountId"/> <br>
         <jsp:getProperty name="orderrequest" property="password"/> <br>
         <jsp:getProperty name="orderrequest" property="totalPrice"/>
           --%>
    </body>
</html>
