<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ include file="/include/taglib.jsp"%>
<%@ taglib prefix="area" uri="http://www.frogsing.com/tags/area" %>
<%@ taglib prefix="contract" uri="http://www.frogsing.com/tags/contract" %>
<%@ taglib prefix="consts" uri="http://www.frogsing.com/tags/consts" %>

<div class="layui-collapse top10">
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">
            入库单编号：${stockInNotice.sorderno}&nbsp;&nbsp;&nbsp;&nbsp;
            状态：<font color="blue"><contract:StockInStatus val="${stockInNotice.istatus}" op="label"/></font>
        </h2>
        <div class="layui-colla-content layui-show">
            <div class="layui-info">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">项目编号：</label>
                        <div class="layui-input-inline">
                            ${stockInNotice.sprojectcode}
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label  class="layui-form-label">存货会员： </label>
                        <div class="layui-input-inline">
                            ${stockInNotice.member.scnname}
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label  class="layui-form-label">供应商： </label>
                        <div class="layui-input-inline">
                            ${stockInNotice.project.ssalename}
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline" >
                        <label class="layui-form-label">入库仓库:</label>
                        <div class="layui-input-inline">
                            ${warehouse.swarehousename}
                        </div>
                    </div>
                    <div class="layui-inline" >
                        <label class="layui-form-label">仓库联系人:</label>
                        <div class="layui-input-inline">
                            ${warehouse.slinkman}
                        </div>
                    </div>
                    <div class="layui-inline" >
                        <label class="layui-form-label">仓库联系电话:</label>
                        <div class="layui-input-inline">
                            ${warehouse.smobile}
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">送货人：</label>
                        <div class="layui-input-inline">
                            ${stockInNotice.sdrivername}
                        </div>
                    </div>
                    <div class="layui-inline" >
                        <label class="layui-form-label">身份证号:</label>
                        <div class="layui-input-inline">
                             ${stockInNotice.sidcardno}
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label  class="layui-form-label">联系方式： </label>
                        <div class="layui-input-inline">
                            ${stockInNotice.smobile}
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label  class="layui-form-label">送货时间： </label>
                        <div class="layui-input-inline">
                            ${stockInNotice.ssendtime}
                        </div>
                    </div>
                    <div class="layui-inline" style="width:30%;">
                        <label class="layui-form-label">送货车型 </label>
                        <div class="layui-input-inline">
                                ${stockInNotice.scartype}
                        </div>
                    </div>
                    <div class="layui-inline" style="width:30%;">
                        <label class="layui-form-label">车牌号 </label>
                        <div class="layui-input-inline">
                             ${stockInNotice.scarnum}
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline" >
                        <label class="layui-form-label">送货单号</label>
                        <div class="layui-input-inline">
                              ${stockInNotice.spaperoutno}
                        </div>
                    </div>
                    <div class="layui-inline" style="width: 60%;">
                        <label  class="layui-form-label">备注：</label>
                        <div class="layui-input-inline">
                            ${stockInNotice.sremark}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<table class="layui-table" lay-size="sm" lay-filter="detail">
    <thead>
    <tr>
        <th lay-data="{field:'scommoditycode', width:150,totalRowText:'合计：'}">物资编码</th>
        <th lay-data="{field:'scommodityname'}">品名</th>
        <th lay-data="{field:'sspec'}">规格</th>
        <th lay-data="{field:'sproducer'}">厂家</th>
        <th lay-data="{field:'foderweight', width:120,totalRow:true,align:'right'}">应入库量</th>
        <th lay-data="{field:'finweight', width:120,totalRow:true,align:'right'}">已入库量</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${stockInNotice.details}" var="obj">
        <c:set var="sin" value="${obj.projectDetail}"/>
        <tr>
            <td> ${sin.scommoditycode }</td>
            <td> ${sin.scommodityname }</td>
            <td>${sin.sspec }</td>
            <td>${sin.sproducer }</td>
            <td>${obj.foderweight} </td>
            <td>${obj.finweight} </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<script type="text/javascript">
    layui.use(['table','layer'],function(){
        var table = layui.table;

//转换静态表格
        table.init('detail', {
            //totalRow:true,
            limit: 10000 //注意：请务必确保 limit 参数（默认：10）是与你服务端限定的数据条数一致
        });
    });
</script>