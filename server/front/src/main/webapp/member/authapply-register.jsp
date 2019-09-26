<%@ taglib prefix="member" uri="http://www.frogsing.com/tags/member" %>
<%@ taglib prefix="cs" uri="http://www.frogsing.com/tags/parameter" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="keywords" content="基金协同监管系统"/>
    <meta name="description" content="基金协同监管系统"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="decorator" charset="" content="none">
    <script src="${ctxStatic}/jquery/jquery-1.9.1.js" type="text/javascript"></script>
    <script src="${ctxStatic}/common/common.js" type="text/javascript"></script>
    <script src="${ctxStatic}/layui-v2.4.2/layui/layui.js" type="text/javascript"></script>

    <link href="${ctxStatic}/layui-v2.4.2/layui/css/layui.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" href="${ctx}/css/layui-extend.css">
    <link rel="stylesheet" href="${ctxStatic}/css/common.css">
    <title></title>
    <style>
        .layui-form-item .layui-input-inline {
            width: 270px;
        }

        .layui-textarea {
            width: 89%;
        }

        .layui-input-sm {
            height: 30px;
        }
    </style>
    <script type="text/javascript">
        var device;
        var form;
        layui.use(['form', 'layedit', 'upload', 'laydate'], function () {
            device = layui.device();
            form = layui.form;
            form.verify({
//                required: function (value) {
//                    if (pub.isnull(value)) {
//                        return '这是必填项';
//                    }
//                }
            });
            var layupload = layui.upload;

            //执行实例
            layupload.render({
                elem: '#yyzz'
                , url: '${ctx}/file/uploadfile.json'
                , accept: 'file'
                , multiple: true
                , auto: false
                , field: "upfile"
                , data: {path: '/Member'}
                , choose: function (obj) {
                    var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
                    obj.preview(function (index, file, result) {
                        obj.upload(index, file);
                    });
                }
                , before: function (obj) { //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
                    layer.load(1); //上传loading
                }
                , allDone: function (obj) {
                    layer.closeAll('loading'); //关闭loadin
                }
                , done: function (res, index, upload) {
                    if (res.state == "SUCCESS") { //上传成功

                        $("#yyzz").attr('src','<cs:SysParaType imgurl="1" op="syspara"/>'+res.url);
                        $("#sbusinessno").val(res.url);
                        return delete this.files[index]; //删除文件队列已经上传成功的文件
                    } else {
                        layer.msg(res.original + "上传失败，失败原因：" + res.state);
                        this.error(index, upload);
                    }
                }
                , error: function (index, upload) {
                    layer.closeAll('loading'); //关闭loadin
                    return delete this.files[index]; //删除文件队列已经上传成功的文件
                }
            });

            layupload.render({
                elem: '#cnh'
                , url: '${ctx}/file/uploadfile.json'
                , accept: 'file'
                , multiple: true
                , auto: false
                , field: "upfile"
                , data: {path: '/Member'}
                , choose: function (obj) {
                    var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
                    obj.preview(function (index, file, result) {
                        obj.upload(index, file);
                    });
                }
                , before: function (obj) { //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
                    layer.load(1); //上传loading
                }
                , allDone: function (obj) {
                    layer.closeAll('loading'); //关闭loadin
                }
                , done: function (res, index, upload) {
                    if (res.state == "SUCCESS") { //上传成功

                        $("#cnh").attr('src','<cs:SysParaType imgurl="1" op="syspara"/>'+res.url);
                        $('#scnuno').val(res.url);
                        return delete this.files[index]; //删除文件队列已经上传成功的文件
                    } else {
                        layer.msg(res.original + "上传失败，失败原因：" + res.state);
                        this.error(index, upload);
                    }
                }
                , error: function (index, upload) {
                    layer.closeAll('loading'); //关闭loadin
                    return delete this.files[index]; //删除文件队列已经上传成功的文件
                }
            });

            layupload.render({
                elem: '#gxt'
                , url: '${ctx}/file/uploadfile.json'
                , accept: 'file'
                , multiple: true
                , auto: false
                , field: "upfile"
                , data: {path: '/Member'}
                , choose: function (obj) {
                    var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
                    obj.preview(function (index, file, result) {
                        obj.upload(index, file);
                    });
                }
                , before: function (obj) { //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
                    layer.load(1); //上传loading
                }
                , allDone: function (obj) {
                    layer.closeAll('loading'); //关闭loadin
                }
                , done: function (res, index, upload) {
                    if (res.state == "SUCCESS") { //上传成功

                        $("#gxt").attr('src','<cs:SysParaType imgurl="1" op="syspara"/>'+res.url);
                        $('#sgxrtno').val(res.url);
                        return delete this.files[index]; //删除文件队列已经上传成功的文件
                    } else {
                        layer.msg(res.original + "上传失败，失败原因：" + res.state);
                        this.error(index, upload);
                    }
                }
                , error: function (index, upload) {
                    layer.closeAll('loading'); //关闭loadin
                    return delete this.files[index]; //删除文件队列已经上传成功的文件
                }
            });
        });

        function valiForm() {//仿照源码写的校验，返回布尔类型
            var verify = form.config.verify, stop = null
                , DANGER = 'layui-form-danger', field = {}, elem = $('.layui-form')
                , verifyElem = elem.find('*[lay-verify]') //获取需要校验的元素
                , formElem = elem //获取当前所在的form元素，如果存在的话
                , fieldElem = elem.find('input,select,textarea') //获取所有表单域
                , filter = '*'; //获取过滤器

            //开始校验  可以支持多规则校验,例：lay-verify="required|number|phone"
            layui.each(verifyElem, function (_, item) {
                var othis = $(this), ver = othis.attr('lay-verify'), tips = '', isExecue = false;
                var value = othis.val(), verArr = ver.split("|");
                $.each(verArr, function (index, val) {
                    var isFn = typeof verify[val] === 'function';
                    othis.removeClass(DANGER);
                    if (verify[val] && (isFn ? tips = verify[val](value, item) : !verify[val][0].test(value))) {
//                    layer.msg(tips || verify[val][1], {
//                        icon: 5
//                        , shift: 6
//                    });
                        layer.tips(tips || verify[val][1], othis);
                        //非移动设备自动定位焦点
                        if (!device.android && !device.ios) {
                            item.focus();
                        }
                        othis.addClass(DANGER);
                        return isExecue = true;
                    }
                });

                if (isExecue)
                    return stop = true;

            });

            if (stop) {
                return false;
            }
            else {
                return true;
            }
        };
    </script>
