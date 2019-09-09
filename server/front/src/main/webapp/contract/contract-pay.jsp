<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
    <meta name="decorator" content="jj"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>订单付款</title>
    <script type="text/javascript">

            //日期
            layui.use(['layer', 'laydate','upload','form'], function () {
                var laydate = layui.laydate;
                layer = layui.layer;

                var layupload = layui.upload;

                //执行实例
                var demoListView = $('#morefile'),uploadListIns = layupload.render({
                    elem: '#addFile'
                    ,url: '${ctx}/file/uploadfile.json'
                    ,accept: 'file'
                    ,multiple: true
                    ,auto: false
                    ,field:"upfile"
                    ,data:{path:'/DxContractPay'}
                    ,choose: function(obj){
                        var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
                        obj.preview(function(index, file, result){
                            obj.upload(index, file);
                        });
                    }
                    ,before: function(obj){ //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
                        layer.load(1); //上传loading
                    }
                    ,allDone:function (obj) {
                        layer.closeAll('loading'); //关闭loadin
                    }
                    ,done: function(res, index, upload){
                        if(res.state == "SUCCESS"){ //上传成功
                            var tr = $(['<tr id="upload-'+ index +'">'
                                ,'<td>' +
                                ' <input type="hidden" name="sfileid" value=""/>' +
                                ' <input type="hidden" name="sfilename" value="'+res.original+'"/>' +
                                '<input type="hidden" name="sfilepath" value="'+res.path+'"/> '+ res.original +'</td>'
                                ,'<td><input type="text" name="sfileremark" autocomplete="off" class="layui-input layui-input-sm"/></td>'
                                ,'<td>'
                                ,'<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>'
                                ,'</td>'
                                ,'</tr>'].join(''));
                            //删除
                            tr.find('.demo-delete').on('click', function(){
                                tr.remove();
                                uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
                            });
                            demoListView.append(tr);
                            return delete this.files[index]; //删除文件队列已经上传成功的文件
                        }else{
                            layer.msg(res.original+"上传失败，失败原因："+res.state);
                            this.error(index, upload);
                        }
                    }
                    ,error: function(index, upload){
                        layer.closeAll('loading'); //关闭loadin
                        return delete this.files[index]; //删除文件队列已经上传成功的文件
                    }
                });

                jj.validate("#formx",{
                    check:function () {
                        var fpayamountinput=$("#fpayamountinput").val();
                        if (isEmpty(fpayamountinput) || !isDouble(fpayamountinput)){
                            fpayamountinput=0;
                            $("#fpayamountinput").val("0");
                        }
                        if(getMoneyValue(fpayamountinput)>getMoneyValue($("#fmaxamount").val())){//付款金额不能大于未付金额
                            var msg = "";
                            if ('${type}' == '1')
                                msg = "付款";
                            else
                                msg = "收款";
                            return msg+"金额不能大于"+msg+"款金额";
                            $("#fpayamountinput").val($("#fmaxamount").val());
                        }
                        if(parseFloat(fpayamountinput)<0){//付款金额不能大于未付金额
                            var msg = "金额不能小于等于0";
                            if ('${type}' == '1')
                                msg = "付款" + msg;
                            else
                                msg = "收款" + msg;
                            return msg;
                            $("#fpayamountinput").val(0);
                        }
                    }
                });
            });


            /*$("#fpayamountinput").blur(function(){
                var fpayamountinput=$(this).val();
                if (isEmpty(fpayamountinput) || !isDouble(fpayamountinput)){
                    fpayamountinput=0;
                    $(this).val("0");
                }
                if(getMoneyValue(fpayamountinput)>getMoneyValue($("#fmaxamount").val())){//付款金额不能大于未付金额
                    alert("支付金额不能大于未付款金额");
                    $("#fpayamountinput").val($("#fmaxamount").val());
                }
                if(parseFloat(fpayamountinput)<0){//付款金额不能大于未付金额
                    alert("支付金额不能小于等于0");
                    $("#fpayamountinput").val(0);
                }
            });*/


            function paymoney() {
                var paymoney = $("#paymoney").val();
                $("#fpayamountinput").val(getRoundValue(paymoney,2));
            }

            function validateFpayamountInput(){
                var fpayamountinput = isNaN(new Number($("#fpayamountinput").val())) ? 0 : new Number($("#fpayamountinput").val());
                var paymoney = $("#paymoney").val();

                if (fpayamountinput > 0){
                    if (fpayamountinput > paymoney)
                        $("#fpayamountinput").val(getRoundValue(paymoney,2));
                }else
                    $("#fpayamountinput").val('');
            }
    </script>
