<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>checkOut</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <style>
        body {
            background-color: #F8F9FA
        }

        .error {
            color: red;
            position: absolute;
            text-align: left;
            margin-left: 30px;
        }
    </style>

</head>
<body>

<div class="col-md-4 container bg-default">

    <h4 class="my-4">
        Billing Address
    </h4>

    <%--@elvariable id="customerDto" type="com"--%>
    <c:url value="/checkOutSave" var="checkOutSave"/>
    <form:form action="${checkOutSave}" modelAttribute="customerDto" method="post">
        <div class="form-row">
            <h1>Book will be delivered on this address</h1>
            <div class="col-md-6 form-group">
                <label for="firstname">First Name</label>
                <form:input path="firstName" class="form-control" id="firstname"/>
                <form:errors path="firstName" cssClass="error"/><br>
            </div>

            <div class="col-md-6 form-group">
                <label for="lastname">Last Name</label>
                <form:input path="lastName" class="form-control" id="lastname"/>
            </div>
        </div>

        <div class="form-group">
            <label for="email">Email</label>
            <form:input path="email" class="form-control" id="lastname"/>
            <form:errors path="email" cssClass="error"/><br>
        </div>

        <div class="form-group">
            <label>Address</label>
            <form:input path="addressLine1" class="form-control" id="lastname"/>
            <form:errors path="addressLine1" cssClass="error"/><br>
        </div>

        <div class="form-group">
            <label>Address 2
                <span class="text-muted">(Optional)</span>
            </label>
            <form:input path="addressLine2" class="form-control" id="lastname"/>
        </div>

        <div class="row">

            <div class="col-md-4 form-group">
                <label for="city">City</label>
                <form:input path="city" class="form-control" id="lastname"/>
                <form:errors path="city" cssClass="error"/><br>
            </div>

            <div class="col-md-4 form-group">
                <label>State</label>
                <form:input path="state" class="form-control" id="lastname"/>
                <form:errors path="state" cssClass="error"/><br>
            </div>

            <div class="col-md-4 form-group">
                <label>Postcode</label>
                <form:input path="pinCode" class="form-control" id="lastname"/>
                <form:errors path="pinCode" cssClass="error"/><br>
            </div>
        </div>

        <hr>

        <h4 class="mb-4">Payment</h4>

        <div class="form-check">
            <form:checkbox path="cod" value="cod"/>
            <label class="form-check-label">Cash On Delivery</label>
            <form:errors path="cod" cssClass="error"/><br>
        </div>

        <hr class="mb-4">

        <button class="btn btn-primary bt-lg btn-block" type="submit">Place Order</button>
    </form:form>
</div>
<a href="http://localhost:8081/spiderBookStore_war_exploded/">HOME</a>
</body>
</html>


