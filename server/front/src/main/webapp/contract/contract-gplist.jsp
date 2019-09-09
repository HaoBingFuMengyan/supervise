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
                    <label class="layui-form-label">卖方名称</label>
                    <div class="layui-input-inline">
                        <input type="text" id="sellname" name="search_like_ssellermembername" placeholder="" autocomplete="off" class="layui-input"/>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">合同进度</label>
                    <div class="layui-input-inline">
                        <contract:ContractProgress op="select" defval="" defname="全部" name="search_eq_iprogress" option="class='layui-input'" nshow="100,300"/>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">日期</label>
                    <div class="layui-input-inline">
                        <input type="text" id="dadddatestart" name="search_gtetime_dadddate" class="layui-input" placeholder="开始日期" readonly/>
                    </div>
                    <div class="layui-form-mid layui-word-aux">-</div>
                    <div class="layui-input-inline">
                        <input type="text" id="dadddateend" name="search_ltetime_dadddate" class="layui-input" placeholder="截止日期" readonly/>
                    </div>
                </div>

            </div>
        </form>
        <table class="layui-hide" id="stable" lay-filter="stable"></table>


<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    var g_ContractProgress = ${contract:ContractProgress()};
    var g_DeliveryStatus = ${contract:DeliveryStatus()};
    var g_InvoiceStatus = ${contract:IInvoiceStatus()};
    var g_PaymentStatus = ${contract:PaymentStatus()};
    layui.use(['table','layer','laydate'],function(){
        var laydate = layui.laydate;
        laydate.render({
            elem: '#dadddatestart',
            event: 'focus'
        });
        laydate.render({
            elem: '#dadddateend',
            event: 'focus'
        });
        jj.table =layui.table;
        jj.url="${ctx}/contract/gplist.json";

        jj.cols= [[
            //{type:'checkbox'}
            {field:'scontractno', title: '合同编号',width:160,sort: true}
            //,{field:'itype', title: '项目类型',sort: true,templet:'#titleTpl'}
            ,{field:'ssellermembername', title: '卖方名称',minWidth:200,sort: true}
            ,{field:'swarehouse', title: '交货仓库',minWidth:120,sort: true}
            ,{field:'iprogress', title: '合同进度',width:120,sort: true ,templet: function (d) {
                    return g_ContractProgress[d.iprogress];
                }}
            ,{field:'ipaymentstatus', title: '付款状态',width:120,sort: true,templet: function (d) {
                return g_PaymentStatus[d.ipaymentstatus];
            }}
            ,{field:'iinvoicestatus', title: '开票状态',width:120,sort: true,templet: function (d) {
                return g_InvoiceStatus[d.iinvoicestatus];
            }}
            ,{field:'ftotalamount', title: '合同总额(元)',width:120,sort: true,align:'right'}
            ,{field:'fbuyerpaid', title: '已付金额(元)',width:120,sort: true,align:'right'}
            ,{field:'dadddate', title: '日期',sort: true,width:170}
            ,{fixed: 'right', align:'left', toolbar: '#barDemo', width: 150} //这里的toolbar值是模板元素的选择器

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
                area: ['80%', '75%'],
                content: '${ctx}/contract/view_'+obj.id+'.shtml' ,
                btn: ['关闭'],
                cancel: function(index){}
            });

        };
        jj.affirm=function (obj) {
            layer.open({
                type: 2,
                title:"合同详情",
                area: ['80%', '80%'],
                content: '${ctx}/contract/saleview_'+obj.id+'.shtml' ,
                btn: ['确认合同','拒绝合同','关闭'],
                yes:function (index,layero) {
                    if(confirm("确定要确认合同吗？")){
                        parent.window.location="${ctx}/contract/buyConfirmContract_"+obj.id+".shtml";
                        layer.close(index);
                    }
                },
                btn2:function (index,layero) {
                    if(confirm("确定要拒绝合同吗？")){
                        parent.window.location="${ctx}/contract/buyCancelContract_"+obj.id+".shtml";
                        layer.close(index);
                    }
                },
                cancel: function(index){}
            });

        };
        jj.receipt=function (obj) {
            jj.xopen({
                title:'合同支付',
                area: ['80%', '80%'],
                content:'${ctx}/contract/contractPay_'+obj.id+'.shtml?type=1',
                btn: ['生成付款单','关闭'],
                yes:function (index,layero) {
                    layer.confirm('确定要生成付款单吗？', {
                        btn: ['确定'] //按钮
                    }, function(){
                        var iframeWin = layero.find('iframe')[0];
                        var $=iframeWin.contentWindow.$;
                        var doc=$(iframeWin.contentWindow.document);
                        var form=doc.find('form');
                        jj.post("${ctx}/contract/contractPay.json",tt.where(form),function (rs) {
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
                },
                cancel: function(index){}
            });

        };


        <%@ include file="signcommon.jsp"%>
    });


</script>

<script type="text/html" id="barDemo">

    <div class="layui-btn-group" data-rowid="{{d.id}}">
        <jj:listbtn name="查看" event="detail" type="a" purview="buycontract:query"/>
        <%--{{#  if(d.iprogress==110 && d.bisbuyerjudge == 0){ }}--%>
        <%--<jj:listbtn name="确认"  type="a" event="affirm" purview="buycontract:confirm"/>--%>
        <%--{{#  }else if(d.iprogress==200){ }}--%>
        <%--{{#  }  if(d.bisacceptover == null || d.bisacceptover == 0){ }}--%>
        <%--{{#  } }}--%>
        {{#  if(d.iprogress==200 && d.bisbuyerjudge == 1 && d.icontractstatus == 0){ }}
            {{# if(d.ipaymentstatus == 30 || d.ipaymentstatus == 31 || d.ipaymentstatus == 60){ }}
                <jj:listbtn name="生成付款单" type="a" event="receipt" purview="billpay:add"/>
            {{# } }}
        {{# } }}


        {{#  if(d.iprogress>=200){ }}
        {{#  if(d.bissigned!=1){ }}
        <jj:listbtn name="签署" event="sign" type="a"/>
        {{#  } else { }}
        <jj:listbtn name="下载" event="downloadContract" type="a"/>
        {{#  } }}
        {{#  } }}
    </div>
</script>
</body>
</html>


