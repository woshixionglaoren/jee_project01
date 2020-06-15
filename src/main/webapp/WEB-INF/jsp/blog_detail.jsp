<%--
  Created by IntelliJ IDEA.
  User: 华耀 王
  Date: 2020/6/12
  Time: 11:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName()
            + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>Blog_detail--芜湖博客</title>

    <link rel="stylesheet" href="<%=basePath%>css/nav-simple.css">
    <link rel="stylesheet" href="<%=basePath%>css/blog_index.css?v=20200002">
    <link rel="stylesheet" href="<%=basePath%>css/footer.css">

    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js">
    </script>
</head>
<body background="/images/calendar-Jun-shangshui.jpg"
      style=" background-repeat:no-repeat ;
      background-size:100% 100%;
      background-attachment: fixed;"
>

<div>
    <header id="nav-header">
        <nav class="nav-container">
            <ul>
                <li>
                    <a href="${pageContext.request.contextPath }/article/blog_index.do">首页</a>
                    <a href="${pageContext.request.contextPath }/article/about.do">关于</a>
                    <a href="${pageContext.request.contextPath }/manage/user/login.do">后台管理</a>
                    <a href="${pageContext.request.contextPath }/user/logout.do">退出登录</a>
                </li>
            </ul>
        </nav>
        <%--<div class="header">
            <div class="w">
                <a class="logo">WUHU</a>
                <div class="search-con">
                    <input class="search-input" id="search-input" placeholder="请输入文章标题" />
                    <button class="btn search-btn" id="search-btn">搜索</button>
                </div>
            </div>
        </div>--%>
    </header>


    <div id="container">
        <article class="article">
            <time id="time1">${article.localTime}</time>
            <h2 style="text-align: center; ">${article.articleTitle}</h2>
            <p style="position: center" class="text-info">点击量:${article.articleCount}</p>
            <section>
                <blockquote>
                    <p>${article.articleInfo}</p>
                </blockquote>
                <p id="zhengwen">
                    ${article.articleContent}
                </p>
                <p style="text-align:center;color:#ccc;font-size:12px;margin-top:40px;">
                    熬过低谷
                    <br>
                    繁花自现
                </p>
                <p style="margin: 5em 0 1em;text-align: center;color: #83b8ec;font-size: .8em">
                    <span>Have a nice day :)</span>
                </p>
            </section>
        </article>
    </div>

    <div style="margin-left: 300px;">
    <% int i =1;    %>
    <c:forEach items="${commentList}" var="comment">
        <article class="comment">
            <section style="text-align:left">
                <%= i++  %>楼&nbsp;&nbsp;&nbsp;&nbsp;时间：${comment.localTime}<br/><br/>
                <p>${comment.commentUsername}：${comment.commentContent}</p><br/>
            </section>
        </article>
    </c:forEach>
    </div>

    <div class="form-horizontal" role="form" style="margin:5px 0;">
        <div class="form-group">
            <label for="content" class="col-sm-2 control-label">评论</label>
            <div class="col-sm-3">
                <textarea id="content" class="form-control" rows="3" placeholder="文明上网，理性发言" ></textarea>
            </div>
        </div>
        <input id="articleId" type="hidden" value="${article.id}" >
       <%-- <div class="form-group">
            <label for="name" class="col-sm-2 control-label">用户昵称</label>
            <div class="col-sm-3">
                <input type="text" id="name" class="form-control" placeholder="用户昵称">
            </div>
        </div>--%>

        <div class="form-group" style="position:relative;left:18%;bottom: 30px">
            <br/>
            <p style="text-align: right;color: red;position: absolute" id="info"></p>
            <br/>
            <button id="commentButton" class="btn btn-default" type="submit">提交</button>
        </div>
    </div>

    <script>

        $("#commentButton").click(function () {
            if($("#content").val()==''){
                $("#info").text("提示:请输入评论内容");
            }
/*            else if ($("#content").val()==''){
                $("#info").text("提示:请输入评论内容");
            }
            else if($("#name").val()==''){
                $("#info").text("提示:请输入昵称");
            }*/
            else {
                $("#info").text("");
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath }/comment/comment_add.do",
                    data: {
                        commentContent: $("#content").val() ,
                        // commentUsername: $("#name").val(),
                        articleId:$("#articleId").val(),
                    },
                    dataType: "json",
                    success: function(data) {
                        if(data.stateCode.trim() == "1") {
                            $("#info").text("评论成功,跳转中...");
                            window.location.reload();
                        } else  {
                            $("#info").text("评论失败...");
                        }
                    }
                });
            }
        })

    </script>

    <div style="position: relative;left: 12%">
        <c:if test="${!empty lastArticle }">
            <div ><a href="${pageContext.request.contextPath }/article/blog_detail.do?id=${lastArticle.id}"><h4><span class="label label-primary">上一篇:${lastArticle.articleTitle}</span></h4></a></div>
        </c:if>
        <c:if test="${!empty nextArticle }">
            <div><a href="${pageContext.request.contextPath }/article/blog_detail.do?id=${nextArticle.id}"><h4><span class="label label-success">下一篇:${nextArticle.articleTitle}</span></h4></a></div>
        </c:if>
    </div>

    <div class="footer">
        <div class="w">
            <div class="links">
                <a href="https://www.jd.com" class="link" target="_blank">京东</a> |
                <a href="https://www.baidu.com" class="link" target="_blank">百度</a> |
                <a href="https://www.taobao.com" class="link" target="_blank">淘宝</a> |
                <a href="https://www.zhihu.com" class="link" target="_blank">知乎</a>
            </div>
            <p class="copyright">
                Copyright © 2020 jee-wuhuluntan.com All Right Reserved
            </p>
        </div>
    </div>

</div>

</body>
</html>
