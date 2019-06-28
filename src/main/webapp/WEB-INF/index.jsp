<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>首页</title>
    <link rel="stylesheet" href="${ctx}/static/bootstrap-3.3.5/css/bootstrap.min.css"/>
    <script src="${ctx}/static/jquery/jquery-1.9.1.min.js"></script>
    <link rel="stylesheet" href="${ctx}/static/bootstrap-3.3.5/css/login.css"/>
    <link rel="stylesheet" href="${ctx}/static/bootstrap-3.3.5/css/font-awesome.css"/>
    <link rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css">
    <link rel="stylesheet" href="${ctx}/static/bootstrap-3.3.5/css/reset.css"/>
    <link rel="stylesheet" href="${ctx}/static/bootstrap-3.3.5/css/common.css"/>
    <link rel="stylesheet" href="${ctx}/static/bootstrap-3.3.5/css/welcome.css"/>
    <link rel="stylesheet" href="${ctx}/static/bootstrap-3.3.5/css/core.css"/>
    <link rel="stylesheet" href="${ctx}/static/bootstrap-3.3.5/css/header.css"/>
    <link rel="stylesheet" href="${ctx}/static/bootstrap-3.3.5/css/bootstrap-multiselect.css"/>
    <link rel="stylesheet" href="${ctx}/static/bootstrap-3.3.5/css/bootstrapValidator.min.css"/>
    <link rel="stylesheet" href="${ctx}/static/bootstrap-3.3.5/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${ctx}/static/bootstrap-3.3.5/css/welcome.css"/>
    <script src="${ctx}/static/jquery/jquery-1.9.1.min.js"></script>
</head>
<body>

<div class="row">
    <div class="col-sm-12">
        <nav class="navbar navbar-default navbar-static-top admin-nav J_admin_nav">
            <a class="left-toggle pull-left" href="javascript:;">
                <i class="fa fa-bars fa-lg"></i>
            </a>
            <a class="pull-left logo-text menu-list-logo" href="/html/pc-admin/common/welcome.html">&nbsp;光华阿姨巡楼小系统-管理员</a>
            <ul class="nav navbar-nav hello-administrator pull-right">
                <li>
                    <a class="menu-list J_adminInfo" href="javascript:;">你好，<span class="J_namename"></span>管理员！</a>
                </li>
                <li>
                    <a class="menu-list J_outManage" href="javascript:;"><i class="fa fa-sign-out"></i>&nbsp;退出登录</a>
                </li>
            </ul>
        </nav>
    </div>
</div>
<!-- 侧边栏 -->
<ul class="nav nav-pills nav-stacked sidebar pull-left">
    <li id="firstMenu0" class="active">
        <a class="J_firstMenu" href="/html/pc-admin/common/welcome.html"><i class="fa fa-home"></i>&nbsp;&nbsp;&nbsp;&nbsp;<span>首页</span></a>
    </li>
    <li id="firstMenu1" class="active">
        <a class="J_firstMenu" href="javascript:;"><i class="fa fa-th"></i>&nbsp;&nbsp;&nbsp;&nbsp;<span>人员管理</span><i class="fa fa-angle-right angle-right"></i></a>
        <ul style="display:none;">
            <li><a class="J_menu" href="../../pc-admin/story-manage/story-list-manage.html">用户列表</a></li>
            <li><a class="J_menu" href="../../pc-admin/story-manage/story-list-manage.html">用户新增</a></li>

        </ul>
    </li>
    <li id="firstMenu2" class="active">
        <a class="J_firstMenu" href="javascript:;"><i class="fa fa-bookmark-o"></i>&nbsp;&nbsp;&nbsp;&nbsp;<span >角色管理</span><i class="fa fa-angle-right angle-right"></i></a>
        <ul style="display:none;">
            <li><a class="J_menu" href="/html/pc-admin/title-management/title-management-list.html">角色列表</a></li>
        </ul>
    </li>
    <li id="firstMenu3" class="active">
        <a  class="J_firstMenu" href="javascript:;"><i class="fa fa-file-video-o"></i>&nbsp;&nbsp;&nbsp;&nbsp;<span>公告管理</span><i class="fa fa-angle-right angle-right"></i></a>
        <ul style="display:none;">
            <li><a class="J_menu" href="javascript:;">公告列表</a></li>
            <li><a class="J_menu" href="javascript:;">新增公告</a></li>
        </ul>
    </li>

