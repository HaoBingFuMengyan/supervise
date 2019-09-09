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
    <script type="text/javascript">
        $(function(){
            $("#sbuyname").bigAutocomplete({
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
                            <input type="text" name="search_like_scontractsellerno" placeholder="" autocomplete="off" class="layui-input"/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">买方名称</label>
                        <div class="layui-input-inline">
                            <input type="text" id="sbuyname" name="search_like_sbuyermembername" placeholder="" autocomplete="off" class="layui-input"/>
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
                            <input type="text" id="dadddatestart" name="search_gtetime_dadddate" class="layui-input" placeholder="开始日期" readonly/>
                        </div>
                        <div class="layui-form-mid layui-word-aux">-</div>
                        <div class="layui-input-inline">
                            <input type="text" id="dadddateend" name="search_ltetime_dadddate" class="layui-input" placeholder="截止日期" readonly/>
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
                elem: '#dadddatestart',
                event: 'focus'
            });
            laydate.render({
                elem: '#dadddateend',
                event: 'focus'
            });
            jj.table =layui.table;
            jj.url="${ctx}/contract/dxsalelist.json";

            jj.cols= [[
                {field:'scontractsellerno', title: '合同编号',width:160,sort: true}
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
                ,{field:'ftotalamount', title: '合同总额(元)',width:120,sort: true,align:'right'}
                ,{field:'fbuyerpaid', title: '已付金额(元)',width:120,sort: true,align:'right'}
                ,{field:'dadddate', title: '日期',sort: true,width:170}
                ,{field:'iprogress', title: '合同进度',width:120,sort: true ,templet: function (d) {
                        return g_ContractProgress[d.iprogress];
                    }}
                ,{align:'left', toolbar: '#barDemo',width:150,fixed:'right'} //这里的toolbar值是模板元素的选择器

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
                    content: '${ctx}/contract/saleview_'+obj.id+'.shtml',
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
                        layer.confirm('确定要撤销合同吗？', {
                            btn: ['确定','取消'] //按钮
                        }, function(){
                            jj.post("${ctx}/contract/saleCancelContract.json",{id:obj.id},function (rs) {
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
                        },function () {
                            jj.closeAll();
                        });
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
            jj.deliveryorderadd=function (d) {
                jj.xopen({
                    area: ['90%', '90%'],
                   content:'${ctx}/contract/dxdeliveryorderadd.shtml?scontractid='+d.id
                });

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
            };

            jj.dxsale=function () {
                jj.xopen({
                    area: ['90%', '90%'],
                    content:'${ctx}/contract/contractBySellerAdd.shtml'
                });
            }

            <%@ include file="signcommon.jsp"%>

        });

    </script>

    <script type="text/html" id="barDemo">
        <div class="layui-btn-group" data-rowid="{{d.id}}">
            <jj:listbtn name="查看" event="detail" css="layui-abtn" type="a" purview="salecontract:query"/>

        {{# if(d.ideliverystatus == 20){ }}
            <c:if test="${mw:user().membertype == 2}">
                <jj:listbtn name="交货完成" event="deliveryFinish" type="a" purview=""/>
            </c:if>
        {{# } }}

        {{#  if(d.icontractstatus==0){ }}
            {{#  if(d.iprogress==110){ }}
                <jj:listbtn name="撤销" event="repeal" css="layui-abtn" type="a" purview="salecontract:cancel"/>
            {{#  }else if(d.iprogress==200){ }}

                {{# if(d.fbuyerpaid < d.fbuyerpayable || d.fbuyerpaid < d.fdeliveryfund) { }}<!--应付大于已付可以出来收款按钮-->
                    <c:if test="${mw:user().membertype == 2}">
                        <jj:listbtn name="生成收款单" event="receipt" css="layui-abtn" type="a" purview="billpay:add"/>
                    </c:if>
                {{#  } }}

                {{# if(d.ideliverystatus == 100){ }}<%--（退款）--%>
                    {{# if(d.ipaymentstatus == 50){ }}
                        <jj:listbtn name="生成付款单" type="a" event="refund" purview="billpay:add"/>
                    {{# } }}
                {{# } }}

                {{# if(d.ideliverystatus!=100) { }}
                    <jj:listbtn name="开提货单" event="deliveryorderadd" css="layui-abtn" type="a" purview="deliveryorder:add"/>
                {{#  } }}

                {{# if(d.iinvoicestatus!=2) { }}
                    <c:if test="${mw:user().membertype == 2}"><!--供应链公司开票-->
                        <jj:listbtn name="开票" event="ticket" type="a" purview="ticket:open"/>
                    </c:if>
                {{# } }}
            {{#  } }}
        {{#  } }}


            {{#  if(d.iprogress>=200){ }}
            {{#  if(d.bissigned!=1){ }}
            <jj:listbtn name="签署" event="sign" type="a"/>
            {{#  } else { }}
            <jj:listbtn name="下载" event="downloadContract" type="a"/>
            {{#  } }}
            {{#  } }}

        </div>
    </script>
    <script type="text/html" id="xtoolbar">
        <jj:btn name="发起定向销售合同" event="dxsale" purview="salecontract:add"/>
</script>
</body>
</html>
