<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>

<html>

<head>
    <link rel="stylesheet" href="webjars/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <title>Task Listing</title>

    <link type="text/css"
          rel="stylesheet"
          href="css/style.css" />
    <style type="text/css">
        table,th,td,h2 {
            border-style: double;
            text-align: center;
        }
        td,h2
        {
            font-weight: bold;
        }
        h2
        {
            background-color: #343a40;
            color: #fff;
        }
        span{
            display:inline-block;
            width: 200px;
            text-align: left;
        }
        button
        {
            margin: 10px;
            padding:10px;
            background-color: #e7e7e7;
            color: black;;

        }
        a:link {
            color: red;
        }

        a:visited {
            color: green;

        }
        a:link, a:visited {
            background-color: #1a64ea;
            color: #FFFFFF;
            padding: 14px 25px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            border-style: single;
        }

    </style>

</head>

<body>

<div id="wrapper">
    <div id="header" align="center">
        <h2>Task Manager</h2>
    </div>
</div>

<div id="container">
    <div id="content">
        <table class="table">
            <thead class="thead-dark">
            <tr>
                <th scope="col">Task Id</th>
                <th scope="col">Task Name</th>
                <th scope="col">Star Date</th>
                <th scope="col">End Date</th>
                <th scope="col">Task Priority</th>
                <th scope="col">Task Status</th>
                <th scope="col">Function</th>

            </tr>

            <c:forEach var="tempTask" items="${tasks}">
            <c:url var="updateLink" value="/task/showFormForUpdate">
                <c:param name="taskId" value="${tempTask.taskId}" />
            </c:url>
            <c:url var="deleteLink" value="/task/delete">
                <c:param name="taskId" value="${tempTask.taskId}" />
            </c:url>
            <tr>
                <td> ${tempTask.taskId} </td>
                <td> ${tempTask.taskName} </td>
                <td> ${tempTask.startDate} </td>
                <td> ${tempTask.endDate} </td>
                <td> ${tempTask.taskPriority} </td>
                <td> ${tempTask.taskStatus} </td>
                <td>
                    <a href="${updateLink}">Update</a>
                    <a href="${deleteLink}">Delete</a>
                </td>

            </tr>

            </c:forEach>

        </table>

    </div>
    <input type="button" onclick="window.location.href='showFormForAdd'; return false"
           class="add-button" value="Add New Task">
    <br/><br/>

</div>


</body>

</html>







