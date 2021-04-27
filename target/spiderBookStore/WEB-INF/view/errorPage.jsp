<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>error</title>
</head>
<body>

<c:url value="/getCustomerDetailsByEmail" var="getCustomerDetailsByEmail"/>
<a href="${getCustomerDetailsByEmail}">Profile</a>

<c:url value="/seller" var="seller"/>
<a href="${seller}">Seller Portal</a>

<div align="center">
    <h1>Something Went Wrong</h1>
    <hr>
</div>

<main>
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


