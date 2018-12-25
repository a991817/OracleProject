//updateCourse.jsp

    function checkUpdateCourse() {
        var cname = $("#cname").val();
        var credit = $("#cname").val();
        var tno = $("#tno").val();
        if (cname == null || cname == "") {
            $("#cnameSpan").text("课程名称不能为空")
        } else if (cname.length > 15 || cname.length < 3) {
            $("#cnameSpan").text("课程名称的长度只能在3-15之间");
        }
    }

    function checkCname() {
        var cname = $("#cname").val();
        if (cname == null || cname == "") {
            $("#cnameSpan").text("课程名称不能为空")
            $("#cnameSpan").css("color", "red");
        } else if (cname.length > 15 || cname.length < 3) {
            $("#cnameSpan").text("课程名称的长度只能在3-15之间");
        }
        else {
            $("#cnameSpan").text("正确");
            $("#cnameSpan").css("color", "green");
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
        else if(parseInt(credit)<1 || parseInt(credit)>5){
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
    function checkTno(){
        var tno = $("#tno").val();
        if (tno == null || tno == "") {
            $("#tnoSpan").text("教师编号不能为空")
            $("#tnoSpan").css("color", "red");
        } else if (cname.length > 15 || cname.length < 3) {
            $("#tnoSpan").text("教师编号长度的长度只能在3-15之间");
        }
        else {
            $("#tnoSpan").text("正确");
            $("#tnoSpan").css("color", "green");
        }
    }

    // $("#cname").blur(checkCname());

//password
function checkPassword(oldPassword,newPassword,newPasswordAgain){
   if(checkOldPassword()&&checkNewPassword()&&checkNewPasswordAgain()){
       return true;
   }
   return false;


}
function checkOldPassword() {
    var oldPassword = $("#oldPassword").val();
    if(oldPassword.length<3 || oldPassword.length>12){
        $("#oldPasswordSpan").css("color", "red");
        $("#oldPasswordSpan").text("密码长度应该在3-12之间");
        return false;
    }
    else{
        $("#oldPasswordSpan").css("color", "green");
        $("#oldPasswordSpan").text("正确");
        return true;
    }

}
function checkNewPassword() {
    var newPassword = $("#newPassword").val();
    if(newPassword.length<3 || newPassword.length>12){
        $("#newPasswordSpan").css("color", "red");
        $("#newPasswordSpan").text("密码长度应该在3-12之间");
        return false;
    }
    else{
        $("#newPasswordSpan").css("color", "green");
        $("#newPasswordSpan").text("正确");
        return true;
    }
}
function checkNewPasswordAgain(newPasswordAgain,newPassword) {
    var newPassword = $("#newPassword").val();
    var newPasswordAgain = $("#newPasswordAgain").val();
    if(newPasswordAgain!=newPassword){
        $("#newPasswordAgainSpan").css("color", "red");
        $("#newPasswordAgainSpan").text("两次密码输入不一致");
        return false;
    }
    if(newPasswordAgain.length<3 || newPasswordAgain.length>12){
        $("#newPasswordAgainSpan").css("color", "red");
        $("#newPasswordAgainSpan").text("密码长度应该在3-12之间");
        return false;
    }
    else{
        $("#newPasswordAgainSpan").css("color", "green");
        $("#newPasswordAgainSpan").text("正确");
        return true;
    }
}

