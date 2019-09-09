<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="resource" uri="http://www.frogsing.com/tags/resource" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>煤亮子-发布<resource:SecondEquipType val="${ioldtype}"/></title>
    <script src="${ctxStatic}/layui-v2.4.2/layui/layui.js" type="text/javascript"></script>
    <script src="${ctx}/static/bigautocomplete/jquery.bigautocomplete.js" type="text/javascript"></script>
    <link rel="stylesheet" href="${ctx}/static/bigautocomplete/jquery.bigautocomplete.css" type="text/css" />
    <script src="${ctx}/static/disableAutoFill/jquery.disableAutoFill.min.js" type="text/javascript"></script>
    <script type="text/javascript" charset="utf-8" src="${ctx}/static/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${ctx}/static/ueditor/ueditor.all.js"> </script>
    <link rel="stylesheet" href="${ctx}/css/static.css">
    <link href="${ctxStatic}/layui-v2.4.2/layui/css/layui.css" type="text/css" rel="stylesheet" />
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
        #test1{
            width: 100px;
            height: 100px;
            margin-right: 10px;
            background: #fff;
            color: #999;
        }
        .edui-default .edui-editor {
            border: 1px solid #d4d4d4;
            background-color: white;
            position: relative;
            overflow: visible;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
            box-sizing: border-box;
        }
    </style>
    <script>
        $(document).ready(function () {

            $("#inputForm").validate({

                submitHandler: function(form) { //验证成功时调用
                    $('#subbtn').attr('disabled','disabled');
                    $.post($('#inputForm').attr('action'),$('#inputForm').serialize(),function(result){
                        if (result.success) {
                            layer.msg("保存成功");
                            location = "${ctx}/zy/secequip/secEquip.html";
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







            layui.use(['layer','laydate','upload','form'], function () {
                layer = layui.layer;

                var upload = layui.upload;
                var laydate = layui.laydate;
                var uploadInst = upload.render({
                    elem: '#test1'
                    ,url: '${ctx}/file/uploadfile.json'
                    ,accept: 'image'
                    ,multiple: false
                    ,auto: true
                    ,field:"upfile"
                    ,data:{path:'/secequip'}
                    , before: function (obj) {
                        layer.load(1); //上传loading
                    }
                    , done: function (res) {
                        layer.closeAll('loading'); //关闭loadin
                        if(res.state == "SUCCESS"){
                            layer.msg("上传成功");
                            $('#simage').val(res.path);
                            $('#yulan').attr('src', res.url);
                        }else{
                            layer.msg(res.original+"上传失败，失败原因："+res.state);
                        }
                    }
                    , error: function () {
                        layer.msg("文件上传失败");
                    }
                });

                //执行一个laydate实例
                laydate.render({
                    elem: '#sproductiondate' //出厂日期
                    ,type: 'month'
                });

                laydate.render({
                    elem: '#sidledate' //使用日期
                    ,type: 'month'
                });

                laydate.render({
                    elem: '#suseddate' //闲置日期
                    ,type: 'month'
                });

            });



            var uel=UE.getEditor('scontent',{UEDITOR_HOME_URL:'${ctx}/static/ueditor/',lang:'zh-cn',serverUrl:'${ctx}/file/upload.json'});




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
                            <label>同时发布${ioldtype eq 10?'出售':'出租'}</label>
                            <input  type="checkbox" id="bisalso"  name="bisalso" value="1" style="width: 15px;height:15px;vertical-align: sub;">
                        </div>
                        <div class="input_group input_group_lg bottom20 left">
                            <label>名称 ：</label>
                            <input  class="form_control required" type="text" name="stitle" ><font class="icon icon-bitian2 redfont must leftfu"></font>
                        </div>
                        <div class="input_group input_group_lg bottom20 left" >
                            <label>规格型号：</label><input class="form_control required" type="text" name="sspec" ><font class="icon icon-bitian2 redfont must leftfu"></font>
                        </div>

                        <div class="input_group input_group_lg bottom20 left">
                            <label><resource:SecondEquipType val="${ioldtype}"/>价：</label><input  class="form_control " type="number" name="fprice" >
                        </div>
                        <div class="input_group input_group_lg bottom20 left" style="display: none">
                            <label>${ioldtype eq 10?'出售':'出租'}价：</label><input id="fotherprice"  class="form_control " type="number">
                        </div>
                        <div class="input_group input_group_lg bottom20 left">
                            <label>数量：</label><input  class="form_control required" type="number" name="inumber" ><font class="icon icon-bitian2 redfont must leftfu"></font>
                        </div>
                        <div class="input_group input_group_lg bottom20 left">
                            <label>数量单位：</label><input  class="form_control required" type="text" name="sunit" ><font class="icon icon-bitian2 redfont must leftfu"></font>
                        </div>
                        <%--<div class="input_group input_group_lg bottom20 left">--%>
                        <%--<label>技术要求：</label><input  class="form_control" type="text" name="srequirements" >--%>
                        <%--</div>--%>
                        <div class="input_group input_group_lg bottom20 left">
                            <label>分类：</label><input  class="form_control required" type="text" id="scategoryname" name="scategoryname" ><font class="icon icon-bitian2 redfont must leftfu"></font>
                            <input name="scategoryid" id="scategoryid" hidden >
                        </div>
                        <div class="input_group input_group_lg bottom20 left" >
                            <label>生产厂家：</label><input class="form_control required" type="text" name="sproducer" ><font class="icon icon-bitian2 redfont must leftfu"></font>
                        </div>

                        <div class="input_group input_group_lg bottom20 left" >
                            <label>过煤量(万吨)：</label><input class="form_control required" type="number" name="icoalnum" ><font class="icon icon-bitian2 redfont must leftfu"></font>
                        </div>
                        <div class="input_group input_group_lg bottom20 left" >
                            <label>出厂日期：</label><input class="form_control required" id="sproductiondate"  name="sproductiondate" readonly><font class="icon icon-bitian2 redfont must leftfu"></font>
                        </div>
                        <div class="input_group input_group_lg bottom20 left" >
                            <label>闲置日期：</label><input class="form_control required" id="sidledate"  name="sidledate" readonly><font class="icon icon-bitian2 redfont must leftfu"></font>
                        </div>
                        <div class="input_group input_group_lg bottom20 left" >
                            <label>使用日期：</label><input class="form_control required" id="suseddate"  name="suseddate" readonly><font class="icon icon-bitian2 redfont must leftfu"></font>
                        </div>
                        <div class="input_group input_group_lg bottom20 left" >
                            <label>状态：</label>
                            <resource:MachineState op="select" defname=" " defval="" name="imachinestate" option="class='form_control required'"></resource:MachineState><font class="icon icon-bitian2 redfont must leftfu"></font>
                        </div>
                        <div class="input_group input_group_lg bottom20 left">
                            <label>现储存位置 ：</label>
                            <resource:StoreType op="select" defname=" " defval="" name="istoretype" option="class='form_control required'"/><font class="icon icon-bitian2 redfont must leftfu"></font>
                        </div>

                        <div class="input_group input_group_lg bottom20 left" style="width: 100%">
                            <label>机型图片：</label>
                            <button type="button" class="layui-btn" id="test1"><i class="layui-icon"></i>上传文件</button>
                            <img  id="yulan" src="${ctx}/images/nopic.png" width="100px",height="100px">
                            <input id="simage" name="simage" hidden>
                        </div>

                        <div class="input_group input_group_lg bottom20 left">
                            <label>详细说明：<br></label>
                            <textarea class="form-control" name="sdesc" style="width: 815px;resize: none;"></textarea>
                        </div>

                        <div class="input_group input_group_lg bottom20 left">
                            <label>详情描述：<br></label>
                            <textarea id="scontent" name="scontent" class="form-control"  style="height:500px;"></textarea>
                        </div>
                    </div>

                </div>
                <div class="input-tit">
                    <span class="leftk">您的联系方式</span>
                </div>
                <div class="datd-table clearfix">
                    <div class="input_group input_group_lg bottom20 left">
                        <label>公司名称：</label><input  name="scompanyname" value="${user.member.scnname}" class="form_control required" type="text"  ><font class="icon icon-bitian2 redfont must leftfu"></font>
                    </div>
                    <div class="input_group input_group_lg bottom20 left">
                        <label>联系人：</label><input name="slinkman" value="${user.sname}"  class="form_control required" type="text"   ><font class="icon icon-bitian2 redfont must leftfu"></font>
                    </div>
                    <div class="input_group input_group_lg bottom20 left">
                        <label>手机号码：</label><input name="smobile" value="${user.smobile}" class="form_control required" type="text"   maxlength="11" ><font class="icon icon-bitian2 redfont must leftfu"></font>
                    </div>
                    <div class="input_group input_group_lg bottom20 left">
                        <label>联系地址：</label><input class="form_control required" type="text" name="saddress" ><font class="icon icon-bitian2 redfont must leftfu"></font>
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
