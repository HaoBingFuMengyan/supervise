<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ include file="/include/taglib.jsp" %>
<%@ taglib prefix="area" uri="http://www.frogsing.com/tags/area" %>
<%@ taglib prefix="wf" uri="http://www.frogsing.com/tags/operator" %>
<%@ taglib prefix="consts" uri="http://www.frogsing.com/tags/consts" %>


<div class="layui-collapse top10">
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">审批流信息</h2>
        <div class="layui-colla-content layui-show">
            <div class="layui-info">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">名称：</label>
                        <div class="layui-input-inline">
                            ${data.sname}
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">业务类型：</label>
                        <div class="layui-input-inline">
                            <wf:WfBizType op="label" val="${data.ibiztype}"/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">业务编号：</label>
                        <div class="layui-input-inline">
                            ${data.sbizno}
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">签约主体：</label>
                        <div class="layui-input-inline">
                            ${data.ssignbody}
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">履约期限(月)：</label>
                        <div class="layui-input-inline">
                            ${data.icycle}
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">金额(元)：</label>
                        <div class="layui-input-inline">
                            <mw:format label="money" value="${data.ftotalamount}"/>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">承办人：</label>
                        <div class="layui-input-inline">
                            ${data.saddoperator}
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">发起时间：</label>
                        <div class="layui-input-inline">
                            <mw:format label="date" value="${data.dadddate}"/>
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-block">
                        <label class="layui-form-label">资信简介：</label>
                        <div class="layui-input-block">
                            ${data.screditbrief}
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-block">
                        <label class="layui-form-label">合同内容：</label>
                        <div class="layui-input-block">
                            ${data.sdesc}
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
