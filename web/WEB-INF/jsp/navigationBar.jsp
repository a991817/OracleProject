
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>


    <ul>
        <li><a>管理员：${username}</a></li>
        <li id="studentListLi"><a href="<%=basePath%>studentList.action">学生信息</a></li>
        <li id="courseListLi"><a href="<%=basePath%>courseList.action">课程信息</a></li>
        <li id="scoreListLi"><a href="<%=basePath%>scoreList.action">学生成绩</a></li>
        <li><a href="<%=basePath%>logout.action">退出登录</a></li>
    </ul>
