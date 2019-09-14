<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="keywords" content="基金协同监管系统"/>
    <meta name="description" content="基金协同监管系统"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="decorator" charset="" content="jj">
    <title>订单发起-煤亮子</title>
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
        layui.use(['layer', 'laydate', 'upload', 'form', 'element'], function () {
            var laydate = layui.laydate;
            layer = layui.layer;
            //日期
            laydate.render({
                elem: '#dintereststart',
                trigger: 'click'
            })

            var layupload = layui.upload;


            //执行实例
            var uploadListIns = layupload.render({
                elem: '#addFile'
                , url: '${ctx}/file/uploadfile.json'
                , accept: 'file'
                , multiple: true
                , auto: false
                , field: "upfile"
                , data: {path: '/Member'}
                , choose: function (obj) {
                    var files = this.files = obj.pushFile(); //将每次填择的文件追加到文件队列
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
                        var tr = $(['<tr id="upload-' + index + '">'
                            , '<td>' +
                            '<input type="hidden" name="files[' + index + '].sfileid" value=""/>' +
                            '<input type="hidden" name="files[' + index + '].sfilename" value="' + res.original + '"/>' +
                            '<input type="hidden" name="files[' + index + '].sfilepath" value="' + res.path + '"/> ' + res.original + '</td>'
                            , '<td><input type="text" name="files[' + index + '].sfileremark" autocomplete="off" class="layui-input layui-input-sm"/></td>'
                            , '<td>'
                            , '<a class="layui-abtn demo-delete">删除</a>'
                            , '</td>'
                            , '</tr>'].join(''));
                        //删除
                        tr.find('.demo-delete').on('click', function () {
                            tr.remove();
                            uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可填
                        });

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

            var form = layui.form;
            form.on('submit(formDemo)', function (data) {

            });

        });

        $().ready(function () {

            $("#morefile").delegate('a', 'click', function () {
                $(this).parent().parent().remove();
            });

        });

        jj.validate("#formx");

    </script>
</head>
<body>
<div class="mbody">
    <mw:msg/>
    <form class="layui-form" action="${ctx }/hy/authapply/applyregister.json" method="post" id="formx"
          onkeydown="if(event.keyCode==13) return false;"
          enctype="multipart/form-data" autocomplete="on">
        <div class="layui-tab layui-tab-card">
            <ul class="layui-tab-title">
                <li class="layui-this">企业补充信息</li>
            </ul>
            <div class="layui-tab-content" style="height: 100%;">
                <div id="projectInfo" class="layui-tab-item layui-show">
                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                        <legend>企业参数</legend>
                    </fieldset>
                    <input type="hidden" id="id" name="id" value="${id}"/>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">企业名称<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="" value="" placeholder="(必填项)" class="layui-input required" autocomplete="off"/>
                            </div>
                        </div>
                    </div>

                    <legend>法定/委派代表人信息</legend>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">姓名<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="" value="" placeholder="(必填项)" class="layui-input required" autocomplete="off"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">手机号<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="" value="" placeholder="(必填项)" class="layui-input required" autocomplete="off"/>
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">邮箱<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="" value="" placeholder="(必填项)" class="layui-input required" autocomplete="off"/>
                            </div>
                        </div>
                    </div>

                    <legend>企业联系人信息</legend>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">姓名<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="" value="" placeholder="(必填项)" class="layui-input required" autocomplete="off"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">手机号<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="" value="" placeholder="(必填项)" class="layui-input required" autocomplete="off"/>
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">邮箱<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="" value="" placeholder="(必填项)" class="layui-input required" autocomplete="off"/>
                            </div>
                        </div>
                    </div>

                    <legend>实际控制人联系信息</legend>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">姓名<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="" value="" placeholder="(必填项)" class="layui-input required" autocomplete="off"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">手机号<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="" value="" placeholder="(必填项)" class="layui-input required" autocomplete="off"/>
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">邮箱<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="" value="" placeholder="(必填项)" class="layui-input required" autocomplete="off"/>
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">通讯地址<em class="red">*</em></label>
                        <div class="layui-input-block">
                            <input type="text" name="" value="" placeholder="(必填项)" class="layui-input required" autocomplete="off"/>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">营业执照<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <a id="addFile" class="layui-btn layui-btn-sm"
                                   style="margin-left: 20px;">添加附件</a>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">承诺函<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="" value="" placeholder="(必填项)" class="layui-input required" autocomplete="off"/>
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">控制人关系图<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="" value="" placeholder="(必填项)" class="layui-input required" autocomplete="off"/>
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