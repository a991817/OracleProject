<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2018/12/22
  Time: 23:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>
    <script src="${pageContext.request.contextPath}/js/jquery_v2.1.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/check.js"></script>
    <link rel="icon" href="/images/dgut.jpg">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/1.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/normal.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Coursenormal.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/courseDetail.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/normal.js"></script>
    <script type="text/javascript">
        function submitPassword() {
            var oldPassword = $("#oldPassword").val();
            var newPassword = $("#newPassword").val();
            var newPasswordAgain = $("#newPasswordAgain").val();
            if(!checkPassword(oldPassword,newPassword,newPasswordAgain)){
                alert("输入有误")
                return false;
            }
            if(newPassword==newPasswordAgain)
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/changePassword.action",
                // contentType: "application/json;charset=UTF-8",//指定消息请求类型
                data:'oldPassword='+oldPassword+'&newPassword='+newPassword,
                dataType: "json",
                success: function (data) {
                    var d = data;
                    if(d==true){
                        alert("修改成功!");
                    }
                    else{
                        alert("修改失败，旧密码输入错误！");
                    }
                }
            })
            else{
                alert("两次密码不正确")
            }
        }
    </script>
</head>
<body onload="Rendering();">

<!-- 通过js渲染，js代码在normal.js里 -->
<div id="top"></div>

<article class="content">

    <section id="banner">
        <img src="${pageContext.request.contextPath}/images/abouttop_03.jpg">
    </section>
    <section class="mainWrap relative">
        <div class="detailContent">
            <div class="column_1">
                <section class="leftNav">
                    <h3>学生管理系统</h3>
                    <jsp:include page="s_navigationBar.jsp"></jsp:include>
                </section>
            </div>
            <div class="column_2 ">
                <article class="mainContent">
                    <header class="contentNav">
                        <h1>查询学生信息</h1>
                    </header>
                    <section class="article">
                        <span>
                            <p>输入旧密码:<input id="oldPassword" type="password" onblur="checkOldPassword()"/>
                                <span id="oldPasswordSpan"></span>
                            </p>
                            <p>输入新密码:<input id="newPassword" type="password" onblur="checkNewPassword()"/>
                                <span id="newPasswordSpan"></span>
                            </p>
                            <p>再次输入新密码:<input id="newPasswordAgain" type="password" onblur="checkNewPasswordAgain()"/>
                                <span id="newPasswordAgainSpan"></span>
                            </p>
                            <input onclick="submitPassword()" type="button" value="确定"/>
                        </span>
                    </section>
                </article>
            </div>
        </div>
    </section>
</article>
<!-- 通过js渲染，js代码在normal.js里 -->
<div id="copyrights"></div>

</body>
</html>
