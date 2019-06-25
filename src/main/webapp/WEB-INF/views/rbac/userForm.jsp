<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户增加</title>
    <link rel="stylesheet" href="${ctx}/static/bootstrap-3.3.5/css/bootstrap.min.css"/>
    <script src="${ctx}/static/jquery/jquery-1.9.1.min.js"></script>
    <script src="${ctx}/static/commons.js"></script>
</head>
<body>
<div class="container">
    <tags:nav/>
    <div class="page-header">
        <h3>用户管理</h3>
    </div>
        <form action="${ctx}/user/create" method="post">
            <p>姓名：<input type="text" name="name" value="" placeholder="姓名"></p>
            <p>性别：<select name="gender">
<%--                <c:forEach items="${genders}" var="gender" varStatus="idxStatus">--%>
<%--                    <option value="${gender.id}">[${gender.code}]${gender.name}</option>--%>
<%--                </c:forEach>--%>
                <option value="1">男</option>
    <option value="0">女</option>
            </select></p>
            <p> 联系方式：<input type="text" name="telephone" value="" placeholder="联系方式"></p>
            <p> 用户名：<input type="text" name="username" value="" placeholder="用户名"></p>
            <p>密码：<input type="password" name="plainPassword" value="" placeholder="密码"/></p>

            <p><button type="submit" name="">保存</button></p>
        </form>
</div>

<script src="${ctx}/static/bootstrap-3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
