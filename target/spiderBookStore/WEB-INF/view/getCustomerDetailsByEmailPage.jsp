<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>GetCustomerDetailsById</title>
</head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
      integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

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

    @media screen and (max-width: 991px) {
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

        h2.nav-item {
            margin-left: 800px;
        }
    }
</style>
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

                    <a class="dropdown-item" href="http://localhost:8081/spiderBookStore_war_exploded/">Home</a>

                    <c:url value="/seller" var="seller"/>
                    <a class="dropdown-item" href="${seller}">Seller Portal</a>

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
                <c:url value="/aboutUs" var="aboutUs"/>
                <a class="nav-link" href="${aboutUs}">AboutUs</a>
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

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>

<section class="center">
    <div class="table__wrapper">
        <h1>Your Account Details</h1>
        <table class="table" summary="This is a summary of your rad table contents.">
            <thead>
            <tr>
                <th scope="row"></th>
                <th scope="col">FirstName</th>
                <th scope="col">LastName</th>
                <th scope="col">Eamil</th>
                <th scope="col">Password</th>
                <th scope="col">RePassword</th>
                <th scope="col">Contact</th>
                <th scope="col">Dob</th>
                <th scope="col">AddressLine1</th>
                <th scope="col">AddressLine2</th>
                <th scope="col">City</th>
                <th scope="col">State</th>
                <th scope="col">PinCode</th>
                <th scope="col">Edit</th>
                <th scope="col">Delete</th>


            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">Account Details</th>
                <td><p>${customerDto.firstName}</p></td>
                <td><p>${customerDto.lastName}</p></td>
                <td><p>${customerDto.email}</p></td>
                <td><p>${customerDto.password}</p></td>
                <td><p>${customerDto.rePassword}</p></td>
                <td><p>${customerDto.contact}</p></td>
                <td><p>${customerDto.dob}</p></td>
                <td><p>${customerDto.addressLine1}</p></td>
                <td><p>${customerDto.addressLine2}</p></td>
                <td><p>${customerDto.city}</p></td>
                <td><p>${customerDto.state}</p></td>
                <td><p>${customerDto.pinCode}</p></td>
                <c:url value="/editCustomerDetails" var="editCustomerDetails"/>
                <td><a href="${editCustomerDetails}">edit</a></td>
                <c:url value="/deleteCustomerDetails" var="deleteCustomerDetails"/>
                <td><a href="${deleteCustomerDetails}?email=${customerDto.email}">delete</a></td>
            </tr>
            </tbody>
        </table>
    </div>
</section>
</body>
</html>