</head>
<body>
<div class="mbody">
    <form id="formx" class="layui-form" action="${ctx}/hy/authapply/applyregister.json" method="post"
          enctype="multipart/form-data" autocomplete="on">
        <input type="hidden" name="id" value="${data.id}"/>
        <div class="layui-tab layui-tab-card">
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">企业名称<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="scnname" id="scnname" value="${data.scnname}" class="layui-input" lay-verify="required"
                                       placeholder="(必填项)" autocomplete="off">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">通讯地址<em class="red">*</em></label>
                        <div class="layui-input-block">
                            <input type="text" name="sbusaddress" id="sbusaddress" value="${data.sbusaddress}" class="layui-input" lay-verify="required" style="width: 98.6%;"
                                   placeholder="(必填项)" autocomplete="off">
                        </div>
                    </div>
                    <fieldset class="layui-elem-field layui-field-title">
                        <legend>法定代表人/委派代表信息</legend>
                    </fieldset>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">名称<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="sfdlinkman" id="sfdlinkman" value="${data.sfdlinkman}" class="layui-input" lay-verify="required"
                                       placeholder="(必填项)" autocomplete="off">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">手机号<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="sfdsmobile" id="sfdsmobile" value="${data.sfdsmobile}" class="layui-input" lay-verify="required"
                                       placeholder="(必填项)" autocomplete="off">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">邮箱<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="sfdemail" id="sfdemail" value="${data.sfdemail}" class="layui-input" lay-verify="required"
                                       placeholder="(必填项)" autocomplete="off">
                            </div>
                        </div>
                    </div>
                    <fieldset class="layui-elem-field layui-field-title">
                        <legend>企业联系人信息</legend>
                    </fieldset>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">名称<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="slinkman" id="slinkman" value="${data.slinkman}" class="layui-input" lay-verify="required"
                                       placeholder="(必填项)" autocomplete="off">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">手机号<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="smobile" id="smobile" value="${data.smobile}" class="layui-input" lay-verify="required"
                                       placeholder="(必填项)" autocomplete="off">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">邮箱<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="semail" id="semail" value="${data.semail}" class="layui-input" lay-verify="required"
                                       placeholder="(必填项)" autocomplete="off">
                            </div>
                        </div>
                    </div>
                    <fieldset class="layui-elem-field layui-field-title">
                         <legend>实际控制人联系信息</legend>
                    </fieldset>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">名称<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="skzrlinkman" id="skzrlinkman" value="${data.skzrlinkman}" class="layui-input" lay-verify="required"
                                       placeholder="(必填项)" autocomplete="off">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">手机号<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="skzrsmobile" id="skzrsmobile" value="${data.skzrsmobile}" class="layui-input" lay-verify="required"
                                       placeholder="(必填项)" autocomplete="off">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">邮箱<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="skzremail" id="skzremail" value="${data.skzremail}" class="layui-input" lay-verify="required"
                                       placeholder="(必填项)" autocomplete="off">
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">营业执照<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="hidden" name="sbusinessno" id="sbusinessno" value="${data.sbusinessno}" class="layui-input" lay-verify="required"
                                           placeholder="(必填项)" autocomplete="off">
                                <c:if test="${data.sbusinessno == null}">
                                    <img src="${ctx}/images/upload-file.jpg" width="200" height="200" alt="" id="yyzz">
                                </c:if>
                                <c:if test="${data.sbusinessno != null}">
                                    <img src="<cs:SysParaType imgurl="1" op="syspara"/>${data.sbusinessno}" width="200" height="200" alt="" id="yyzz">
                                </c:if>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">承诺函<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="hidden" name="scnuno" id="scnuno" value="${data.scnuno}" class="layui-input" lay-verify="required"
                                       placeholder="(必填项)" autocomplete="off">
                                <c:if test="${data.scnuno == null}">
                                    <img src="${ctx}/images/upload-file.jpg" width="200" height="200" alt="" id="cnh">
                                </c:if>
                                <c:if test="${data.scnuno != null}">
                                    <img src="<cs:SysParaType imgurl="1" op="syspara"/>${data.scnuno}" width="200" height="200" alt="" id="cnh">
                                </c:if>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">控制人关系图<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="hidden" name="sgxrtno" id="sgxrtno" value="${data.sgxrtno}" class="layui-input" lay-verify="required"
                                       placeholder="(必填项)" autocomplete="off">
                                <c:if test="${data.sgxrtno == null}">
                                    <img src="${ctx}/images/upload-file.jpg" width="200" height="200" alt="" id="gxt">
                                </c:if>
                                <c:if test="${data.sgxrtno != null}">
                                    <img src="<cs:SysParaType imgurl="1" op="syspara"/>${data.sgxrtno}" width="200" height="200" alt="" id="gxt">
                                </c:if>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </form>
</div>

</body>
</html>