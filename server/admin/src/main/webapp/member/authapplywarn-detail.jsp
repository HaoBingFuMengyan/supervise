<%@ taglib prefix="member" uri="http://www.frogsing.com/tags/member" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<html>
<head>

    <title>风险排查详情</title>
    <meta name="decorator" charset="" content="jj">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

</head>
<body>
<div class="layui-collapse" style="border-top: none;">
    <div class="layui-colla-item">
        <div class="layui-colla-content layui-show" style="padding-top: 30px">
            <div class="layui-info">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">业务类型：</label>
                        <div class="layui-input-inline">
                            <member:BizType op="label" val="${data.ibiztype}"/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">企业名称：</label>
                        <div class="layui-input-inline">
                            ${data.scnname}
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">社会统一信用代码：</label>
                        <div class="layui-input-inline">
                            ${data.ssocialcreditno}
                        </div>
                    </div>
                </div>
                <fieldset class="layui-elem-field layui-field-title">
                    <legend>法定代表人/执行事务合伙人</legend>
                </fieldset>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">姓名：</label>
                        <div class="layui-input-inline">
                            ${data.sname}
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">证件类型：</label>
                        <div class="layui-input-inline">
                            <member:MemberCardType op="label" val="${data.icardtype}"/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">证件号：</label>
                        <div class="layui-input-inline">
                            ${data.scardno}
                        </div>
                    </div>
                </div>
                <fieldset class="layui-elem-field layui-field-title">
                    <legend>实际控制人</legend>
                </fieldset>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">姓名：</label>
                        <div class="layui-input-inline">
                            ${data.skzrname}
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">证件类型：</label>
                        <div class="layui-input-inline">
                            <member:MemberCardType op="label" val="${data.ikrzcardtype}"/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">证件号：</label>
                        <div class="layui-input-inline">
                            ${data.skzrcardno}
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">状态：</label>
                        <div class="layui-input-inline">
                            <member:CheckStatus op="label" val="${data.istatus}"/>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>