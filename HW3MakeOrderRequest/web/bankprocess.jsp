<%-- 
    Document   : bank
    Created on : Oct 23, 2017, 2:43:43 AM
    Author     : Lauren
--%>

<jsp:useBean id="orderrequest" class="orderrequest.OrderRequestBean" scope="session"/> <%--use java bean object to store/ retrive information --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Bank Process</h1>
        <jsp:setProperty name="orderrequest" property="*"/> <%--Make sure all java bean attributes were set correctly from previous page --%>

        <%
            //Check whether or not bank actor authorized credit card

            //if the credit card was authorized, set request type flag variable equal to 1 and redirect to makeorderequest.jsp
            if (orderrequest.getAuthorized().equals("yes")) {

                orderrequest.setRequestType(1);
                response.sendRedirect("makeorderrequest.jsp");

            }
            //if the credit card was not authorized, set request type flag variable equal to 2 and redirect to updatecreditcard.jsp
            if (orderrequest.getAuthorized().equals("no")) {
                orderrequest.setRequestType(2);
                response.sendRedirect("updatecreditcard.jsp");
            }

        %>
    </body>
</html>
