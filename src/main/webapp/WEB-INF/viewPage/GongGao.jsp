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
            <div class="row">
                <div class="col-sm-12">
                    <ol class="breadcrumb">
                        <li>
                            <a href="/html/pc-admin/common/welcome.html"><i class="fa fa-home"></i>&nbsp;首页</a>
                        </li>
                        <li>
                            <a href="../story-manage/story-list-manage.html">公告管理</a>
                        </li>
                        <li class="active">公告列表</li>
                    </ol>
                    <input type="hidden" class="pageDataCount" value="10">
                    <div class="col-sm-12 margin-top--10">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h4>公告列表</h4>
                            </div>
                            <div class="panel-body">
                                <form class="form-horizontal J_searchForm">
                                    <div class="form-group">
                                        <label class="padding-left-30 control-label">公告名</label>
                                        <div class="col-sm-2">
                                            <input class="form-control J_username" name="username"></input>
                                        </div>


                                    </div>
                                    <div class="col-sm-12 margin-bottom-10 margin-top--10 pull-right">
                                        <a class="btn btn-success btn-radius-no J_search margin-left-15 pull-right" type="button"><i class="fa fa-search"></i>&nbsp;搜索</a>

                                    </div>
                                </form>
                                <div class="table-responsive col-sm-12">
                                    <table class="J_table table table-hover table-bordered" style="table-layout: fixed;">
                                        <thead>
                                        <tr>


                                            <th>标题</th>
                                            <th>上传人</th>
                                            <th>发布时间</th>
                                            <th>详情</th>

                                        </tr>
                                        </thead>
                                        <tbody id="J_template">
                                        <tr>
                                            <td>今天自习室该打扫了</td>
                                            <td>张阿姨</td>
                                            <td>12/3</td>
                                            <td>
                                                <!-- <a href="/html/pc-admin/student-information-management/student-information-detail.html#?id='1'" class="label-info J_modify"><i class="fa fa-pencil"></i>&nbsp;编辑</a> -->
                                                <a href="/html/pc-admin/student-information-management/student-information-detail.html#?id='1'" class="label-info J_modify"><i class="fa fa-pencil"></i>&nbsp;点击查看详情</a>
                                                <a href="/html/pc-admin/student-information-management/student-information-detail.html#?id='1'" class="label-info J_modify"><i class="fa fa-pencil"></i>&nbsp;下载此公告</a>

                                            </td>
                                        </tr>

                                        </tbody>
                                    </table>
                                    <div class="pull-right">
                                        <nav aria-label="Page navigation">
                                            <ul class="pagination" id="pageLimit">
                                                <li>
                                                    <a href="#" aria-label="Previous">
                                                        <span aria-hidden="true">&laquo;</span>
                                                    </a>
                                                </li>
                                                <li class="active"><a href="#">1</a></li>
                                                <li><a href="#">2</a></li>
                                                <li><a href="#">3</a></li>
                                                <li><a href="#">4</a></li>
                                                <li><a href="#">5</a></li>
                                                <li>
                                                    <a href="#" aria-label="Next">
                                                        <span aria-hidden="true">&raquo;</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<footer role="contentinfo">
    <div class="clearfix footer">
        <ul class="list-unstyled list-inline pull-left">
            <li>pandawork © 2018</li>
        </ul>
        <button class="pull-right btn btn-inverse-alt btn-xs hidden-print" id="back-to-top"><i class="fa fa-arrow-up"></i></button>
    </div>
</footer>

<script src="${ctx}/static/bootstrap-3.3.5/js/bootstrap.min.js"></script>
<script src="${ctx}/static/bootstrap-3.3.5/js/header.js"></script>
<script src="${ctx}/static/bootstrap-3.3.5/js/common.js"></script>
    <script src="${ctx}/static/bootstrap-3.3.5/js/story-list-manage.js"></script>
<script src="${ctx}/static/bootstrap-3.3.5/js/bootstrap-paginator.js"></script>
<script src="${ctx}/static/bootstrap-3.3.5/js/bootstrap.dialog.js"></script>
</body>
</html>
