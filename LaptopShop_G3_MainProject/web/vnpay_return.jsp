<%-- 
    Document   : vnpay_return
    Created on : Jul 2, 2024, 1:33:24 PM
    Author     : vutie
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>VNPAY Return</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f0f0;
                margin: 0;
                padding: 0;
            }
            .container {
                width: 80%;
                margin: 50px auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }
            h2 {
                color: #333;
            }
            .success {
                color: #4CAF50;
            }
            .error {
                color: #f44336;
            }
        </style>
        <script>
            function redirectToCompletion() {
                setTimeout(function() {
                    window.location.href = 'completion.jsp';
                }, 5000);
            }
        </script>
    </head>
    <body>
        <div class="container">
            <h2>VNPAY Return</h2>

            <c:set var="responseCode" value="${param.vnp_ResponseCode}" />
            <c:set var="transactionStatus" value="${param.vnp_TransactionStatus}" />

            <p>Response Code: ${responseCode}</p>
            <p>Transaction Status: ${transactionStatus}</p>

            <c:choose>
                <c:when test="${responseCode == '00'}">
                    <div class="success">
                        <h3>Payment Success!</h3>
                        <p>Transaction ID: ${param.vnp_TransactionNo}</p>
                        <p>Amount: ${param.vnp_Amount}</p>
                        <p>Payment Method: ${param.vnp_PaymentMethod}</p>
                        <!-- Clear session and redirect to completion.jsp -->
                        <%
                            session.removeAttribute("cart");
                        %>
                        <script>
                            redirectToCompletion();
                        </script>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="error">
                        <h3>Payment Failed!</h3>
                        <p>Error Code: ${responseCode}</p>
                        <p>Error Message: ${param.vnp_OrderInfo}</p>
                        <p>Please <a href="checkout.jsp">return to checkout</a> and try again.</p>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </body>
</html>
