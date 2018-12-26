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
    <title>选课信息</title>
    <script src="${pageContext.request.contextPath}/js/jquery_v2.1.1.js"></script>
    <link rel="icon" href="/images/dgut.jpg">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/1.css">
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
            $("#s_courseListLi").addClass("current");
        });
        function selectCourse(cno, self, i) {
            if (confirm("确定选则这门课程吗？")) {
                var inputData = "sno=${username}" + "&cno=" + cno;
                $.ajax({
                    type: "GET",
                    url: "${pageContext.request.contextPath}/selectCourse.action",
                    // contentType: "application/json;charset=UTF-8",//指定消息请求类型
                    data: inputData,
                    success: function () {
                        $(self).parent().html("已选");
                    },
                    error: function (e) {
                        console.log("error")
                    }
                })

            }
            else {
                return false;
            }
        }
    </script>

    <%--翻页--%>
    <script type="text/javascript">
        function firstPage() {
            window.location.href = "s_courseList.action?pageNum=1&type=page";
        }

        function previousPage() {
            var currentPage = ${pager.currentPage}-1;
            if (currentPage < 1)
                currentPage = 1;
            window.location.href = "s_courseList.action?pageNum=" + currentPage + "&type=page";
        }

        function nextPage() {
            var currentPage = ${pager.currentPage}+1;
            window.location.href = "s_courseList.action?pageNum=" + currentPage + "&type=page";
        }

        function lastPage() {
            var totalPage = ${pager.totalPage};
            window.location.href = "s_courseList.action?pageNum=" + totalPage + "&type=page";
        }
    </script>
</head>
<body onload="Rendering();">

<!-- 通过js渲染，js代码在normal.js里 -->
<div id="top"></div>

<article class="content" style="height: 600px;">

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
                        <h1>选课信息</h1>
                    </header>
                    <section class="article">
                        <c:if test="${pager.totalRecord!=0}">
                            <table class="InfoTable" style="width: 600px;">
                                <tr>
                                    <td>课程编号</td>
                                    <td>课程名称</td>
                                    <td>学分</td>
                                    <td>教师姓名</td>
                                    <td>选择</td>
                                </tr>
                                <c:forEach varStatus="i" var="selectCourseVo" items="${pager.dataList}">
                                    <tr>
                                        <td>${selectCourseVo.course.cno}</td>
                                        <td>${selectCourseVo.course.cname}</td>
                                        <td>${selectCourseVo.course.credit}</td>
                                        <td>${selectCourseVo.tname}</td>
                                        <td value="${selectCourseVo.course.cno}">
                                            <c:if test="${selectCourseVo.selected}">
                                                已选
                                            </c:if>
                                            <c:if test="${!selectCourseVo.selected}">
                                                <input type="button" value="选择"
                                                       onclick="selectCourse('${selectCourseVo.course.cno}',this,${i.count})"/>
                                            </c:if>
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
                            <strong>暂无课程信息</strong>
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
