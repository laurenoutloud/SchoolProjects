<%-- 
    Document   : login
    Created on : Oct 21, 2017, 1:33:54 PM
    Author     : Lauren
--%>

<jsp:useBean id="orderrequest" class="orderrequest.OrderRequestBean" scope="session"/>
<%@page import="orderrequest.CustomerInterface" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h1>Login</h1>
       
        
        <form action="loginprocess.jsp">
             Account Id: <input type = "text" name = "accountId"> </br>
             Password:   <input type ='text' name ='password'></br>
            <jsp:setProperty name="orderrequest" property="*"  /> 
             <input type="Submit" value ="Submit"/>
              
         <br />
         <p>Don't have an account? Click <a href='createaccountrequestorder.jsp'>here.</a>
        
           
         </form>
        
        
    </body>
    
</html>

