<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户角色</title>
    <link rel="stylesheet" href="${ctx}/static/bootstrap-3.3.5/css/bootstrap.min.css"/>
    <script src="${ctx}/static/jquery/jquery-1.9.1.min.js"></script>
    <script src="${ctx}/static/commons.js"></script>
</head>
<body>
<div class="container">
    <tags:nav/>
    <div class="page-header">
        <h3>用户与角色管理</h3>
    </div>
        <form action="${ctx}/user/setroles" method="post">
            <p>
                用户姓名：<input type="hidden" name="userid" value="${user.id}">${user.name}
            </p>
            <p>用户角色：
                <ul>
                <c:forEach items="${roles}" var="role" varStatus="idxStatus">
                    <li><input type="checkbox" name="chkRoles" value="${role.id}"> ${role.name}[${role.code}]</li>
                </c:forEach>
                </ul>
            </p>
            <p><button type="submit">保存</button></p>
        </form>
</div>

<script src="${ctx}/static/bootstrap-3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
