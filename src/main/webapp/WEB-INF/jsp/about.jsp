<%--
  Created by IntelliJ IDEA.
  User: 华耀 王
  Date: 2020/6/10
  Time: 22:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <style>
        hr{
            margin-top: 20px;
        }
        .h1{
            text-align: center;
            color: #5e5e5e;
        }
        .h3{
            text-align: center;
            color: #5e5e5e;
        }
        .result-content{
            margin-top: 20px;
            text-align: center;
        }
        .result-content .link{
            margin: 0 5px;
            padding: 5px 10px;
            border:1px solid #ccc;
        }

    </style>

</head>
<body>
<hr>
<h1 class="h1">关于作者信息</h1>
<h3 class="h3">作者：我是熊老人</h3>
<h3 class="h3">QQ：1244871712</h3>
<div class="result-content">
    <a href="${pageContext.request.contextPath }/article/blog_index.do" class="link">返回首页</a>
</div>
</body>
</html>
