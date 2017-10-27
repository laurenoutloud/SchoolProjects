<%-- 
    Document   : Catalog
    Created on : Oct 19, 2017, 12:20:28 PM
    Author     : Lauren
--%>

<jsp:useBean id = "orderrequest" class = "orderrequest.OrderRequestBean" scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Catalog</h1>
       
        <form action='login.jsp' metod='post'>
            <b>Item</b>
            <br>
            <input type='radio' name='item' value='note' checked> Note ($1 each) </br>
            <input type='radio' name='item' value='book'> Book ($1 each) </br>
            <input type='radio' name='item' value='pencil'> Pencil ($1 each) </br>
            <b>Quantity</b>
            <br>
            <select name='quantity'>
                <option value='1'>1</option>
                <option value='2'>2</option>
                <option value='3'>3</option>
                <option value='4'>4</option>
                <option value='5'>5</option>
            </select> </br></br>
            
            <jsp:setProperty name="orderrequest" property="*"  />
        
            <input type='submit' value='Submit Order Request'>
        </form>
        
        
        
        
        
        
        <%--
        <form>
            <input type ="text" name="id">
            <input type="Submit" value ="Submit"/>
        </form>
        
        
        
        <jsp:useBean id = "customer" class = "orderrequest.CustomerAccount" />
        <jsp:setProperty name = "customer" property = "accountId" value = '<%= request.getParameter("id") %>' />
        Your Account Id is: 
        <jsp:getProperty name = "customer" property = "accountId"/>
        --%>
        
        
    </body>
</html>
