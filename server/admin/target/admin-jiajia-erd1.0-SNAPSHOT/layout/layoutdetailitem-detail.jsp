<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/include/taglib.jsp" %>
<html>
<head>
    <title></title>
    <script type="text/javascript">
        $("docunment").ready(function () {
            var validateForm = $("#inputForm").validate({
                submitHandler: function(form){
                    layer.load('正在提交，请稍等...');
                    form.submit();
                }

            });

        });

    </script>
</head>
<body>

<div class="layui-tab-content ">
    <div class="layui-main">

        <form:form id="inputForm" modelAttribute="data" action="${ctx}/jj/layoutdetailitem/save.shtml" method="post" cssClass="layui-form">
            <form:hidden path="id"/>
            <input type="hidden" name="slayoutdetailid" value="${param.slayoutdetailid}"/>
            <form:hidden path="simageurl" />

            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">序号</label>
                    <div class="layui-input-inline">
                        <form:input path="ino" class="layui-input required"/>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">名称</label>
                    <div class="layui-input-inline">
                        <form:input path="sname" class="layui-input required"/>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">链接地址</label>
                    <div class="layui-input-inline">
                        <form:input path="surl" class="layui-input"/>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">是否站外链接</label>
                    <div class="layui-input-inline">
                        <consts:BoolType val="${data.bisoutlink}" defval="0" name="bisoutlink"  op="select" option=" class='layui-input layui-unselect' "/>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">图片</label>
                    <div class="layui-input-inline">
                        <div class="layui-upload">
                            <button type="button" class="layui-btn" id="test1">上传图片</button>
                            <div class="layui-upload-list">
                                <img class="layui-upload-img" id="imgfile">
                            </div>
                        </div>
                    </div>
                </div>
            </div>



        </form:form>


    </div>
</div>
<script>
    layui.use(['form','upload'], function() {
        var form = layui.form
            , layer = layui.layer
            ,upload = layui.upload;
        //普通图片上传
        layui.use('upload', function(){
            //执行实例
            var uploadInst = layui.upload.render({
                elem: '#test1' //绑定元素
                ,url: '${ctx}/file/pubimg.json' //上传接口
                ,accept:'images'
                ,auto:true
                ,field:'imgfile'
                ,done: function(res){
                    if (res.state == "SUCCESS"){
                        $("#simageurl").val(res.url);
                        layer.msg("上传成功");
                    }else{
                        showTip(res.state);
                    }
                }
                ,error: function(){
                    //请求异常回调
                    showTip("图片上传失败");
                }
            });
        });

    });

</script>

</body>
</html>