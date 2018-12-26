<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2018/12/17
  Time: 16:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改课程信息</title>
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
        function checkUpdateCourse() {
            $(function () {
                $("#courseListLi").addClass("current");
            });
            var flag = true;
            if(!checkCname()){
                flag = false;
            }
            if(!checkCredit()){
                flag = false;
            }
            if(!flag){
                alert("输入有误！");
                return false;
            }
            return true;
        }

        function checkCname() {
            var cname = $("#cname").val();
            if (cname == null || cname == "") {
                $("#cnameSpan").text("课程名称不能为空")
                $("#cnameSpan").css("color", "red");
                return false;
            } else if (cname.length > 15 || cname.length < 3) {
                $("#cnameSpan").text("课程名称的长度只能在3-15之间");
                return false;
            }
            else {
                $("#cnameSpan").text("正确");
                $("#cnameSpan").css("color", "green");
                return true;
            }
        }

        function checkCredit() {
            var credit = $("#credit").val();
            var r = /^[0-9]*[1-9][0-9]*$/;
            r.test(credit);
            if (credit == null || credit == "") {
                $("#creditSpan").text("学分不能为空")
            } else if (!r.test(credit)) {
                $("#creditSpan").text("学分必须是正整数");
            }
            else if (parseInt(credit) < 1 || parseInt(credit) > 5) {
                $("#creditSpan").text("学分只能是1-5");
            }
            else {
                $("#creditSpan").text("正确");
                $("#creditSpan").css("color", "green");
                return true;
            }
            $("#creditSpan").css("color", "red");
            return false;
        }
        function teacherNameChange() {
            var tno = $("#teacherNameSelect").val();
            $("#tno").val(tno)
        }


    </script>
</head>
<body>

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
                        <h1>课程信息</h1>
                    </header>
                    <section class="article">
                        <form class="userForm" action="<%=basePath%>insertCourse.action"
                              onsubmit="return checkUpdateCourse();">
                            <p>
                                <c:if test="${updateCourseVo.courseExtend.cno!=null}">
                                    <span>课程编号</span>
                                    <input disabled="disabled" value="${updateCourseVo.courseExtend.cno}"/>
                                    <input name="cno" hidden="hidden" value="${updateCourseVo.courseExtend.cno}"/>
                                </c:if>
                            </p>
                            <p>
                                <span>课程名称</span>
                                <input id="cname" name="cname" value="${updateCourseVo.courseExtend.cname}" maxlength="15" onblur="checkCname()"/>
                                <span id="cnameSpan"></span>
                            </p>
                            <p>
                                <span>学分</span>
                                <input id="credit" type="number" maxlength="1" name="credit" value="${updateCourseVo.courseExtend.credit}"
                                       onblur="checkCredit()"oninput="if(value.length>1)value=value.slice(0,1)"
                                       placeholder="请输入1-5"/>
                                <span id="creditSpan"></span>
                            </p>
                            <p>
                                <%--<span>教师编号</span>--%>
                                <%--<input id="tno" name="tno" value="${course.tno}" maxlength="15" onblur="checkTno()"/>--%>
                                <%--<span id="tnoSpan"></span>--%>
                                    <span>教师姓名</span>
                                    <select id="teacherNameSelect" onchange="teacherNameChange()">
                                        <option value="${updateCourseVo.courseExtend.tno}">${updateCourseVo.courseExtend.tname}</option>
                                        <c:forEach items="${updateCourseVo.teachers}" var="teacher">
                                            <c:if test="${teacher.tno!=updateCourseVo.courseExtend.tno}">
                                                <option value="${teacher.tno}">${teacher.tname}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                    <input id="tno" name="tno" value="${updateCourseVo.courseExtend.tno}" hidden="true"/>
                            </p>
                            <input type="submit" value="提交"/>
                        </form>
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
