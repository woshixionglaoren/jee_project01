<%--
  Created by IntelliJ IDEA.
  User: 华耀 王
  Date: 2020/6/13
  Time: 23:07
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
    <script src="<%=basePath%>js/jquery-3.2.1.min.js"></script>
<%--    <script src="<%=basePath%>js/jquery.slim.min.js" ></script>--%>
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
                        <!-- <a class="dropdown-item" href="#">评论</a>-->
                    </div>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath }/manage/article/index.do">主页 </a>
            </li>
            <li class="nav-item active">
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
<br/>
<table class="table table-sm">
    <thead>
    <tr class="table-info">
        <th>id</th>
        <th width="25%">标题</th>
        <th>发表时间</th>
        <th>点击量</th>
        <th>详情</th>
        <th>评论管理</th>
        <th>编辑</th>
        <th>删除</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${articleList}" var="article">
        <tr>
            <th scope="row">${article.id}</th>
            <td>${article.articleTitle}</td>
            <td>${article.localTime}</td>
            <td>${article.articleCount}</td>
            <td><button type="button" class="btn btn-outline-info btn-sm" onclick="fullScreen('《${article.articleTitle}》','${pageContext.request.contextPath }/manage/article/article_detail.do?id=${article.id}')">详情</button></td>
            <td><button type="button" class="btn btn-outline-success btn-sm" onclick="fullScreen('《${article.articleTitle}》|评论管理','${pageContext.request.contextPath }/manage/comment/comment_list.do?id=${article.id}')">评论管理</button></td>
            <td><button type="button" class="btn btn-outline-primary btn-sm" onclick="fullScreen('《${article.articleTitle}》|编辑','${pageContext.request.contextPath }/manage/article/article_edit.do?id=${article.id}')">编辑</button>&nbsp;&nbsp;</td>
            <td><button type="button" class="btn btn-outline-danger btn-sm" onclick="ifdelete('${article.id}','${article.articleTitle}') ">删除</button></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<nav aria-label="Page navigation example" style="position: absolute;bottom: 10px;left: 42%">
    <ul class="pagination justify-content-center">
        <li class="page-item  <c:if test="${page.pageNum==1}">disabled</c:if> ">
            <a class="page-link" href="${pageContext.request.contextPath }/manage/article/article_list.do?pageNum=${page.firstPage}" >&laquo;</a>
        </li>
        <c:forEach begin="1" end="${page.pages}" step="1" var="pageNo">
            <li class="page-item <c:if test="${page.pageNum==pageNo}">active</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/manage/article/article_list.do?pageNum=${pageNo}">${pageNo}</a></li>
        </c:forEach>
        <li class="page-item  <c:if test="${page.pageNum==page.pages}">disabled</c:if> ">
            <a class="page-link" href="${pageContext.request.contextPath }/manage/article/article_list.do?pageNum=${page.pages}">&raquo;</a>
        </li>
    </ul>
</nav>


<%--<script src="<%=basePath%>js/jquery-3.2.1.min.js"></script>--%>
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

    function ifdelete(id,title) {
        // var $$ = layui.jquery
        layer.confirm('确定删除该文章吗?', {
            btn: ['确定','取消'] //按钮
        }, function(){
            layer.close(layer.index);
            var curIndex = layer.load(0, {time: 5*1000}); //并且设定最长等待5秒
            $.ajax({
                type: 'POST',
                url: '${pageContext.request.contextPath }/manage/article/article_del.do',
                datatype:'json',
                data:{"id":id},
                success: function(data){
                    layer.close(curIndex);
                    if(data['stateCode']==1){
                        layer.msg('删除成功!',{icon:1,time:1000});
                        setTimeout("window.location.reload()",1000);
                    }
                    else {
                        layer.msg('删除失败!',{icon:5,time:1000});
                    }
                },
                error:function(data) {
                    layer.close(curIndex);
                    layer.msg('删除失败!',{icon:5,time:1000});
                    console.log('错误...');
                }
            });
        }, function(){
            layer.msg('已取消!',{icon:2,time:1000});
        });
    }
</script>
</body>
</html>