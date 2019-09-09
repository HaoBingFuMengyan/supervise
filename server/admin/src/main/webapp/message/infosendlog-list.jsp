]<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
	<title>角色管理</title>
	<meta name="decorator" content="jj"/>
</head>
<body >
<div class="search">
	<form  class="layui-form" id="searchForm">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">发送内容</label>
				<div class="layui-input-inline">
					<input type="text" name="search_like_scontext" placeholder="" autocomplete="off" class="layui-input"/>
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">接收人</label>
				<div class="layui-input-inline">
					<input type="text" name="search_like_soperator" placeholder="" autocomplete="off" class="layui-input"/>
				</div>
			</div>
		</div>
	</form>
</div>


<table class="layui-hide" id="stable" lay-filter="stable"></table>

<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    layui.use(['table','layer'],function(){

        jj.table =layui.table;
        var form = layui.form;
        jj.url="${ctx}/jj/InfoSendLog/list.json";
        jj.xurl="${ctx}/jj/InfoSendLog/";
        jj.cols= [[
            {type:'checkbox'}
            ,{field:'dsendtime', title: '发送时间',sort: true}
            ,{field:'bissuccess', title: '发送是否成功',sort: true,templet:'#titleTpl'}
            ,{field:'soperator', title: '接收人',sort: true}
            ,{field:'scontext', title: '发送内容',sort: true}
            ,{field:'sremark', title: '备注',sort: true}
        ]];

        jj.width=500;
        jj.height=530;

        jj.render({
            initSort:{
                field:"dsendtime",
                type:"desc"
            },
            cellMinWidth:80,
            page: true
        });

    });

</script>
<script type="text/html" id="titleTpl">
	{{#  if(d.bischecked==0){ }}
	否
	{{#  } else{}}
	是
	{{#  } }}
</script>



</body>
</html>