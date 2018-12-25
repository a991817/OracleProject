<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2018/12/16
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查询学生</title>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
    <link rel="icon" href="/images/dgut.jpg">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/normal.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Coursenormal.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/courseDetail.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/normal.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery_v2.1.1.js"></script>
    <script type="text/javascript">
        function isConfirm(){
            if(confirm("确定删除该学生信息吗？")){
                return true;
            }
            else{
                return false;
            }
        }
        function queryStudent() {
                $.ajax({
                    type: "GET",
                    url: "${pageContext.request.contextPath}/queryStudent.action",
                    contentType: "application/json;charset=UTF-8",//指定消息请求类型
                    data:$('#sno'),
                    dataType: "json",
                    success: function (data) {
                        if(data.sno=="-2"){
                            alert("输入学号不能为空!");
                        }
                        else if(data.sno=="-1"){
                            alert("该学生不存在！");
                        }
                        else {
                                $('#studentInfo').empty();   //清空resText里面的所有内容
                                var html = '';
                                html += ""
                                html += " <td>" + data.sno + "</td>"
                                html += " <td>" + data.sname + "</td>"
                                html += " <td>" + data.ssex + "</td>"
                                html += " <td>" + data.speciality + "</td>"
                                html += " <td>" + data.sbirthday + "</td>"
                                html += " <td>" + data.tc + "</td>"
                                html += "  <td>" + data.sclass + "</td>"
                                html += "<td>"
                                html += '<a href="<%=basePath%>updateStudentPage.action?sno=' + data.sno + '">修改</a>|'
                                html += '<a href="<%=basePath%>deleteStudent.action?sno=' + data.sno + '" onclick="return isConfirm()">删除</a>'
                                html += '</td>'
                                $('#studentInfo').html(html);
                                $('#studentInfoTable').css("display","block");
                        }
                    }
            })
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
                            <h1>查询学生信息</h1>
                        </header>
                        <section class="article">
                            <span>输入学号：</span><input type="text" id ="sno" name="sno"/>
                            <input type="button" value="确定" onclick="queryStudent()"/>
                            <div id="queryContent" class="queryContent">
                                <table id="studentInfoTable" class="studentInfoTable" style="display:none;width: 800px;">
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
                                <tr id="studentInfo">
                                </tr>
                                </table>
                            </div>
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
