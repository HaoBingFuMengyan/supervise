<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="sys" uri="http://www.frogsing.com/tags/frontsys" %>
<%@ taglib prefix="member" uri="http://www.frogsing.com/tags/member" %>
<%@ include file="/include/taglib.jsp" %>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>会员认证详情</title>
    <link href="${ctx}/member/css/open.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/css/common.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="${ctxStatic}/common/jquery.searchableSelect.css"/>


    <script type="text/javascript">
        $.validator.setDefaults({
            submitHandler: function () {
                var flag = true;
                if (!check())
                    flag = false;

                if (flag) {
                    loading('正在提交，请稍等...');
                    form.submit();
                }
            }
        });

        //校验是否否和申请条件
        function check() {
            var iregmoney = isNaN(new Number($('#iregmoney').val())) ? 0 : new Number($('#iregmoney').val());//注册资金

            if (iregmoney == 0) {
                layer.msg("注册资金有误", {icon: 3});
                return false;
            }

            var regamount = 0;//所有股东注册资金之和
            var indexsum = 0;
            $('input[data-id="regamount"]').each(function (index, element) {

                var amount = isNaN(new Number($(this).val())) ? 0 : new Number($(this).val());

                if (amount == 0) {
                    layer.msg("股东注册资金填写有误", {icon: 3});
                    return false;
                }

                regamount = parseInt(regamount) + parseInt(amount);

                indexsum = parseInt(indexsum) + parseInt(index);
            });

            if (parseInt(iregmoney) != parseInt(regamount)) {
                layer.msg("各股东股权相加之和不等于100%，请检查", {icon: 3});
                return false;
            }

            if (parseInt(indexsum) > 49){
                layer.msg("股东范围只能在1-50人之间", {icon: 3});
                return false;
            }

            return true;
        }

        $(document).ready(function () {
            $("#orderForm").validate({
                rules: {
                    iregmoney: "required",
                    slegalperson: "required",
                    slegalpersoncode: {required: true, maxlength: 18},
                    bisjoblegal: "required",
                    smanagername: "required",
                    smanagerno: {required: true, maxlength: 18},
                    bisjobmanager: "required",
                    sname: "required",
                    scardno: {required: true, maxlength: 18},
                    famount: "required",
//                    bisjob:"required",
                    scompanyname: "required",
                    scompanycardno: {required: true, maxlength: 18},
                    fcompanyamount: "required",
                    sconname: "required",
                    ssocialcreditno: {required: true, maxlength: 18},
                },
                messages: {
                    iregmoney: "注册资金不能为空",
                    slegalperson: "执行懂事姓名不能为空",
                    slegalpersoncode: {required: "执行懂事证件号不能为空", maxlength: "最大位数不能超过18位"},
                    bisjoblegal: "请勾选兼职情况",
                    smanagername: "公司经理姓名不能为空",
                    smanagerno: {required: "公司经理证件号不能为空", maxlength: "最大位数不能超过18位"},
                    bisjobmanager: "请勾选兼职情况",
                    sname: "股东姓名不能为空",
                    scardno: {required: "证件号码不能为空", maxlength: "最大位数不能超过18位"},
                    famount: "出资金额不能为空",
//                    bisjob: "danxuan",
                    scompanyname: "股东姓名不能为空",
                    scompanycardno: {required: "证件号码不能为空", maxlength: "最大位数不能超过18位"},
                    fcompanyamount: "出资金额不能为空",
                    sconname: "股东姓名不能为空",
                    ssocialcreditno: {required: "社会统一信用代码不能为空", maxlength: "最大位数不能超过18位"},
                }
            });

            //添加自然人股东信息
            $("#addbtn").click(function () {
                var innerHTML = '<div class="input_group bottom20 input_group_half"><div class="fill-label clearfix"><button onclick="remove(this)" type="button" class="delete"><img src="${ctx}/images/delete.png">删除</button></div>'
                    + '<div class="mask-bg"><div ><input name="sname" class="form_control" placeholder="股东姓名">'
                    + '<member:MemberCardType op="select" name="icardtype" defname="请选择证件类型" defval="999" option="class=\\'form_control\\'"/>'
                    + '<input name="scardno" class="form_control" placeholder="证件号码">'
                    + '<input data-id="regamount" name="famount" class="form_control" placeholder="认缴出资额">万元</div<div class="checkbox"><p>兼职情况</p>'
                    + '<input name="bisjob" type="radio" value="1">在XXXXXXXXXXX担任股东/董事/法定代表人/监事等职务'
                    + '<input name="bisjob" type="radio" value="0">未在其他公司担任股东/董事/法定代表人/监事等职务</div></div></div>';

                $("#company").before(innerHTML);
            });

            //添加机构股东信息
            $('#addbtn1').click(function () {
                var innerHTML = '<div class="input_group bottom20 input_group_half"><div class="fill-label clearfix"><button onclick="remove(this)" type="button" class="delete"><img src="${ctx}/images/delete.png">删除</button></div>'
                    + '<div class="mask-bg"><div ><input name="scompanyname" class="form_control" placeholder="股东名称">'
                    + '<member:LicenseType op="select" name="icompanycardtype" defname="请选择证件类型" defval="999" option="class=\\'form_control\\'"/>'
                    + '<input name="scompanycardno" class="form_control" placeholder="填写统一社会信用代码">'
                    + '<input data-id="regamount" name="fcompanyamount" class="form_control" placeholder="认缴出资额">万元</div></div></div>';

                $("#control").before(innerHTML);
            });


        });

        //删除
        function remove(is) {
            $(is).parent().parent().remove();
        }

    </script>
