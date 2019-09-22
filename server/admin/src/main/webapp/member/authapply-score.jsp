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
    <title>风险总评</title>
    <style>
        .layui-form-item {
            position: relative;
        }

        .layui-form-item input.delete {
            position: absolute;
            left: 0;
            top: 10px;
            z-index: 1000;
        }

        .red {
            color: red;
        }
    </style>
    <script type="text/javascript">
        var device;
        var form;

        layui.use(['form', 'layedit', 'upload', 'laydate'], function () {
            device = layui.device();
            form = layui.form;
            var layer = layui.layer
                , layedit = layui.layedit
                , laydate = layui.laydate;

            form.verify({
//                required: function (value) {
//                    if (pub.isnull(value)) {
//                        return '这是必填项';
//                    }
//                }
            });

            var layupload = layui.upload;

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
    <mw:msg/>
    <form class="layui-form" action="${ctx }/hy/authapply/score.json" method="post" id="formx"
          onkeydown="if(event.keyCode==13) return false;"
          enctype="multipart/form-data" autocomplete="on">
        <input type="hidden" name="id" value="${data.id}">
        <div class="layui-tab layui-tab-card">
            <div class="layui-tab-content">
                <div id="projectInfo" class="layui-tab-item layui-show">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">机构自身<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="fjgscore" placeholder="(必填项)" value="${data.fjgscore}"
                                       class="layui-input" lay-verify="required" autocomplete="off"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">核心人员<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="fhxscore" placeholder="(必填项)" value="${data.fhxscore}"
                                       class="layui-input" lay-verify="required" autocomplete="off"/>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">关联企业<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="fglqyscore" id="fglqyscore" placeholder="(必填项)" lay-verify="required"
                                       class="layui-input" autocomplete="off" value="${data.fglqyscore}"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">在管基金<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="fzgjjscore" id="fzgjjscore" placeholder="(必填项)" lay-verify="required"
                                       class="layui-input" autocomplete="off" value="${data.fzgjjscore}"/>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">未备案合伙企业<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="fwbascore" id="fwbascore" placeholder="(必填项)" lay-verify="required"
                                       class="layui-input" autocomplete="off" value="${data.fwbascore}"/>
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