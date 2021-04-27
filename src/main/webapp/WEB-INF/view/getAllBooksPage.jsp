<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>getAllBooks</title>
    <style>
        /* Fonts */
        @import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap");

        /* General Setup */
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

        /* Table */
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

        /* Media Queries */
        @media (max-width: 320px) {
            .customer-table {
                font-size: 0.55em;
            }
        }

        @media (min-width: 411px) {
            .customer-table {
                font-size: 0.71875em; /*11.5px*/
            }
        }

        @media (min-width: 768px) {
            body {
                font-size: 1.125em; /*16px*/
            }

            caption {
                padding: 20px;
            }
        }

        @media (min-width: 1024px) {
            body {
                font-size: 1.25em; /*20px*/
            }
        }
    </style>
</head>
<body>
<main>
    <table class="customer-table">
        <caption>Book Info</caption>
        <thead>
        <tr>
            <th>BookName</th>
            <th>Author</th>
            <th>Description</th>
            <th>Price</th>
            <th>PublishYear</th>
            <th>SellerName</th>
            <th>Publication</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${bookWarehouseDto}" var="bookWarehouseDto">
            <tr>
                <th>${bookWarehouseDto.bookName}</th>
                <th>${bookWarehouseDto.author}</th>
                <th>${bookWarehouseDto.description}</th>
                <th>${bookWarehouseDto.price}</th>
                <th>${bookWarehouseDto.publishYear}</th>
                <th>${bookWarehouseDto.sellerName}</th>
                <th>${bookWarehouseDto.publication}</th>
                <th><a href="edit/${bookWarehouseDto.bookName}">edit</a></th>
                <th><a href="delete/${bookWarehouseDto.bookName}">delete</a></th>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div align="center"><a href="http://localhost:8080/spiderBookWarehouse_war_exploded/">HOME</a></div>
</main>
</body>
</html>
