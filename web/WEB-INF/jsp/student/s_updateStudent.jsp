<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2018/12/14
  Time: 20:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>修改学生信息</title>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    %>
    <link href="${pageContext.request.contextPath}/css/lyz.calendar.css" rel="stylesheet" type="text/css"/>
    <script src="${pageContext.request.contextPath}/js/jquery_v2.1.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/lyz.calendar.min.js"></script>
    <link rel="icon" href="/images/dgut.jpg">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/1.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/normal.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Coursenormal.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/courseDetail.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/normal.js"></script>
    <script type="text/javascript">
        //根据学生信息显示select默认的学生性别
        $(document).ready(function () {
            var sex = $("#ssex").val();

            if (sex.length == 0) {
                $("#ssex").val('男');
            }

            if (sex == "女") {
                $("#sexSelect").val('w')
            }
            else {
                $("#sexSelect").val('m')
            }

        })

        //当性别那项改变后，更新input的值
        function sexSelectChange() {
            var v = $("#sexSelect").val();
            if (v == 'w') {
                $("#ssex").val('女')
            }
            else {
                $("#ssex").val('男')
            }
        }
        function selectDate() {
            var pos = $("#sbirthday").position();
            var top = pos.top + 180;
            var left = pos.left + 250;
            $("#divDate").offset({top: top, left: left})
        }
        $(function () {
            Rendering();
            $("#sbirthday").calendar({
                controlId: "divDate",                                 // 弹出的日期控件ID，默认: $(this).attr("id") + "Calendar"
                speed: 200,                                           // 三种预定速度之一的字符串("slow", "normal", or "fast")或表示动画时长的毫秒数值(如：1000),默认：200
                complement: true,                                     // 是否显示日期或年空白处的前后月的补充,默认：true
                readonly: true,                                       // 目标对象是否设为只读，默认：true
                upperLimit: new Date(),                               // 日期上限，默认：NaN(不限制)
                lowerLimit: new Date("2011/01/01"),                   // 日期下限，默认：NaN(不限制)
                callback: function () {                               // 点击选择日期后的回调函数
                }
            });
        });

        function subname() {
            var str = $("#sname").val();
            var han = /^[\u4e00-\u9fa5]+$/;
            if (str == null || str == "") {
                $("#ssname").text("名字不能为空");
                $("#ssname").css("color", "red");
                return false;
            }
            else if (!han.test(str)) {
                $("#ssname").text("请输入正确的名字！");
                $("#ssname").css("color", "red");
                return false;
            } else {
                $("#ssname").text("正确");
                $("#ssname").css("color", "green");
                return true;
            }
        };

        function subspeciality() {
            var str = $("#speciality").val();
            var han = /^[\u4e00-\u9fa5]+$/;
            if (str == null || str == "") {
                $("#sspeciality").text("专业不能为空");
                $("#sspeciality").css("color", "red");
                return false;
            }
            else if (!han.test(str)) {
                $("#sspeciality").text("请输入正确的专业！");
                $("#sspeciality").css("color", "red");
                return false;
            } else {
                $("#sspeciality").text("正确");
                $("#sspeciality").css("color", "green");
                return true;
            }
        }

        function checkStudentInfo() {
            var flag = true;
            if(!subspeciality()){
                flag = false;
            }
            if(!subname()){
                flag = false;
            }
            if(!flag){
                alert("输入有误！");
                return false;
            }
            return true;
        }
        function classNameChange() {
            var sclass = $("#sClassSelect").val();
            $("#sclass").val(sclass)
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
                        <h1>修改信息</h1>
                    </header>
                    <section class="article">
                        <form class="userForm" action="<%=basePath%>insertStudent.action" onsubmit="return checkStudentInfo()">
                            <c:if test="${student.studentCustom.sno!=null}">
                                <p>
                                    <span>学号</span>
                                    <input disabled="disabled" value="${student.studentCustom.sno}"/>
                                    <input name="sno" hidden="hidden" value="${student.studentCustom.sno}"/>
                                </p>
                            </c:if>
                            <p>
                                <span>姓名</span>
                                <input id="sname" name="sname" value="${student.studentCustom.sname}" onblur="subname()"/>
                                <span id="ssname"></span>
                            </p>

                            <p>
                                <span>性别</span>
                                <select id="sexSelect" onchange="sexSelectChange()">
                                    <option value="m">男</option>
                                    <option value="w">女</option>
                                </select>
                                <input id="ssex" name="ssex" value="${student.studentCustom.ssex}" hidden="true"/>
                            </p>
                            <p>
                                <span>出生日期</span>

                                <input id="sbirthday" name="sbirthday" onclick="selectDate();"
                                       value="<fmt:formatDate value="${student.studentCustom.sbirthday}" pattern="yyyy-MM-dd"/>"
                                       style="width:170px;padding:7px 10px;border:1px solid #ccc;margin-right:10px;"/>

                            </p>
                            <p>
                                <span>专业</span>
                                <input id="speciality" name="speciality" value="${student.studentCustom.speciality}" onblur="subspeciality()"/>
                                <span id="sspeciality"></span>
                            </p>
                            <p>
                                <%--<span>班号</span>--%>
                                <%--<input id="sclass" name="sclass" type="number" onblur="checkClassNo()" oninput="if(value.length>2)value=value.slice(0,3)" placeholder="请输入班号(数字)" value="${student.sclass}"/>--%>
                                <%--<span id="ssclass"></span>--%>
                                    <span>班级</span>
                                    <select id="sClassSelect" onchange="classNameChange()">
                                        <option value="${student.studentCustom.sclass}">${student.studentCustom.sclassname}</option>
                                        <c:forEach items="${student.classes}" var="c">
                                            <c:if test="${c.cno!=student.studentCustom.sclass}">
                                                <option value="${c.cno}">${c.cname}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                    <input id="sclass" name="sclass" value="${student.studentCustom.sclass}" hidden="true"/>
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
