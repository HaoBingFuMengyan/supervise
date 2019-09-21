<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="sys" uri="http://www.frogsing.com/tags/frontsys" %>
<%@ taglib prefix="member" uri="http://www.frogsing.com/tags/member" %>
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
    <title>有限责任公司拟备案为私募基金管理人</title>
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
    </style>
    <script type="text/javascript">
        var device;
        var form;

        layui.use(['form', 'layedit', 'upload', 'laydate'], function () {
            device = layui.device();
            form = layui.form;
            form.verify({
                money500: function (value) {
                    if (value < 500) {
                        return '注册资金必须大于等于500万';
                    }
                }
            });

            var layer = layui.layer
                ,layedit = layui.layedit
                ,laydate = layui.laydate;

            var layupload = layui.upload;

            form.on('select(iauthapplysource)', function(data){

                if(data.value == 20){
                    $('#iauthapplysource').after('<div class="layui-inline" id="scnname"><label class="layui-form-label">企业名称<em class="red">*</em></label>'
                        + '<div class="layui-input-inline"><input type="text" name="scnname" placeholder="(必填项)" class="layui-input" lay-verify="required" autocomplete="off"/></div></div>');
                }else {
                    $('#scnname').remove();
                }

            })

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

        //校验是否否和申请条件
        function check() {
            var iregmoney = isNaN(new Number($('#iregmoney').val())) ? 0 : new Number($('#iregmoney').val());//注册资金

            if (iregmoney == 0) {
                top.layer.msg("注册资金有误", {icon: 3});
                return false;
            }

            var regamount = 0;//所有股东注册资金之和
            var indexsum = 0;
            $('input[data-id="regamount"]').each(function (index, element) {

                var amount = isNaN(new Number($(this).val())) ? 0 : new Number($(this).val());

                if (amount == 0) {
                    top.layer.msg("股东注册资金填写有误", {icon: 3});
                    return false;
                }

                regamount = parseInt(regamount) + parseInt(amount);

                indexsum = parseInt(indexsum) + parseInt(index);
            });

            if (parseInt(iregmoney) != parseInt(regamount)) {
                top.layer.msg("各股东股权相加之和不等于100%，请检查", {icon: 3});
                return false;
            }

            if (parseInt(indexsum) > 49){
                top.layer.msg("股东范围只能在1-50人之间", {icon: 3});
                return false;
            }

            return true;
        }

        $(document).ready(function () {
            //添加自然人股东信息
            $("#addbtn").click(function () {
                var innerHTML = '<div class="layui-form-item"><input type="button" class="delete layui-btn layui-btn-danger layui-btn-xs" value="删除" /><div class="layui-inline"><label class="layui-form-label">姓名<em class="red">*</em></label>'
                    + '<div class="layui-input-inline"><input type="text" name="sname" placeholder="(必填项)" class="layui-input" lay-verify="required" autocomplete="off"/>'
                    + '</div></div><div class="layui-inline"><label class="layui-form-label">证件类型<em class="red">*</em></label><div class="layui-input-inline">'
                    + '<member:MemberCardType op="select" name="icardtype" defname="请选择证件类型" option="class=\\'layui-input\\' lay-verify=\\'required\\'"/>'
                    + '</div></div><div class="layui-inline"><label class="layui-form-label">证件号<em class="red">*</em></label><div class="layui-input-inline">'
                    + '<input type="text" name="scardno" placeholder="(必填项最大只能18位)" class="layui-input" lay-verify="required" autocomplete="off"/>'
                    + '</div></div><div class="layui-inline"><label class="layui-form-label">出资额<em class="red">*</em></label><div class="layui-input-inline">'
                    + '<input type="text" data-id="regamount" name="famount" placeholder="(必填项只能正整数)" class="layui-input" lay-verify="required" autocomplete="off"/>'
                    + '</div></div><div class="layui-inline"><label class="layui-form-label">兼职情况<em class="red">*</em></label>'
                    + '<div class="layui-input-inline"><select name="bisjob" class="layui-input" lay-verify="required">'
                    + '<option value>请选择</option><option value="1">在其他公司担任股东/董事/法定代表人/监事等职务</option><option value="0">未在其他公司担任股东/董事/法定代表人/监事等职务</option>'
                    + '</select></div></div></div>';

                $("#company").before(innerHTML);
                form.render();
                $(".layui-form-item .delete").click(function () {
                    $(this).parent().remove();
                })
            });

            //添加机构股东信息
            $('#addbtn1').click(function () {
                var innerHTML = '<div class="layui-form-item"><input type="button" class="delete layui-btn layui-btn-danger layui-btn-xs" value="删除" /><div class="layui-inline"><label class="layui-form-label">姓名<em class="red">*</em></label>'
                    + '<div class="layui-input-inline"><input type="text" name="scompanyname" placeholder="(必填项)" class="layui-input" lay-verify="required" autocomplete="off"/>'
                    + '</div></div><div class="layui-inline"><label class="layui-form-label">证件类型<em class="red">*</em></label><div class="layui-input-inline">'
                    + '<member:LicenseType op="select" name="icompanycardtype" defname="请选择证件类型" option="class=\\'layui-input\\' lay-verify=\\'required\\'"/>'
                    + '</div></div><div class="layui-inline"><label class="layui-form-label">社会信用代码<em class="red">*</em></label>'
                    + '<div class="layui-input-inline"><input type="text" name="scompanycardno" placeholder="(必填项统一社会信用代码)" class="layui-input" lay-verify="required" autocomplete="off"/>'
                    + '</div></div><div class="layui-inline"><label class="layui-form-label">出资额<em class="red">*</em></label>'
                    + '<div class="layui-input-inline"><input type="text" data-id="regamount" name="fcompanyamount" placeholder="(必填项只能正整数)" class="layui-input" lay-verify="required" autocomplete="off"/>'
                    + '</div></div></div>';

                $("#control").before(innerHTML);
                form.render();
                $(".layui-form-item .delete").click(function () {
                    $(this).parent().remove();
                })
            });

        });
        

    </script>
</head>
<body>
<div class="mbody">
    <mw:msg/>
    <form class="layui-form" action="${ctx }/hy/member/authapply.json" method="post" id="formx"
          onkeydown="if(event.keyCode==13) return false;"
          enctype="multipart/form-data" autocomplete="on">
        <input type="hidden" name="icorbiztype" value="${icorbiztype}">
        <div class="layui-tab layui-tab-card">
            <div class="layui-tab-content">
                <div id="projectInfo" class="layui-tab-item layui-show">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">注册资本(万元)<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" id="iregmoney" name="iregmoney" placeholder="(必填项只能正整数)"
                                       class="layui-input" lay-verify="required|money500" autocomplete="off"/>
                            </div>
                        </div>
                        <div class="layui-inline" id="iauthapplysource">
                            <label class="layui-form-label">入驻方式<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <member:AuthapplySource op="select" name="iauthapplysource" defname="请选择方式"
                                                       option="class='layui-input' lay-verify='required' lay-filter='iauthapplysource'"/>
                            </div>
                        </div>
                    </div>
                    <fieldset class="layui-elem-field layui-field-title">
                        <legend>填写执行董事信息</legend>
                    </fieldset>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">姓名<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" id="slegalperson" name="slegalperson" placeholder="(必填项)"
                                       class="layui-input" lay-verify="required" autocomplete="off"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">证件类型<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <member:MemberCardType op="select" name="ilegaltype" defname="请选择证件类型"
                                                       option="class='layui-input' lay-verify='required'"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">证件号码<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="slegalpersoncode" id="slegalpersoncode" placeholder="(必填项最大只能18位)"
                                       class="layui-input" lay-verify="required" autocomplete="off"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">兼职情况<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <select name="bisjoblegal" class="layui-input" lay-verify="required">
                                    <option value>请先择</option>
                                    <option value="1">在其他公司担任股东/董事/法定代表人/监事等职务</option>
                                    <option value="0">未在其他公司担任股东/董事/法定代表人/监事等职务</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <fieldset class="layui-elem-field layui-field-title">
                        <legend>填写公司经理信息</legend>
                    </fieldset>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">姓名<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" id="smanagername" name="smanagername" placeholder="(必填项)"
                                       class="layui-input" lay-verify="required" autocomplete="off"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">证件类型<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <member:MemberCardType op="select" name="imanagertype" defname="请选择证件类型"
                                                       option="class='layui-input' lay-verify='required'"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">证件号码<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="smanagerno" id="smanagerno" placeholder="(必填项最大只能18位)"
                                       class="layui-input" lay-verify="required" autocomplete="off"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">兼职情况<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <select name="bisjobmanager">
                                    <option value>请先择</option>
                                    <option value="1">在其他公司担任股东/董事/法定代表人/监事等职务</option>
                                    <option value="0">未在其他公司担任股东/董事/法定代表人/监事等职务</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <fieldset class="layui-elem-field layui-field-title">
                        <legend>选择法定代表人</legend>
                    </fieldset>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">法定代表人<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <member:CorporateType op="select" name="icorporatetype" defname="请选择法人代表"
                                                      option="class='layui-input' lay-verify='required'"/>
                            </div>
                        </div>
                    </div>
                    <fieldset class="layui-elem-field layui-field-title">
                         <legend>填写自然人股东信息<button type="button" id="addbtn" class="layui-btn layui-btn-warm layui-btn-sm">添加</button></legend>
                    </fieldset>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">姓名<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="sname" placeholder="(必填项)"
                                       class="layui-input" lay-verify="required" autocomplete="off"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">证件类型<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <member:MemberCardType op="select" name="icardtype" defname="请选择证件类型"
                                                       option="class='layui-input' lay-verify='required'"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">证件号<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="scardno" placeholder="(必填项最大只能18位)"
                                       class="layui-input" lay-verify="required" autocomplete="off"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">出资额<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" data-id="regamount" name="famount" placeholder="(必填项只能正整数)"
                                       class="layui-input" lay-verify="required" autocomplete="off"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">兼职情况<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <select name="bisjob" class="layui-input" lay-verify="required">
                                    <option value>请选择</option>
                                    <option value="1">在其他公司担任股东/董事/法定代表人/监事等职务</option>
                                    <option value="0">未在其他公司担任股东/董事/法定代表人/监事等职务</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <fieldset id="company" class="layui-elem-field layui-field-title">
                        <legend>填写机构股东信息<button type="button" id="addbtn1" class="layui-btn layui-btn-warm layui-btn-sm">添加</button></legend>
                    </fieldset>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">姓名<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="scompanyname" placeholder="(必填项)"
                                       class="layui-input" lay-verify="required" autocomplete="off"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">证件类型<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <member:LicenseType op="select" name="icompanycardtype" defname="请选择证件类型"
                                                    option="class='layui-input' lay-verify='required'"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">社会信用代码<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="scompanycardno" placeholder="(必填项统一社会信用代码)"
                                       class="layui-input" lay-verify="required" autocomplete="off"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">出资额<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" data-id="regamount" name="fcompanyamount" placeholder="(必填项只能正整数)"
                                       class="layui-input" lay-verify="required" autocomplete="off"/>
                            </div>
                        </div>
                    </div>

                    <fieldset id="control" class="layui-elem-field layui-field-title">
                         <legend>填写实际控制人信息</legend>
                    </fieldset>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">姓名<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="sconname" placeholder="(必填项)"
                                       class="layui-input" lay-verify="required" autocomplete="off"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">证件类型<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <member:CardType op="select" name="iconcardtype" defname="请选择证件类型"
                                                 option="class='layui-input' lay-verify='required'"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">社会信用代码<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="ssocialcreditno" placeholder="(必填项统一社会信用代码)"
                                       class="layui-input" lay-verify="required" autocomplete="off"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">公司类型<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <member:ComType op="select" name="iconpanytype" defname="请选择类型"
                                                option="class='layui-input' lay-verify='required'"/>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">备注</label>
                            <div class="layui-input-inline" style="width: 100%">
                                <h3 style="font-size: 13px;padding: 0 86px;color: #666;line-height: 1.8;">
                                    实际控制人是指控股股东（或派出董事最多的股东、互相之间签有一致行动协议的股东）或能够实际支配企业行为的自然人、法人或其他组织。认定实际控制人应一直追溯到最后的自然人、国资控股企业或集体企业、上市公司、受国外金融监管部门监管的境外机构。可以为共同实际控制。
                                    在符合上述要求的前提下，实际控制人可按照下列情形进行认定：</br>1）持股50%以上的；</br>2）通过行使表决权能够决定董事会半数以上成员当选的；</br>
                                    3）通过投资关系、协议或者其他安排能够实际支配公司行为且表决权持股超过50%的；</br>4）合伙企业的执行事务合伙人；</br>
                                    5）在无法满足前述认定标准时，可以填报“第一大股东”</h3>
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