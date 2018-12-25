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
            $("#scoreListLi").addClass("current");
        });
        function isConfirm() {
            if (confirm("确定删除该课程信息吗？")) {
                return true;
            }
            else {
                return false;
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
                        <h1>查询学生成绩</h1>
                    </header>
                    <section class="article">
                        <form action="<%=basePath%>scoreList.action?type=query">
                            课程名称：
                            <input type="text" name="cname" id="cname" style="width:120px">
                            学生姓名：
                            <input type="text" name="sname" id="sname" style="width:120px">
                            <input type="submit" value="查询">
                        </form>
                        <c:if test="${pager.totalRecord!=0}">
                            <table class="InfoTable">
                                <tr>
                                    <td>课程名称</td>
                                    <td>学号</td>
                                    <td>学生姓名</td>
                                    <td>分数</td>
                                    <td>操作</td>
                                </tr>
                                <c:forEach var="sc" items="${pager.dataList}">
                                    <tr>
                                        <td>${sc.cname}</td>
                                        <td>${sc.sno}</td>
                                        <td>${sc.sname}</td>
                                        <td>
                                            <c:if test="${sc.score>0}">
                                                ${sc.score}
                                            </c:if>
                                            <c:if test="${sc.score==0}">
                                                未打分
                                            </c:if>
                                        </td>
                                        <td>
                                            <a href="<%=basePath%>updateScorePage.action?cno=${sc.cno}&sno=${sc.sno}">
                                                <c:if test="${sc.score>0}">
                                                    修改
                                                </c:if>
                                                <c:if test="${sc.score==0}">
                                                    打分
                                                </c:if>
                                            </a>
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
                            <strong>暂无成绩信息</strong>
                        </c:if>
                    </section>
                </article>
            </div>
        </div>
    </section>
</article>
<!-- 通过js渲染，js代码在normal.js里 -->
<div id="copyrights"></div>

</div>
</body>
</html>
