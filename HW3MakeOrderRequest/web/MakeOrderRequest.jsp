<%-- 
    Document   : MakeOrderRequest
    Created on : Oct 19, 2017, 1:08:34 PM
    Author     : Lauren
--%>

<%@ page import="orderrequest.CustomerAccount"%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Online Shopping Store</h1>
        <p>Welcome to our online shopping store. 
            Please select an option from the menu </p>
    <a href="Catalog.jsp">Catalog</a>
    
        <form>
         First Name: <input type = "text" name = "first_name">
         <input type="Submit" value ="Submit"/>
         <br />
        
         </form>
    
    <%
        CustomerAccount test = new CustomerAccount();
        
        String testStr = test.testMethod();
        %>
        
        <p>My testStr is: <%=testStr%></p>
        
        <p>My first name is: <%= request.getParameter("first_name") %>
        
            <% testStr = request.getParameter("first_name");%>
            
        <p> New testStr is: <%=testStr%></p>
      
        
     
        
        
      
        
    </body>
</html>
