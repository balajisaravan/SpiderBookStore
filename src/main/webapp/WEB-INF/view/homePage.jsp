<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Home</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <!--Custom CSS-->
    <link rel="stylesheet" href="space.css">

    <title>Home</title>

    <style>
        .navbar-brand {
            font-weight: bolder;
        }

        .nav-item {
            padding-left: 1rem;
        }

        .navbar {
            background-color: rgb(86, 205, 183);
        }

        .footer {
            background-color: rgb(221, 187, 187);
        }

        .form-control {
            background-color: rgb(224, 186, 186);
            border: 1px solid rgba(255, 255, 255, .5);;
            border-radius: 0;
            opacity: 1;
        }

        .form-control .form-inline {
            width: 220px;
        }


        .form-control:focus {
            color: black;
            background-color: #fff;
            border-color: #a75470;
            box-shadow: none;
        }

        .form-control::placeholder {
            color: rgba(255, 255, 255, .5);
        }

        .btn {
            color: #fff;
            background-color: #a56177;
            border-color: rgb(224, 186, 186);
            border-radius: 0;
            height: 38px;
        }

        .btn:hover, .btn:focus {
            color: #fff;
            box-shadow: 0 0 0 0.2rem #a56177;
        }

        .dropdown-menu {
            padding: 0;
            border-radius: 0;
            background-color: rgb(223, 197, 197);

        }

        .dropdown-item {
            color: rgba(255, 255, 255, .5);
        }

        .dropdown-item:hover {
            background-color: rgb(224, 186, 186);
            color: white;
        }

        .carousel-caption, h3 {
            font-weight: lighter;
        }

        .footer {
            font-size: x-small;
        }

    </style>

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

        h2.nav-item {
            margin-left: 800px;
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

<nav class="navbar navbar-expand-sm navbar-dark" data-id="web_navigation_bar">
    <picture class="navbar-brand brand-name"><img
            src="https://c8.alamy.com/comp/WAWTNN/education-vector-logo-open-book-dictionary-textbook-or-notebook-with-sunrice-icon-modern-emblem-idea-concept-design-for-business-libraries-WAWTNN.jpg"
            alt="Girl in a jacket" width="70" height="70">
    </picture>
    <a class="navbar-brand brand-name" href>Spider Book Store</a>
    <div class="collapse navbar-collapse" id="web_navigation_bar_collapse">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item dropdown">

                <c:if test="${pageContext.request.userPrincipal.name!=null}">
                <a class="nav-link dropdown-toggle" href="#" id="dropdown07XL" data-toggle="dropdown"
                   aria-expanded="false">Setting</a>
                <div class="dropdown-menu" aria-labelledby="dropdown07XL">

                    <a class="dropdown-item" href="getCustomerDetailsByEmail">Profile</a>

                    <a class="dropdown-item" href="seller">Seller Portal</a>

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

                    <a class="dropdown-item" href="javascript:formSubmit()"> Logout</a>
                </div>
            </li>
            </c:if>

            <li class="nav-item">
                <a class="nav-link" href="aboutUs">AboutUs</a>
            </li>

                <c:if test="${pageContext.request.userPrincipal.name==null}">
                    <li class="nav-item">
                        <div align="center"><a class="nav-link" href="login">Login</a></div>
                    </li>

                    <li class="nav-item">
                        <div align="center" class="nav-link">or</div>
                    </li>

                    <li class="nav-item">
                        <div align="center"><a class="nav-link" href="customerRegistration">Register</a></div>
                    </li>

                </c:if>

                <li class="nav-item">
                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <h2 class="nav-item" style="margin-left: 500px">
                            Hi : ${firstName}
                        </h2>
                    </c:if>
                </li>
        </ul>
    </div>
</nav>

<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="https://wallpapercave.com/wp/wp4430570.jpg" class=" w-100 " alt="Error loading image">
        </div>
        <div class="carousel-item">
            <img src="https://wallpaperaccess.com/full/552869.jpg" alt="Error loading image">
        </div>
        <div class="carousel-item">
            <img src="https://images.hdqwalls.com/wallpapers/enjoying-coffee-and-reading-book-4k-nn.jpg"
                 class="d-block w-100" alt="Error loading image">
        </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>

<main>
    <table class="customer-table">
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
        <c:forEach items="${bookWarehouseDto}" var="bookWarehouseDto">
            <tr>
                <th><a href="getbookWarehouseDtoById/${bookWarehouseDto.bookId}">${bookWarehouseDto.bookId}</a></th>
                <th><a href="getbookWarehouseDtoById/${bookWarehouseDto.bookId}">${bookWarehouseDto.bookName}</a></th>
                <th>${bookWarehouseDto.author}</th>
                <th>${bookWarehouseDto.description}</th>
                <th>${bookWarehouseDto.price}</th>
                <th>${bookWarehouseDto.publishYear}</th>
                <th>${bookWarehouseDto.sellerName}</th>
                <th>${bookWarehouseDto.publication}</th>
                <th><a href="getbookWarehouseDtoById/${bookWarehouseDto.bookId}">buy</a></th>   <%--checkOut/${pageContext.request.userPrincipal.name}--%>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</main>
</body>
</html>





