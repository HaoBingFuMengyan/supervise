<%@ taglib prefix="member" uri="http://www.frogsing.com/tags/member" %>
<%@ taglib prefix="consts" uri="http://www.frogsing.com/tags/consts" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<html>
<head>

    <title>基本信息</title>
    <meta name="decorator" charset="" content="jj">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <script type="text/javascript">
        //风险检测报告
        function riskcheck(id,irisktype){
            top.layer.open({
                type: 2,
                title: "风险评估报告",
                area: ['95%', '95%'],
                content: '${ctx}/hy/authapplyriskdetail/risk.shtml?id='+id+'&irisktype='+irisktype,
                btn: ['关闭'],
                cancel: function (index) {
                }
            });
        }
    </script>
</head>
<body>
<div class="layui-collapse" style="border-top: none;">
    <div class="layui-colla-item">
        <%--<h2 class="layui-colla-title">会员编号：${data.smemberno}</h2>--%>
        <div class="layui-colla-content layui-show">
            <div class="layui-info">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">整体评分：</label>
                        <div class="layui-input-inline">
                            ${data.fscore}
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">风险等级：</label>
                        <div class="layui-input-inline">
                            <member:RiskLevel op="label" val="${data.irisklevel}"/>
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">机构自身：</label>
                        <div class="layui-input-inline">
                            ${data.fjgscore}
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">核心人员：</label>
                        <div class="layui-input-inline">
                            ${data.fhxscore}
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">关联企业：</label>
                        <div class="layui-input-inline">
                            ${data.fglqyscore}
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">在管基金：</label>
                        <div class="layui-input-inline">
                            ${data.fzgjjscore}
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">合伙企业：</label>
                        <div class="layui-input-inline">
                            ${data.fwbascore}
                        </div>
                    </div>
                </div>

                <fieldset class="layui-elem-field layui-field-title">
                    <legend>预警数</legend>
                </fieldset>
                <div class="layui-form-item">
                    <iframe  src="${ctx}/hy/authapplyriskdetail/risk.shtml?id=${data.id}&irisktype=7" allowtransparency="true" frameborder="0" scrolling="0" width="100%" height="200px"></iframe>
                </div>
                <fieldset class="layui-elem-field layui-field-title">
                    <legend>机构自身</legend>
                </fieldset>
                <div class="layui-form-item">
                    <iframe  src="${ctx}/hy/authapplyriskdetail/risk.shtml?id=${data.id}&irisktype=0" allowtransparency="true" frameborder="0" scrolling="0" width="100%" height="200px"></iframe>
                </div>
                <fieldset class="layui-elem-field layui-field-title">
                    <legend>核心人员</legend>
                </fieldset>
                <div class="layui-form-item">
                    <iframe  src="${ctx}/hy/authapplyriskdetail/risk.shtml?id=${data.id}&irisktype=1" allowtransparency="true" frameborder="0" scrolling="0" width="100%" height="200px"></iframe>
                </div>
                <fieldset class="layui-elem-field layui-field-title">
                    <legend>关联企业</legend>
                </fieldset>
                <div class="layui-form-item">
                    <iframe  src="${ctx}/hy/authapplyriskdetail/risk.shtml?id=${data.id}&irisktype=2" allowtransparency="true" frameborder="0" scrolling="0" width="100%" height="200px"></iframe>
                </div>
                <fieldset class="layui-elem-field layui-field-title">
                    <legend>在管基金</legend>
                </fieldset>
                <div class="layui-form-item">
                    <iframe  src="${ctx}/hy/authapplyriskdetail/risk.shtml?id=${data.id}&irisktype=3" allowtransparency="true" frameborder="0" scrolling="0" width="100%" height="200px"></iframe>
                </div>
                <fieldset class="layui-elem-field layui-field-title">
                    <legend>未备案企业</legend>
                </fieldset>
                <div class="layui-form-item">
                    <iframe  src="${ctx}/hy/authapplyriskdetail/risk.shtml?id=${data.id}&irisktype=4" allowtransparency="true" frameborder="0" scrolling="0" width="100%" height="200px"></iframe>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>