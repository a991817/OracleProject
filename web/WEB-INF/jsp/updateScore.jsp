<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2018/12/16
  Time: 20:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>课程信息</title>
    <script src="${pageContext.request.contextPath}/js/jquery_v2.1.1.js"></script>
    <link rel="icon" href="/images/dgut.jpg">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/normal.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Coursenormal.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/courseDetail.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/normal.js"></script>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    %>
    <script type="text/javascript">
        $(function () {
            $("#scoreListLi").addClass("current");
        });
        function updateScore() {
            var flag = true;
            if(!checkUpdateGrade()){
                flag = false;
            }
            if (flag) {
                var cno = $("#cno").text();
                var sno = $("#sno").text();
                var score = $("#newScore").val();
                window.location.href = "updateCourse.action?cno=" + cno + "&sno=" + sno + "&score=" + score;
            }else{
                alert("输入有误！");
            }
        }

        function checkUpdateGrade() {
            var newScore = $("#newScore").val();
            if (newScore == null ||newScore=="") {
                $("#grade").text("成绩不能为空")
                $("#grade").css("color", "red");
                return false;
            } else if (newScore > 100 || newScore < 0) {
                $("#grade").text("成绩不能超过0-100");
                $("#grade").css("color", "red");
                return false;
            } else {
                $("#grade").text("正确");
                $("#grade").css("color", "green");
                return true;
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
                    <jsp:include page="navigationBar.jsp"></jsp:include>
                </section>
            </div>
            <div class="column_2 ">
                <article class="mainContent">
                    <header class="contentNav">
                        <h1>修改成绩</h1>
                    </header>
                    <section class="article">
                        <table class="InfoTable">
                            <tr>
                                <td>课程编号</td>
                                <td>课程名称</td>
                                <td>学号</td>
                                <td>学生姓名</td>
                                <td>分数</td>
                                <td>操作</td>
                            </tr>
                            <tr>
                                <td id="cno">${score.cno}</td>
                                <td>${score.cname}</td>
                                <td id="sno">${score.sno}</td>
                                <td>${score.sname}</td>
                                <td>${score.score}</td>
                                <td>
                            <span>
                            输入分数：
                            </span>
                                    <input id="newScore" type="number" onblur="checkUpdateGrade()"
                                           oninput="if(value.length>2)value=value.slice(0,3)" placeholder="请输入0-100"/>
                                    <br>
                                    <span id="grade" style="color:#F00"></span>
                                </td>
                            </tr>
                        </table>
                        <input type="button" value="确定" onclick="updateScore()"/>
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
