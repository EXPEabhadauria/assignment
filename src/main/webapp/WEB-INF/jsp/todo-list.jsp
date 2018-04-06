<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <link rel="stylesheet" href="<c:url value="css/base.css"/>">
</head>
<body>
<section id="todoapp">
    <header id="header">
        <h1>Abhishek</h1>
        <form action="<c:url value="insert"/>" method="POST">
            <input type="hidden" name="filter" value="${filter}"/>
            <input id="new-todo" name="name" placeholder="Add item" autofocus>
        </form>
    </header>
    <section id="main">
        <input id="toggle-all" type="checkbox">
        <ul id="todo-list">
            <c:forEach var="toDoItem" items="${toDoItems}" varStatus="status">
                <li id="toDoItem_${status.count}" class="<c:if test="${toDoItem.completed}">completed</c:if>">
                    <div class="view">
                        <form id="toggleForm_${status.count}" action="<c:url value="toggleStatus"/>" method="POST">
                            <input type="hidden" name="id" value="${toDoItem.id}"/>
                            <input type="hidden" name="filter" value="${filter}"/>
                            <input class="toggle" name="toggle" type="checkbox" <c:if test="${toDoItem.completed}">checked</c:if> onchange="javascript:document.getElementById('toggleForm_${status.count}').submit();">
                        </form>
                        <label>${toDoItem.name}</label>
                        <form action="<c:url value="delete"/>" method="POST">
                            <input type="hidden" name="id" value="${toDoItem.id}"/>
                            <input type="hidden" name="filter" value="${filter}"/>
                            <button class="destroy"></button>
                        </form>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </section>
</section>
</body>
</html>