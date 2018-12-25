<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2018/12/14
  Time: 20:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>


<%--<ul>--%>
    <%--<li>${username}</li>--%>
    <%--<li onclick="studentList()">个人信息</li>--%>
    <%--<li onclick="courseList()">选课信息</li>--%>
    <%--<li onclick="scoreList()">成绩信息</li>--%>
<%--</ul>--%>
<ul id="navLi">
    <li><a>学号：${username}</a></li>
    <li id="studentInfoLi"><a href="<%=basePath%>studentInfo.action">个人信息</a></li>
    <li id="s_courseListLi"><a href="<%=basePath%>s_courseList.action">选课信息</a></li>
    <li id="scoreInfoLi"><a href="<%=basePath%>scoreInfo.action">成绩信息</a></li>
    <li><a href="<%=basePath%>logout.action">退出登录</a></li>
</ul>

