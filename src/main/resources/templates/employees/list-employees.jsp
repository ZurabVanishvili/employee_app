<!DOCTYPE HTML>
<html lang="en" xmlns:th="http://www.thymeleaf.org">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
          integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <link rel="stylesheet" href="/static/css/style.css">
    <title>Employee Directory</title>
</head>

<body>

<div class="container">

    <div class="container">
        <div class="navbar">
            <h3 class="text"> Employee Directory </h3>
            <nav>

                <a th:href="@{/loginPage}"
                   class="btn btn-primary btn-sm mb-3 ">
                    Sign In
                </a>
            </nav>
        </div>
    </div>


    <!-- Add a button -->
    <a th:href="@{/employees/showFormForAdd}"
       class="btn btn-primary btn-sm mb-3">
        Add Employee
    </a>


    <table class="table table-bordered table-striped">
        <thead class="thead-dark">
        <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Action</th>
        </tr>
        </thead>

        <tbody>
        <tr th:each="tempEmployee : ${employees}">

            <td th:text="${tempEmployee.firstName}"/>
            <td th:text="${tempEmployee.lastName}"/>
            <td th:text="${tempEmployee.email}"/>

            <td>
                <!-- Add "update" button/link -->
                <a th:href="@{/employees/showFormForUpdate(employeeId=${tempEmployee.id})}"
                   class="btn btn-info btn-sm">
                    Update
                </a>

                <!-- Add "delete" button/link -->
                <a th:href="@{/employees/delete(employeeId=${tempEmployee.id})}"
                   class="btn btn-danger btn-sm"
                   onclick="if (!(confirm('Are you sure you want to delete this employee?'))) return false">
                    Delete
                </a>

            </td>


        </tr>
        </tbody>
    </table>

</div>

</body>
</html>



