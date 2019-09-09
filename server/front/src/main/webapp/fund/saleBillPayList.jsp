<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp"%>
<%@ taglib prefix="contract" uri="http://www.frogsing.com/tags/contract" %>
<%@ taglib prefix="mv" uri="http://www.frogsing.com/tags/frogsing" %>
<%@ taglib prefix="consts" uri="http://www.frogsing.com/tags/fund" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>付款单列表</title>
    <script type="text/javascript">
        $(function () {
            $("#sacceptmeb").bigAutocomplete({
                url: "${ctx}/hy/member/searchMember.json",
                click: 'true',
                select: true
            });
        })
    </script>
</head>
<body>
<form  id="searchForm" class="layui-form">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">收款单号</label>
                    <div class="layui-input-inline">
                        <input type="text" name="search_like_spayno" placeholder="" autocomplete="off" class="layui-input"/>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">业务编号</label>
                    <div class="layui-input-inline">
                        <input type="text" name="search_like_sbillno" placeholder="" autocomplete="off" class="layui-input"/>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">付款方</label>
                    <div class="layui-input-inline">
                        <input type="text" id="sacceptmeb" name="search_like_ssendmeb.scnname" placeholder="" autocomplete="off" class="layui-input"/>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">单据类型</label>
                    <div class="layui-input-inline">
                        <consts:BillPaySrcType op="select" option="class='layui-input'" defval="" defname="全部" name="search_eq_ipaytype"/>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">状态</label>
                    <div class="layui-input-inline">
                        <consts:BillPayStatus op="select" option="class='layui-input'" defval="" defname="全部" name="search_eq_ipaystatus"/>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">日期</label>
                    <div class="layui-input-inline">
                        <input type="text" id="ddatestart" name="search_gtetime_ddate" class="layui-input" placeholder="开始日期" readonly/>
                    </div>
                    <div class="layui-form-mid layui-word-aux">-</div>
                    <div class="layui-input-inline">
                        <input type="text" id="ddateend" name="search_ltetime_ddate" class="layui-input" placeholder="截止日期" readonly/>
                    </div>
                </div>

            </div>
        </form>
        <table class="layui-hide" id="stable" lay-filter="stable"></table>





<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    var g_BillPaySrcType = ${consts:BillPaySrcType()};
    var g_AcctcPayType = ${consts:AcctcPayType()};
    var g_BillPayStatus = ${consts:BillPayStatus()};
    layui.use(['table','layer','laydate'],function(){
        var laydate=layui.laydate;
        laydate.render({
            elem: '#ddatestart',
            event: 'focus'
        });
        laydate.render({
            elem: '#ddateend',
            event: 'focus'
        });
        jj.table =layui.table;
        jj.url="${ctx}/fund/billpay/saleBillPayList.json";

        jj.cols= [[
            //{type:'checkbox'}
            {field:'spayno', title: '收款单号',width:150,sort: true},
            {field:'ipaytype', title: '单据类型',width:100, templet: function (d) {
                    return g_BillPaySrcType[d.ipaytype];
                }}
            ,{field:'sbillno', title: '业务编号',minWidth:120,sort: true}
            ,{field:'sacceptmeb', title: '付款方',width:200,sort: true,templet:'<div>{{d.ssendmeb.scnname}}</div>'}
            ,{field:'famount', title: '金额(元)',width:120,sort: true,align:'right'}
            ,{field:'fpayamount', title: '实际收款金额(元)',width:120,sort: true,align:'right'}
            ,{field:'iacctpaytype', title: '支付方式',width:80,sort: true,hide:true, templet: function (d) {
                    return g_AcctcPayType[d.iacctpaytype];
                }}
            ,{field:'ipaystatus', title: '状态',width:100,sort: true,templet: function (d) {
                    return g_BillPayStatus[d.ipaystatus];
                }}
            ,{field:'dpaytime', title: '收款时间',width:180,sort: true,templet:function (d) {
                return tt.toDate(d.dpaytime);
            }}
            ,{field:'sremark', title: '备注',minWidth:150,sort: true}
            ,{ align:'left',fixed:'right',width:120, toolbar: '#barDemo'} //这里的toolbar值是模板元素的选择器
        ]];

        jj.render({
            initSort:{
                field:"ddate",
                type:"desc"
            },
            cellMinWidth:80,
            page: true
        });
        jj.detail=function (obj) {
            layer.open({
                type: 2,
                title:"收款单详情",
                area: ['85%', '80%'],
                content: '${ctx}/fund/billpay/saleBillPayView_'+obj.id+'.shtml' ,
                btn: ['关闭'],
                cancel: function(index){}
            });
        };

        jj.gathering=function (obj) {
            layer.open({
                type: 2,
                title:"收款单详情",
                area: ['85%', '80%'],
                content: '${ctx}/fund/billpay/saleBillGathering_'+obj.id+'.shtml' ,
                btn: ['收款','关闭'],
                yes:function (index,layero) {
                    var iframeWin = layero.find('iframe')[0];
                    var $=iframeWin.contentWindow.$;
                    var doc=$(iframeWin.contentWindow.document);
                    var fpayamount = doc.find("input[name='fpayamount']").val();//实际收款金额
                    var dpaytime = doc.find("input[name='dpaytime']").val();//收款时间
                    if (isNull(fpayamount)){
                        jj.error("实际收款金额不能为空");
                    }else if (isNull(dpaytime)){
                        jj.error("收款时间不能为空");
                    }else{
                        layer.confirm('确定已收款吗？', {
                            btn: ['确定','取消'] //按钮
                        }, function(){
                            doc.find('form').first().submit() ;
                        }, function(){
                            jj.closeAll(1);
                        });
                    }
                },
                cancel: function(index){}
            });
        };

        jj.cancelpay=function (obj) {
            layer.open({
                type: 2,
                title:"付款单详情",
                area: ['85%', '80%'],
                content: '${ctx}/fund/billpay/saleBillPayView_'+obj.id+'.shtml' ,
                btn: ['撤销','关闭'],
                yes:function (index,layero) {
                    layer.confirm('您确定要撤消吗？', {
                        btn: ['确定撤消','取消'] //按钮
                    },function(){
                        jj.post("${ctx}/fund/billpay/cancelpay.json",{id:obj.id},function (rs) {
                            if(rs.success){
                                jj.closeAll();
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
                    }, function(){
                        jj.closeAll();
                    });
                },
                cancel: function(index){}
            });
        }

    });

</script>

<script type="text/html" id="barDemo">
    <div class="layui-btn-group" data-rowid="{{d.id}}">
    <jj:listbtn name="查看" event="detail" css="layui-abtn" type="a" purview=""/>
    {{#  if(d.ipaystatus==10 && d.iapprovalstatus == 3){ }}
        <jj:listbtn name="收款" event="gathering"  css="layui-abtn" type="a" purview="billpay:pay"/>

        <c:if test="${mw:user().membertype == 2}">
            <jj:listbtn name="撤销" event="cancelpay" css="layui-abtn" type="a" purview="billpay:cancel"/>
        </c:if>
    {{#  } }}
    </div>
</script>
</body>
</html>
