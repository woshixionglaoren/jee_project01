<%--
  Created by IntelliJ IDEA.
  User: 华耀 王
  Date: 2020/6/15
  Time: 13:21
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
    <c:if test="${!empty commentList}">
        <table class="table">
            <thead class="thead-default">
            <tr>
                <th>ID</th>
                <th>所属文章ID</th>
                <th>评论内容</th>
                <th>日期</th>
                <th>用户名称</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${commentList}" var="comment">
                <tr>
                    <th scope="row">${comment.id}</th>
                    <td>${comment.articleId}</td>
                    <td>${comment.commentContent}</td>
                    <td>${comment.localTime}</td>
                    <td>${comment.commentUsername}</td>
                    <td><button type="button" class="btn btn-outline-danger btn-sm" onclick="ifdelete('${comment.id}') ">删除</button></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
<%--        <script src="/js/jquery-3.2.1.min.js"></script>--%>
        <script>
            function ifdelete(id) {
                layer.confirm('确定删除该评论吗?', {
                    btn: ['确定','取消'] //按钮
                }, function(){
                    layer.close(layer.index);
                    var curIndex = layer.load(0, {time: 5*1000}); //并且设定最长等待5秒
                    $.ajax({
                        type: 'POST',
                        url: '${pageContext.request.contextPath }/manage/comment/comment_del.do',
                        datatype:'json',
                        data:{"id":id},
                        success: function(data){
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
                        },
                    });
                }, function(){
                    layer.msg('已取消!',{icon:2,time:1000});
                });
            }
        </script>
    </c:if>
    <c:if test="${empty commentList}">
        <div class="card">
            <div class="card-body">
                该文章暂无评论!
            </div>
        </div>
    </c:if>
</div>
</body>
</html>
