<%--
  Created by IntelliJ IDEA.
  User: 华耀 王
  Date: 2020/6/9
  Time: 18:36
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
    <title>注册页面-jee实训</title>
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
            var passwordconfirm = $("#password-confirm").val();
            var email = $("#email").val();
            if(username=="" || password==""){
                alert("用户名或密码不能为空!");
                $("#message").text("账号或密码不能为空！");
                return false;
            }
            if (password != passwordconfirm){
                alert("两次输入的密码不一致！");
                return false;
            }
            if (email == ""){
                alert("邮箱不能为空！");
                return false;
            }
            return true;
        }
    </script>

<%--    <script type="text/javascript">
        // 验证输入不为空的脚本代码
        function checkForm(form) {
            if(form.username.value == "") {
                alert("用户名不能为空!");
                form.username.focus();
                return false;
            }
            if(form.password.value == "") {
                alert("密码不能为空!");
                form.password.focus();
                return false;
            }
            if(form.email.value == "") {
                alert("邮箱不能为空!");
                form.email.focus();
                return false;
            }
            if(form.password.value !== form.password-again.value) {
                alert("两次输入密码不对!");
                form.email.focus();
                return false;
            }
            return true;
        }
    </script>--%>
</head>
<body>

<div class="nav-simple">
    <div class="w">
        <a class="logo">JEE-芜湖论坛</a>
    </div>
</div>


<div class="page-wrap">
    <div class="w">
        <div class="user-con">
            <div class="user-title">用户注册</div>

            <div class="user-box">
                <form role="form" action="${pageContext.request.contextPath }/user/register.do" method="post" onsubmit="return check()">
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

                    <div class="user-item">
                        <label for="password-confirm" class="user-label">
                            <i class="fa fa-lock"></i>
                        </label>
                        <input type="password" class="user-content" id="password-confirm" name="password-confirm" placeholder="请再次输入密码" autocomplete="off">
                    </div>

                    <div class="user-item">
                        <label for="email" class="user-label">
                            <i class="fa fa-envelope"></i>
                        </label>
                        <input class="user-content" id="email" name="email" placeholder="邮箱" autocomplete="off">
                    </div>

                    <div class="user-item">
                        <label for="phone" class="user-label">
                            <i class="fa fa-phone"></i>
                        </label>
                        <input class="user-content" id="phone" name="phone" placeholder="电话" autocomplete="off">
                    </div>

                    <input class="user-btn btn-submit" id="submit" type="submit" value="立即注册"></input>
                    <div class="link-item">
                        <a href="${pageContext.request.contextPath }/user/login.do" class="link" target="_blank">已有账号，去登录>></a>
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
