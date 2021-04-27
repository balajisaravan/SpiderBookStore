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
    <h2>New Password</h2>
    <hr>

    <%--@elvariable id="forgetPasswordDto" type="com"--%>
    <form:form action="forgetPasswordSave" method="post" modelAttribute="forgetPasswordDto">

    <table>

        <tr>
            <td>
                Email :
            </td>
            <td>
                <div class="form-group">
                    <form:input path="email" id="ps"/>
                    <form:errors path="email" cssClass="error"/><br>
                </div>
            </td>
        </tr>

        <tr>
            <td>
                New Password :
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

    </table>

    <input type="submit" value="submit">

    <br>

    <div align="center"><a href="http://localhost:8081/spiderBookStore_war_exploded/">HOME</a></div>
    </form:form>
</body>
</html>
