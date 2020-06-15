<%--
  Created by IntelliJ IDEA.
  User: 华耀 王
  Date: 2020/6/13
  Time: 9:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName()
            + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>芜湖论坛管理系统</title>

    <link rel="stylesheet" href="<%=basePath%>/css/bootstrap4.0.min.css" >
    <script src="<%=basePath%>js/jquery.slim.min.js" ></script>
    <script src="<%=basePath%>js/popper.min.js" ></script>
    <script src="<%=basePath%>js/bootstrap4.0.min.js"></script>
    <script src="<%=basePath%>js/layer.js"></script>

</head>
<body>


<nav class="navbar navbar-expand-lg navbar-light bg-light" >
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand text-success" href="${pageContext.request.contextPath }/manage/article/index.do">博客管理</a>

    <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
            <li class="nav-item">
                <!-- Example single danger button -->
                <div class="btn-group">
                    <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        新建
                    </button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="javascript:void(0);" onclick="fullScreen('添加文章','${pageContext.request.contextPath }/manage/article/article_add.do')">文章</a>
                        <!-- <a class="dropdown-item" href="#">评论</a> -->
                    </div>
                </div>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="${pageContext.request.contextPath }/manage/article/index.do">主页 </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath }/manage/article/article_list.do">文章管理</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath }/manage/user/user_list.do">用户管理</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0" action="${pageContext.request.contextPath }/manage/article/article_search.do" method="GET">
            <input class="form-control mr-sm-2" type="search" placeholder="文章标题或内容..." aria-label="Search" name="keyword">
            <button class="btn btn-outline-success my-2 my-sm-0 btn-sm" type="submit">搜索</button>
        </form>

        <a class="btn btn-outline-danger btn-sm" href="${pageContext.request.contextPath }/manage/user/logout.do" role="button">退出</a>
    </div>
</nav>
<div class="card mb-3">
    <div style="overflow: hidden;height: 844px;width: auto">
        <img class="card-img-top" src="/images/wangzhe-sunshangxiang.jpg" alt="Card image cap" style="height: 100%;width:100%;">
    </div>

    <div class="card-body">
        <h4 class="card-title" style="text-align: center">欢迎登录，${adminMsg.username}</h4>
<%--        <p class="card-text"><small class="text-muted">上次登录时间:${loginLog.localTime}</small></p>
        <p class="card-text"><small class="text-muted">上次登录IP:${loginLog.ip}</small></p>
        <p class="card-text"><small class="text-muted">本次登录IP:${clientIp}</small></p>--%>
    </div>
</div>

<div >
    <table class="table table-hover">
        <p class="text-success" style="text-align: center"> 系统统计</p>
        <thead>
        <tr >
            <th>#</th>
            <th>总文章数</th>
            <th>总评论数</th>
        </tr>
        </thead>
        <tbody>
        <tr class="table-success">
            <th scope="row">全部</th>
            <td>${articleCount}</td>
            <td>${commentCount}</td>
        </tr>
        </tbody>
    </table>
</div>


<div style="width: 50%;position: relative;left: 25%">
    <table class="table table-sm" >
        <p class="text-success" style="text-align: center"> 系统信息</p>

        <tr>
            <th scope="row">管理员用户名</th>
            <td>${adminMsg.username}</td>
        </tr>
        <tr>
            <th scope="row">今天星期几</th>
            <td>不知道</td>
        </tr>
        <tr>
            <th scope="row">这里还没想好填啥</th>
            <td>.....</td>
        </tr>

    </table>
</div>

<script>
    function fullScreen(title,url){
        var index = layer.open({
            type: 2,
            title: title,
            area: ['70%', '70%'],
            content: url,
            maxmin: true
        });
        layer.full(index);
    }
</script>

</body>
</html>
