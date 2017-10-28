<%-- 
    Document   : Catalog
    Created on : Oct 19, 2017, 12:20:28 PM
    Author     : Lauren
--%>

<jsp:useBean id = "orderrequest" class = "orderrequest.OrderRequestBean" scope="session" /> <%--Use javabean object to store information --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Catalog</h1>

        <form action='login.jsp' metod='post'> <%--Form that goes to login.jsp on submit --%>
            <b>Item</b>
            <br>
            <%--Used radio buttons so the user can only select one menu item --%>
            <input type='radio' name='item' value='note' checked> Note ($1 each) </br>
            <input type='radio' name='item' value='book'> Book ($1 each) </br>
            <input type='radio' name='item' value='pencil'> Pencil ($1 each) </br>
            <b>Quantity</b>
            <br>
            <%--Used a select dropdown box so customer can select how many of each item they want --%>
            <select name='quantity'>
                <option value='1'>1</option>
                <option value='2'>2</option>
                <option value='3'>3</option>
                <option value='4'>4</option>
                <option value='5'>5</option>
            </select> </br></br>
            <%--Set all of the attributes of my orderrequest java bean object to match the selected values --%>
            <jsp:setProperty name="orderrequest" property="*"  />

            <input type='submit' value='Submit Order Request'>
        </form>

    </body>
</html>
