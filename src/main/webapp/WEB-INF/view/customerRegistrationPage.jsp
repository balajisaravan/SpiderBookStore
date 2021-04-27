<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>SpiderBookStore</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <style type="text/css">
        .container {
            margin-top: 8%;
            width: 400px;
            border: ridge 1.5px white;
            padding: 20px;
        }

        body {
            background: #E0EAFC;
            background: -webkit-linear-gradient(to right, #CFDEF3, #E0EAFC);
            background: linear-gradient(to right, #CFDEF3, #E0EAFC);
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
<div class="container">
    <h2>Register</h2>
    <hr>

    <%--@elvariable id="customerDto" type="com"--%>
    <form:form action="customerRegistrationSave" method="post" modelAttribute="customerDto">

    <table>

        <tr>
            <td>
                FirstName :
            </td>
            <td>
                <div class="form-group">
                    <form:input path="firstName" id="n"/>
                    <form:errors path="firstName" cssClass="error"/><br>
                </div>
            </td>
        </tr>

        <tr>
            <td>
                LastName :
            </td>
            <td>
                <div class="form-group">
                    <form:input path="lastName" id="un"/>
                    <form:errors path="lastName" cssClass="error"/><br>
                </div>
            </td>
        </tr>

        <tr>
            <td>
                Email :
            </td>
            <td>
                <div class="form-group">
                    <form:input path="email" placeholder="@gmail.com" id="reps"/>
                    <form:errors path="email" cssClass="error"/><br>
                </div>
            </td>
        </tr>

        <tr>
            <td>
                Password :
            </td>
            <td>
                <div class="form-group">
                    <form:password path="password" id="ps"/>
                    <form:errors path="password" cssClass="error"/><br>
                </div>
            </td>
        </tr>

        <tr>
            <td>
                RePassword :
            </td>
            <td>
                <div class="form-group">
                    <form:password path="rePassword" id="ag"/>
                    <form:errors path="rePassword" cssClass="error"/><br>
                </div>
            </td>
        </tr>

        <tr>
            <td>
                PhoneNo :
            </td>
            <td>
                <div class="form-group">
                    <form:input path="contact" placeholder="+91-89736*****" id="hb"/>
                    <form:errors path="contact" cssClass="error"/><br>
                </div>
            </td>
        </tr>

        <tr>
            <td>
                Dob :
            </td>
            <td>
                <div class="form-group">
                    <form:input path="dob" type="date" id="hb"/>
                    <form:errors path="dob" cssClass="error"/><br>
                </div>
            </td>
        </tr>

        <tr>
            <td>
                AddressLine1 :
            </td>
            <td>
                <div class="form-group">
                    <form:input path="addressLine1" id="hb"/>
                    <form:errors path="addressLine1" cssClass="error"/><br>
                </div>
            </td>
        </tr>

        <tr>
            <td>
                AddressLine2 :
            </td>
            <td>
                <div class="form-group">
                    <form:input path="addressLine2" id="hb"/>
                    <form:errors path="addressLine2" cssClass="error"/><br>
                </div>
            </td>
        </tr>

        <tr>
            <td>
                city :
            </td>
            <td>
                <div class="form-group">
                    <form:input path="city" id="hb"/>
                    <form:errors path="city" cssClass="error"/><br>
                </div>
            </td>
        </tr>

        <tr>
            <td>
                State :
            </td>
            <td>
                <div class="form-group">
                    <form:input path="state" id="hb"/>
                    <form:errors path="state" cssClass="error"/><br>
                </div>
            </td>
        </tr>

        <tr>
            <td>
                PinCode :
            </td>
            <td>
                <div class="form-group">
                    <form:input path="pinCode" id="hb"/>
                    <form:errors path="pinCode" cssClass="error"/><br>
                </div>
            </td>
        </tr>

    </table>

    <input type="submit" value="Register">

    <br>

    <div align="center"><a href="http://localhost:8081/spiderBookStore_war_exploded/">HOME</a></div>
    </form:form>
</body>
</html>
