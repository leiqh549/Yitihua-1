<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.LockedAccountException" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录</title>

    <link rel="stylesheet" href="${ctx}/static/bootstrap-3.3.5/css/login.css"/>
    <link rel="stylesheet" href="${ctx}/static/bootstrap-3.3.5/css/font-awesome.css"/>
    <link rel="stylesheet" href="${ctx}/static/bootstrap-3.3.5/css/reset.css"/>
    <link rel="stylesheet" href="${ctx}/static/bootstrap-3.3.5/css/common.css"/>
    <link rel="stylesheet" href="${ctx}/static/bootstrap-3.3.5/css/core.css"/>
    <link rel="stylesheet" href="${ctx}/static/bootstrap-3.3.5/css/header.css"/>
    <link rel="stylesheet" href="${ctx}/static/bootstrap-3.3.5/css/bootstrap-multiselect.css"/>
    <link rel="stylesheet" href="${ctx}/static/bootstrap-3.3.5/css/bootstrapValidator.min.css"/>
    <link rel="stylesheet" href="${ctx}/static/bootstrap-3.3.5/css/bootstrap.min.css"/>
    <script src="${ctx}/static/jquery/jquery-1.9.1.min.js"></script>
</head>

<body class="login-background">
<div class="page container clearfix">
    <!-- 光华阿姨巡楼小系统 -->
    <div class="page container clearfix">
        <div class="row">
            <div class="login-heading">
                <h2 class="text-center">光华阿姨巡楼小系统 </h2>
            </div>
        </div>
        <form id="J_form" action="${ctx}/login" method="post">
            <div class="row">
                <div class="login-body login-box">
                    <div class="title">
                        <h3 class="text-center margin-top-15 margin-bottom-20">欢迎登录
                        </h3>
                    </div>
                    <div class="form-group">
                        <div class="input-group">
							<span class="input-group-addon">
								<span class="fa fa-user"></span>
							</span>
                            <input class="J_username form-control" type="text" placeholder="请填写登录用户名"  name="username" value="${username}">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-group">
							<span class="input-group-addon">
								<span class="fa fa-lock"></span>
							</span>
                            <input class="J_pwd form-control" type="password" placeholder="请填写登录密码" name="password">
                        </div>
                    </div>
                    <button class="J_submitBtn btn btn-info btn-block margin-top-15" type="submit">
                        登录
                    </button>
                    <%
                        String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
                        if(error != null){
                    %>

                    <%
                        if (error.contains("DisabledAccountException")){
                            out.print("用户已被屏蔽，请登录其他用户.");
                        }else{
                            out.print("登录失败，请重试.");
                        }
                    %>

                <%
                    }
                %>
                </div>
            </div>
        </form>
    </div>
<%--</body>--%>
<%--<div class="container">--%>
<%--    <tags:nav/>--%>
<%--    <h1>用户登录222222</h1>--%>
<%--    <hr>--%>
<%--    <form action="${ctx}/login" method="post">--%>
<%--        <p><input type="text" name="username" value="${username}" placeholder="用户名"></p>--%>
<%--        <p><input type="password" name="password" placeholder="用户密码"></p>--%>
<%--        <p><button type="submit">登录</button></p>--%>
<%--    </form>--%>
<%--    <%--%>
<%--        String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);--%>
<%--        if(error != null){--%>
<%--    %>--%>
<%--    <div class="alert alert-danger" role="alert" style="margin-bottom: 10px;padding: 10px;">--%>
<%--        <button class="close" data-dismiss="alert">×</button>--%>
<%--        <%--%>
<%--            if (error.contains("DisabledAccountException")){--%>
<%--                out.print("用户已被屏蔽，请登录其他用户.");--%>
<%--            }else{--%>
<%--                out.print("登录失败，请重试.");--%>
<%--            }--%>
<%--        %>--%>
<%--    </div>--%>
<%--    <%--%>
<%--        }--%>
<%--    %>--%>
<%--    <hr>--%>
<%--    <a href="${ctx}/index">首页</a> | <a href="${ctx}/dict">数据字典</a>--%>
<%--</div>--%>
<script src="${ctx}/static/bootstrap-3.3.5/js/bootstrap.min.js"></script>
    <script src="${ctx}/static/js/bootstrap-paginator.js"></script>
    <script src="${ctx}/static/js/bootstrap.dialog.js"></script>
</body>
</html>
