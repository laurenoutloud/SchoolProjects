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
            //out.println(status);
            
            if(status){
                out.println("Your login was successful.");
                orderrequest.setCardNumber(customerInt.getCreditCardNumber());
                String email = customerInt.getEmail(orderrequest.getAccountId(), orderrequest.getPassword());
                orderrequest.setEmail(email);
                out.println(orderrequest.getEmail());
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
      
    </body>
</html>
