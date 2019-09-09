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
            jj.url="${ctx}/contract/salelist.json";

            jj.cols= [[
                //{type:'checkbox'}

                {field:'scontractsellerno', title: '合同编号',width:160,sort: true}
                ,{field:'id', title: '项目类型',minWidth:150,sort: true,templet:function (d) {
                    return g_ProjectType[d.project.itype];
                }}
                ,{field:'sbuyermembername', title: '买方名称',minWidth:200,sort: true}
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
                    content: '${ctx}/contract/saleview_'+obj.id+'.shtml?em=detail',
                    btn: ['关闭'],
                    cancel: function(index){}
                });

            };
            jj.repeal=function(obj){
                layer.open({
                    type: 2,
                    title:"合同详情",
                    area: ['80%', '65%'],
                    content: '${ctx}/contract/saleview_'+obj.id+'.shtml',
                    btn: ['撤销合同','关闭'],
                    yes:function (index,layero) {
                        if(confirm("确定要撤销合同吗？")){
                            parent.window.location="${ctx}/contract/saleCancelContract_"+id+".shtml";
                            layer.close(index);
                        }
                    },
                    cancel: function(index){}
                });

            };
            jj.receipt=function(obj){
                jj.xopen({
                    title:'合同收款',
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
            jj.refund=function (obj) {
                jj.xopen({
                    title:'合同退款',
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
            jj.affirm = function (obj) {
                layer.open({
                    type: 2,
                    title: "合同详情",
                    area: ['80%', '80%'],
                    content: '${ctx}/contract/saleview_'+obj.id+'.shtml',
                    btn: ['确认合同', '拒绝合同', '关闭'],
                    btn1: function (indexp, layero) {
                        layer.confirm('您是否确定要确认此合同？', {
                            btn: ['确认', '取消'] //按钮
                        }, function () {
                            jj.post("${ctx}/contract/sellerConfirmContract.json", {id: obj.id}, function (rs) {
                                jj.closeAll('loading');
                                if (rs.success) {
                                    if (rs.msg) {
                                        jj.msg(rs.msg);
                                    }
                                    else {
                                        jj.msg("操作成功!");
                                    }
                                    layer.close(indexp);
                                    jj.refresh();
                                }
                                else {
                                    jj.msg(rs.msg, 5, 3);
                                }

                            });
                        }, function () {
                            jj.closeAll();
                        });
                    },
                    btn2: function (indexp, layero) {
                        layer.prompt({title: '请输入拒绝合同的原因', formType: 2}, function (text, index) {
                            layer.close(index);//关闭意见框
                            layer.confirm('您确定要拒绝此合同吗？', {
                                btn: ['确认', '取消'] //按钮
                            }, function () {
                                jj.post("${ctx}/contract/saleCancelContract.json",{id:obj.id,sinfo:text},function (rs) {
                                    jj.closeAll('loading');
                                    if(rs.success){
                                        if(rs.msg){
                                            jj.msg(rs.msg);
                                        }
                                        else {
                                            jj.msg("操作成功!");
                                        }
                                        layer.close(indexp);
                                        jj.refresh();
                                    }
                                    else {
                                        jj.msg(rs.msg,5,3);
                                    }
                                });
                            }, function () {
                                jj.closeAll();
                            });
                        });
                        return false;//避免关闭顶层窗口
                    },
                    btn3: function (index) {
                    }
                });
            };

            <!--供应链公司开票-->
            jj.ticket=function (obj) {
                layer.open({
                    type: 2,
                    title:"开票详情",
                    area: ['80%', '80%'],
                    content: '${ctx}/contract/contractRecepit_'+obj.id+'.shtml?itype=1' ,
                    btn: ['开票','关闭'],
                    yes:function (index,layero) {
                        layer.confirm('确定要开票吗？', {icon: 3, title:'系统提示'}, function(index){
                            var iframeWin = layero.find('iframe')[0];
                            var $=iframeWin.contentWindow.$;
                            var doc=$(iframeWin.contentWindow.document);
                            doc.find('form').first().submit() ;

                            layer.close(index);
                        });
                    },
                    cancel: function(index){}
                });
            }
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
            jj.doApproval = function (obj) {
                jj.xopen({
                    title:"发起审批",
                    area: ['80%', '80%'],
                    content: '${ctx}/contract/saleworkflow_'+obj.id+'.shtml?em=approval',
                    btn: ['确定','关闭'],
                    yes:function (index,layero) {
                        var iframeWin = layero.find('iframe')[0];
                        var $=iframeWin.contentWindow.$;
                        var doc=$(iframeWin.contentWindow.document);
                        var form=doc.find('form');
                        jj.post("${ctx}/contract/approval.json",tt.where(form),function (rs) {
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
                    },
                    cancel: function(index){}
                })
            };
            jj.deliveryFinish = function (obj) {
                layer.confirm('货物实际交收量与合同约定的数量不一致，您是否已经与各方沟通确认，需要强制交货完成吗？', {
                    btn: ['确定'] //按钮
                }, function(){
                    jj.post("${ctx}/contract/deliveryfinish.json",{id:obj.id},function (rs) {
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

            jj.receiptPlan=function (d) {
                <c:if test="${mw:user().membertype eq 2}"><%--供应链可以修改--%>
                jj.open({
                    area: ['80%', '80%'],
                    title:'收款计划',
                    content:"${ctx}/repaymentplan/receiptplan.shtml?sprojectid="+d.sorderid
                });
                </c:if>
                <c:if test="${mw:user().membertype ne 2}"><%--上游只能查看--%>
                jj.xview({
                    area: ['80%', '80%'],
                    title:'收款计划',
                    content: "${ctx}/project/repaymentplan.shtml?itype=20&id=" + d.sorderid
                });
                </c:if>
            }

            <%@ include file="signcommon.jsp"%>


        });

    </script>

    <script type="text/html" id="barDemo">
        <div class="layui-btn-group" data-rowid="{{d.id}}">
            <jj:listbtn name="查看" event="detail" type="a" purview="salecontract:query"/>

        {{# if(d.ideliverystatus == 20){ }}
            <c:if test="${mw:user().membertype == 2}">
                <jj:listbtn name="交货完成" event="deliveryFinish" type="a" purview=""/>
            </c:if>
        {{# } }}

        {{# if(d.iapprovalstatus === 0 || d.iapprovalstatus === 2){ }}
            <c:if test="${mw:user().membertype == 2}"><%--供应链公司发起审批--%>
                <jj:listbtn name="发起审批" event="doApproval" type="a" purview="have:approval"/>
            </c:if>
        {{# } }}

            <c:if test="${mw:user().membertype == 2}"><!--上传附件-->
                <jj:listbtn name="上传附件" event="uploadFile" type="a" purview="salecontract:uploadfile"/>
            </c:if>

        {{#  if(d.icontractstatus==0){ }}
            {{#  if(d.iprogress==110){ }}
                {{#  if(d.bissellerjudge==0){ }}
                <jj:listbtn name="确认" type="a" event="affirm" purview="salecontract:confirm"/>
                {{#  } }}
                <%--<jj:listbtn name="撤销" event="repeal" type="a" purview="salecontract:cancel"/>--%>
            {{#  }else if(d.iprogress==200){ }}
                {{# if(d.fbuyerpaid < d.fbuyerpayable || d.fbuyerpaid < d.fdeliveryfund){ }}<!--应付大于已付可以出来收款按钮-->
                <c:if test="${mw:user().membertype == 2}">
                    {{# if(d.project.itype==10 || d.project.itype==20) { }}<!--库存融资、预付款项目融资才有收款按钮-->
                        <jj:listbtn name="生成收款单" event="receipt" type="a" purview="billpay:add"/>
                    {{# } }}
                </c:if>
                {{#  } }}

                {{# if(d.ideliverystatus == 100){ }}<%--供应商生成付款计划（退款）--%>
                    {{# if(d.ipaymentstatus == 50){ }}
                        <jj:listbtn name="生成付款单" type="a" event="refund" purview="billpay:add"/>
                    {{# } }}

                {{# } }}

            {{#  } else{ }}

            {{#  } }}
                {{# if(d.ideliverystatus!=100) { }}
                {{#  } }}
                {{# if(d.iinvoicestatus!=2) { }}
                <c:if test="${mw:user().membertype == 2}"><!--供应链公司开票-->
                <jj:listbtn name="开票" event="ticket" type="a" purview="ticket:open"/>
                </c:if>
                {{# } }}
        {{#  }  }}

            <%--<c:choose>--%>
                <%--<c:when test="${mw:user().membertype == 2}">--%>
                    <%--{{# if(d.iprogress>=200 && d.iapprovalstatus ==3){ }}--%>
                    <%--{{# if(d.bissigned!=1){ }}--%>
                    <%--<jj:listbtn name="签署" purview="contract:sign" event="sign" type="a"/>--%>
                    <%--{{# } else { }}--%>
                    <%--<jj:listbtn name="下载" event="downloadContract" type="a"/>--%>
                    <%--{{# } }}--%>
                    <%--{{# } }}--%>
                <%--</c:when>--%>
                <%--<c:otherwise>--%>
                    <%--{{# if(d.iprogress>=200){ }}--%>
                    <%--{{# if(d.bissigned!=1){ }}--%>
                    <%--<jj:listbtn name="签署" event="sign" purview="contract:sign" type="a"/>--%>
                    <%--{{# } else { }}--%>
                    <%--<jj:listbtn name="下载" event="downloadContract" type="a"/>--%>
                    <%--{{# } }}--%>
                    <%--{{# } }}--%>
                <%--</c:otherwise>--%>
            <%--</c:choose>--%>


            {{# if(d.iprogress>=200 && d.iapprovalstatus ==3){ }}
            {{# if(d.bissigned!=1){ }}
            <jj:listbtn name="签署" event="sign" purview="contract:sign" type="a"/>
            {{# } else { }}
            <jj:listbtn name="下载" event="downloadContract" type="a"/>
            {{# } }}
            {{# } }}


            <jj:listbtn name="收款计划" event="receiptPlan" type="a"/>




        </div>
    </script>
</body>
</html>
