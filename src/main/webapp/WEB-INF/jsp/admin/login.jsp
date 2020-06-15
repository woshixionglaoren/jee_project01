<%--
  Created by IntelliJ IDEA.
  User: 华耀 王
  Date: 2020/6/13
  Time: 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName()
            + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>登录页面-jee实训</title>
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>css/user-login.css">
    <link rel="stylesheet" href="<%=basePath%>css/nav-simple.css">
    <link rel="stylesheet" href="<%=basePath%>css/footer.css">
    <link rel="stylesheet" href="<%=basePath%>css/font-awesome-4.7.0/css/font-awesome.css"  type="text/css" />
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js">
    </script>

    <script>
        // 判断是登录账号和密码是否为空
        function check(){
            var username = $("#username").val();
            var password = $("#password").val();
            if(username=="" || password==""){
                alert("用户名或密码不能为空!");
                $("#message").text("账号或密码不能为空！");
                return false;
            }
            return true;
        }
    </script>

</head>
<body>

<div class="nav-simple">
    <div class="w">
        <a class="logo">后台管理系统-芜湖论坛</a>
    </div>
</div>


<div class="page-wrap">
    <div class="w">
        <div class="user-con">
            <div class="user-title">管理员用户登录</div>

            <div class="user-box">
                <form role="form" action="${pageContext.request.contextPath }/manage/user/login.do" method="post" onsubmit="check()">
                    <font color="red">
                        <%-- 提示信息--%>
                        <span id="message">${msg}</span>
                    </font>
                    <div class="user-item">
                        <label for="username" class="user-label">
                            <i class="fa fa-user"></i>
                        </label>
                        <input class="user-content" id="username" name="username" placeholder="请输入用户名" autocomplete="off">
                    </div>
                    <div class="user-item">
                        <label for="password" class="user-label">
                            <i class="fa fa-lock"></i>
                        </label>
                        <input type="password" class="user-content" id="password" name="password" placeholder="请输入密码" autocomplete="off">
                    </div>
                    <input class="user-btn btn-submit" id="submit" type="submit" value="登录"></input>
                    <div class="link-item">
                        <a href="${pageContext.request.contextPath }/article/blog_index.do" class="link" target="_blank">返回文章浏览页>></a>
                    </div>
                </form>
            </div>
        </div>
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

</body>
</html>
