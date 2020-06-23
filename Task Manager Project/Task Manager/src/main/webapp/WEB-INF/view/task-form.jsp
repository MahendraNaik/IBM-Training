 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>

<head>
    <title>Save Task</title>


    <link type="text/css"
          rel="stylesheet"
          href="css/style.css">

    <link type="text/css"
          rel="stylesheet"
          href="css/add-customer-style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <style type="text/css">

        form {
            margin-top: 20px;
            width: 50%;
        }
        .error {
            color: #ff0000;
        }

        form-group {
            margin-top: 20px;
        }

        label
        {
            font-weight: bolder;
            color: #000000;

        }
        span{
            width: 50%;
            display:inline-block;
            width: 200px;
            text-align: left;
        }

        input[type=submit] {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            align-self: auto;
        }



        }
    </style>


</head>

<body>


<div id="wrapper" >
    <div id="header" align="center">
        <h2>Task Manager</h2>
    </div>
</div>

<div id="container" align="center" >
    <h3>Save Task</h3>

    <form:form action="saveTask" modelAttribute="task" method="POST" cssStyle="border-style: solid">

        <form:hidden path="taskId" />

        <div class="form-group">
            <label style="margin-top: 20px">Task Name : </label>
            <form:input path="taskName"/>
            <div><form:errors path="taskName" cssClass="error" /></div>
        </div>

        <div class="form-group">
            <label>Start Date : </label>
            <form:input type="Date" path="startDate"/>
            <div><form:errors type="Date" path="startDate" cssClass="error" /></div>
        </div>
        <div class="form-group">
            <label>End Date : </label>
            <form:input type="Date" path="endDate"/>
            <div><form:errors type="Date" path="endDate" cssClass="error" /></div>
        </div>

        <div class="form-group">
            <label style="margin-top: 20px">Task Priority : </label>
            <form:input path="taskPriority"/>
<%--            <div><form:errors path="taskPriority" /></div>--%>
        </div>

        <div class="form-group">
            <label style="margin-top: 20px">Task Status : </label>
            <form:input path="taskStatus"/>
            <div><form:errors path="taskStatus" cssClass="error" /></div>
        </div>
        </br>

        <input type="submit" value="Save" class="save"/>

        <p style="margin-top: 20px">
            <a href="${pageContext.request.contextPath}/task/listTask">Back to List</a>
        </p>

    </form:form>



</div>

</body>

</html>








