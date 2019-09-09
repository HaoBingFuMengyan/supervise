<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ include file="/include/taglib.jsp"%>
<%@ taglib prefix="area" uri="http://www.frogsing.com/tags/area" %>

<script type="text/javascript">
    jj.validate("#formx");
</script>
<form action="${ctx}/wf/workflow/shure.json" method="post" id="formx" enctype="multipart/form-data" novalidate="novalidate">
    <input type="hidden" name="id" value="${param.id}">
    <input type="hidden" name="type" id="type" value="1">

    <div class="layui-collapse top10">
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">
                审批流
            </h2>
            <div class="layui-colla-content layui-show">
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">审核意见</label>
                    <div class="layui-input-block">
                        <textarea placeholder="请输入审核意见" class="layui-textarea required" id="scheckinfo" name="scheckinfo"></textarea>
                    </div>
                </div>

            </div>
        </div>
    </div>

</form>

