<%@ taglib prefix="member" uri="http://www.frogsing.com/tags/member" %>
<%@ taglib prefix="cs" uri="http://www.frogsing.com/tags/parameter" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<html>
<head>

    <title>基本信息</title>
    <meta name="decorator" charset="" content="jj">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<style>
    .layui-info .layui-form-item .layui-inline .layui-input-inline{
        color:#333
    }
    .redfont{
        color:#ff0000
    }
    legend{
        font-size: 15px!important;
        color:#1E9FFF
    }
</style>
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
                        <div class="layui-input-inline redfont">
                            ${data.iregmoney}
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">入驻方式：</label>
                        <div class="layui-input-inline">
                            <member:AuthapplySource op="label" val="${data.iauthapplysource}"/>
                        </div>
                    </div>
                    <c:if test="${data.iauthapplysource eq 20}">
                        <div class="layui-inline">
                            <label class="layui-form-label">企业名称：</label>
                            <div class="layui-input-inline">
                                ${data.scnname}
                            </div>
                        </div>
                    </c:if>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">执行董事(董事长)：</label>
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
                                    ${data.sdsjobcnname}
                                </c:when>
                                <c:otherwise>
                                    无
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
                                    ${data.sjljobcnname}
                                </c:when>
                                <c:otherwise>
                                    无
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">法定代表人：</label>
                        <div class="layui-input-inline">
                            ${data.slegalpersonname}
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">状态：</label>
                        <div class="layui-input-inline">
                            <member:CheckStatus op="label" val="${data.istatus}"/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">变更状态：</label>
                        <div class="layui-input-inline">
                            <member:ApprovalStatus op="label" val="${data.iapprovalstatus}"/>
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <c:if test="${data.istatus eq 1}">
                        <div class="layui-inline">
                            <label class="layui-form-label">注册地址：</label>
                            <div class="layui-input-inline">
                                    ${data.sregaddress}
                            </div>
                        </div>
                    </c:if>
                </div>


            </div>
        </div>
    </div>
</div>

<c:if test="${data.bisincompany eq 1 || (data.istatus eq 1 && (data.iprocess eq 10 || data.iprocess eq 20 || data.iprocess eq 30 || data.iprocess eq 40))}">
    <div class="layui-collapse" style="border-top: none;margin-top: 10px;">
        <div class="layui-colla-item">
            <div class="layui-colla-content layui-show">
                <div class="layui-info">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">企业名称：</label>
                            <div class="layui-input-inline">
                                    ${data.scnname}
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">通讯地址：</label>
                            <div class="layui-input-inline">
                                ${data.sbusaddress}
                            </div>
                        </div>
                    </div>
                    <fieldset class="layui-elem-field layui-field-title">
                    <legend>法定代表人/委派代表信息</legend>
                    </fieldset>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">名称：</label>
                            <div class="layui-input-inline">
                                    ${data.sfdlinkman}
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">手机号：</label>
                            <div class="layui-input-inline">
                                    ${data.sfdsmobile}
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">Email：</label>
                            <div class="layui-input-inline">
                                    ${data.sfdemail}
                            </div>
                        </div>
                    </div>
                    <fieldset class="layui-elem-field layui-field-title">
                    <legend>企业联系人信息</legend>
                    </fieldset>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">名称：</label>
                            <div class="layui-input-inline">
                                    ${data.slinkman}
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">手机号：</label>
                            <div class="layui-input-inline">
                                    ${data.smobile}
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">Email：</label>
                            <div class="layui-input-inline">
                                    ${data.semail}
                            </div>
                        </div>
                    </div>
                    <fieldset class="layui-elem-field layui-field-title">
                    <legend>实际控制人信息</legend>
                    </fieldset>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">名称：</label>
                            <div class="layui-input-inline">
                                    ${data.skzrlinkman}
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">手机号：</label>
                            <div class="layui-input-inline">
                                    ${data.skzrsmobile}
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">Email：</label>
                            <div class="layui-input-inline">
                                    ${data.skzremail}
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">营业执照：</label>
                            <div class="layui-input-inline">
                                <img src="<cs:SysParaType imgurl="1" op="syspara"/>${data.sbusinessno}" width="200" height="" alt="">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">承诺函：</label>
                            <div class="layui-input-inline">
                                <img src="<cs:SysParaType imgurl="1" op="syspara"/>${data.scnuno}" width="200" height="" alt="">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">控制人关系图：</label>
                            <div class="layui-input-inline">
                                <img src="<cs:SysParaType imgurl="1" op="syspara"/>${data.sgxrtno}" width="200" height="" alt="">
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</c:if>
</body>
</html>