</head>
<body>
<div class="fillIn">
    <div class="fill-box">
        <div class="fill-form">
            <sys:message content="${message}"/>
            <form id="orderForm" action="${ctx}/hy/member/authapply.shtml" method="post" enctype="multipart/form-data">
                <input type="hidden" name="icorbiztype" value="${param.icorbiztype}">
                <div class="input_group bottom20 input_group_half">
                    <div class="fill-label"><em class="red">*</em>填写注册资本</div>
                    <div class="for-error"><input id="iregmoney" name="iregmoney" class="form_control"
                                                  placeholder="请填写注册资本">万元
                    </div>
                </div>
                <div class="input_group bottom20 input_group_half">
                    <div class="fill-label"><em class="red">*</em>填写执行董事信息</div>
                    <div class="mask-bg">
                        <div>
                            <div class="for-error"><input id="slegalperson" name="slegalperson" class="form_control"
                                                          placeholder="姓名"></div>
                            <member:MemberCardType op="select" name="ilegaltype" defname="请选择证件类型" defval="999"
                                                   option="class='form_control'"/>
                            <div class="for-error"><input id="slegalpersoncode" name="slegalpersoncode"
                                                          class="form_control" placeholder="证件号码"></div>
                        </div>
                        <div class="checkbox">
                            <p>兼职情况</p>
                            <input name="bisjoblegal" type="radio" value="1">在XXXXXXXXXXX担任股东/董事/法定代表人/监事等职务
                            <input name="bisjoblegal" type="radio" value="0">未在其他公司担任股东/董事/法定代表人/监事等职务
                        </div>
                    </div>
                </div>
                <div class="input_group bottom20 input_group_half">
                    <div class="fill-label"><em class="red">*</em>填写公司经理信息</div>
                    <div class="mask-bg">
                        <div>
                            <div class="for-error"><input id="smanagername" name="smanagername" class="form_control"
                                                          placeholder="姓名"></div>
                            <member:MemberCardType op="select" name="imanagertype" defname="请选择证件类型" defval="999"
                                                   option="class='form_control'"/>
                            <div class="for-error"><input id="smanagerno" name="smanagerno" class="form_control"
                                                          placeholder="证件号码"></div>
                        </div>
                        <div class="checkbox">
                            <p>兼职情况</p>
                            <input name="bisjobmanager" type="radio" value="1">在XXXXXXXXXXX担任股东/董事/法定代表人/监事等职务
                            <input name="bisjobmanager" type="radio" value="0">未在其他公司担任股东/董事/法定代表人/监事等职务
                        </div>
                    </div>
                </div>
                <div class="input_group bottom20 input_group_half">
                    <div class="fill-label"><em class="red">*</em>选择法定代表人</div>
                    <member:CorporateType op="select" name="icorporatetype" defname="请选择法人代表" defval="999"
                                          option="class='form_control'"/>
                </div>

                <div class="input_group bottom20 input_group_half">
                    <div class="fill-label"><em class="red">*</em>填写自然人股东信息
                        <button id="addbtn" type="button"><img src="${ctx}/images/add.png">添加</button>
                    </div>
                    <div class="mask-bg">
                        <div>
                            <div class="for-error"><input name="sname" class="form_control" placeholder="股东姓名"></div>
                            <member:MemberCardType op="select" name="icardtype" defname="请选择证件类型" defval="999"
                                                   option="class='form_control'"/>
                            <div class="for-error"><input name="scardno" class="form_control" placeholder="证件号码"></div>
                            <div class="for-error"><input data-id="regamount" name="famount" class="form_control"
                                                          placeholder="认缴出资额">万元
                            </div>
                        </div>
                        <div class="checkbox">
                            <p>兼职情况</p>
                            <input name="bisjob" type="radio" value="1">在XXXXXXXXXXX担任股东/董事/法定代表人/监事等职务
                            <input name="bisjob" type="radio" value="0">未在其他公司担任股东/董事/法定代表人/监事等职务
                        </div>
                    </div>
                </div>

                <div id="company" class="input_group bottom20 input_group_half">
                    <div class="fill-label"><em class="red">*</em>填写机构股东信息
                        <button id="addbtn1" type="button"><img src="${ctx}/images/add.png">添加</button>
                    </div>
                    <div class="mask-bg">
                        <div>
                            <div class="for-error"><input name="scompanyname" class="form_control" placeholder="股东名称">
                            </div>
                            <member:LicenseType op="select" name="icompanycardtype" defname="请选择证件类型" defval="999"
                                                option="class='form_control'"/>
                            <div class="for-error"><input name="scompanycardno" class="form_control"
                                                          placeholder="填写统一社会信用代码"></div>
                            <div class="for-error"><input data-id="regamount" name="fcompanyamount" class="form_control"
                                                          placeholder="认缴出资额">万元
                            </div>
                        </div>
                    </div>
                </div>
                <div id="control" class="input_group bottom20 input_group_half">
                    <div class="fill-label"><em class="red">*</em>填写实际控制人信息</div>
                    <div class="mask-bg" style="width: 1119px;box-sizing: border-box">
                        <div>
                            <div class="for-error"><input name="sconname" class="form_control" placeholder="名称"></div>
                            <member:CardType op="select" name="iconcardtype" defname="请选择证件类型" defval="999"
                                             option="class='form_control'"/>
                            <div class="for-error"><input name="ssocialcreditno" class="form_control"
                                                          placeholder="填写统一社会信用代码"></div>
                            <member:ComType op="select" name="iconpanytype" defname="请选择类型" defval="999"
                                            option="class='form_control'"/>
                        </div>
                        <div class="checkbox">
                            <p>备注：</p>
                            <h3>
                                实际控制人是指控股股东（或派出董事最多的股东、互相之间签有一致行动协议的股东）或能够实际支配企业行为的自然人、法人或其他组织。认定实际控制人应一直追溯到最后的自然人、国资控股企业或集体企业、上市公司、受国外金融监管部门监管的境外机构。可以为共同实际控制。
                                在符合上述要求的前提下，实际控制人可按照下列情形进行认定：</br>1）持股50%以上的；</br>2）通过行使表决权能够决定董事会半数以上成员当选的；</br>
                                3）通过投资关系、协议或者其他安排能够实际支配公司行为且表决权持股超过50%的；</br>4）合伙企业的执行事务合伙人；</br>
                                5）在无法满足前述认定标准时，可以填报“第一大股东”</h3>
                        </div>
                    </div>
                </div>
                <div class="jj-submit">
                    <button>提交信息</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>