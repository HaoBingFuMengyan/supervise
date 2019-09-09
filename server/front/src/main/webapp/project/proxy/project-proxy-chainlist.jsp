<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE html >
<html>
<head>
	<title>代理销售项目管理</title>
	<script type="text/javascript">
        $().ready(function () {
            $("#membername").bigAutocomplete({
                url: "${ctx}/hy/member/searchMember.json",
                click: 'true',
                select: true
            });
        });
	</script>

</head>
<body >
<form  id="searchForm" class="layui-form">
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">项目编号</label>
					<div class="layui-input-inline">
						<input type="text" name="search_like_scode" placeholder="" autocomplete="off" class="layui-input"/>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">存货方</label>
					<div class="layui-input-inline">
						<input type="text" id="membername" name="search_like_ssalename" placeholder="" autocomplete="off" class="layui-input"/>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">状态</label>
					<div class="layui-input-inline">
						<project:ProjectStatus op="select" option="class='layui-input'" name="search_eq_istatus" defval="" defname="全部"/>
					</div>
				</div>
			</div>
		</form>

		<table class="layui-hide" id="stable" lay-filter="stable"></table>

<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    var g_istatus=${project:ProjectStatus()};
    layui.use(['table','layer'],function(){
        jj.table =layui.table;
        jj.url="${ctx}/projectproxy/list.json";

        jj.cols= [[
            //{type:'checkbox'}
            {field:'scode', title: '项目编号',sort: true,width:150}
            ,{field:'swarehousecontractno', title: '仓储合同号',sort: true,width:150}
            ,{field:'ssalename', title: '存货方',sort: true,minWidth:200}
            ,{field:'fprojectamount', title: '存货总额(元)',sort: true,width:120,align:'right'}

            ,{field:'fbuyamount', title: '采购总额(元)',sort: true,width:120,align:'right'}
            ,{field:'none', title: '采购数量',width:100,sort: true,align:'right',hide:true,templet:function(d){
                    return d.ext.fbuyweight;
                }}
            ,{field:'fsaleamount', title: '代理销售总额(元)',sort: true,width:120,align:'right'}
            ,{field:'none', title: '销售数量',width:100,align:'right',hide:true,sort: true,templet:function(d){
                    return d.ext.fsaleweight;
                }}
            ,{field:'swarehousename', title: '存货仓库',sort: true,minWidth:200}
            ,{field:'istatus', title: '状态',width:100,sort: true,templet:function(d){
                    return g_istatus[d.istatus];
                }}
            ,{field:'bisstock', title: '入库状态',width:100,sort: true,templet:'#stockinstatusTp'}
            ,{field:'none', title: '入库数量',width:100,hide:true,align:'right',sort: true,templet:function(d){
                    return d.ext.finweight;
                }}
            ,{field:'', title: '出库状态',width:100,sort: true,templet:"#stockoutstatus"}
            ,{field:'none', title: '出库数量',width:100,hide:true,align:'right',sort: true,templet:function(d){
                    return d.ext.foutweight;
                }}
            ,{align:'left',width:200, toolbar: '#barDemo',fixed:'right'} //这里的toolbar值是模板元素的选择器

        ]];


        jj.render({
            initSort:{
                field:"scode",
                type:"desc"
            },
			toolbar:"#toolBarDemo",
            //cellMinWidth:80,
            page: true
        });
        jj.detail=function(d){
            layer.open({
                type: 2,
                title:'代理销售详情',
                area: ['90%', '90%'],
                content: '${ctx}/project/index.shtml?id='+d.id,
                btn: ['关闭'],
                cancel: function(index){}
            });
        };
        jj.stockout=function(d){
            jj.xopen({
                area: ['90%', '90%'],
                content:'${ctx}/project/deliveryindentureadd.shtml?sprojectid='+d.id
            });
        };
        jj.add=function () {
            jj.open({
                area: ['90%', '90%'],
                title:'发起代理销售项目',
                content:"${ctx}/projectproxy/add.shtml"
            });

        };

        jj.edit=function (d) {
            jj.open({
                area: ['90%', '90%'],
                title:'代理销售项目修改',
                content:"${ctx}/projectproxy/edit_"+d.id+".shtml"
            });

        };

        jj.stockin=function (obj) {
            jj.xopen({
                area: ['90%', '90%'],
				title:'开入库通知单',
                content:'${ctx}/stockinnotice/project_stockin_'+obj.id+'.shtml',
                btn: ['提交入库申请','关闭'],
            });

        };

        jj.dobuyer=function (obj) {
            jj.xopen({
                area: ['90%', '90%'],
                title:'发起采购',
                content:'${ctx}/projectproxy/dobuyer.shtml?id='+obj.id,
                btn: ['提交采购','关闭']
            });

        };

		//入库完成
        jj.stockincomplete = function(obj){
            layer.confirm('货物入库数量与合同约定的入库量不一致，您是否已经与各方沟通确认，需要强制完成入库吗？', {
                btn: ['确定'] //按钮
            }, function(){
                jj.post("${ctx}/project/stockincomplete.json",{id:obj.id},function (rs) {
                    if(rs.success){
                        if(rs.msg){
                            jj.msg(rs.msg);
                        }
                        else {
                            jj.msg("操作成功!");
                        }
                        jj.refresh();
                    }
                    else {
                        jj.msg(rs.msg,5,3);
                    }
                });

            });
        };

        jj.chain_over=function(d) {
            top.layer.confirm('确定对该项目进行完结吗?', {icon: 3, title:'系统提示'},function(index){
                jj.post("${ctx}/projectproxy/chain_over.json",{id:d.id},function (rs) {
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

        jj.commit=function(d) {
            top.layer.confirm('确定要提交审核吗?', {icon: 3, title:'系统提示'},function(index){
                jj.post("${ctx}/projectproxy/commit.json",{id:d.id},function (rs) {
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

        jj.settle=function (obj) {
            layer.open({
                type: 2,
                title:"项目结算单",
                area: ['90%', '90%'],
                content: '${ctx}/projectsettle/add_'+obj.id+'.shtml' ,
                btn: ['提交结算单','关闭'],
                yes:function (index,layero) {
                    layer.confirm('确定要提交结算申请单吗？', {
                        btn: ['确定'] //按钮
                    }, function(){
                        var iframeWin = layero.find('iframe')[0];
                        var $=iframeWin.contentWindow.$;
                        var doc=$(iframeWin.contentWindow.document);
                        var form=doc.find('form');
                        jj.post("${ctx}/projectsettle/save.json",tt.where(form),function (rs) {
                            if(rs.success){
                                if(rs.msg){
                                    jj.msg(rs.msg);
                                }
                                else {
                                    jj.msg("操作成功!");
                                }
                                layer.close(index);
                            }
                            else {
                                jj.msg(rs.msg,5,3);
                            }

                        });

                    });

                },
                cancel: function(index){}
            });
        };

    });

</script>
<script type="text/html" id="barDemo">
	<div class="layui-btn-group" data-rowid="{{d.id}}">

		<jj:listbtn name="查看" event="detail" purview="" type="a"/>
        {{#  if(d.istatus==100){ }}
            <jj:listbtn event="edit" name="修改" type="a" purview="projectproxy:add"/>
            <jj:listbtn event="commit" name="提交审核" type="a" purview="projectproxy:add"/>
        {{#  } }}
		{{#  if(d.istatus==320 || d.istatus==330){ }}
		{{#  if(d.finweight>0){ }}
		<jj:listbtn name="发结算单" event="settle" type="a" purview="projectsettle:add" />
		{{#  } }}
			{{#  if(d.bisstock == 1 || (d.ext.fweight > 0 && d.ext.fweight == d.ext.foutweight) ){ }}
		<jj:listbtn name="项目完结" event="chain_over" type="a"  purview="projectproxy:forceover"/>
			{{#  } }}
		{{#  } }}
		{{#  if(d.istatus==320){ }}
			{{#  if( d.ext.fweight-d.ext.fladingweight-d.ext.fbuyweight>0 ){ }}
			<jj:listbtn name="发起采购" event="dobuyer" type="a" purview="buycontract:add"/>
			{{#  } }}
		{{#  if(d.bisstock != 1 && ( d.ext.fweight-d.ext.fnoticeinweight+d.ext.ioffset >0 ) ){ }}
		<jj:listbtn name="发入库通知单" event="stockin" type="a" purview="stockinnotice:add"/>
		{{#  } }}

		{{#  if(d.ext.fcanuse >0){ }}
		<jj:listbtn name="开提单" event="stockout" type="a" purview="deliveryorderandind:add	" />
		{{#  } }}

		{{#  } }}


		{{#  if((d.bisstock==0||d.bisstock=="") && (d.istatus == 320 || d.istatus == 330 ) ){ }}
            {{#  if(d.ext.fweight > d.ext.finweight && d.ext.finweight>0 && parseInt(10000*(d.ext.fnoticeinweight-d.ext.ioffset))==parseInt(10000*d.ext.finweight)){ }}
                <jj:listbtn name="完成入库" event="stockincomplete" type="a" purview="stockinnotice:forceover"/>
            {{#  } }}
		{{#  } }}

	</div>
</script>

<script type="text/html" id="xtoolbar">
	<jj:btn event="add" name="发起项目" purview="projectproxy:add"/>
</script>
<jsp:include page="../project-common-templete.jsp"/>


</body>
</html>