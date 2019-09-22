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

    <title>风险评估报告</title>
    <style>
        .layui-form-item{
            position: relative;
        }
        .layui-form-item input.delete{
            position: absolute;
            left: 0;
            top:10px;
            z-index: 1000;
        }
        .layui-form-label{
            width: 70px;
        }
        .layui-form-label-else{
            width: 120px;
        }
        .mytit{
            margin-top: 20px;
            margin-bottom: 20px;
            text-align: right;
            position: relative;
        }
        .mytit:after{
            position: absolute;
            content: '';
            left:0;
            right:0;
            top:15px;
            height: 1px;
            background: #f0f0f0;
            z-index: -1;
        }
        .mytit input{
            width: 200px;
            height: 28px;
            line-height: 28px;
            margin-right: 5px;
            padding-left: 10px;
        }
        .layui-block{
            display: table;
            width: 100%;
            padding: 20px 0 0 0;
        }
        .layui-block button{
            margin-bottom: 5px;
        }
        .layui-block textarea{
            width: 100%;
            min-height: 60px;
            border-radius: 4px;
            border:none;
            padding: 10px;
            box-sizing: border-box;
            margin-bottom: 5px;
            color:#666;
        }
        .my-block{
            padding: 20px;
            background: #f0f0f0;
            margin-bottom: 10px;
        }
    </style>
    <script type="text/javascript">
        var device;
        var form;

        layui.use(['form', 'layedit', 'upload', 'laydate','element'], function () {
            device = layui.device();
            form = layui.form;
            var layer = layui.layer
                ,layedit = layui.layedit
                ,laydate = layui.laydate;
            var $ = layui.jquery
                ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
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
    <form class="layui-form" action="${ctx}/hy/authapplyrisk/save.json" method="post" id="formx" onkeydown="if(event.keyCode==13) return false;" enctype="multipart/form-data" autocomplete="on">
        <input type="hidden" name="sauthapplyid" value="${id}">
        <div class="layui-tab">
            <ul class="layui-tab-title">
                <li class="layui-this">风险总评</li>
                <li>机构自身</li>
                <li>核心人员</li>
                <li>关联企业</li>
                <li>在管基金</li>
                <li>未备案的合伙企业</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label layui-form-label-else">风险评级</label>
                            <div class="layui-input-inline">
                                <select name="irisklevel" class="layui-input" lay-verify="required">
                                    <option value="0">优秀</option>
                                    <option value="1">良好</option>
                                    <option value="2">瑕疵</option>
                                    <option value="3">风险</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label layui-form-label-else">风险预警</label>
                            <div class="layui-input-inline">
                                <input type="text" name="idangernum" placeholder="风险预警数" class="layui-input" lay-verify="required" autocomplete="off"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label layui-form-label-else">整体评分</label>
                            <div class="layui-input-inline">
                                <input type="text" name="fscore" placeholder="(评分)" class="layui-input" lay-verify="required" autocomplete="off"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label layui-form-label-else">机构自身</label>
                            <div class="layui-input-inline">
                                <input type="text" name="fjgscore" placeholder="(评分)" class="layui-input" lay-verify="required" autocomplete="off"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label layui-form-label-else">核心人员</label>
                            <div class="layui-input-inline">
                                <input type="text" name="fhxscore" placeholder="(评分)" class="layui-input" lay-verify="required" autocomplete="off"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label layui-form-label-else">关联企业</label>
                            <div class="layui-input-inline">
                                <input type="text" name="fglqyscore" placeholder="(评分)" class="layui-input" lay-verify="required" autocomplete="off"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label layui-form-label-else">在管企业</label>
                            <div class="layui-input-inline">
                                <input type="text" name="fzgscore" placeholder="(评分)" class="layui-input" lay-verify="required" autocomplete="off"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label layui-form-label-else">未备案的合伙企业</label>
                            <div class="layui-input-inline">
                                <input type="text" name="fwbaqyscore" placeholder="(评分)" class="layui-input" lay-verify="required" autocomplete="off"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-tab-item">
                    <div class="mytit">
                        <input name="" placeholder="机构自身评分" /><input type="button" id="jg-addbtn" class="layui-btn layui-btn-warm layui-btn-sm" value="添加"/>
                    </div>
                    <div class="my-block">
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">机构名称</label>
                                <div class="layui-input-inline">
                                    <input name="jgMap[0].scnname" type="text" placeholder="(请输入)" class="layui-input" lay-verify="required" autocomplete="off"/>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">管理人资格</label>
                                <div class="layui-input-inline">
                                    <input name="jgMap[0].smanager" type="text" placeholder="(请输入)" class="layui-input" lay-verify="required" autocomplete="off"/>
                                </div>
                            </div>
                            <div class="layui-block">
                                <div class="jg">
                                    <input onclick="jgAdd('jg','0',this)" class="layui-btn layui-btn-sm" value="添加" />
                                    <input type="hidden" name="jgMap[0].sfList[0].iexceptiontype" value="0">
                                    <textarea name="jgMap[0].sfList[0].scontent" placeholder="请输入司法异常描述"></textarea>
                                </div>
                            </div>
                            <div id="jg-btn-2" class="layui-block">
                                <input class="layui-btn layui-btn-sm" value="添加" />
                                <input type="hidden" name="jgMap[0].sfList[1].iexceptiontype" value="1">
                                <textarea name="jgMap[0].sfList[1].scontent" placeholder="请输入行政处罚描述"></textarea>
                            </div>
                            <div id="jg-btn-3" class="layui-block">
                                <input class="layui-btn layui-btn-sm" value="添加" />
                                <input type="hidden" name="jgMap[0].sfList[2].iexceptiontype" value="2">
                                <textarea name="jgMap[0].sfList[2].scontent" placeholder="请输入异常经营描述"></textarea>
                            </div>
                            <div id="jg-btn-4" class="layui-block">
                                <input class="layui-btn layui-btn-sm" value="添加" />
                                <input type="hidden" name="jgMap[0].sfList[3].iexceptiontype" value="3">
                                <textarea name="jgMap[0].sfList[3].scontent" placeholder="请输入涉诉情况"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-tab-item">
                    <div class="mytit">
                        <input placeholder="核心人员" /><button type="button" id="addbtn1" class="layui-btn layui-btn-warm layui-btn-sm">添加</button>
                    </div>
                    <div class="my-block">
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">姓名</label>
                                <div class="layui-input-inline">
                                    <input type="text" placeholder="(请输入)" class="layui-input" lay-verify="required" autocomplete="off"/>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">身份</label>
                                <div class="layui-input-inline">
                                    <input type="text" placeholder="(请输入)" class="layui-input" lay-verify="required" autocomplete="off"/>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">证件号</label>
                                <div class="layui-input-inline">
                                    <input type="text" placeholder="(请输入)" class="layui-input" lay-verify="required" autocomplete="off"/>
                                </div>
                            </div>
                            <div class="layui-block">
                                <button class="layui-btn layui-btn-sm">添加</button>
                                <textarea>请输入司法异常描述...</textarea>
                            </div>
                            <div class="layui-block">
                                <button class="layui-btn layui-btn-sm">添加</button>
                                <textarea>请输入行政处罚描述...</textarea>
                            </div>
                            <div class="layui-block">
                                <button class="layui-btn layui-btn-sm">添加</button>
                                <textarea>请输入涉诉情况...</textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-tab-item">
                    <div class="mytit">
                        <input placeholder="关联企业" /><button type="button" id="addbtn2" class="layui-btn layui-btn-warm layui-btn-sm">添加</button>
                    </div>
                    <div class="my-block">
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">名称</label>
                                <div class="layui-input-inline">
                                    <input type="text" placeholder="(请输入)" class="layui-input" lay-verify="required" autocomplete="off"/>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">身份</label>
                                <div class="layui-input-inline">
                                    <input type="text" placeholder="(请输入)" class="layui-input" lay-verify="required" autocomplete="off"/>
                                </div>
                            </div>
                            <div class="layui-block">
                                <button class="layui-btn layui-btn-sm">添加</button>
                                <textarea>请输入司法异常描述...</textarea>
                            </div>
                            <div class="layui-block">
                                <button class="layui-btn layui-btn-sm">添加</button>
                                <textarea>请输入行政处罚描述...</textarea>
                            </div>
                            <div class="layui-block">
                                <button class="layui-btn layui-btn-sm">添加</button>
                                <textarea>请输入异常经营描述...</textarea>
                            </div>
                            <div class="layui-block">
                                <button class="layui-btn layui-btn-sm">添加</button>
                                <textarea>请输入涉诉情况...</textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-tab-item">
                    <div class="mytit">
                        <input placeholder="在管基金" /><button type="button" id="addbtn3" class="layui-btn layui-btn-warm layui-btn-sm">添加</button>
                    </div>
                    <div class="my-block">
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">名称</label>
                                <div class="layui-input-inline">
                                    <input type="text" placeholder="(请输入)" class="layui-input" lay-verify="required" autocomplete="off"/>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">类型</label>
                                <div class="layui-input-inline">
                                    <input type="text" placeholder="(请输入)" class="layui-input" lay-verify="required" autocomplete="off"/>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">托管方</label>
                                <div class="layui-input-inline">
                                    <input type="text" placeholder="(请输入)" class="layui-input" lay-verify="required" autocomplete="off"/>
                                </div>
                            </div>
                            <div class="layui-block">
                                <button class="layui-btn layui-btn-sm">添加</button>
                                <textarea>请输入披露异常描述...</textarea>
                            </div>
                            <div class="layui-block">
                                <button class="layui-btn layui-btn-sm">添加</button>
                                <textarea>请输入清算异常描述...</textarea>
                            </div>
                            <div class="layui-block">
                                <button class="layui-btn layui-btn-sm">添加</button>
                                <textarea>请输入可疑交易情况...</textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-tab-item">
                    <div class="mytit">
                        <input placeholder="管理的未备案合伙企业" /><button type="button" id="addbtn4" class="layui-btn layui-btn-warm layui-btn-sm">添加</button>
                    </div>
                    <div class="my-block">
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">名称</label>
                                <div class="layui-input-inline">
                                    <input type="text" placeholder="(请输入)" class="layui-input" lay-verify="required" autocomplete="off"/>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">成立时间</label>
                                <div class="layui-input-inline">
                                    <input type="text" placeholder="(请输入)" class="layui-input" lay-verify="required" autocomplete="off"/>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">合伙人数量</label>
                                <div class="layui-input-inline">
                                    <input type="text" placeholder="(请输入)" class="layui-input" lay-verify="required" autocomplete="off"/>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">自然人合伙人数量</label>
                                <div class="layui-input-inline">
                                    <input type="text" placeholder="(请输入)" class="layui-input" lay-verify="required" autocomplete="off"/>
                                </div>
                            </div>
                            <div class="layui-block">
                                <button class="layui-btn layui-btn-sm">添加</button>
                                <textarea>请输入对外投资情况描述...</textarea>
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