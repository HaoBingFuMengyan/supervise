
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp"%>
<%@ taglib prefix="contract" uri="http://www.frogsing.com/tags/contract" %>
<%@ taglib prefix="mv" uri="http://www.frogsing.com/tags/frogsing" %>
<%@ taglib prefix="consts" uri="http://www.frogsing.com/tags/fund" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>付款单列表</title>
    <link href="${ctx}/css/salelist.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/css/main.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/css/common.css" rel="stylesheet" type="text/css">
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
                <label class="layui-form-label">付款单号</label>
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
                <label class="layui-form-label">收款方</label>
                <div class="layui-input-inline">
                    <input type="text" id="sacceptmeb" name="search_like_sacceptmeb.scnname" placeholder="" autocomplete="off" class="layui-input"/>
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
    var g_approvalStatus = ${consts:ApprovalStatus()};
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
        jj.url="${ctx}/fund/billpay/buyBillPayList.json";

        jj.cols= [[
            //{type:'checkbox'}
            {field:'spayno', title: '付款单号',width:150,sort: true},
            {field:'ipaytype', title: '单据类型',width:100, templet: function (d) {
                return g_BillPaySrcType[d.ipaytype];
            }}
            ,{field:'sbillno', title: '业务编号',minWidth:120,sort: true}
            ,{field:'sacceptmeb', title: '收款方',width:200,sort: true,templet:'<div>{{d.sacceptmeb.scnname}}</div>'}
            ,{field:'famount', title: '金额(元)',width:120,sort: true,align:'right'}
            ,{field:'fpayamount', title: '实际支付金额(元)',width:120,sort: true,align:'right'}
            ,{field:'iacctpaytype', title: '支付方式',width:80,sort: true,hide:true, templet: function (d) {
                    return g_AcctcPayType[d.iacctpaytype];
                }}
            ,{field:'ipaystatus', title: '状态',width:100,sort: true,templet: function (d) {
                    return g_BillPayStatus[d.ipaystatus];
                }}
            ,{field:'iapprovalstatus', title: '审批进度',width:100,sort: true,templet:function (d) {
                return g_approvalStatus[d.iapprovalstatus];
            }}
            ,{field:'dpaytime', title: '付款时间',width:180,sort: true,templet:function (d) {
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
                title:"付款单详情",
                area: ['85%', '80%'],
                content: '${ctx}/fund/billpay/buyBillPayView_'+obj.id+'.shtml?em=detail' ,
                btn: ['关闭'],
                cancel: function(index){}
            });
        };
        jj.pay=function (obj) {
            layer.open({
                type: 2,
                title:"付款单详情",
                area: ['85%', '80%'],
                content: '${ctx}/fund/billpay/buyBillPay_'+obj.id+'.shtml' ,
                btn: ['支付','关闭'],
                yes:function (index,layero) {
                    var iframeWin = layero.find('iframe')[0];
                    var $=iframeWin.contentWindow.$;
                    var doc=$(iframeWin.contentWindow.document);
                    var fpayamount = doc.find("input[name='fpayamount']").val();//支付金额
                    var dpaytime = doc.find("input[name='dpaytime']").val();//支付时间
                    if (isNull(fpayamount)){
                        jj.error("实际付款金额不能为空");
                    }else if (isNull(dpaytime)){
                        jj.error("支付时间不能为空");
                    }else {
                        layer.confirm('您确定要支付吗？', {
                            btn: ['确认支付', '取消'] //按钮
                        }, function () {
                            doc.find('form').first().submit();
                        }, function () {
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
                content: '${ctx}/fund/billpay/buyBillPayView_'+obj.id+'.shtml' ,
                btn: ['撤消','关闭'],
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
                        jj.closeAll(1);
                    });
                },
                cancel: function(index){}
            });
        };
        jj.doApproval = function (obj) {
            layer.open({
                type: 2,
                title:"付款单详情",
                area: ['85%', '80%'],
                content: '${ctx}/fund/billpay/wfbillpay_'+obj.id+'.shtml?em=approval' ,
                btn: ['确定','关闭'],
                yes:function (index,layero) {
                    var iframeWin = layero.find('iframe')[0];
                    var $=iframeWin.contentWindow.$;
                    var doc=$(iframeWin.contentWindow.document);
                    var form=doc.find('form');
                    jj.post("${ctx}/fund/billpay/approval.json",tt.where(form),function (rs) {
                        if(rs.success){
                            if(rs.msg){
                                jj.msg(rs.msg);
                            }
                            else {
                                jj.msg("支付单审批发起成功");
                            }
                            layer.close(index);
                            jj.refresh();
                        }
                        else {
                            jj.msg(rs.msg,5,3);
                        }
                    });
                },
                cancel: function(index){}
            });
        }

    });

</script>
<script type="text/html" id="titleTpl">

</script>
<script type="text/html" id="barDemo">
    <div class="layui-btn-group" data-rowid="{{d.id}}">
    <jj:listbtn name="查看" event="detail"  type="a" purview=""/>

    <c:choose>
        <c:when test="${mw:user().membertype == 2}"><%--供应链公司发起审批--%>
            {{# if(d.ipaystatus == 10 && (d.iapprovalstatus == 0 || d.iapprovalstatus == 2)){ }}
                <jj:listbtn name="发起审批" event="doApproval" type="a" purview="billpay:approval"/>

                {{# if(d.isendpoint==1){ }}
                    <jj:listbtn name="撤销" event="cancelpay"  type="a" purview="billpay:cancel"/>
                {{# } }}

            {{# } }}

            {{# if(d.ipaystatus==10 && d.iapprovalstatus == 3){ }}
                <jj:listbtn name="支付" event="pay"  type="a" purview="billpay:pay"/>
            {{# } }}

        </c:when>
        <c:otherwise>
            {{# if(d.ipaystatus==10){ }}
                <jj:listbtn name="支付" event="pay"  type="a" purview="billpay:pay"/>
            {{# } }}
            <%--{{# if(d.ipaystatus==10 && d.isendpoint==1){ }}--%>
                <%--<jj:listbtn name="撤销" event="cancelpay"  type="a" purview="billpay:cancel"/>--%>
            <%--{{# } }}--%>
        </c:otherwise>
    </c:choose>
    </div>
</script>
</body>
</html>
