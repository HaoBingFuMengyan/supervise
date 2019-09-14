<%@ taglib prefix="member" uri="http://www.frogsing.com/tags/member" %>
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

    <link href="${ctxStatic}/layui-v2.4.2/layui/css/layui.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" href="${ctx}/css/layui-extend.css">
    <link rel="stylesheet" href="${ctxStatic}/css/common.css">
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
        var device;
        var form;
        layui.use(['form', 'layedit', 'laydate'], function () {
            device = layui.device();
            form = layui.form;
            form.verify({
//                required: function (value) {
//                    if (pub.isnull(value)) {
//                        return '这是必填项';
//                    }
//                }
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
                var value = othis.val(),verArr = ver.split("|");
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
    <form id="formInput" class="layui-form" action="${ctx}/hy/authapply/applyregister.json" method="post" enctype="multipart/form-data" autocomplete="on">
        <%--<input type="hidden" name="id" value="${data.id}"/>--%>
        <div class="layui-tab layui-tab-card">
            <div class="layui-tab-content height-100-perce">
                <div class="layui-tab-item layui-show">

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">企业名称<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="" value="" class="layui-input" lay-verify="required" placeholder="(必填项)" autocomplete="off" >
                            </div>
                        </div>

                        <div class="layui-inline">
                            <label class="layui-form-label">企业名称<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <member:MemberCardType op="select" name="ilegaltype" defname="请选择证件类型" defval="999"
                                                       option="class='form_control' lay-verify='required'"/>
                            </div>
                        </div>


                    </div>

                    <legend>法定/委派代表人信息</legend>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">姓名<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="" value="" class="layui-input" lay-verify="required" placeholder="(必填项)" autocomplete="off" >
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">手机号<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="" value="" class="layui-input" lay-verify="required" placeholder="(必填项)" autocomplete="off" >
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">邮箱<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="" value="" class="layui-input" lay-verify="required" placeholder="(必填项)" autocomplete="off" >
                            </div>
                        </div>
                    </div>

                    <legend>企业联系人信息</legend>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">姓名<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="" value="" class="layui-input" lay-verify="required" placeholder="(必填项)" autocomplete="off" >
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">手机号<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="" value="" class="layui-input" lay-verify="required" placeholder="(必填项)" autocomplete="off" >
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">邮箱<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="" value="" class="layui-input" lay-verify="required" placeholder="(必填项)" autocomplete="off" >
                            </div>
                        </div>
                    </div>

                    <legend>实际控制人联系信息</legend>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">姓名<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="" value="" class="layui-input" lay-verify="required" placeholder="(必填项)" autocomplete="off" >
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">手机号<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="" value="" class="layui-input" lay-verify="required" placeholder="(必填项)" autocomplete="off" >
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">邮箱<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="" value="" class="layui-input" lay-verify="required" placeholder="(必填项)" autocomplete="off" >
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">通讯地址<em class="red">*</em></label>
                        <div class="layui-input-block">
                            <input type="text" name="" value="" class="layui-input" lay-verify="required" placeholder="(必填项)" autocomplete="off" >
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
                                <input type="text" name="" value="" class="layui-input" lay-verify="required" placeholder="(必填项)" autocomplete="off" >
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">控制人关系图<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="" value="" class="layui-input" lay-verify="required" placeholder="(必填项)" autocomplete="off" >
                            </div>
                        </div>
                    </div>
                    <%--<div class="layui-form-item">--%>
                        <%--<div class="layui-inline layui-form-text">--%>
                            <%--<label class="layui-form-label">说明</label>--%>
                            <%--<div class="layui-input-inline layui-input-text">--%>
                                <%--<textarea class="layui-textarea" name="sdescription" id="sdescription">${data.sdescription}</textarea>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                </div>
            </div>
        </div>
    </form>
</div>

</body>
</html>