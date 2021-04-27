<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>GetById</title>

    <style>
        @import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap");

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-size: 16px;
        }

        main {
            padding: 10px;
        }

        .customer-table {
            font-size: 0.625em;
            font-family: "Noto Sans KR", sans-serif;
            width: 100%;
            max-width: 1024px;
            margin: 100px auto;
            border-collapse: collapse;
            text-align: center;
            box-shadow: 0 2px 2px #e6e6e6;
        }

        caption {
            font-weight: bold;
            padding: 10px;
            background-color: #3b6978;
        }

        thead th {
            background-color: #204051;
        }

        caption,
        thead th {
            color: #fff;
        }

        th {
            padding: 10px 5px;
        }

        tfoot {
            text-align: left;
            background-color: #e7dfd5;
            font-weight: lighter;
            font-size: 0.8em;
        }

        tbody th,
        tbody td {
            text-align: center;
        }

        tbody tr {
            border-bottom: 2px solid transparent;
        }

        tbody tr:hover {
            border-bottom: 2px solid #84a9ac;
        }

        tbody tr:nth-of-type(even) {
            background-color: #e7dfd5;
        }

        @media (max-width: 320px) {
            .customer-table {
                font-size: 0.55em;
            }
        }

        @media (min-width: 411px) {
            .customer-table {
                font-size: 0.71875em;
            }
        }

        @media (min-width: 768px) {
            body {
                font-size: 1.125em;
            }

            caption {
                padding: 20px;
            }
        }

        @media (min-width: 1024px) {
            body {
                font-size: 1.25em;
            }
        }
    </style>

</head>
<body>

<c:url value="/getCustomerDetailsByEmail" var="getCustomerDetailsByEmail"/>
<a href="${getCustomerDetailsByEmail}">Profile</a>

<c:url value="/seller" var="seller"/>
<a href="${seller}">Seller Portal</a>

<c:if test="${pageContext.request.userPrincipal.name != null}">
    <h2 style="margin-left: 500px">
        Hi : ${firstName}
    </h2>
</c:if>

<div align="center">
    <h1>Check Your Book Details Before Buy</h1>
    <hr>
</div>

<main>
    <table class="customer-table">
        <caption>Book Info</caption>
        <thead>
        <tr>
            <th>BookId</th>
            <th>BookName</th>
            <th>Author</th>
            <th>Description</th>
            <th>Price</th>
            <th>PublishYear</th>
            <th>SellerName</th>
            <th>Publication</th>
            <th>Buy</th>

        </tr>
        </thead>
        <tbody>
        <tr>
            <th>${bookWarehouse.bookId}</th>
            <th>${bookWarehouse.bookName}</th>
            <th>${bookWarehouse.author}</th>
            <th>${bookWarehouse.description}</th>
            <th>${bookWarehouse.price}</th>
            <th>${bookWarehouse.publishYear}</th>
            <th>${bookWarehouse.sellerName}</th>
            <th>${bookWarehouse.publication}</th>
            <c:url value="/checkOut" var="checkOut"/>
            <th><a href="${checkOut}">buy</a></th>
        </tr>
        </tbody>
    </table>
    <div align="center"><a href="http://localhost:8081/spiderBookStore_war_exploded/">HOME</a></div>

    <br>
    <div align="center">
        <a class="dropdown-item" href="javascript:formSubmit()"> Logout</a>
    </div>
    </div>
    <c:url value="/logout" var="logout"/>
    <form action="${logout}" method="post" id="logoutForm">
        <input type="hidden"
               name="${_csrf.parameterName}"
               value="${_csrf.token}"/>
    </form>

    <script>
        function formSubmit() {
            document.getElementById("logoutForm").submit();
        }
    </script>
</main>
</body>
</html>

