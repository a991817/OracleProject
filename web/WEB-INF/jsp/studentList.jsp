<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2018/12/13
  Time: 16:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>学生信息</title>
    <link rel="icon" href="/images/dgut.jpg">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/1.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/normal.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Coursenormal.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/courseDetail.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/normal.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery_v2.1.1.js"></script>

    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    %>

    <script type="text/javascript">
        $(function () {
            $("#studentListLi").addClass("current");
        });
        function isConfirm() {
            if (confirm("确定删除该学生信息吗？")) {
                return true;
            }
            else {
                return false;
            }
        }

        function addStudent() {
            window.location.href = "updateStudentPage.action";
        }

        function queryStudentPage() {
            window.location.href = "queryStudentPage.action";
        }
    </script>
    <%--翻页--%>
    <script type="text/javascript">
        function firstPage() {
            window.location.href = "searchStudent.action?pageNum=1&type=page";
        }

        function previousPage() {
            var currentPage = ${pager.currentPage}-1;
            if (currentPage < 1)
                currentPage = 1;
            window.location.href = "searchStudent.action?pageNum=" + currentPage + "&type=page";
        }

        function nextPage() {
            var currentPage = ${pager.currentPage}+1;
            window.location.href = "searchStudent.action?pageNum=" + currentPage + "&type=page";
        }

        function lastPage() {
            var totalPage = ${pager.totalPage};
            window.location.href = "searchStudent.action?pageNum=" + totalPage + "&type=page";
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
            <!-- navigation -->
            <div class="column_1">
                <section class="leftNav">
                    <h3>学生管理系统</h3>
                    <jsp:include page="navigationBar.jsp"></jsp:include>
                </section>
            </div>
            <!-- navigation -->
            <div class="column_2 ">
                <article class="mainContent">
                    <header class="contentNav">
                        <h1>学生信息</h1>
                    </header>
                    <section class="article">
                        <input type="button" value="添加学生" onclick="addStudent()"/>
                        <%--<input type="button" value="查询学生" onclick="queryStudentPage()"/>--%>
                        <form action="<%=basePath%>searchStudent.action?type=query">
                            学号
                            <input type="text" name="sno" id="sno" style="width:120px">
                            姓名
                            <input type="text" name="sname" id="sname" style="width:120px">
                            &nbsp;
                            性别
                            <select name="ssex" id="ssex" style="width:80px">
                                <option value="0">全部</option>
                                <option value="1">男</option>
                                <option value="2">女</option>
                            </select>
                            &nbsp;&nbsp;
                            <input type="submit" value="查询">
                        </form>
                        <%--若记录数不为空，才显示信息，否则显示无学生信息--%>

                        <c:if test="${pager.totalRecord!=0}">
                            <table class="InfoTable">
                                <tr>
                                    <td>学号</td>
                                    <td>姓名</td>
                                    <td>性别</td>
                                    <td>专业</td>
                                    <td>出生日期</td>
                                    <td>总学分</td>
                                    <td>班号</td>
                                    <td>操作</td>
                                </tr>
                                <c:forEach var="student" items="${pager.dataList}">
                                    <tr>
                                        <td>${student.sno}</td>
                                        <td>${student.sname}</td>
                                        <td>${student.ssex}</td>
                                        <td>${student.speciality}</td>
                                        <td><fmt:formatDate value="${student.sbirthday}" pattern="yyyy-MM-dd"/></td>
                                        <td>${student.tc}</td>
                                        <td>${student.sclass}</td>
                                        <td>
                                            <a href="<%=basePath%>updateStudentPage.action?sno=${student.sno}">修改</a>|
                                            <a href="<%=basePath%>deleteStudent.action?sno=${student.sno}"
                                               onclick="return isConfirm()">删除</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                            <p>页数:${pager.currentPage}/${pager.totalPage} ,总记录数：${pager.totalRecord}</p>
                            <c:if test="${pager.currentPage!=1}">
                                <input type="button" value="首页" onclick="firstPage()"/>
                                <input type="button" value="上一页" onclick="previousPage()"/>
                            </c:if>
                            <c:if test="${pager.currentPage!=pager.totalPage}">
                                <input type="button" value="下一页" onclick="nextPage()"/>
                                <input type="button" value="尾页" onclick="lastPage()"/>
                            </c:if>
                        </c:if>
                        <c:if test="${pager.totalRecord==0}">
                            <strong>暂无学生信息</strong>
                        </c:if>
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
