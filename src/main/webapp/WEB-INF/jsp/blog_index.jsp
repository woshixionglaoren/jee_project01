<%--
  Created by IntelliJ IDEA.
  User: 华耀 王
  Date: 2020/6/10
  Time: 11:34
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
    <title>Blog_index--芜湖博客</title>

    <link rel="stylesheet" href="<%=basePath%>css/nav-simple.css">
    <link rel="stylesheet" href="<%=basePath%>css/blog_index.css?v=20200002">
    <link rel="stylesheet" href="<%=basePath%>css/footer.css">

    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js">
    </script>

</head>
<body background="/images/calendar-Jun.jpg"
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
        <form action="${pageContext.request.contextPath }/article/blog_search.do" method="post">
        <div class="header">
            <div class="w">
                <a class="logo">WUHU</a>
                <div class="search-con">
                    <input class="search-input" id="search-input" name="keyword" placeholder="请输入文章标题" style="color: #808080" />
                    <input class="btn search-btn" id="search-btn" type="submit" value="搜索"/>
                </div>
            </div>
        </div>
        </form>
    </header>

    <div id="container">

        <c:forEach items="${articleList}" var="article">
            <article class="article">
                <time>${article.localTime}</time>
                <h2 class="title"><a href="${pageContext.request.contextPath }/article/blog_detail.do?id=${article.id}">${article.articleTitle}</a></h2>
                    <%--            <span><i>${article.keywords}</i></span>--%>
                <section class="article-content markdown-body">
                    <blockquote>
                        <p>${article.articleInfo}</p>
                    </blockquote>
                    ......
                </section>
                <footer>
                    <a href="${pageContext.request.contextPath }/article/blog_detail.do?id=${article.id}">阅读全文</a>
                </footer>
            </article>
        </c:forEach>


        <div id="page-part">

        <p>当前表格共${page.pages}页、${page.total}条记录</p>

        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li <c:if test="${page.pageNum==1}">class="disabled"</c:if>>
                    <a href="${pageContext.request.contextPath }/article/blog_index.do?pageNum=${page.firstPage}" aria-label="Previous">
                        <span aria-hidden="true">«</span>
                    </a>
                </li>
                <c:forEach var="s" begin="1" end="${page.pages}">
                    <li <c:if test="${page.pageNum==pageNo}">class="active"</c:if>><a href="${pageContext.request.contextPath }/article/blog_index.do?pageNum=${s}">${s}</a></li>
                </c:forEach>
                <li <c:if test="${page.pageNum==page.pages}">class="disabled"</c:if>>
                    <a href="${pageContext.request.contextPath }/article/blog_index.do?pageNum=${page.lastPage}" aria-label="Next">
                        <span aria-hidden="true">»</span>
                    </a>
                </li>
            </ul>
        </nav>
        </div>
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
