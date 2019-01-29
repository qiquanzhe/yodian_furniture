<%--
Created by IntelliJ IDEA.
User: Administrator
Date: 2018/11/28
Time: 23:38
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>

<![endif]-->
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />

<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
	<style>
		.ui-upload {
			font-size: 14px;
			width: 80px;
			height: 30px;
			line-height: 30px;
			text-align: center;
			position: relative;
			cursor: pointer;
			color: #fff;
			background: #00abff;
			border-radius: 3px;
			overflow: hidden;
			display: inline-block;
			text-decoration: none;
			text-underline-mode: none;
		}
		.ui-upload input
		{
			position: absolute;
			font-size: 100px;
			right: 0;
			top: 0;
			opacity: 0;
			filter: alpha(opacity=0);
			cursor: pointer
		}
	</style>

<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--/meta 作为公共模版分离出去-->

<link href="lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />

</head>
<body>
<!--jsp:include page="adminHeader.jsp"/-->

<script>
    var result=document.getElementById("result");
    var file=document.getElementById("file");

    function readAsDataURL(){

        document.getElementById("result").innerHTML = "";

        var file = document.getElementById("file").files;
        var result=document.getElementById("result");

        if(file.length > 7)
        {
            alert("数量过多！");
            return;
        }
        for(i = 0; i< file.length; i ++) {
            var reader = new FileReader();
            reader.readAsDataURL(file[i]);
            reader.onload=function(e){
                //多图预览
                result.innerHTML = result.innerHTML + '<img style="width:100px;height:100px;margin-left: 50px;margin-top:20px" src="' + this.result +'" alt="" />';
            }

        }

    }


</script>
<div class="page-container">
<form id="infoForm" action="<%=request.getContextPath()%>/UploadServlet" method="post" enctype="multipart/form-data"  class="form form-horizontal"  >

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>请输入商品编号：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" id="fid" name="fid">
            <span id="fstocktip" style="font-size: 10px;color: red">.</span>
        </div>
    </div>
    <label class="form-label col-xs-4 col-sm-2">请选择文件：</label>
        <a href="javascript:;" class="ui-upload">
        <input type="file" name="file" id="file" multiple="multiple" onchange="readAsDataURL()" accept="image/*"/>选择
        </a>
    <a href="javascript:;" class="ui-upload">
    <input  type="submit"/>上传
    </a>
    <div id="result" name="result" style="margin-top: 20px"></div>
    <span style="font-size: 10px;color: red">
        <%
            String picMess = (String) session.getAttribute("picMess");
            if(picMess!=null)   out.print(picMess);
            else    out.print("");
        %>
    </span>
</form>

</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="lib/webuploader/0.1.5/webuploader.min.js"></script> 
<script type="text/javascript" src="lib/ueditor/1.4.3/ueditor.config.js"></script>
<script type="text/javascript" src="lib/ueditor/1.4.3/ueditor.all.min.js"> </script>
<script type="text/javascript" src="lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>

</body>
</html>