</head>
<body>
<c:if test="${type eq 1}">
    <c:set var="typeName" value="付款"/>
</c:if>
<c:if test="${type eq 2}">
    <c:set var="typeName" value="收款"/>
</c:if>
<c:if test="${type eq 3}">
    <c:set var="typeName" value="退款"/>
</c:if>

<div class="layui-collapse top10">
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">${typeName}信息</h2>
        <div class="layui-colla-content layui-show">
            <form action="${ctx}/contract/contractPay.json" method="post" id="formx" enctype="multipart/form-data" novalidate="novalidate">

                <input type="hidden" id="nullid">
                <input type="hidden" name="id" id="id" value="${contract.id }"/>
                <input type="hidden" name="fmaxamount" id="fmaxamount" value="<mw:format label="money" value="${contract.fbuyerpayable-contract.fbuyerpaid}"/>"/>
                <input type="hidden" id="type" name="type" value="${type}">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">剩余未${typeName}金额</label>
                        <div class="layui-input-block" style="line-height: 32px;">
                            <c:choose>
                                <c:when test="${(contract.ideliverystatus eq 100 && contract.ipaymentstatus eq 30) || (contract.ideliverystatus eq 100 && contract.ipaymentstatus eq 60)}"><%--交货完成状态为待付款 || 交货完成状态为待补款--%>
                                    <input type="hidden" id="paymoney" value="${contract.fdeliveryfund-contract.fbuyerpaid}">
                                    <mw:format label="money" value="${contract.fdeliveryfund-contract.fbuyerpaid}"/>元
                                </c:when>
                                <c:when test="${contract.ideliverystatus eq 100 && contract.ipaymentstatus eq 50}"><%--交货完成状态为待退款--%>
                                    <input type="hidden" id="paymoney" value="${contract.fbuyerpaid-contract.fdeliveryfund-frefund}">
                                    <mw:format label="money" value="${contract.fbuyerpaid-contract.fdeliveryfund-frefund}"/>元
                                </c:when>
                                <c:when test="${contract.ideliverystatus ne 100 && contract.ipaymentstatus eq 30}"><%--未交货或者部分交货状态为待付款--%>
                                    <input type="hidden" id="paymoney" value="${contract.fbuyerpayable-contract.fbuyerpaid}">
                                    <mw:format label="money" value="${contract.fbuyerpayable-contract.fbuyerpaid}"/>元
                                </c:when>
                                <c:otherwise>

                                </c:otherwise>
                            </c:choose>
                            <%--<c:if test="${contract.ipaymentstatus eq 50}">--%>
                                <%--<input type="hidden" id="paymoney" value="${contract.fbuyerpaid-contract.fdeliveryfund-contract.frefund}">--%>
                                <%--<mw:format label="money" value="${contract.fbuyerpaid-contract.fdeliveryfund-contract.frefund}"/>元--%>
                            <%--</c:if>--%>
                            <%--<c:if test="${contract.ipaymentstatus ne 50}">--%>
                                <%--<input type="hidden" id="paymoney" value="${contract.fbuyerpayable-contract.fbuyerpaid}">--%>
                                <%--<mw:format label="money" value="${contract.fbuyerpayable-contract.fbuyerpaid}"/>元--%>
                            <%--</c:if>--%>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">${typeName}金额 </label>
                        <div class="layui-input-block">
                            <input type="text" onchange="validateFpayamountInput()" id="fpayamountinput" placeholder="请输入${typeName}金额" name="fpayamount" value=""  class="layui-input required money" autocomplete="off" style="display: inline-block;width: 65%;"/>
                            <a onclick="paymoney()" style="color: #1E9FFF;margin-left: 10px;cursor: pointer;">全额${typeName}</a>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">备注</label>
                    <div class="layui-input-block">
                        <textarea placeholder="请输入备注" class="layui-textarea" id="sremark" name="sremark"></textarea>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<c:if test="${type eq 1 || type eq 3}">
    <%@include file="/contract/buy-common-view.jsp"%>
</c:if>
<c:if test="${type eq 2}">
    <%@include file="/contract/sale-common-view.jsp"%>
    <c:set var="typeName" value="收款"/>
</c:if>


</body>
</html>
