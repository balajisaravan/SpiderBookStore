<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>placeOrder</title>
</head>
<style>
    * {
        box-sizing: border-box;
        font-family: Arial, Helvetica, sans-serif;
    }

    .table__wrapper {
        width: 100%;
    }

    .table__wrapper .table {
        width: 100%;
        max-width: 100%;
    }

    h1 {
        text-align: center;
    }

    .center {
        margin: 0 auto;
        width: 80%;
    }

    .table {
        border: 1px solid #f0f0f0;
        border-collapse: collapse;
    }

    .table tr {
        border-bottom: 1px solid #f0f0f0;
    }

    .table thead tr {
        border-bottom: 2px solid #f0f0f0;
    }

    .table td,
    .table th {
        padding: .5em;
    }

    .table th {
        text-align: left;
    }

    @media screen and (max-width:991px) {
        .table {
            margin: 0 auto;
            width: 100%;
            border-spacing: 0;
        }
        .table thead {
            position: absolute;
            clip: rect(1px, 1px, 1px, 1px);
            padding: 0;
            border: 0;
            height: 1px;
            width: 1px;
            overflow: hidden;
        }
        .table tbody,
        .table tr,
        .table th,
        .table td {
            display: block;
            padding: 0;
            text-align: left;
            white-space: normal;
        }
        .table tr td,
        .table tr th {
            padding: 2em 1em;
            vertical-align: middle;
            overflow: hidden;
            position: relative;
            vertical-align: top;
            border: 1px solid #EDF0F1;
            border-top: none;
            width: 100%;
            white-space: normal;
        }
        .table th[scope="row"] {
            width: 100%;
            text-align: center;
            display: block;
            background-color: #B3BFC6;
            margin: 0 auto;
            padding: .5em 0;
        }
        .table td[data-header]:before {
            content: attr(data-header);
            display: block;
            float: left;
            width: 50%;
            color: #000000;
            font-weight: bold;
            text-align: left;
        }
        .table td[data-header] > * {
            display: block;
            width: 50%;
            float: right;
            clear: right;
            padding-left: 1em;
            margin-top: 0;
        }
        .table td[data-header]:after {
            content: "";
            position: absolute;
            left: 0;
            top: 0;
            width: 50%;
            border-right: 1px solid #EDF0F1;
            padding-bottom: 200%;
            display: block;
        }
    }

    @media screen and (max-width: 600px) {
        .center {
            width: 100%;
        }
    }
</style>
<body>
<div align="center">
    <h1>Spider Book Store</h1>

    <hr>

    <h2>Order placed successfully</h2>

</div>
<section class="center">
    <div class="table__wrapper">
        <table class="table" summary="This is a summary of your rad table contents.">
            <thead>
            <tr>
                <th scope="col">Email</th>
                <th scope="col">OrderId</th>
                <th scope="col">Payment</th>
                <th scope="col">BookId</th>
                <th scope="col">BookName</th>
                <th scope="col">Price</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><p>${customerDto.email}</p></td>
                <td><p>${customerDto.orderId}</p></td>
                <td><p>${customerDto.cod}</p></td>
                <td><p>${bookWarehouse.bookId}</p></td>
                <td><p>${bookWarehouse.bookName}</p></td>
                <td><p>${bookWarehouse.price}</p></td>
            </tr>
            </tbody>
        </table>

        <br>

        <div align="center"><a href="http://localhost:8081/spiderBookStore_war_exploded/">HOME</a></div>
    </div>
</section>
</body>
</html>

