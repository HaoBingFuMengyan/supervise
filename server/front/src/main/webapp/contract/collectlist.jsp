<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp"%>
<%@ taglib prefix="contract" uri="http://www.frogsing.com/tags/contract" %>
<%@ taglib prefix="mv" uri="http://www.frogsing.com/tags/frogsing" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>开票管理</title>
    <link href="${ctx}/css/salelist.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/css/main.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/css/common.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
        $(function(){
            $("#sellname").bigAutocomplete({
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
                    <label class="layui-form-label">单据编号</label>
                    <div class="layui-input-inline">
                        <input type="text" name="search_like_scode" placeholder="" autocomplete="off" class="layui-input"/>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">合同编号</label>
                    <div class="layui-input-inline">
                        <input type="text" name="search_like_sbillno" placeholder="" autocomplete="off" class="layui-input"/>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">开票方</label>
                    <div class="layui-input-inline">
                        <input type="text" id="sellname" name="search_like_sellmember.scnname" placeholder="" autocomplete="off" class="layui-input"/>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">发票类型</label>
                    <div class="layui-input-inline">
                        <contract:ReceiptType op="select" defname="全部" defval="" option="class='layui-input'" name="search_eq_itype"/>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">单据类型</label>
                    <div class="layui-input-inline">
                        <contract:BillType op="select" defname="全部" defval="" option="class='layui-input'" name="search_eq_ibilltype"/>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">状态</label>
                    <div class="layui-input-inline">
                        <contract:BillStatus op="select" defname="全部" defval="" option="class='layui-input'" name="search_eq_ibillstatus" nshow="30,50"/>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">日期</label>
                    <div class="layui-input-inline">
                        <input type="text" id="dinvoicedatestart" name="search_gtetime_dinvoicedate" class="layui-input" placeholder="开始日期" readonly/>
                    </div>
                    <div class="layui-form-mid layui-word-aux">-</div>
                    <div class="layui-input-inline">
                        <input type="text" id="dinvoicedateend" name="search_ltetime_dinvoicedate" class="layui-input" placeholder="截止日期" readonly/>
                    </div>
                </div>
            </div>
        </form>
        <table class="layui-hide" id="stable" lay-filter="stable"></table>

<script>
    var g_receiptType = ${contract:ReceiptType()};
    var g_billType = ${contract:BillType()};
    layui.use(['table','layer','laydate'],function(){
        var laydate=layui.laydate;
        laydate.render({
            elem: '#dinvoicedatestart',
            event: 'focus'
        });
        laydate.render({
            elem: '#dinvoicedateend',
            event: 'focus'
        });
        jj.table =layui.table;
        jj.url="${ctx}/ht/receiptInfo/collectlist.json";

        jj.cols= [[
            //{type:'checkbox'}
            {field:'scode', title: '单据编号',minWidth:150,sort: true}
            ,{field:'sbillno', title: '合同编号',minWidth:150,sort: true}
            ,{field:'ssellmemberid', title: '开票方',minWidth:200,sort: true,templet: function (d) {
                return d.sellmember.scnname;
            }}
            ,{field:'itype', title: '发票类型',width:100,sort: true ,templet: function (d) {
                return g_receiptType[d.itype];
            }}
            ,{field:'ibilltype', title: '单据类型',width:100,sort: true,templet: function (d) {
                return g_billType[d.ibilltype];
            }}
            ,{field:'ibillstatus', title: '状态',width:100,sort: true,templet: function (d) {
                return ${contract:BillStatus()}[d.ibillstatus];
            }}
            ,{field:'finvoiceamount', title: '收票金额',width:120,sort: true,align:'right'}
            ,{field:'dinvoicedate', title: '收票时间',width:180,sort: true,templet:function (d) {
                return tt.toDate(d.dinvoicedate);
            }}
            ,{field:'sremark', title: '备注',minWidth:200,sort: true}
            ,{fixed: 'right', align:'center',title:'操作', toolbar: '#barDemo', width: 150} //这里的toolbar值是模板元素的选择器

        ]];

        jj.render({
            initSort:{
                field:"dinvoicedate",
                type:"desc"
            },
            cellMinWidth:80,
            page: true
        });
        jj.detail=function (obj) {
            layer.open({
                type: 2,
                title:"收票详情",
                area: ['80%', '65%'],
                content: '${ctx}/ht/receiptInfo/detail_'+obj.id+'.shtml?isCancle=false&op=sp',
                btn: ['关闭'],
                cancel: function(index){}
            });

        };
        jj.cancleReceipt=function (obj) {
            layer.open({
                type: 2,
                title:"收票信息",
                area: ['85%', '65%'],
                content: '${ctx}/ht/receiptInfo/detail_'+obj.id+'.shtml?isCancle=true',
                btn: ['撤销收票','关闭'],
                yes:function (index,layero) {
                    layer.confirm('确定要撤销收票吗？', {icon: 3, title:'系统提示'}, function(index){
                        var iframeWin = layero.find('iframe')[0];
                        var $=iframeWin.contentWindow.$;
                        var doc=$(iframeWin.contentWindow.document);
                        doc.find('form').first().submit() ;
                        layer.close(index);
                    });
                },
                cancel: function(index){}
            });
        };
        jj.shureReceipt=function (obj) {
            layer.open({
                type: 2,
                title:"收票信息",
                area: ['85%', '65%'],
                content: '${ctx}/ht/receiptInfo/detail_'+obj.id+'.shtml?isCancle=false&itype=2&op=sp',
                btn: ['确认收票','关闭'],
                yes:function (index,layero) {
                    layer.confirm('确定要收票吗？', {icon: 3, title:'系统提示'}, function(index) {
                        var iframeWin = layero.find('iframe')[0];
                        var $ = iframeWin.contentWindow.$;
                        var doc = $(iframeWin.contentWindow.document);
                        doc.find('form').first().submit();
                        layer.close(index);
                    });
                },
                cancel: function(index){}
            });
        };
        jj.modifyReceipt=function (obj) {
            layer.open({
                type: 2,
                title:"收票信息",
                area: ['85%', '65%'],
                content: '${ctx}/ht/receiptInfo/detail_'+obj.id+'.shtml?idetail=1&itype=2&op=sp',
                btn: ['确认修改','关闭'],
                yes:function(index,layero) {
                    layer.confirm('确定要做此操作吗？', {icon: 3, title:'系统提示'}, function(index) {
                        var iframeWin = layero.find('iframe')[0];
                        var $ = iframeWin.contentWindow.$;
                        var doc = $(iframeWin.contentWindow.document);
                        doc.find('form').first().submit();
                        layer.close(index);
                    });
                },
                cancel: function(index){}
            });
        };
        jj.dowload=function (obj) {
            window.open("${ctx}/ht/receiptInfo/download.shtml?id="+obj.id);
        }

    });


</script>

<script type="text/html" id="barDemo">

    <div class="layui-btn-group" data-rowid="{{d.id}}">
        <jj:listbtn name="查看" event="detail" css="layui-abtn" type="a" purview="ticket:receive"/>
        <jj:listbtn name="生成附件" event="dowload" css="layui-abtn" type="a" purview=""/>
        {{# if(d.ibillstatus == 40 && d.ibillstatus != 60 && d.ibillstatus != 10){ }}
            <jj:listbtn name="确认收票" event="shureReceipt" css="layui-abtn" type="a" purview=""/>

            <jj:listbtn name="修改" event="modifyReceipt" css="layui-abtn" type="a" purview=""/>

            <jj:listbtn name="撤销收票" event="cancleReceipt" css="layui-abtn" type="a" purview="ticket:cancel"/>
        {{#   } }}
    </div>
</script>
</body>
</html>


