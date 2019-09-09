<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<html>
<head>
    <title>选择集团</title>
    <meta name="decorator" content="jj"/>
    <script src="${ctx}/static/disableAutoFill/jquery.disableAutoFill.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        layui.use(['layer','form','laydate'],function(){
            var form = layui.form,
                laydate = layui.laydate;

            jj.validate('#inputForm');

            laydate.render({
                elem: '#dpredictpaydate',
                trigger: 'click'
            });

        });



    </script>
</head>
<body>

<div class="layui-main">
    <mw:msg/>
    <form id="inputForm" class="layui-form" action="${ctx}/overduebill/handle.shtml" method="post">

        <input name="id" value="${obj.id}" hidden>

        <div class="layui-form-item">
            <label class="layui-form-label">预计还款日期<span class="red">*</span></label>
            <div class="layui-input-block">
                <input id="dpredictpaydate" name="dpredictpaydate" type="text"   class="layui-input required">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">应收(付)违约金</label>
            <div class="layui-input-block">
                <input type="number" value="${obj.fpenalty}"  disabled  class="layui-input readonly">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">实收(付)违约金<span class="red">*</span></label>
            <div class="layui-input-block">
                <input name="frealpenalty"  type="number" value="${obj.fpenalty}"   class="layui-input required">
            </div>
        </div>




    </form>
</div>

</body>
</html>