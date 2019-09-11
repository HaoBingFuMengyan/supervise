<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
    <meta name="decorator" content="jj"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>合同审批</title>
    <style>
        .layui-form-item .layui-input-inline {
            width: 270px ;
        }
        .layui-textarea{
            width:89%;
        }
        .layui-input-sm{
            height: 30px;
        }
    </style>
    <script type="text/javascript">
        layui.use(['layer', 'laydate','upload','form','element'], function () {
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
                ,data:{path:'/billpay'}
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
                            '<input type="hidden" name="files['+index+'].sfileid" value=""/>' +
                            '<input type="hidden" name="files['+index+'].sfilename" value="'+res.original+'"/>' +
                            '<input type="hidden" name="files['+index+'].sfilepath" value="'+res.path+'"/> '+ res.original +'</td>'
                            ,'<td><input type="text" name="files['+index+'].sfileremark" autocomplete="off" class="layui-input layui-input-sm"/></td>'
                            ,'<td>'
                            ,'<a class="layui-abtn demo-delete">删除</a>'
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

            var form = layui.form;
            form.on('submit(formDemo)', function (data) {
            });
        });

        jj.validate("#formx",{});
    </script>
</head>
<body>
<div class="mbody">
    <mw:msg/>
    <form class="layui-form" action="${ctx}/fund/billpay/approval.json" method="post" id="formx" onkeydown="if(event.keyCode==13) return false;"
          enctype="multipart/form-data" autocomplete="on">
        <div class="layui-tab layui-tab-card">

            <div class="layui-tab-content" style="height: 100%;">
                <div class="layui-tab-item layui-show">
                    <input type="hidden" name="id" value="${obj.id}">

                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                        <legend>审批流</legend>
                    </fieldset>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">
                                名称
                            </label>
                            <div class="layui-input-block">
                                <input type="text" id="sname" name="sname" autocomplete="off" placeholder="请输入名称" value="“基金协同监管系统沟通”煤炭生产综合服务平台<c:choose><c:when test="${obj.spaymemberid == mw:user().memberId}">采购</c:when><c:otherwise>销售</c:otherwise></c:choose>合同" readonly="readonly" class="layui-input" />
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">
                                领款单位全称
                            </label>
                            <div class="layui-input-block">
                                <input type="text" id="ssignbody" name="ssignbody" autocomplete="off" placeholder="请输入主体" value="<c:choose><c:when test="${obj.spaymemberid == mw:user().memberId}">${obj.sacceptmeb.scnname}</c:when><c:otherwise>${obj.ssendmeb.scnname}</c:otherwise></c:choose>" readonly="readonly" class="layui-input" />
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">
                                金额（元）
                            </label>
                            <div class="layui-input-block">
                                <input type="text" autocomplete="off" placeholder="请输入金额" value="<mw:format label="money" value="${obj.famount}"/>" readonly="readonly" class="layui-input" />
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">
                                收款人全称
                            </label>
                            <div class="layui-input-block">
                                <input type="text" autocomplete="off" value="<c:choose><c:when test="${obj.spaymemberid == mw:user().memberId}">${obj.sacceptmeb.sopenname}</c:when><c:otherwise>${obj.ssendmeb.sopenname}</c:otherwise></c:choose>" readonly="readonly" class="layui-input" />
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">
                                开户行
                            </label>
                            <div class="layui-input-block">
                                <input type="text" autocomplete="off" value="<c:choose><c:when test="${obj.spaymemberid == mw:user().memberId}">${obj.sacceptmeb.sopenbank}</c:when><c:otherwise>${obj.ssendmeb.sopenbank}</c:otherwise></c:choose>" readonly="readonly" class="layui-input" />
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">
                                账号
                            </label>
                            <div class="layui-input-block">
                                <input type="text" autocomplete="off" value="<c:choose><c:when test="${obj.spaymemberid == mw:user().memberId}">${obj.sacceptmeb.sopenaccount}</c:when><c:otherwise>${obj.ssendmeb.sopenaccount}</c:otherwise></c:choose>" readonly="readonly" class="layui-input" />
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">支付事由</label>
                        <div class="layui-input-block">
                            <textarea placeholder="请输入资信简介" class="layui-textarea" id="screditbrief" name="screditbrief"></textarea>
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

                </div>


            </div>

        </div>
    </form>

</div>

</body>
</html>
