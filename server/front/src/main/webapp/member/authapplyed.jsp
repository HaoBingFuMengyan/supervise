<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="sys" uri="http://www.frogsing.com/tags/frontsys" %>
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
            submitHandler: function() {
                loading('正在提交，请稍等...');
                form.submit();
            }
        });
        $(document).ready(function () {
            $("#orderForm").validate({
                rules: {
                    firstname: "required",
                    gu:"required"
//                    "topic[]": {
//                        required: "#newsletter:checked",
//                        minlength: 2
//                    }
                },
                messages: {
                    firstname: "请输入您的名字",
                    gu: "不能我 i 啊接口给手机看风景"
//                    topic: "请选择两个主题"
                }
            });
        });


    </script>
</head>
<body>
<div class="fillIn">
    <div class="fill-box">
        <div class="fill-form">
            <sys:message content="${message}"/>
            <form id="orderForm" action="${ctx}/hy/member/authapply.shtml"  method="post"  enctype="multipart/form-data">
                <div class="input_group bottom20 input_group_half">
                    <div class="fill-label"><em class="red">*</em>填写注册资本</div>
                    <input id="firstname" name="firstname" class="form_control" placeholder="请填写注册资本">万元
                </div>
                <div class="input_group bottom20 input_group_half">
                    <div class="fill-label"><em class="red">*</em>填写执行董事信息</div>
                    <div class="mask-bg">
                        <div >
                            <input name="" class="form_control" placeholder="姓名">
                            <select>
                                <option value="">下拉选择证件类别</option>
                                <option value="">身份证</option>
                                <option value="">护照</option>
                                <option value="">港澳台通行证</option>
                            </select>
                            <input name="" class="form_control" placeholder="证件号码">
                        </div>
                        <div class="checkbox">
                            <p>兼职情况</p>
                            <input onclick="" type="radio">在XXXXXXXXXXX担任股东/董事/法定代表人/监事等职务
                            <input onclick="" type="radio">未在其他公司担任股东/董事/法定代表人/监事等职务
                        </div>
                    </div>
                </div>
                <div class="input_group bottom20 input_group_half">
                    <div class="fill-label"><em class="red">*</em>填写公司经理信息</div>
                    <div class="mask-bg">
                        <div >
                            <input name="" class="form_control" placeholder="姓名">
                            <select>
                                <option value="">下拉选择证件类别</option>
                                <option value="">身份证</option>
                                <option value="">护照</option>
                                <option value="">港澳台通行证</option>
                            </select>
                            <input name="" class="form_control" placeholder="证件号码">
                        </div>
                        <div class="checkbox">
                            <p>兼职情况</p>
                            <input onclick="" type="radio">在XXXXXXXXXXX担任股东/董事/法定代表人/监事等职务
                            <input onclick="" type="radio">未在其他公司担任股东/董事/法定代表人/监事等职务
                        </div>
                    </div>
                </div>
                <div class="input_group bottom20 input_group_half">
                    <div class="fill-label"><em class="red">*</em>选择法定代表人</div>
                    <select>
                        <option value="">下拉选择法定代表人</option>
                        <option value="">执行董事</option>
                        <option value="">经理</option>
                        <option value="">执行董事兼经理</option>
                    </select>
                </div>
                <div class="input_group bottom20 input_group_half">
                    <div class="fill-label"><em class="red">*</em>填写自然人股东信息<button id="addbtn" type="button"><img src="${ctx}/images/add.png">添加</button></div>
                    <div class="mask-bg">
                        <div >
                            <input name="gu" class="form_control" placeholder="股东姓名">
                            <select>
                                <option value="">下拉选择证件类别</option>
                                <option value="">身份证</option>
                                <option value="">护照</option>
                                <option value="">港澳台通行证</option>
                            </select>
                            <input name="" class="form_control" placeholder="证件号码">
                            <input name="" class="form_control" placeholder="认缴出资额">万元
                        </div>
                        <div class="checkbox">
                            <p>兼职情况</p>
                            <input onclick="" type="radio">在XXXXXXXXXXX担任股东/董事/法定代表人/监事等职务
                            <input onclick="" type="radio">未在其他公司担任股东/董事/法定代表人/监事等职务
                        </div>
                    </div>
                </div>
                <div class="input_group bottom20 input_group_half">
                    <div class="fill-label"><em class="red">*</em>填写机构股东信息<button id="" type="button"><img src="${ctx}/images/add.png">添加</button></div>
                    <div class="mask-bg">
                        <div >
                            <input name="" class="form_control" placeholder="股东名称">
                            <select>
                                <option value="">下拉选择证件类别</option>
                                <option value="">营业执照</option>
                            </select>
                            <input name="" class="form_control" placeholder="填写统一社会信用代码">
                            <input name="" class="form_control" placeholder="认缴出资额">万元
                        </div>
                    </div>
                </div>
                <div class="input_group bottom20 input_group_half">
                    <div class="fill-label"><em class="red">*</em>填写实际控制人信息<button  type="button"><img src="${ctx}/images/add.png">添加</button></div>
                    <div class="mask-bg" style="width: 1119px;box-sizing: border-box">
                        <div >
                            <input name="" class="form_control" placeholder="名称">
                            <select>
                                <option value="">下拉选择证件类别</option>
                                <option value="">身份证</option>
                                <option value="">护照</option>
                                <option value="">港澳台通行证</option>
                                <option value="">营业执照</option>
                            </select>
                            <input name="" class="form_control" placeholder="填写统一社会信用代码">
                            <select>
                                <option value="">下拉选择</option>
                                <option value="">自然人</option>
                                <option value="">上市公司</option>
                                <option value="">国企或集体企业</option>
                            </select>
                        </div>
                        <div class="checkbox">
                            <p>备注：</p>
                            <h3>实际控制人是指控股股东（或派出董事最多的股东、互相之间签有一致行动协议的股东）或能够实际支配企业行为的自然人、法人或其他组织。认定实际控制人应一直追溯到最后的自然人、国资控股企业或集体企业、上市公司、受国外金融监管部门监管的境外机构。可以为共同实际控制。
                                在符合上述要求的前提下，实际控制人可按照下列情形进行认定：</br>1）持股50%以上的；</br>2）通过行使表决权能够决定董事会半数以上成员当选的；</br>3）通过投资关系、协议或者其他安排能够实际支配公司行为且表决权持股超过50%的；</br>4）合伙企业的执行事务合伙人；</br>5）在无法满足前述认定标准时，可以填报“第一大股东”</h3>
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


