<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
	<title>库存项目管理</title>
	<script type="text/javascript">
        $().ready(function () {
            $("#sbuyname").bigAutocomplete({
                url: "${ctx}/hy/member/searchMember.json",
                click: 'true',
                select: true
            });
            $("#sellname").bigAutocomplete({
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
				<label class="layui-form-label">采购商</label>
				<div class="layui-input-inline">
					<input type="text" id="sbuyname" name="search_like_sbuyname" placeholder="" autocomplete="off" class="layui-input"/>
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">供应商</label>
				<div class="layui-input-inline">
					<input type="text" id="sellname" name="search_like_ssalename" placeholder="" autocomplete="off" class="layui-input"/>
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
        jj.url="${ctx}/projectstock/stock-list.json";

        jj.cols= [[
            //{type:'checkbox'}
            {field:'scode', title: '项目编号',width:150,sort: true}
            ,{field:'scontractno', title: '采购合同号',width:150,sort: true,hide:true}
            ,{field:'ssalecontractno', title: '销售合同号',width:150,sort: true,hide:true}
            ,{field:'swarehousecontractno', title: '仓储合同号',width:150,sort: true,hide:true}
            ,{field:'sbuyname', title: '采购商',minWidth:200,sort: true}
            ,{field:'ssalename', title: '供应商',minWidth:200,sort: true}
            ,{field:'icycle', title: '项目周期',width:100,sort: true,templet:function (d) {
                    return d.icycle+"个月"
                }}
//            ,{field:'fcontractrate', title: '月利率',width:100,sort: true,templet:function (d) {
//                    return d.fcontractrate+"%"
//                }}
            ,{field:'fbuyamount', title: '采购总额(元)',width:120,sort: true,align:'right',templet:function (d) {
                    return d.fbuyamount;
                }}
//            ,{field:'fcanuse', title: '可用量',width:120,sort: true,align:'right',templet:function (d) {
//                return d.ext.fcanuse;
//            }}
//            ,{field:'finweight', title: '入库量',width:120,sort: true,align:'right',templet:function (d) {
//                return d.ext.finweight;
//            }}

            ,{field:'fsaleamount', title: '销售总额(元)',width:120,sort: true,align:'right'}
            ,{field:'swarehousename', title: '存货仓库',minWidth:120,sort: true}
            ,{field:'istatus', title: '状态',width:100,sort: true,templet:function(d){
                return g_istatus[d.istatus];
            }}
            ,{field:'bisstock', title: '入库状态',width:100,sort: true,templet:'#stockinstatusTp'}
            ,{field:'', title: '出库状态',sort: true,width:100,templet:"#stockoutstatus"}
            ,{ align:'left', width:180, toolbar: '#barDemo',fixed:'right'} //这里的toolbar值是模板元素的选择器

        ]];

        jj.render({
            initSort:{
                field:"scode",
                type:"desc"
            },

            //cellMinWidth:80,
            page: true
        });
        jj.detail=function(d){
            layer.open({
                type:2,
                title:"查看项目详情",
                area: ['90%', '90%'],
                content:"${ctx}/project/index.shtml?id="+d.id+"&roleType=chain",
                btn: ['关闭'],
                cancel: function(index){}
            });
        };
        jj.add=function () {
            jj.open({
                area: ['90%', '90%'],
                title:'项目编辑',
                content:"${ctx}/projectstock/add.shtml?type=10&isedit=false"
            });

        };
        jj.stockin=function (obj) {
            jj.xopen({
                area: ['90%', '90%'],
                content:'${ctx}/stockinnotice/contract_stockin_'+obj.id+'.shtml',
                btn: ['提交入库申请','关闭'],
            });
		};
        jj.deliveryorderadd=function (d) {
            jj.xopen({
                area: ['90%', '90%'],
                content:'${ctx}/contract/deliveryorderadd.shtml?sprojectid='+d.id
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

		//修改计息日
        jj.editInterestDate=function(obj){
            jj.height=500;
            jj.width=600;
            jj.xopen({
                title:'修改计息日',
                content:'${ctx}/projectstock/editinterestdate.shtml?id='+obj.id,
                btn: ['确定','关闭']
            });
        };

        //项目完结
        jj.chain_over=function(d) {
            top.layer.confirm('确定对该项目进行完结吗?', {icon: 3, title:'系统提示'},function(index){
                jj.post("${ctx}/projectstock/chain_over.json",{id:d.id},function (rs) {
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
                content: '${ctx}/projectSotckSettle/add_'+obj.id+'.shtml' ,
                btn: ['提交结算单','关闭'],
                yes:function (index,layero) {
                    layer.confirm('确定要提交结算申请单吗？', {
                        btn: ['确定'] //按钮
                    }, function(){
                        var iframeWin = layero.find('iframe')[0];
                        var $=iframeWin.contentWindow.$;
                        var doc=$(iframeWin.contentWindow.document);
                        var form=doc.find('form');
                        jj.post("${ctx}/projectSotckSettle/save.json",tt.where(form),function (rs) {
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

        jj.commit=function(d) {
            top.layer.confirm('确定要提交审核吗?', {icon: 3, title:'系统提示'},function(index){
                jj.post("${ctx}/projectstock/commit.json",{id:d.id},function (rs) {
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

        jj.edit=function (d) {
            jj.open({
                area: ['90%', '90%'],
                title:'项目编辑',
                content:"${ctx}/projectstock/edit_"+d.id+".shtml?isedit=true"
            });

        };

        jj.paymentPlan=function (d) {
            jj.open({
                area: ['90%', '90%'],
                title:'收付款计划',
                content:"${ctx}/repaymentplan/add.shtml?sprojectid="+d.id
            });
        }


    });

</script>

<script type="text/html" id="barDemo">
	<div class="layui-btn-group" data-rowid="{{d.id}}">
		<jj:listbtn name="查看" event="detail" purview="" type="a"/>
		{{#  if(d.istatus==100){ }}
			<jj:listbtn event="edit" name="修改" type="a" purview="projectstock:add"/>
			<jj:listbtn event="commit" name="提交审核" type="a" purview="projectstock:add"/>
		{{#  } }}

		{{#  if(d.ext.fcanuse==d.ext.finweight){ }}
			<%--<jj:listbtn name="修改计息日" event="editInterestDate" type="a"  purview="projectstock:add"/>--%>
		{{#  } }}


		{{#  if(d.istatus==320 || d.istatus==330){ }}
			{{#  if(d.bisstock == 1 || (d.ext.fweight > 0 && d.ext.finweight == d.ext.foutweight) ){ }}
			<jj:listbtn name="项目完结" event="chain_over" type="a"  purview="projectstock:forceover"/>
			{{#  } }}

		{{#  if(d.bisstock != 1 && ( d.ext.fweight-d.ext.fnoticeinweight+d.ext.ioffset >0 ) ){ }}
				<jj:listbtn name="发入库通知单" type="a" event="stockin" purview="stockinnotice:add"/>
		{{#  } }}

		{{#  if(d.ext.fcanuse >0){ }}
			<jj:listbtn name="开提货单" event="deliveryorderadd" type="a" purview="deliveryorderandind:add"/>
		{{#  } }}

		{{#  } }}
        {{#  if((d.bisstock==0||d.bisstock=="") && (d.istatus == 320 || d.istatus == 330 ) ){ }}
        {{#  if(d.ext.fweight > d.ext.finweight && d.ext.finweight>0 && parseInt(10000*(d.ext.fnoticeinweight-d.ext.ioffset))==parseInt(10000*d.ext.finweight)){ }}
            <jj:listbtn name="完成入库" event="stockincomplete" type="a" purview="stockinnotice:forceover" />
        {{#  } }}
        {{#  } }}

		<%--<jj:listbtn name="收付款计划" event="paymentPlan" type="a" />--%>



	</div>
</script>

<jsp:include page="../project-common-templete.jsp"/>

<script type="text/html" id="xtoolbar">
	<jj:btn event="add" name="发起项目" purview="projectstock:add"/>
</script>


</body>
</html>