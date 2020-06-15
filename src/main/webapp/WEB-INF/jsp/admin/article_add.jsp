<%--
  Created by IntelliJ IDEA.
  User: 华耀 王
  Date: 2020/6/14
  Time: 10:42
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
    <script type="text/javascript" src="<%=basePath%>js/wangEditor.min.js"></script>
</head>

<body>
<div style="position: relative;top: 10%">
    <c:if test="${!empty succ}">
        <div class="alert alert-success" role="alert">
                ${succ}
        </div>
    </c:if>
    <c:if test="${!empty error}">
        <div class="alert alert-danger" role="alert">
                ${error}
        </div>
    </c:if>
</div>
<div class="container">
    <form action="${pageContext.request.contextPath }/manage/article/article_add_do.do" method="post">
        <div class="form-group">
            <label for="articleTitle">文章标题</label>
            <input type="text" class="form-control" id="articleTitle" name="articleTitle" placeholder="文章标题">
        </div>
        <div class="form-group">
            <label for="articleTypeid">栏目</label>
            <select class="form-control" id="articleTypeid" name="articleTypeid">
                <option value="101">学习</option>
                <option value="102">生活</option>
                <option value="103">动漫</option>
                <option value="104">科技</option>
            </select>
        </div>
        <div class="form-group">
            <label for="articleMasterid">所有者ID</label>
            <input type="text" class="form-control" id="articleMasterid" name="articleMasterid" placeholder="所有者ID">
        </div>
        <div class="form-group">
            <label for="articleInfo">简介</label>
            <textarea class="form-control" id="articleInfo" rows="3" name="articleInfo" placeholder="简介"></textarea>
        </div>
        <div class="form-group">
            <label for="div1">内容</label>
            <div id="div1">
            </div>
            <textarea id="content" name="articleContent" style="display: none"></textarea>
        </div>
        <input type="submit" value="发表" />
    </form>

    <script type="text/javascript">
        var E = window.wangEditor
        var editor = new E('#div1')
        var $text1 = $('#content')
        editor.customConfig.onchange = function (html) {
            // 监控变化，同步更新到 textarea
            $text1.val(html)
        }
        editor.create()
        // 初始化 textarea 的值
        $text1.val(editor.txt.html())
    </script>
</div>
</body>
</html>