<%--
  Created by IntelliJ IDEA.
  User: 华耀 王
  Date: 2020/6/9
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName()
            + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>注册成功页面</title>
    <link rel="stylesheet" href="<%=basePath%>css/nav-simple.css">
    <link rel="stylesheet" href="<%=basePath%>css/register-result.css">
</head>
<body>

<div class="nav-simple">
    <div class="w">
        <a class="logo">JEE-芜湖论坛</a>
    </div>
</div>

<div class="page-wrap w">
<div class="result-con register-success">
    <h1 class="result-title">
        <span>${msg}</span>
    </h1>

    <div class="result-content">
        <a href="${pageContext.request.contextPath }/user/login.do" class="link">返回登录</a>
    </div>
</div>
</div>

</body>
</html>
