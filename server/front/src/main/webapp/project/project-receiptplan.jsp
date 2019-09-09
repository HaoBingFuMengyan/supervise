<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE html >
<html>
<head>
	<title>项目还款计划</title>
	<meta name="decorator" content="jj"/>
</head>
<body >
	<form  class="layui-form" id="searchForm">

	</form>

<table class="layui-hide" id="stable" lay-filter="stable"></table>

<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
	var g_istatus=${project:ProjectStatus()};
    layui.use(['table','layer'],function(){
        var g_ProjectStatus = ${project:ProjectStatus()};
		var g_projecttype=${project:ProjectType()};
        jj.table =layui.table;
        var form = layui.form;
        jj.url="${ctx}/repaymentplan/project-list.json?sprojectid=${data.id}&itype=${data.itype}";
        jj.cols= [[
            {field:'ino', title: '期数',sort: true}
            ,{field:'dplandate', title: '应收日期',sort: true,templet:function(d){
                    return tt.toDate(d.dplandate);
                }}
            ,{field:'fplanback', title: '应收金额',sort: true}
//            ,{field:'frealback', title: '已还本金',sort: true}
//            ,{field:'fplaninterest', title: '应还利息',sort: true}
//            ,{field:'frealinterest', title: '已还利息',sort: true}
//            ,{field:'fdefaultinterest', title: '罚息',sort: true}
            ,{field:'freceivabletotal', title: '累计应收金额',sort: true}
//            ,{field:'frefundtotal', title: '已付金额',sort: true}
//            ,{field:'fless', title: '剩余本金',sort: true,templet:function(d){
//                    return d.fless;
//                }}
//            ,{field:'brefund', title: '是否已结清',sort: true,templet:'#checkedTp'}
            ,{field:'sremark', title: '备注',sort: true}
        ]];

        jj.limit=1000;
        jj.width=500;
        jj.height=530;
		jj.showtoolbar=false;
        jj.render({
            initSort:{
                field:"ino",
                type:"asc"
            },
            cellMinWidth:80,

            page: false
        });

    });


</script>
<script type="text/html" id="barDemo">

</script>
	<script type="text/html" id="checkedTp">
		{{#  if(d.brefund==0){ }}
		否
		{{#  } else{ }}
		是
		{{#  } }}
	</script>
</body>
</html>