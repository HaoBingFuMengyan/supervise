<%@ taglib prefix="member" uri="http://www.frogsing.com/tags/member" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<html>
<head>

    <title>基本信息</title>
    <meta name="decorator" charset="" content="jj">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

</head>
<body>
<div class="layui-collapse" style="border-top: none;">
    <div class="layui-colla-item">
        <%--<h2 class="layui-colla-title">会员编号：${data.smemberno}</h2>--%>
        <div class="layui-colla-content layui-show">
            <div class="layui-info">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">注册资金(万元)：</label>
                        <div class="layui-input-inline">
                            ${data.iregmoney}
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">状态：</label>
                        <div class="layui-input-inline">
                            <member:CheckStatus op="label" val="${data.istatus}"/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">审批状态：</label>
                        <div class="layui-input-inline">
                            <member:ApprovalStatus op="label" val="${data.iapprovalstatus}"/>
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">董事姓名：</label>
                        <div class="layui-input-inline">
                            ${data.slegalperson}
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">证件类型：</label>
                        <div class="layui-input-inline">
                            <member:MemberCardType op="label" val="${data.ilegaltype}"/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">证件号码：</label>
                        <div class="layui-input-inline">
                            ${data.slegalpersoncode}
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-block">
                        <label class="layui-form-label">兼职情况：</label>
                        <div class="layui-input-block">
                            <c:choose>
                                <c:when test="${data.bisjoblegal eq 1}">
                                    在XXXXXXXXXXX担任股东/董事/法定代表人/监事等职务
                                </c:when>
                                <c:otherwise>
                                    未在其他公司担任股东/董事/法定代表人/监事等职务
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">经理姓名：</label>
                        <div class="layui-input-inline">
                            ${data.smanagername}
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">证件类型：</label>
                        <div class="layui-input-inline">
                            <member:MemberCardType op="label" val="${data.imanagertype}"/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">证件号码：</label>
                        <div class="layui-input-inline">
                            ${data.smanagerno}
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-block">
                        <label class="layui-form-label">兼职情况：</label>
                        <div class="layui-input-block">
                            <c:choose>
                                <c:when test="${data.bisjobmanager eq 1}">
                                    在XXXXXXXXXXX担任股东/董事/法定代表人/监事等职务
                                </c:when>
                                <c:otherwise>
                                    未在其他公司担任股东/董事/法定代表人/监事等职务
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">法定代表人：</label>
                        <div class="layui-input-inline">
                            <member:CorporateType op="label" val="${data.icorporatetype}"/>
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">申请时间：</label>
                        <div class="layui-input-inline">
                            <mw:format label="datetime" value="${data.dapplydate}"/>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
</body>
</html>