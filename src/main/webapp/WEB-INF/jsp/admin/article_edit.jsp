<%--
  Created by IntelliJ IDEA.
  User: 华耀 王
  Date: 2020/6/13
  Time: 23:57
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
<%--    <script type="text/javascript" src="<%=basePath%>js/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/ueditor/ueditor.all.js"> </script>
    <script type="text/javascript"  src="<%=basePath%>js/lang/zh-cn/zh-cn.js"></script>--%>
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
    <form action="${pageContext.request.contextPath }/manage/article/article_edit_update.do" method="post">
        <input type="hidden" value="${articleEdit.id}" name="id">
        <div class="form-group">
            <label for="articleTitle">文章标题</label>
            <input type="text" class="form-control" id="articleTitle" name="articleTitle" placeholder="文章标题" value="${articleEdit.articleTitle}">
        </div>
        <div class="form-group">
            <label for="articleTypeid">栏目</label>
            <select class="form-control" id="articleTypeid" name="articleTypeid">
                <option value="101" <c:if test="${articleEdit.articleTypeid==101}">selected="selected"</c:if>>学习</option>
                <option value="102" <c:if test="${articleEdit.articleTypeid==102}">selected="selected"</c:if>>生活</option>
                <option value="103" <c:if test="${articleEdit.articleTypeid==103}">selected="selected"</c:if>>动漫</option>
                <option value="104" <c:if test="${articleEdit.articleTypeid==104}">selected="selected"</c:if>>科技</option>
            </select>
        </div>
        <div class="form-group">
            <label for="articleMasterid">所有者ID</label>
            <input type="text" class="form-control" id="articleMasterid" name="articleMasterid" placeholder="所有者ID" value="${articleEdit.articleMasterid}">
        </div>
        <div class="form-group">
            <label for="articleInfo">简介</label>
            <textarea class="form-control" id="articleInfo" rows="3" name="articleInfo" placeholder="简介">${articleEdit.articleInfo}</textarea>
        </div>
        <div class="form-group">
            <label for="articleContent">内容</label>
            <textarea class="form-control" id="articleContent" rows="5" name="articleContent" placeholder="内容">${articleEdit.articleContent}</textarea>
        </div>
        <input type="submit" />
    </form>

</div>
</body>
</html>