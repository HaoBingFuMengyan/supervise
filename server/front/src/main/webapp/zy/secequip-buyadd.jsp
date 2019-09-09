<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="resource" uri="http://www.frogsing.com/tags/resource" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>煤亮子-发布<resource:SecondEquipType val="${ioldtype}"/></title>
    <script src="${ctx}/static/bigautocomplete/jquery.bigautocomplete.js" type="text/javascript"></script>
    <link rel="stylesheet" href="${ctx}/static/bigautocomplete/jquery.bigautocomplete.css" type="text/css" />
    <script src="${ctx}/static/disableAutoFill/jquery.disableAutoFill.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="${ctx}/css/static.css">
    <style>
        .input_group {
            font-size: 0;
        }
        .input_group label.error {
            width: auto;
            text-align: left;
            margin-right: 10px;
            position: absolute;
            left: 150px;
            top: 38px;
            font-size: 12px;
            color: #ff0000!important;
        }
    </style>
    <script>
        $(document).ready(function () {
            $("#inputForm").validate({submitHandler: function(form) { //验证成功时调用
                    $('#subbtn').attr('disabled','disabled');
                    $.post($('#inputForm').attr('action'),$('#inputForm').serialize(),function(result){
                        if (result.success) {
                            layer.msg("保存成功");
                            location = "${ctx}/zy/secequip/secEquipBuy.html";
                        }else{
                            layer.msg(result.msg);
                        }
                        $('#subbtn').removeAttr('disabled');
                    });
                }});

            $("#scategoryname").bigAutocomplete({
                url: "${ctx}/sp/category/getcategory.json",
                click: 'true',
                select: true,
                callback: function (data) {
                    $("#scategoryid").val(data.id);

                }
            });

            //防止自动补全
            $('#scategoryname').disableAutoFill({
                passwordField: '.password',
                debugMode: false,
                randomizeInputName: true
            });

            $("#bisalso").click(function () {
                if ($(this).prop("checked")) {
                    $('#fotherprice').parent('.input_group').show();
                    $('#fotherprice').attr('name', 'fotherprice');
                } else {
                    $('#fotherprice').parent('.input_group').hide();
                    $('#fotherprice').removeAttr('name');
                }
            });

        })

    </script>
</head>
<body>

<div class="unity-new">
    <div class="banner"></div>
    <div class="unity-content">
        <form id="inputForm" action="${ctx}/zy/secequip/save.json" method="post" >
            <input name="ioldtype" value="${ioldtype}" hidden>
            <div class="inner-con">
                <div class="moudle-write">
                    <div class="input-tit">
                        <span class="leftk">请填写您的<resource:SecondEquipType val="${ioldtype}"/>设备信息</span>
                    </div>
                    <div class="datd-table clearfix" id="put">
                        <div class="input_group input_group_lg bottom20 left" style="width: 100%">
                            <label>同时发布${ioldtype eq 30?'求购':'求租'}</label>
                            <input  type="checkbox" id="bisalso"  name="bisalso" value="1" style="width: 15px;height:15px;vertical-align: sub;">
                        </div>

                        <div class="input_group input_group_lg bottom20 left" >
                            <label>型号：</label><input name="sspec" class="form_control" type="text"  >
                        </div>
                        <div class="input_group input_group_lg bottom20 left" >
                            <label>设备名称：</label><input class="form_control required" type="text" name="stitle" ><font class="icon icon-bitian2 redfont must leftfu"></font>
                        </div>
                        <div class="input_group input_group_lg bottom20 left">
                            <label>数量：</label><input  class="form_control required" type="number" name="inumber" ><font class="icon icon-bitian2 redfont must leftfu"></font>
                        </div>
                        <div class="input_group input_group_lg bottom20 left">
                            <label>技术要求：</label><input  class="form_control" type="text" name="srequirements" >
                        </div>
                        <div class="input_group input_group_lg bottom20 left">
                            <label>分类：</label><input  class="form_control required" type="text" id="scategoryname" name="scategoryname" ><font class="icon icon-bitian2 redfont must leftfu"></font>
                            <input name="scategoryid" id="scategoryid" hidden >
                        </div>
                        <div class="input_group input_group_lg bottom20 left">
                            <label>生产厂家：</label><input class="form_control" type="text" name="sproducer" >
                        </div>
                        <div class="input_group input_group_lg bottom20 left">
                            <label>设备需求地：</label><input class="form_control required" type="text" name="sdemandaddress" > <font class="icon icon-bitian2 redfont must leftfu"></font>
                        </div>


                        <div class="input_group input_group_lg bottom20 left">
                            <label>详细说明：<br></label>
                            <textarea class="form-control" name="sdesc" style="width: 815px;resize: none;"></textarea>
                        </div>
                    </div>

                </div>
                <div class="input-tit">
                    <span class="leftk">您的联系方式</span>
                </div>
                <div class="datd-table clearfix">
                    <div class="input_group input_group_lg bottom20 left">
                        <label>联系人：</label><input name="slinkman" value="${user.sname}"  class="form_control required" type="text"   ><font class="icon icon-bitian2 redfont must leftfu"></font>
                    </div>
                    <div class="input_group input_group_lg bottom20 left">
                        <label>手机号码：</label><input name="smobile"  value="${user.smobile}" class="form_control required" type="text"   ><font class="icon icon-bitian2 redfont must leftfu"></font>
                    </div>
                    <div class="input_group input_group_lg bottom20 left">
                        <label>公司名称：</label><input name="scompanyname"  value="${user.member.scnname}" class="form_control required" type="text"   ><font class="icon icon-bitian2 redfont must leftfu"></font>
                    </div>

                </div>
                <div class="submit-btn">
                    <input id="subbtn" onclick="$('#inputForm').submit()" type="button" class="btn primary" value="提交需求"/>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