<%--function check(){--%>
<%--//                var  rs=true;--%>
<%--////                $('input[type=checkbox]:checked').each(function(){--%>
<%--////                    if(!rs)--%>
<%--////                        return;--%>
<%--////                    var v= $(this).next('input').val();--%>
<%--////                    if(v&&!isNumber(v)){--%>
<%--////                        alert($(this).prev('label').html()+"序号必须是数字");--%>
<%--////                        rs=false;--%>
<%--////                        return ;--%>
<%--////                    }--%>
<%--////                    $(this).val(v);--%>
<%--////                });--%>
<%--//                return rs;--%>
<%--//            };--%>
<%--//            var validateForm = $("#orderForm").validate({--%>
<%--//                submitHandler: function(form){--%>
<%--////                    if(!check())--%>
<%--////                        return false;--%>
<%--//                    loading('正在提交，请稍等...');--%>
<%--//                    form.submit();--%>
<%--//                },--%>
<%--//                errorContainer: "#messageBox",--%>
<%--//                errorPlacement: function(error, element) {--%>
<%--//                    $("#messageBox").text("输入有误，请先更正。");--%>
<%--//                    if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){--%>
<%--//                        error.appendTo(element.parent().parent());--%>
<%--//                    } else {--%>
<%--//                        error.insertAfter(element);--%>
<%--//                    }--%>
<%--//                }--%>
<%--//            });--%>