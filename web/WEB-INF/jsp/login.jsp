<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2018/12/18
  Time: 20:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆</title>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
    <link rel="icon" href="/images/dgut.jpg">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/normal.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/normal.js"></script>
</head>
<body onload="Rendering();">
    <%--<form action="<%=basePath%>login.action">--%>
        <%--<span>用户名：</span>--%>
        <%--<input type="text" name="username" id="username"/>--%>
        <%--<span>密码：</span>--%>
        <%--<input type="password" name="password" id="password"/>--%>
        <%--<input type="submit" value="登陆">--%>
    <%--</form>--%>

    <div id="top"></div>
    <div class="outlineDiv">
        <form action="<%=basePath%>login.action">
            <div class="titleDiv">用户登录</div>
            <div class="partDiv">
                <div class="partLeft"><img src="${pageContext.request.contextPath}/images/man.png" width="40px" height="40px" alt=""/></div>
                <div class="partRight">
                    <input class="input" type="text" name="username" id="username"  placeholder="用户名">
                    <br><span id="accountSpan"></span>
                </div>
            </div>
            <div class="partDiv">
                <div class="partLeft"><img src="${pageContext.request.contextPath}/images/lock.png" width="40px" height="40px" alt=""/></div>
                <div class="partRight">
                    <input class="input" type="password" name="password" id="password" placeholder="密码">
                    <span id="passwordSpan"></span>
                </div>
            </div>
            <div ><input class="login" type="submit" value="立即登录"/></div>
        </form>

    </div>
    <br><br><br>
    <!-- 通过js渲染，js代码在normal.js里 -->
    <div id="copyrights"></div>
</body>
</html>
