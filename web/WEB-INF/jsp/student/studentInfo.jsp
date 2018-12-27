<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2018/12/18
  Time: 21:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>  <script src="${pageContext.request.contextPath}/js/jquery_v2.1.1.js"></script>
<link rel="icon" href="/images/dgut.jpg">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/1.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/normal.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Coursenormal.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/courseDetail.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/normal.js"></script>
<head>
    <title>个人信息</title>

    <%
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
    <script type="text/javascript">
        function updateStudent() {
            window.location.href="updateStudentInfoPage.action?sno="+${student.sno};
        }
        function changePassword() {
            window.location.href="changePasswordPage.action";
        }
        $(function () {
            $("#studentInfoLi").addClass("current");
        });

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
                            <h1>个人信息</h1>
                        </header>
                        <section class="article">
                            <input type="button" value="修改信息" onclick="updateStudent()"/>
                            <input type="button" value="修改密码" onclick="changePassword()"/>
                                <p>学号：${student.sno}<span id="snoSpan"></span></p>
                                <p>姓名：${student.sname}</p>
                                <p>生日：<fmt:formatDate value="${student.sbirthday}" pattern="yyyy-MM-dd"/></p>
                                <p>性别：${student.ssex}</p>
                                <p>专业：${student.speciality}</p>
                                <p>班级：${student.sclassname}</p>
                                <p>总学分：${student.tc}</p>
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
