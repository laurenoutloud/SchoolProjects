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
            CustomerInterface customerInt = new CustomerInterface();
          
            
            
            switch(orderrequest.getRequestType()){
                
                case 1: {out.println("Made it to case 1");
                        String confirmation;
                        confirmation = customerInt.request(orderrequest.getAccountId(), orderrequest.getPassword(), orderrequest.getItem(), orderrequest.getQuantity(), orderrequest.getTotalPrice());
                        orderrequest.setConfirmation(confirmation);
                        String email = customerInt.getEmail(orderrequest.getAccountId(), orderrequest.getPassword());
                        orderrequest.setEmail(email);
                        response.sendRedirect("emailconfirmation.jsp");}
                        break;
                case 2: out.println("Made it to case 2");
                        response.sendRedirect("emailconfirmation.jsp");
                        break;
                case 3: out.println("Made it to case 3");
                        response.sendRedirect("emailconfirmation.jsp");
                        break;
                case 4: out.println("Made it to case 4");
                        response.sendRedirect("index.jsp");
                        break;
                
            }
        
        
        
        %>
            
    </body>
</html>