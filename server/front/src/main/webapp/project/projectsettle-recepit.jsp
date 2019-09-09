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

                jj.validate("#formx");

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

    </script>


</head>
<body>
<sys:message content="${message}"/>
<form action="${ctx}/ht/receiptInfo/receiptinfo.shtml" method="post" id="formx" >

<div class="layui-collapse top10">
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">开票信息</h2>
        <div class="layui-colla-content layui-show">
            <%--<form class="layui-form" action="${ctx}/fund/billpay/buyBillPay.shtml" method="post" id="formx" enctype="multipart/form-data" novalidate="novalidate">--%>

                <input type="hidden" name="sbillid" id="id" value="${projectSettle.id }"/>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">
                            已收金额：
                        </label>
                        <div class="layui-input-block">
                            <mw:format label="money" value="${projectSettle.frealamount}"/>元
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">
                            已开票金额：
                        </label>
                        <div class="layui-input-block">
                            <mw:format label="money" value="${projectSettle.finvoiceamount}"/>元
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">
                            未开票金额：
                        </label>
                        <div class="layui-input-block">
                            <mw:format label="money" value="${projectSettle.frealamount - projectSettle.finvoiceamount}"/>元
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">开票金额：</label>
                        <div class="layui-input-block">
                            <input type="number"  autocomplete="off" name="finvoiceamount" required class="layui-input required money">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">
                            开票日期：
                        </label>
                        <div class="layui-input-block">
                            <input type="text" id="dinvoicedate" name="dinvoicedate" placeholder="请选择日期" class="layui-input required"  readonly="readonly"/>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">备注：</label>
                    <div class="layui-input-block">
                        <textarea placeholder="请输入备注" class="layui-textarea"  name="sremark"></textarea>
                    </div>
                </div>

            <%--</form>--%>
        </div>
    </div>
</div>



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

</body>
</html>
