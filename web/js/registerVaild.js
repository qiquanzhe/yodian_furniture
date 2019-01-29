function toVaild() {



    if(document.getElementById("username").value == "")
    {
        document.getElementById("nametip").innerHTML = "昵称不能为空";
        flag = false;
    }
    else
    {
        document.getElementById("nametip").innerHTML = ".";
    }



    if(document.getElementById("usertel").value == "")
    {
        document.getElementById("teltip").innerHTML = "手机号不能为空";
        flag = false ;
    }
    else if(!checkPhone(document.getElementById("usertel").value))
    {
        document.getElementById("teltip").innerHTML = "手机号码格式不正确";
        flag = false ;
    }
    else
    {
        document.getElementById("teltip").innerHTML = ".";
    }

    if(document.getElementById("useremail").value == "")
    {
        document.getElementById("emailtip").innerHTML = "邮箱不能为空";
        flag = false;
    }
    else if(!checkEmail(document.getElementById("useremail").value))
    {
        document.getElementById("emailtip").innerHTML = "邮箱格式不正确";
        flag = false;
    }
    else
    {
        document.getElementById("emailtip").innerHTML = ".";
    }

    if(document.getElementById("userpwd").value == "")
    {
        document.getElementById("pwdtip").innerHTML = "密码不能为空";
        flag = false;
    }
    else {
        document.getElementById("pwdtip").innerHTML = ".";
    }

    if (document.getElementById("userpwdagain").value == "") {
        document.getElementById("pwdagaintip").innerHTML = "再次输入密码";
        flag = false;
    }
    else {
        document.getElementById("pwdagaintip").innerHTML = ".";
    }

    if (document.getElementById("userpwd").value != document.getElementById("userpwdagain").value) {
        document.getElementById("pwdagaintip").innerHTML = "密码输入不一致";
        flag = false;
    }
    else {
        document.getElementById("pwdagaintip").innerHTML = ".";
    }

    if(document.getElementById("validcode").value == "")
    {
        document.getElementById("codetip").innerHTML = "验证码不能为空";
        flag = false;
    }
    else {
        document.getElementById("codetip").innerHTML = ".";
    }
    return flag;
}

function checkPhone(phone){
    if(!(/^1[34578]\d{9}$/.test(phone))){
        return false;
    }
    else return true;
}

function checkEmail(email){
    var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$");
    if(!reg.test(email)){
        return false;
    }else{
        return true;
    }
}