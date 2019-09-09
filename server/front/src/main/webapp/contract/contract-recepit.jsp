<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
    <meta name="decorator" content="jj"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>订单开票</title>

    <script type="text/javascript">
        $(document).ready(function() {

            //日期
            layui.use(['layer', 'laydate','upload','form'], function () {
                var laydate = layui.laydate;
                layer = layui.layer;

                var layupload = layui.upload;
                laydate.render({
                    elem: '#dinvoicedate',
                    trigger: 'click',
                    max:'new Date()'
                });
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
            });

        });
        //计算开票金额
        function calFpayamount(fweight,is){
            var weight = $(is).val();
            if (isNaN(weight) || isNull(weight) || weight == 0){
                $(is).val('');
                $("#fpayamountinput").val('');
                return;
            }
//            if (eval(weight) > eval(fweight)){
//                $(is).val(fweight);
//            }
            var fpayamount=0;//开票金额
            $("#contractDetail tr").each(function () {
                var fprice = parseFloat($(this).find('input[data-name="fprice"]').val());
                var openWeight = $(this).find('input[data-name="openweight"]').val()==""?0:$(this).find('input[data-name="openweight"]').val();

                fpayamount = getRoundValue(fpayamount + parseFloat(fprice * openWeight),2);
            })

            $("#fpayamountinput").val(fpayamount==0?"":fpayamount);

            $(is).attr("name","openweight");
            $(is).siblings("input[data-name='scontractdetailid']").attr("name","scontractdetailid");
        }
    </script>

    <style type="text/css">
        .alert-danger {
            font-size: 12px;
            background: #fecccb;
            line-height: 50px;
            box-sizing: border-box;
            color: #ff0000;
            position: relative;
            padding-left: 20px;
            margin-bottom: 10px;
        }
        .alert-danger .close{
            position: absolute;
            right: 5px;
            top: 5px;
            background: none;
            border: none;
            font-size: 16px;
            color: red;
            width: 18px;
            height: 18px;
            background: #fff;
            border-radius: 50%;
            text-align: center;
            line-height: 18px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<sys:message content="${message}"/>
<form action="${ctx}/contract/contractRecepit.shtml" method="post" id="formx" enctype="multipart/form-data" novalidate="novalidate">

<div class="layui-collapse top10">
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">
            <c:if test="${itype==1}">开票信息</c:if>
            <c:if test="${itype==2}">收票信息</c:if>
        </h2>
        <div class="layui-colla-content layui-show">
            <%--<form class="layui-form" action="${ctx}/fund/billpay/buyBillPay.shtml" method="post" id="formx" enctype="multipart/form-data" novalidate="novalidate">--%>

                <input type="hidden" id="nullid">
                <input type="hidden" name="id" id="id" value="${contract.id }"/>
                <input type="hidden" name="itype" value="${itype}">
                <input type="hidden" name="fmaxamount" id="fmaxamount" value="${contract.fbuyerpaid-contract.finvoiceamount}"/>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">
                            <c:if test="${itype==1}">已收金额：</c:if>
                            <c:if test="${itype==2}">已付金额：</c:if>
                        </label>
                        <div class="layui-input-block">
                            <mw:format label="money" value="${contract.fbuyerpaid}"/>元
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">
                            <c:if test="${itype==1}">采购总额：</c:if>
                            <c:if test="${itype==2}">销售总额：</c:if>
                        </label>
                        <div class="layui-input-block">
                            <mw:format label="money" value="${contract.fmount}"/>元
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">
                            <c:if test="${itype==1}">已开票金额：</c:if>
                            <c:if test="${itype==2}">已收票金额：</c:if>
                        </label>
                        <div class="layui-input-block">
                            <mw:format label="money" value="${contract.finvoiceamount}"/>元
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">
                            <c:if test="${itype==1}">未开票金额：</c:if>
                            <c:if test="${itype==2}">未收票金额：</c:if>
                        </label>
                        <div class="layui-input-block">
                            <mw:format label="money" value="${contract.fbuyerpayable - contract.finvoiceamount}"/>元
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">
                            <c:if test="${itype==1}">开票金额：</c:if>
                            <c:if test="${itype==2}">收票金额：</c:if>
                        </label>
                        <div class="layui-input-block">
                            <input type="text" id="fpayamountinput" autocomplete="off" name="fpayamount" placeholder="" aria-required="true" aria-invalid="true" required class="layui-input required money" readonly="readonly" style="background: #f8f8f8">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">
                            <c:if test="${itype==1}">开票日期：</c:if>
                            <c:if test="${itype==2}">收票日期：</c:if>
                        </label>
                        <div class="layui-input-block">
                            <input type="text" id="dinvoicedate" name="dinvoicedate" placeholder="请选择日期" aria-required="true" aria-invalid="true" class="layui-input required" autocomplete="off" readonly="readonly"/>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">备注：</label>
                    <div class="layui-input-block">
                        <textarea placeholder="请输入备注" class="layui-textarea" id="sremark" name="sremark"></textarea>
                    </div>
                </div>

            <%--</form>--%>
        </div>
    </div>
</div>

<table class="layui-table" lay-size="sm" lay-filter="detail">
    <thead>
    <tr>
        <th lay-data="{field:'scommodityname', minWidth:150}">物资名称</th>
        <th lay-data="{field:'sspec', minWidth:150}">规格</th>
        <th lay-data="{field:'sproducer', minWidth:120}">生产厂家</th>
        <th lay-data="{field:'fweight', width:100,totalRow:true,align:'right'}">总数量</th>
        <th lay-data="{field:'fprice', width:100,align:'right'}">单价(元)</th>
        <th lay-data="{field:'famount', width:120,totalRow:true,align:'right'}">金额(元)</th>
        <th lay-data="{field:'fweight', width:100,totalRow:true,align:'right'}">合同量</th>
        <th lay-data="{field:'foutweight', width:100,totalRow:true,align:'right'}">交收量</th>
        <th lay-data="{field:'finvoiceweight', width:140,align:'right'}">
            <c:if test="${itype==1}">销项</c:if>
            <c:if test="${itype==2}">进项</c:if>
        </th>
        <th lay-data="{field:'foutamount', width:140,totalRow:true,align:'right'}">
            <c:if test="${itype==1}">未销项</c:if>
            <c:if test="${itype==2}">未进项</c:if>
        </th>
        <th lay-data="{field:'foutamount', width:140,totalRow:true,align:'right'}">
            <c:if test="${itype==1}">开票量(可输入)</c:if>
            <c:if test="${itype==2}">收票量(可输入)</c:if>
        </th>
    </tr>
    </thead>
    <tbody id="contractDetail">

    <c:forEach items="${contract.contractDetailList}" var="obj">
        <tr>
            <input type="hidden" data-name="fprice" value="${obj.fprice}">
            <td>${obj.scommodityname}</td>
            <td>${obj.sspec}</td>
            <td>${obj.sproducer}</td>
            <td>${obj.fweight}&nbsp;${obj.sweightunit}</td>
            <td><mw:format label="money" value="${obj.fprice}"/></td>
            <td><mw:format label="money" value="${obj.fweight*obj.fprice}"/></td>
            <td>${obj.fweight}</td>
            <td>${obj.foutweight}</td>
            <td>
                <c:if test="${itype==1}">
                    <mw:format label="weight2" value="${obj.fsaleweight - (obj.finvoiceweight==null?0:obj.finvoiceweight)}" format="#"/>
                </c:if>
                <c:if test="${itype==2}">
                    ${obj.finvoiceweight==null?0:obj.finvoiceweight}
                </c:if>
            </td>
            <td <c:if test="${obj.fweight - (obj.finvoiceweight==null?0:obj.finvoiceweight) ge 0}">style="color: #5FB878;"</c:if><c:if test="${obj.fweight - (obj.finvoiceweight==null?0:obj.finvoiceweight) le 0}">style="color: #f10214;"</c:if> ><mw:format label="weight2" value="${obj.fweight - (obj.finvoiceweight==null?0:obj.finvoiceweight)}" format="#"/></td>
            <td>
                <%--<c:choose>--%>
                    <%--<c:when test="${obj.fweight - (obj.finvoiceweight==null?0:obj.finvoiceweight) > 0}">--%>
                        <input type="hidden" data-name="scontractdetailid" value="${obj.id}">
                        <input onchange="calFpayamount('${obj.fweight - (obj.finvoiceweight==null?0:obj.finvoiceweight)}',this)" value="" type="text" data-name="openweight" class="layui-input" style='background: antiquewhite'>
                    <%--</c:when>--%>
                    <%--<c:otherwise>--%>
                        <%--<input data-name="openweight" value="0" type="text" class="layui-input" style='background: #f8f8f8;' readonly="readonly">--%>
                    <%--</c:otherwise>--%>
                <%--</c:choose>--%>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>附件<a id="addFile" class="layui-btn layui-btn-sm" style="margin-left: 20px;">添加附件</a><label id="doUploadFile"></label></legend>
</fieldset>

<table class="layui-table" lay-size="sm">
    <colgroup>
        <col width="40%">
        <col>
        <col width="10%">
    </colgroup>
    <thead>
    <tr>
        <th >附件</th>
        <th >说明</th>
        <th >操作</th>
    </tr>
    </thead>
    <tbody id="morefile">

    </tbody>
</table>
</form>
<script type="text/javascript">
    layui.use(['layer', 'laydate'], function () {
        var table = layui.table;

        table.init('detail', {
            //totalRow:true,
            limit: 10000 //注意：请务必确保 limit 参数（默认：10）是与你服务端限定的数据条数一致
        });
    })
</script>
</body>
</html>
