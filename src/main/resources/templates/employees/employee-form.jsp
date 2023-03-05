<!DOCTYPE HTML>
<html lang="en" xmlns:th="http://www.thymeleaf.org">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

    <title>Save Employee</title>
</head>

<body>

<div class="container">

    <h3>Employee Directory</h3>
    <hr>

    <p class="h4 mb-4">Save Employee</p>

    <form action="#" th:action="@{/employees/save}"
          th:object="${employee}" method="POST">

        <input type="hidden" th:field="*{id}" />

        <input required type="text" th:field="*{firstName}"
               class="form-control mb-4 col-4" placeholder="First name">


        <input required type="text" th:field="*{address}"
               class="form-control mb-4 col-4" placeholder="Address">

        <input th:field="*{image}" required type="file" name="photo" id="photo" class="form-control-file mb-4 col-4">

        <div th:if="${error}" class="text-danger mb-3">
            <span th:text="${error}"></span>
        </div>
        <button type="submit" class="btn btn-success">Save</button>

    </form>

    <hr>
    <a th:href="@{/employees/list}">Back to Employees List</a>

</div>
</body>

</html>