</ul>

<div class="page clearfix">
    <div class="holder">
        <div class="container">
            <div class="col-sm-12 margin-top--10 ">
                <h3 class="welcome-head text-center">欢迎使用光华阿姨巡楼小系统</h3>
                <div class="col-md-10 col-sm-offset-1 box">
                    <div class="col-md-2 module first-module">
                        <a class="text-center" href="/html/pc-admin/story-manage/story-list-manage.html">
                            <i class="fa fa-th fa-3x"></i>
                            <br>公告管理
                        </a>
                    </div>
                    <div class="col-md-2 module forth-module">
                        <a class="text-center" href="/html/pc-admin/title-management/title-management-list.html">
                            <i class="fa fa-bookmark-o fa-3x text-center"></i>
                            <br>厕所巡查
                        </a>
                    </div>
                    <div class="col-md-2 module third-module">
                        <a class="text-center" href="/html/pc-admin/title-management/title-management-list.html" >
                            <i class="fa fa-file-video-o fa-3x"></i>
                            <br>自习室检查/(开发中）
                        </a>
                    </div>
                    <div class="col-md-2 module second-module">
                        <a class="text-center" href="/html/pc-admin/story-plan/plan-exam.html">
                            <i class="fa fa-gavel fa-3x"></i>
                            <br>生活小提示(开发中)
                        </a>
                    </div>
                    <div class="col-md-2 module fifth-module">
                        <a class="text-center" href="/html/pc-admin/student-information-management/student-information-list.html">
                            <i class="fa fa-users fa-3x"></i>
                            <br>角色管理
                        </a>
                    </div>
                    <%--                    <div class="col-md-2 module sixth-module">--%>
                    <%--                        <a class="text-center" href="\html\pc-admin\teacher-information-management\teacher-information-list.html">--%>
                    <%--                            <i class="fa fa-user fa-3x"></i>--%>
                    <%--                            <br>教师管理--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="col-md-2 module seventh-module">--%>
                    <%--                        <a class="text-center" href="/html/pc-admin/school-information-management/school-information-list.html">--%>
                    <%--                            <i class="fa fa-building fa-3x"></i>--%>
                    <%--                            <br>学校管理--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="col-md-2 module eight-module">--%>
                    <%--                        <a class="text-center" href="/html/pc-admin/report-forms/report-forms.html">--%>
                    <%--                            <i class="fa fa-file fa-3x"></i>--%>
                    <%--                            <br>报表管理--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="col-md-2 module first-module">--%>
                    <%--                        <a class="text-center" href="/html/pc-admin/contents-management/contents-management.html">--%>
                    <%--                            <i class="fa fa-book fa-3x"></i>--%>
                    <%--                            <br>教材目录管理--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="col-md-2 module third-module J_qx">--%>
                    <%--                        <a class="text-center" href="/html/pc-admin/admin-information-management/admin-information-list.html">--%>
                    <%--                            <i class="fa fa-cogs fa-3x"></i>--%>
                    <%--                            <br>权限管理--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>
                </div>
            </div>
        </div><!-- container -->
    </div><!-- holder -->
</div><!-- page -->

<footer role="contentinfo">
    <div class="clearfix footer">
        <ul class="list-unstyled list-inline pull-left">
            <li>pandawork © 2018</li>
        </ul>
        <button class="pull-right btn btn-inverse-alt btn-xs hidden-print" id="back-to-top"><i class="fa fa-arrow-up"></i></button>
    </div>
</footer>
<div class="container">
    <tags:nav/>
    <div class="jumbotron">
        <h2>内容管理系统<small>（SSH框架整合实战项目）</small></h2>
        <p>一体化软件工程实践三之整合框架开发，采用Spring MVC + Spring + Hibernate技术，结合Apache Shiro安全框架实现内容管理系统</p>
        <p></p>
        <%--        <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a></p>--%>
    </div>
</div>
<script src="${ctx}/static/bootstrap-3.3.5/js/bootstrap.min.js"></script>
<script src="${ctx}/static/bootstrap-3.3.5/js/header.js"></script>
<script src="${ctx}/static/bootstrap-3.3.5/js/common.js"></script>
<script src="${ctx}/static/bootstrap-3.3.5/js/bootstrap-paginator.js"></script>
<script src="${ctx}/static/bootstrap-3.3.5/js/bootstrap.dialog.js"></script>
</body>
</html>
