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

    <title>ListOfBooks</title>

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
        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap");

        body {
            font-family: "Poppins", sans-serif !important;
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

                    <c:url value="/getCustomerDetailsByEmail" var="getCustomerDetailsByEmail"/>
                    <a class="dropdown-item"
                       href="${getCustomerDetailsByEmail}">Profile</a>

                    <c:url value="/seller" var="seller"/>
                    <a class="dropdown-item" href="${seller}">Seller Portal</a>

                    <a class="dropdown-item" href="javascript:formSubmit()"> Logout</a>
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
            </li>
            </c:if>

            <li class="nav-item">
                <a class="nav-link" href="http://localhost:8081/spiderBookStore_war_exploded/">Home</a>
            </li>

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
                    <h2 class="nav-item" style="margin-left: 400px">
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
</body>

<div align="center">
    <h1>Spider Book Store</h1>
    <hr>
</div>

<div class="container my-5">
    <div class="row">
        <div class="col-md-6 p-4 p-sm-5 order-2 order-sm-1">
            <small class="text-uppercase" style="color: #9B5DE5;">About us</small>
            <h1 class="h2 mb-4" style="font-weight: 600;">Your Headline <span style="color: #9B5DE5;">Here</span></h1>
            <p class="text-secondary" style="line-height: 2;">We also support anyone who advocates for books through our affiliate program,
                which pays a 10% commission on every sale, and gives a matching 10% to independent bookstores. If you are an author, a website or magazine,
                have a bookclub, an organization that wants to recommend books, or even just a book-lover with an Instagram feed, you can sign up to be an affiliate,
                start your own shop, and be rewarded for your advocacy of books.
                Bookshop wants to give back to everyone who promotes books, authors, and independent bookstores!</p>
            <a href="#" style="background-color: #9B5DE5; width: 240px;"
               class="btn px-4 py-3 mt-4 text-white d-flex align-items-center justify-content-between">
                <span>Download Profile</span>
                <svg width="25px" fill="currentColor" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg"
                     xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                     viewBox="0 0 489 489" style="enable-background:new 0 0 489 489;" xml:space="preserve">
        <g>
            <g>
                <path d="M329.2,327.2c-4.5,0-8.1,3.4-8.6,7.9c-3.9,38.6-36.5,68.7-76.2,68.7c-39.6,0-72.2-30.1-76.2-68.7
              c-0.5-4.4-4.1-7.9-8.6-7.9h-104c-21.8,0-39.5,17.7-39.5,39.5v82.8c0,21.8,17.7,39.5,39.5,39.5h377.8c21.8,0,39.5-17.7,39.5-39.5
              v-82.7c0-21.8-17.7-39.5-39.5-39.5H329.2V327.2z"/>
                <path d="M303.5,198.6l-30.9,30.9V28.1C272.6,12.6,260,0,244.5,0l0,0c-15.5,0-28.1,12.6-28.1,28.1v201.4l-30.9-30.9
              c-9.5-9.5-24.7-11.9-35.9-4.4c-15.3,10.2-16.8,31.1-4.5,43.4l82.8,82.8c9.2,9.2,24.1,9.2,33.3,0l82.8-82.8
              c12.3-12.3,10.8-33.2-4.5-43.4C328.2,186.6,313,189,303.5,198.6z"/>
            </g>
        </svg>
            </a>
        </div>
        <div class="col-md-6 p-0 text-center order-1 order-sm-2">
            <img src="https://images.pexels.com/photos/3184430/pexels-photo-3184430.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
                 class="w-100" alt="">
        </div>

        <div class="col-md-6 p-0 text-center">
            <img src="https://images.pexels.com/photos/2467506/pexels-photo-2467506.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
                 class="w-100" alt="">
        </div>
        <div class="col-md-6 p-4 p-sm-5">
            <small class="text-uppercase" style="color: #9B5DE5;">About us</small>
            <h1 class="h2 mb-4" style="font-weight: 600;">Your Headline <span style="color: #9B5DE5;">Here!</span></h1>
            <p class="text-secondary" style="line-height: 2;">We believe that bookstores are essential to a healthy culture.
                They?re where authors can connect with readers, where we discover new writers,
                where children get hooked on the thrill of reading that can last a lifetime. They?re also anchors for our downtowns and communities.</p>
            <a href="#" style="background-color: #9B5DE5; width: 240px;"
               class="btn px-4 py-3 mt-4 text-white d-flex align-items-center justify-content-between">
                <span>Our Mission</span>
                <svg width="25px" fill="currentColor" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg"
                     xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                     viewBox="0 0 489 489" style="enable-background:new 0 0 489 489;" xml:space="preserve">
        <g>
            <g>
                <path d="M329.2,327.2c-4.5,0-8.1,3.4-8.6,7.9c-3.9,38.6-36.5,68.7-76.2,68.7c-39.6,0-72.2-30.1-76.2-68.7
              c-0.5-4.4-4.1-7.9-8.6-7.9h-104c-21.8,0-39.5,17.7-39.5,39.5v82.8c0,21.8,17.7,39.5,39.5,39.5h377.8c21.8,0,39.5-17.7,39.5-39.5
              v-82.7c0-21.8-17.7-39.5-39.5-39.5H329.2V327.2z"/>
                <path d="M303.5,198.6l-30.9,30.9V28.1C272.6,12.6,260,0,244.5,0l0,0c-15.5,0-28.1,12.6-28.1,28.1v201.4l-30.9-30.9
              c-9.5-9.5-24.7-11.9-35.9-4.4c-15.3,10.2-16.8,31.1-4.5,43.4l82.8,82.8c9.2,9.2,24.1,9.2,33.3,0l82.8-82.8
              c12.3-12.3,10.8-33.2-4.5-43.4C328.2,186.6,313,189,303.5,198.6z"/>
            </g>
        </svg>
            </a>
        </div>
    </div>
</div>

</html>

