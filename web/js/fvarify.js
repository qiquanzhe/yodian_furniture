function preSubmit() {
    var flag = true;
    if(document.getElementById("fno").value == "")
    {
        document.getElementById("fnotip").innerHTML="请输入商品编号";
        flag = false;
    }else if(!check_int(document.getElementById("fno").value))
    {
        document.getElementById("fnotip").innerHTML="请输入数字";
        flag = false;
    }
    else
    {
        document.getElementById("fnotip").innerHTML=".";
    }

    if(document.getElementById("fname").value=="")
    {
        document.getElementById("fnametip").innerHTML="请输入商品名称";
        flag = false;
    }
    else
    {
        document.getElementById("fnametip").innerHTML=".";
    }

    if(document.getElementById("fstock").value == "")
    {
        document.getElementById("fstocktip").innerHTML="请输入商品库存";
        flag = false;
    }
    else if(!check_int(document.getElementById("fstock").value))
    {
        document.getElementById("fstocktip").innerHTML="请输入正确的数字";
        flag = false;
    }
    else
    {
        document.getElementById("fstocktip").innerHTML=".";
    }

    if(document.getElementById("fprice").value == "")
    {
        document.getElementById("fpricetip").innerHTML = "请输入商品价格";
        flag = false;
    }
    else if(!check_float(document.getElementById("fprice").value))
    {
        document.getElementById("fpricetip").innerHTML="请输入正确的数字";
        flag = false;
    }
    else
    {
        document.getElementById("fpricetip").innerHTML = ".";
    }

    alert(document.getElementById("f").value);

    return flag;

}

function check_float(e) {
    var re = "/^\d+(?=\.{0,1}\d+$|$)/";
    return re.test(e)
}

function check_int(e) {
    var re = "^[0-9]*$";
    return re.test(e);
}
