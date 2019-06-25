<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>角色增加</title>
    <link rel="stylesheet" href="${ctx}/static/bootstrap-3.3.5/css/bootstrap.min.css"/>
    <script src="${ctx}/static/jquery/jquery-1.9.1.min.js"></script>
    <script src="${ctx}/static/commons.js"></script>
</head>
<body>
<div class="container">
    <tags:nav/>
    <div class="page-header">
        <h3>角色管理</h3>
    </div>
        <form action="${ctx}/role/create" method="post">
            <p><input type="text" name="code" value="${role.code}" placeholder="角色标识"></p>
            <p> <input type="text"name="name" value="${role.name}" placeholder="角色名称"></p>
            <p><button type="submit" name="">保存</button></p>
        </form>
</div>

<script src="${ctx}/static/bootstrap-3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
