function toVaild() {
    var flag = true;

    if(document.getElementById("loginname").value == "")
    {
        document.getElementById("logintip").innerHTML = "登录名不能为空";
        flag = false;
    }
    else
    {
        if(checkEmail(document.getElementById("loginname").value))
            document.getElementById("inputtype").value = "email";
        else if(checkPhone(document.getElementById("loginname").value))
            document.getElementById("inputtype").value = "phone";
        else
            document.getElementById("inputtype").value = "name";

        document.getElementById("logintip").innerHTML = ".";
    }

    if(document.getElementById("userpwd").value == "")
    {
        document.getElementById("pwdtip").innerHTML = "密码不能为空";
        flag = false;
    }
    else {
        document.getElementById("pwdtip").innerHTML = ".";
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