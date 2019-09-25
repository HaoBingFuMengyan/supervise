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
    <title>添加</title>
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

            laydate.render({
                elem: '#dsetdate',
                trigger: 'click'
            });
            laydate.render({
                elem: '#beian',
                trigger: 'click'
            });
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
    <form class="layui-form" action="${ctx }/hy/authapplyriskdetail/add.json" method="post" id="formx"
          onkeydown="if(event.keyCode==13) return false;"
          enctype="multipart/form-data" autocomplete="on">
        <input type="hidden" name="id" value="${id}">
        <input type="hidden" name="irisktype" value="${irisktype}">
        <input type="hidden" name="type" value="${type}">
        <div class="layui-tab layui-tab-card">
            <div class="layui-tab-content">
                <div id="projectInfo" class="layui-tab-item layui-show">
                    <c:choose>
                        <c:when test="${irisktype eq 0}"><%--机构自身--%>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">机构名称<em class="red">*</em></label>
                                    <div class="layui-input-inline">
                                        <input type="text" id="scnname" name="scnname" placeholder="(必填项)"
                                               class="layui-input" lay-verify="required" autocomplete="off"/>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">管理人资格</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="smanager" id="smanager"
                                               class="layui-input" autocomplete="off"/>
                                    </div>
                                </div>
                            </div>
                        </c:when>
                        <c:when test="${irisktype eq 1}"><%--核心人员--%>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">姓名<em class="red">*</em></label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="sname" placeholder="(必填项)"
                                               class="layui-input" lay-verify="required" autocomplete="off"/>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">身份<em class="red">*</em></label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="scard" placeholder="(必填项)"
                                               class="layui-input" lay-verify="required" autocomplete="off"/>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">证件号<em class="red">*</em></label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="scardno" placeholder="(必填项)"
                                               class="layui-input" lay-verify="required" autocomplete="off"/>
                                    </div>
                                </div>
                            </div>
                        </c:when>
                        <c:when test="${irisktype eq 2}"><%--关联企业--%>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">机构名称<em class="red">*</em></label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="scnname" placeholder="(必填项)"
                                               class="layui-input" lay-verify="required" autocomplete="off"/>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">身份<em class="red">*</em></label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="scard" placeholder="(必填项)"
                                               class="layui-input" lay-verify="required" autocomplete="off"/>
                                    </div>
                                </div>
                            </div>
                        </c:when>
                        <c:when test="${irisktype eq 3}"><%--在管企业--%>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">名称<em class="red">*</em></label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="scnname" placeholder="(必填项)"
                                               class="layui-input" lay-verify="required" autocomplete="off"/>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">类型<em class="red">*</em></label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="stype" placeholder="(必填项)"
                                               class="layui-input" lay-verify="required" autocomplete="off"/>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">托管方<em class="red">*</em></label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="strustname" placeholder="(必填项)"
                                               class="layui-input" lay-verify="required" autocomplete="off"/>
                                    </div>
                                </div>
                            </div>
                        </c:when>
                        <c:when test="${irisktype eq 4}"><%--未备案企业--%>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">名称<em class="red">*</em></label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="scnname" placeholder="(必填项)"
                                               class="layui-input" lay-verify="required" autocomplete="off"/>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">成立时间<em class="red">*</em></label>
                                    <div class="layui-input-inline">
                                        <input type="text" id="dsetdate" name="dsetdate" placeholder="(必填项)" readonly
                                               class="layui-input" lay-verify="required" autocomplete="off"/>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">合伙人数量<em class="red">*</em></label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="fnum" placeholder="(必填项)"
                                               class="layui-input" lay-verify="required" autocomplete="off"/>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">自然合伙人数量<em class="red">*</em></label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="fnaturalnum" placeholder="(必填项)"
                                               class="layui-input" lay-verify="required" autocomplete="off"/>
                                    </div>
                                </div>
                            </div>
                        </c:when>
                        <c:when test="${irisktype eq 5}"><%--管理人合规性--%>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">机构名称<em class="red">*</em></label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="scnname" placeholder="(必填项)"
                                               class="layui-input" lay-verify="required" autocomplete="off"/>
                                    </div>
                                </div>
                            </div>
                        </c:when>
                        <c:when test="${irisktype eq 6}"><%--基金运作情况--%>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">名称<em class="red">*</em></label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="sname" placeholder="(必填项)"
                                               class="layui-input" lay-verify="required" autocomplete="off"/>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">备案日期<em class="red">*</em></label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="dsetdate" id="beian" placeholder="(必填项)" readonly
                                               class="layui-input" lay-verify="required" autocomplete="off"/>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">托管方<em class="red">*</em></label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="strustname" placeholder="(必填项)"
                                               class="layui-input" lay-verify="required" autocomplete="off"/>
                                    </div>
                                </div>
                            </div>
                        </c:when>
                        <c:when test="${irisktype eq 7}"><%--风险预警--%>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">预警数<em class="red">*</em></label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="iwarnnum" placeholder="(必填项)"
                                               class="layui-input" lay-verify="required" autocomplete="off"/>
                                    </div>
                                </div>
                            </div>
                        </c:when>
                    </c:choose>
                </div>
            </div>

        </div>
    </form>

</div>
</body>
</html>