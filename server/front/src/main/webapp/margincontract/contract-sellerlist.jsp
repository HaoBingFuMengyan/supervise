<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp"%>
<%@ taglib prefix="contract" uri="http://www.frogsing.com/tags/contract" %>
<%@ taglib prefix="mv" uri="http://www.frogsing.com/tags/frogsing" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>合同列表</title>
    <link href="${ctx}/css/salelist.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/css/main.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/css/common.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
        $(function () {
            $("#membername").bigAutocomplete({
                url: "${ctx}/hy/member/searchMember.json",
                click: 'true',
                select: true
            });
        });
    </script>
</head>
<body>
<form  id="searchForm" class="layui-form">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">合同编号</label>
                        <div class="layui-input-inline">
                            <input type="text" name="search_like_scontractno" placeholder="" autocomplete="off" class="layui-input"/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">买方名称</label>
                        <div class="layui-input-inline">
                            <input type="text" id="membername" name="search_like_sbuyermembername" placeholder="" autocomplete="off" class="layui-input"/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">合同进度</label>
                        <div class="layui-input-inline">
                            <contract:ContractProgress op="select" defval="" defname="全部" name="search_eq_iprogress" option="class='layui-input'" nshow="100,300"/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">交收状态</label>
                        <div class="layui-input-inline">
                            <contract:DeliveryStatus op="select" defval="" defname="全部" name="search_eq_ideliverystatus" option="class='layui-input'"/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">付款状态</label>
                        <div class="layui-input-inline">
                            <contract:PaymentStatus op="select" defval="" defname="全部" name="search_eq_ipaymentstatus" option="class='layui-input'"/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">日期</label>
                        <div class="layui-input-inline">
                            <input type="text" id="dcontractdatestart" name="search_gtetime_dcontractdate" class="layui-input" placeholder="开始日期" readonly/>
                        </div>
                        <div class="layui-form-mid layui-word-aux">-</div>
                        <div class="layui-input-inline">
                            <input type="text" id="dcontractdateend" name="search_ltetime_dcontractdate" class="layui-input" placeholder="截止日期" readonly/>
                        </div>
                    </div>

                </div>
            </form>
            <table class="layui-hide" id="stable" lay-filter="stable" lay-size="sm"></table>





    <!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

    <script>
        var g_ContractProgress = ${contract:ContractProgress()};
        var g_DeliveryStatus = ${contract:DeliveryStatus()};
        var g_PaymentStatus = ${contract:PaymentStatus()};
        var g_InvoiceStatus = ${contract:IInvoiceStatus()};
        layui.use(['table','layer','laydate'],function(){
            var laydate=layui.laydate;
            laydate.render({
                elem: '#dcontractdatestart',
                event: 'focus'
            });
            laydate.render({
                elem: '#dcontractdateend',
                event: 'focus'
            });
            jj.table =layui.table;
            jj.url="${ctx}/margincontract/salelist.json";

            jj.cols= [[
                //{type:'checkbox'}
                {field:'scontractno', title: '合同编号',width:160,sort: true}
                ,{field:'sbuyermembername', title: '买方名称',minWidth:200,sort: true}
                ,{field:'ideliverystatus', title: '货物交收状态',width:120,sort: true,templet: function (d) {
                        return g_DeliveryStatus[d.ideliverystatus];
                    }}
                ,{field:'ipaymentstatus', title: '付款状态',width:120,sort: true,templet: function (d) {
                        return g_PaymentStatus[d.ipaymentstatus];
                    }}
                ,{field:'iinvoicestatus', title: '开票状态',width:120,sort: true,templet: function (d) {
                    return g_InvoiceStatus[d.iinvoicestatus];
                }}
                ,{field:'iprogress', title: '合同进度',width:120,sort: true ,templet: function (d) {
                        return g_ContractProgress[d.iprogress];
                    }}
                ,{field:'ftotalamount', title: '合同总额(元)',width:120,sort: true,align:'right'}
                ,{field:'fbuyerpaid', title: '已付金额(元)',width:120,sort: true,align:'right'}
                ,{field:'dadddate', title: '日期',sort: true,width:170}

                ,{align:'left',title:'操作', toolbar: '#barDemo',width:150,fixed:'right'} //这里的toolbar值是模板元素的选择器

            ]];

            jj.render({
                initSort:{
                    field:"dadddate",
                    type:"desc"
                },
                cellMinWidth:80,
                page: true
            });
            jj.detail=function (obj) {
                layer.open({
                    type: 2,
                    title:"合同详情",
                    area: ['80%', '80%'],
                    content: '${ctx}/margincontract/saleview_'+obj.id+'.shtml',
                    btn: ['关闭'],
                    cancel: function(index){}
                });

            };
            jj.confirm=function (obj) {
                top.layer.open({
                    type: 2,
                    title: "查看详情",
                    area: ['80%', '80%'],
                    content: '${ctx}/margincontract/saleview_'+obj.id+'.shtml',
                    btn: ['确认','关闭'],
                    yes:function (index,layero) {
                        layer.confirm('您确定要确认此合同吗？', {
                            btn: ['确认','取消'] //按钮
                        }, function(){
                            jj.post("${ctx}/margincontract/sellerconfirm_"+obj.id+".json",{},function (rs) {
                                jj.closeAll('loading');
                                if(rs.success){
                                    if(rs.msg){
                                        jj.msg(rs.msg);
                                    }
                                    else {
                                        jj.msg("操作成功!");
                                    }
                                    top.layer.close(index);
                                    jj.refresh();
                                }
                                else {
                                    jj.msg(rs.msg,5,3);
                                }
                            });
                        }, function(){
                            layer.close();
                        });
                    },
                    cancle:function (index) {
                    }
                });
            };

        });

    </script>

    <script type="text/html" id="barDemo">
        <div class="layui-btn-group" data-rowid="{{d.id}}">
            <jj:listbtn name="查看" event="detail" type="a" purview="salemargincontract:query"/>

            {{# if(d.iprogress == 110){ }}
                <jj:listbtn name="确认" event="confirm" type="a" purview=""/>
            {{# }
            }}
        </div>
    </script>
</body>
</html>
