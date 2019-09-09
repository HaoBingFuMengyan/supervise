<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp"%>
<%@ taglib prefix="contract" uri="http://www.frogsing.com/tags/contract" %>
<%@ taglib prefix="mv" uri="http://www.frogsing.com/tags/frogsing" %>
<!DOCTYPE html>
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
                    <label class="layui-form-label">项目编号</label>
                    <div class="layui-input-inline">
                        <input type="text" name="search_like_sorderno" placeholder="" autocomplete="off" class="layui-input"/>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">合同编号</label>
                    <div class="layui-input-inline">
                        <input type="text" name="search_like_scontractsellerno" placeholder="" autocomplete="off" class="layui-input"/>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">卖方名称</label>
                    <div class="layui-input-inline">
                        <input type="text" id="membername" name="search_like_ssellermembername" placeholder="" autocomplete="off" class="layui-input"/>
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
        <table class="layui-hide" id="stable" lay-filter="stable"></table>


<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    var g_ContractProgress = ${contract:ContractProgress()};
    var g_DeliveryStatus = ${contract:DeliveryStatus()};
    var g_PaymentStatus = ${contract:PaymentStatus()};
    var g_InvoiceStatus = ${contract:IInvoiceStatus()};
    var g_ProjectType = ${project:ProjectType()};
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
        jj.url="${ctx}/contract/list.json";

        jj.cols= [[
            //{type:'checkbox'}
            {field:'scontractsellerno', title: '合同编号',width:160,sort: true}
            ,{field:'id', title: '项目类型',minWidth:150,sort: true,templet:function (d) {
                return g_ProjectType[d.project.itype];
            }}
            //,{field:'itype', title: '项目类型',sort: true,templet:'#titleTpl'}
            ,{field:'ssellermembername', title: '卖方名称',minWidth:200,sort: true}
            ,{field:'swarehouse', title: '交货仓库',minWidth:120,sort: true}
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
                area: ['80%', '80%'],
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
                    layer.confirm('确定要确认合同吗？', {
                        btn: ['确定','取消'] //按钮
                    }, function(){
                        parent.window.location="${ctx}/contract/buyConfirmContract_"+obj.id+".shtml";
                        layer.close(index);
                    }, function(){
                        jj.closeAll(1);
                    });
                },
                btn2:function (index,layero) {
                    layer.confirm('确定要拒绝合同吗？', {
                        btn: ['确定','取消'] //按钮
                    }, function(){
                        parent.window.location="${ctx}/contract/buyCancelContract_"+obj.id+".shtml";
                        layer.close(index);
                    }, function(){
                        jj.closeAll(1);
                    });
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
        jj.refund=function (obj) {
            jj.xopen({
                title:'合同退款',
                area: ['80%', '80%'],
                content:'${ctx}/contract/contractPay_'+obj.id+'.shtml?type=2',
                btn: ['生成收款单','关闭'],
                yes:function (index,layero) {
                    layer.confirm('确定要生成收款单吗？', {
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
        <!--交易会员收票确认-->
        jj.receiveticket=function (obj) {
            layer.open({
                type: 2,
                title:"收票详情",
                area: ['80%', '80%'],
                content: '${ctx}/contract/contractRecepit_'+obj.id+'.shtml?itype=2' ,
                btn: ['收票','关闭'],
                yes:function (index,layero) {
                    layer.confirm('确定要收票吗？', {icon: 3, title:'系统提示'}, function(index){
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
        jj.uploadFile=function (obj) {
            layer.open({
                type: 2,
                title:"合同详情",
                area: ['80%', '80%'],
                content: '${ctx}/contract/uploadfile_'+obj.id+'.shtml' ,
                btn: ['确定','关闭'],
                yes:function (index,layero) {
                    layer.confirm('确定要上传吗？', {icon: 3, title:'系统提示'}, function(index){
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
        jj.cancle = function (obj) {
            layer.confirm('你确定要作废此合同吗？', {
                btn: ['确定', '取消'] //按钮
            }, function () {
                jj.post("${ctx}/contract/saleCancelContract.json", {id: obj.id}, function (rs) {
                    if (rs.success) {
                        if (rs.msg) {
                            jj.msg(rs.msg);
                        }
                        else {
                            jj.msg("操作成功!");
                        }
                        jj.refresh();
                    }
                    else {
                        jj.msg(rs.msg, 5, 3);
                    }
                });
            }, function () {
            });
        };
        jj.doApproval = function (obj) {
            jj.xopen({
                title: "发起审批",
                area: ['80%', '80%'],
                content: '${ctx}/contract/saleworkflow_' + obj.id + '.shtml?em=approval',
                btn: ['确定', '关闭'],
                yes: function (index, layero) {
                    var iframeWin = layero.find('iframe')[0];
                    var $ = iframeWin.contentWindow.$;
                    var doc = $(iframeWin.contentWindow.document);
                    var form = doc.find('form');
                    jj.post("${ctx}/contract/approval.json", tt.where(form), function (rs) {
                        if (rs.success) {
                            if (rs.msg) {
                                jj.msg(rs.msg);
                            }
                            else {
                                jj.msg("操作成功!");
                            }
                            layer.close(index);
                            jj.refresh();
                        }
                        else {
                            jj.msg(rs.msg, 5, 3);
                        }
                    });
                },
                cancel: function (index) {
                }
            })
        };

        jj.paymentPlan = function (d) {
            <c:if test="${mw:user().membertype ne 2}"><%--下游只能查看--%>
            jj.xview({
                area: ['80%', '80%'],
                title: '付款计划',
                content: "${ctx}/project/repaymentplan.shtml?itype=10&id=" + d.sorderid
            });
            </c:if>
            <c:if test="${mw:user().membertype eq 2}"><%--供应链可以修改--%>
            jj.open({
                area: ['80%', '80%'],
                title: '付款计划',
                content: "${ctx}/repaymentplan/paymentplan.shtml?sprojectid=" + d.sorderid
            });
            </c:if>
        }
        <%@ include file="signcommon.jsp"%>
    });


</script>

<script type="text/html" id="barDemo">

    <div class="layui-btn-group" data-rowid="{{d.id}}">
        <jj:listbtn name="查看" event="detail" type="a" purview="buycontract:query"/>

        {{# if(d.iapprovalstatus === 0 || d.iapprovalstatus === 2){ }}
            <c:if test="${mw:user().membertype == 2}"><%--供应链公司发起审批--%>
                <jj:listbtn name="发起审批" event="doApproval" type="a" purview="have:approval"/>
            </c:if>
        {{# } }}

        <c:if test="${mw:user().membertype == 2}"><!--上传附件-->
            <jj:listbtn name="上传附件" event="uploadFile" type="a" purview="buycontract:uploadfile"/>
        </c:if>

        {{# if(d.iprogress==110 && d.icontractstatus == 0){ }}
            <jj:listbtn name="确认" type="a" event="affirm" purview="billpay:confirm"/>

            {{# if(d.icontractstatus == 0 && d.ipaymentstatus == 30 && d.iinvoicestatus == 0 && d.ideliverystatus == 10 && d.fopenbillweight <= 0){ }}
            <jj:listbtn name="撤销" type="a" event="cancle" purview="buycontract:cancel"/>
            {{# } }}
        {{# }else if(d.iprogress==200 && d.icontractstatus == 0){ }}
            {{# if(d.ipaymentstatus == 30 || d.ipaymentstatus == 31 || d.ipaymentstatus == 60){ }}
            <c:if test="${mw:user().membertype == 2}">
                <jj:listbtn name="生成付款单" type="a" event="receipt" purview="billpay:add"/>
            </c:if>

            {{# } }}

            {{# if(d.ideliverystatus == 100 && d.ipaymentstatus == 50){ }}<%--采购商生成收款计划（退款）--%>
                <c:if test="${mw:user().membertype == 2}">
                    <jj:listbtn name="生成收款单" type="a" event="refund" purview="billpay:add"/>
                </c:if>
            {{# } }}

        {{# } if(d.bisacceptover == null || d.bisacceptover == 0){ }}
        {{# } }}
        {{# if(d.iprogress>=200 && d.iinvoicestatus!=2) { }}
        <c:if test="${mw:user().membertype == 2}"><!--收票-->
        <jj:listbtn name="收票" event="receiveticket" type="a" purview="ticket:receive"/>
        </c:if>
        {{# } }}


        {{#  if(d.iprogress>=200 && d.iapprovalstatus ==3){ }}
        {{#  if(d.bissigned!=1){ }}
        <jj:listbtn name="签署" event="sign" purview="contract:sign" type="a"/>
        {{#  } else { }}
        <jj:listbtn name="下载" event="downloadContract" type="a"/>
        {{#  } }}
        {{#  } }}


        <jj:listbtn name="付款计划" event="paymentPlan" type="a"/>
    </div>


</script>
</body>
</html>


