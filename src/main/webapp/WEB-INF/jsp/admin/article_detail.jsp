<%--
  Created by IntelliJ IDEA.
  User: 华耀 王
  Date: 2020/6/13
  Time: 23:41
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


<table class="table table-striped table-sm">

    <tr class="table-active">
        <th width="15%">ID</th>
        <td >${articleDetail.id}</td>
    </tr>
    <tr class="table-secondary">
        <th>标题</th>
        <td>${articleDetail.articleTitle}</td>
    </tr>
    <tr class="table-danger">
        <th>简介</th>
        <td>${articleDetail.articleInfo}</td>
    </tr>
    <tr class="table-warning">
        <th>发表时间</th>
        <td>${articleDetail.localTime}</td>
    </tr>
    <tr class="table-info">
        <th>点击量</th>
        <td>${articleDetail.articleCount}</td>
    </tr>
    <tr class="table-light">
        <th>内容</th>
        <td>${articleDetail.articleContent}</td>
    </tr>
    <tr class="table-success">
        <th>文章所有者ID</th>
        <td>${articleDetail.articleMasterid}</td>
    </tr>
</table>

</body>
</html>