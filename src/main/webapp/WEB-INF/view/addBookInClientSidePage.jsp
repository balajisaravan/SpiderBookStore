<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>AddBook</title>
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
            position: fixed;
            text-align: left;
            margin-left: 30px;
        }

    </style>
</head>
<body>
<div class="container">
    <h2>AddBook</h2>
    <hr>

    <%--@elvariable id="bookWarehouseDto" type="com"--%>
    <form:form action="addBookInClientSideSave" method="post" modelAttribute="bookWarehouseDto">

    <table>

        <form:hidden path="bookId"/>

        <tr>
            <td>
                BookName :
            </td>
            <td>
                <div class="form-group">
                    <form:input path="bookName" id="n"/>
                    <form:errors path="bookName" cssClass="error"/>
                </div>
            </td>
        </tr>

        <tr>
            <td>
                Author :
            </td>
            <td>
                <div class="form-group">
                    <form:input path="author" id="un"/>
                    <form:errors path="author" cssClass="error"/>
                </div>
            </td>
        </tr>

        <tr>
            <td>
                Description :
            </td>
            <td>
                <div class="form-group">
                    <form:input path="description" id="reps"/>
                    <form:errors path="description" cssClass="error"/>
                </div>
            </td>
        </tr>

        <tr>
            <td>
                Price :
            </td>
            <td>
                <div class="form-group">
                    <form:input path="price" id="ps"/>
                    <form:errors path="price" cssClass="error"/>
                </div>
            </td>
        </tr>

        <tr>
            <td>
                PublishYear :
            </td>
            <td>
                <div class="form-group">
                    <form:input path="publishYear" id="ag"/>
                    <form:errors path="publishYear" cssClass="error"/>
                </div>
            </td>
        </tr>

        <tr>
            <td>
                <div class="form-group">
                    <form:hidden path="sellerName" value="${pageContext.request.userPrincipal.name}" id="hb"/>
                    <form:errors path="sellerName" cssClass="error"/>
                </div>
            </td>
        </tr>

        <tr>
            <td>
                Publication :
            </td>
            <td>
                <div class="form-group">
                    <form:input path="publication" id="hb"/>
                    <form:errors path="publication" cssClass="error"/>
                </div>
            </td>
        </tr>

    </table>

    <input type="submit" value="Add Book">

    <br>

    <div align="center"><a href="http://localhost:8081/spiderBookStore_war_exploded/">HOME</a></div>
    </form:form>
</body>
</html>