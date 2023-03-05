<!DOCTYPE HTML>

<html lang="en" xmlns:th="http://www.thymeleaf.org">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" integrity="sha512-37M5VQx3q5hELkZ4D4z4t/9RtKK/0iPqtVjKpJx1xVbcOfwA2eTmvHkKjX9BbbCWbGSCyH7VIfSRT+nz2QV5OA==" crossorigin="anonymous" />

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
          integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
    <title>Employee Directory</title>
</head>

<body>
<div class="container">
    <div class="row justify-content-between align-items-center">
        <div class="col-sm-5">
            <h3><a th:href="@{/employees/list}">Employee Directory</a></h3>
        </div>
        <div class="col-sm-6 d-flex justify-content-end">
            <div class="d-flex align-items-center">
                <form class="form-inline mr-2" th:action="@{/employees/search}" method="get">
                    <div class="input-group">
                        <input type="text" name="first_name" class="form-control" placeholder="Search">
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="submit">
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                    </div>
                </form>
                <a th:text="${session.loggedIn} ? 'Log Out' : 'Log In'" th:href="${session.loggedIn} ? '/employees/logout' : '/loginPage'" class="btn btn-primary ml-3"></a>

                <a th:href="@{/export/csv}" class="btn btn-info">Export to CSV</a>
            </div>
        </div>
    </div>
    <a th:if="${session.loggedIn}" th:href="@{/employees/showFormForAdd}" class="btn btn-primary btn-sm mb-3">
        Add Employee
    </a>
    <br><br>
    <table class="table table-bordered table-striped">
        <thead class="thead-dark">
        <tr>
            <th>First Name</th>
            <th>Address</th>
            <th th:if="${session.loggedIn}" >Action</th>
        </tr>
        </thead>
        <tbody>
        <tr th:each="tempEmployee : ${employees}">
            <td th:text="${tempEmployee.firstName}"/>
            <td th:text="${tempEmployee.address}"/>
            <td th:if="${session.loggedIn}">
                <a th:href="@{/employees/showFormForUpdate(employeeId=${tempEmployee.id})}" class="btn btn-info btn-sm">
                    Update
                </a>

                <a th:href="@{/employees/delete(employeeId=${tempEmployee.id})}" class="btn btn-danger btn-sm"
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



