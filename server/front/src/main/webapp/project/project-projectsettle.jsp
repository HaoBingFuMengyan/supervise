<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
	<title>结算单管理</title>
	<meta name="decorator" content="jj"/>
</head>
<body >
<div class="layui-card">
		<form  id="searchForm">

		</form>

</div>
<table class="layui-hide" id="stable" lay-filter="stable"></table>


<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    var g_ProjectSettleStatus = ${project:ProjectSettleStatus()};
    layui.use(['table','layer'],function(){
        jj.table =layui.table;
        jj.url="${ctx}/projectsettle/project-list.json?sprojectid=${data.id}";

        jj.cols= [[
            //{type:'checkbox'}
            {field:'scode', title: '编号',sort: true}
            ,{field:'id', title: '结算会员',sort: true,templet:function (d) {
					return d.acceptmber.scnname;
                }}
			,{field:'id', title: '支付会员',sort: true,templet:function (d) {
					return d.paymber.scnname;
                }}
            ,{field:'famount', title: '结算总额(元)',sort: true}
            ,{field:'fdiscount', title: '优惠金额(元)',sort: true}
            ,{field:'freceivable', title: '应收金额(元)',sort: true}
            ,{field:'istatus', title: '状态',sort: true,templet:function (d) {
                    return g_ProjectSettleStatus[d.istatus];
                }}
            ,{field:'ddate', title: '结算日期',sort: true}
            ,{ align:'center', toolbar: '#barDemo'} //这里的toolbar值是模板元素的选择器

        ]];
        jj.limit=1000;
        jj.showtoolbar=false;
        jj.render({
            initSort:{
                field:"scode",
                type:"desc"
            },
            cellMinWidth:100,
            page: false
        });

        jj.check=function(obj){
            layer.prompt({title: '请输入审核意见', formType: 2},function(text, index){
                jj.post("${ctx}/projectsettle/check.json",{id:obj.id,checkok:true,sinfo:text},function (rs) {
                    jj.closeAll('loading');
                    if(rs.success){
                        if(rs.msg){
                            jj.msg(rs.msg);
                        }
                        else {
                            jj.msg("操作成功!");
                        }
                        layer.close(index);
                        jj.refresh();
                    }
                    else {
                        jj.msg(rs.msg,5,3);
                    }

                });
            });
        };
        jj.reject=function(obj){
            layer.prompt({title: '请输入拒绝理由', formType: 2},function(text, index){
                jj.post("${ctx}/projectsettle/check.json",{id:obj.id,checkok:false,sinfo:text},function (rs) {
                    jj.closeAll('loading');
                    if(rs.success){
                        if(rs.msg){
                            jj.msg(rs.msg);
                        }
                        else {
                            jj.msg("操作成功!");
                        }
                        layer.close(index);
                        jj.refresh();
                    }
                    else {
                        jj.msg(rs.msg,5,3);
                        return false;
                    }

                });
            });
        };

    });

</script>
<script type="text/html" id="barDemo">
	<div class="layui-btn-group" data-rowid="{{d.id}}">
		<jj:listbtn name="查看" event="detail" purview=""/>
		{{#  if(d.istatus==20){ }}
		<jj:listbtn name="审核通过" event="check"/>
		<jj:listbtn name="拒绝" event="reject"/>
		{{#  } else{ }}
		{{#  } }}
	</div>
</script>




</body>
</html>