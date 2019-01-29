<%@ page import="com.JDBC.Appl.FDBoperator" %>
<%@ page import="com.JDBC.Furniture.furnitureUnit" %>
<%@ page import="java.util.List" %><%--
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
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<!--link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" /-->
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>后台管理</title>
<link rel="stylesheet" href="lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" href="//at.alicdn.com/t/font_944826_zkzsq88uh5.css" type="text/css">
</head>
<body class="pos-r">
<jsp:include page="adminHeader.jsp"/>
<div style="margin-left:20px;">
  <div class="page-container">
      <div style="color: red;font-size: 10px;">
          <%
              String tips = (String)session.getAttribute("tips");
              if(tips!=null)
                  out.print(tips);
              else
                  out.print("");
          %>
      </div>
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <a class="btn btn-primary radius" onclick="product_add('添加产品','product-add.jsp')" href="javascript:;">
                <i class="Hui-iconfont">&#xe600;</i> 添加产品
            </a>
            <a class="btn btn-secondary radius" onclick="product_add('添加图片','picture-add.jsp')" href="javascript:;">
                <i class="iconfont">&#xeb98;</i> 修改图片
            </a>
        </span>
    </div>
		<div class="mt-20">
		  <table class="table table-border  table-bg table-hover"><!-- table-sort table-bordered"-->
			  <thead>
					<tr class="text-c">
						<th width="63"><input name="" type="checkbox" value=""></th>
						<th width="66">编号</th>
						<th width="140">名称</th>
						<th width="140">种类</th>
                        <th width="110">价格</th>
						<th width="110">库存</th>
						<th width="110">销量</th>
						<!--th width="110">发布状态</th-->
						<th >操作</th>
					</tr>
				</thead>
              <%
				  FDBoperator fdBoperator = new FDBoperator();
				  List<furnitureUnit> list = fdBoperator.listFurniture();
				  for (int i = 0; i < list.size(); i++) {
					  out.print("<tbody>" +
						  "<tr class=\"text-c va-m\">" +
						  "<td><input type=\"checkbox\"></td>" +
						  "<td>" + list.get(i).getFid() + "</td>" +
						  "<td>" + list.get(i).getFname() + "</td>" +
						  "<td>" + list.get(i).getFtype() + "</td>" +
						  "<td>" + list.get(i).getFprice() + "</td>" +
						  "<td>" + list.get(i).getFstock() + "</td>" +
						  "<td>" + list.get(i).getFsellno() + "</td>" +
						  "<td class=\"td-manage\">" +
						  "<a style=\"text-decoration:none\" class=\"ml-5\" onClick=\"product_edit('产品编辑','product-edit.jsp'," + list.get(i).getFid() + ")\" title=\"编辑\">" +
						  "<i class=\"Hui-iconfont\">&#xe6df;</i>" +
						  "</a>" +
						  "<a style=\"text-decoration:none\" class=\"ml-5\" onClick=\"javascript:window.location.href='deleteFurniture.jsp?fid=" + list.get(i).getFid() + "'\" title=\"删除\">" +
						  "<i class=\"Hui-iconfont\">&#xe6e2;</i>" +
						  "</a>" +
						  "</td></tr></tbody>");
				  }
              %>
			</table>
		</div>
	</div>
</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript" src="lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
var setting = {
	view: {
		dblClickExpand: false,
		showLine: false,
		selectedMulti: false
	},
	data: {
		simpleData: {
			enable:true,
			idKey: "id",
			pIdKey: "pId",
			rootPId: ""
		}
	},
	callback: {
		beforeClick: function(treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("tree");
			if (treeNode.isParent) {
				zTree.expandNode(treeNode);
				return false;
			} else {
				//demoIframe.attr("src",treeNode.file + ".html");
				return true;
			}
		}
	}
};

var zNodes =[
	{ id:1, pId:0, name:"一级分类", open:true},
	{ id:11, pId:1, name:"二级分类"},
	{ id:111, pId:11, name:"三级分类"},
	{ id:112, pId:11, name:"三级分类"},
	{ id:113, pId:11, name:"三级分类"},
	{ id:114, pId:11, name:"三级分类"},
	{ id:115, pId:11, name:"三级分类"},
	{ id:12, pId:1, name:"二级分类 1-2"},
	{ id:121, pId:12, name:"三级分类 1-2-1"},
	{ id:122, pId:12, name:"三级分类 1-2-2"},
];
		
		
		
$(document).ready(function(){
	var t = $("#treeDemo");
	t = $.fn.zTree.init(t, setting, zNodes);
	//demoIframe = $("#testIframe");
	//demoIframe.on("load", loadReady);
	var zTree = $.fn.zTree.getZTreeObj("tree");
	//zTree.selectNode(zTree.getNodeByParam("id",'11'));
});

$('.table-sort').dataTable({
	"aaSorting": [[ 1, "desc" ]],//默认第几个排序
	"bStateSave": true,//状态保存
	"aoColumnDefs": [
	  {"orderable":false,"aTargets":[0,7]}// 制定列不参与排序
	]
});
/*产品-添加*/
function product_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*产品-查看*/
function product_show(title,url,id){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*产品-审核*/
function product_shenhe(obj,id){
	layer.confirm('审核文章？', {
		btn: ['通过','不通过'],
		shade: false
	},
	function(){
		$(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="product_start(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
		$(obj).remove();
		layer.msg('已发布', {icon:6,time:1000});
	},
	function(){
		$(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="product_shenqing(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-danger radius">未通过</span>');
		$(obj).remove();
    	layer.msg('未通过', {icon:5,time:1000});
	});
}
/*产品-下架*/
function product_stop(obj,id){
	layer.confirm('确认要下架吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="product_start(this,id)" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已下架</span>');
		$(obj).remove();
		layer.msg('已下架!',{icon: 5,time:1000});
	});
}

/*产品-发布*/
function product_start(obj,id){
	layer.confirm('确认要发布吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="product_stop(this,id)" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
		$(obj).remove();
		layer.msg('已发布!',{icon: 6,time:1000});
	});
}

/*产品-申请上线*/
function product_shenqing(obj,id){
	$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">待审核</span>');
	$(obj).parents("tr").find(".td-manage").html("");
	layer.msg('已提交申请，耐心等待审核!', {icon: 1,time:2000});
}

/*产品-编辑*/
function product_edit(title,url,id){
	var index = layer.open({
		type: 2,
		title: title,
		content: url+"?fid="+id
	});
	layer.full(index);
}

/*产品-删除*/
/*function product_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type:"post",
            url:"ajaxServlet",
            data:{
			    "fid":id
            },
            cache:true,
            async:true,
            success:function (data,texxtStatus,jqXHR) {
                if(data.code == 1){
                    layer.msg("已删除",{icon:1,time:1000});
                }else{
                    layer.msg(data.message,{icon:2,time:1000});
                }
                error:function(XMLHttpRequest,textStatus,errorThrown)
                {

                }
            }
		});
	});
}*/
</script>
</body>
</html>