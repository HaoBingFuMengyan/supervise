<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/include/taglib.jsp"%>
<%@ taglib prefix="consts" uri="http://www.frogsing.com/tags/contract" %>

<div class="layui-collapse top10">
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">项目编号：${p.scode}</h2>
        <div class="layui-colla-content layui-show">
            <div class="layui-info">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">存货方：</label>
                        <div class="layui-input-inline">
                            ${p.ssalename}
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label  class="layui-form-label">存货仓库： </label>
                        <div class="layui-input-inline">
                            ${p.swarehousename }
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label  class="layui-form-label">仓储合同号： </label>
                        <div class="layui-input-inline">
                            ${p.swarehousecontractno }
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">代理合同号：</label>
                        <div class="layui-input-inline">
                            ${p.scontractno}
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label  class="layui-form-label">月周转率： </label>
                        <div class="layui-input-inline">
                            <mw:format label='percent' value='${p.fturnoverrate }'/>&nbsp;%
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label  class="layui-form-label">月提货日： </label>
                        <div class="layui-input-inline">
                            ${p.imonthlydelivery }&nbsp;号
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">存货总额：</label>
                        <div class="layui-input-inline">
                            <em><mw:format label='money' value='${p.fprojectamount}'/></em>&nbsp;元
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label  class="layui-form-label">采购总额： </label>
                        <div class="layui-input-inline">
                            <em><mw:format label='money' value='${p.fbuyamount}'/></em>&nbsp;元
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label  class="layui-form-label">代理销售总额： </label>
                        <div class="layui-input-inline">
                            <em><mw:format label='money' value='${p.fsaleamount}'/></em>&nbsp;元
                        </div>
                    </div>

                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">存货周期：</label>
                        <div class="layui-input-inline">
                            ${p.icycle}&nbsp;月
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label  class="layui-form-label">开始日期： </label>
                        <div class="layui-input-inline">
                            <mw:format label="date" value="${p.dbegindate }" format="yyyy-MM-dd"/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label  class="layui-form-label">添加日期： </label>
                        <div class="layui-input-inline">
                            <mw:format label="date" value="${p.dadddate }" format="yyyy-MM-dd"/>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">签订日期：</label>
                        <div class="layui-input-inline">
                            <mw:format label='date' value='${p.dsigndate}' format="yyyy-MM-dd"/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label  class="layui-form-label">生效日期： </label>
                        <div class="layui-input-inline">
                            <mw:format label='date' value='${p.dvaliddate}' format="yyyy-MM-dd"/>
                        </div>
                    </div>

                </div>

                <div class="layui-form-item">
                    <div class="layui-block">
                        <label  class="layui-form-label">备注：</label>
                        <div class="layui-input-block">
                            ${p.sremark}
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
        <th lay-data="{field:'scommodityname', minWidth:150}">物资名称</th>
        <th lay-data="{field:'sspec', minWidth:150}">规格型号</th>
        <th lay-data="{field:'sproducer', minWidth:120}">生产厂家</th>
        <th lay-data="{field:'fweight', width:100}">数量</th>
        <th lay-data="{field:'sweightunit', width:60}">单位</th>
        <th lay-data="{field:'finwegith', width:100,totalRow:true,align:'right'}">入库量</th>
        <th lay-data="{field:'fbuyweight', width:100,totalRow:true,align:'right'}">采购数量</th>
        <th lay-data="{field:'fbuyprice', width:120,align:'right'}">采购单价(元)</th>
        <th lay-data="{field:'fbuyamount', width:120,totalRow:true,align:'right'}">采购总额(元)</th>
        <th lay-data="{field:'fsaleweight', width:120,totalRow:true,align:'right'}">代理销售量</th>
        <th lay-data="{field:'fsaleamount', width:120,totalRow:true,align:'right'}">代理销售总额(元)</th>
        <th lay-data="{field:'foutweight', width:100,totalRow:true,align:'right'}">出库量</th>
        <th lay-data="{field:'sremark', minWidth:150}">交货周期</th>
    </tr>
    </thead>
    <tbody>

    <c:forEach items="${p.detailsList}" var="sin" varStatus="ind">
        <tr>
            <td>${sin.scommoditycode }</td>
            <td>${sin.scommodityname }</td>
            <td>${sin.sspec }</td>
            <td>${sin.sproducer }</td>
            <td>${sin.fweight}</td>
            <td>${sin.sweightunit }</td>
            <td>${sin.finwegith}</td>
            <td>${sin.fbuyweight}</td>
            <td><mw:format label="money" value="${sin.fbuyprice}"/></td>
            <td><mw:format label="money" value="${sin.fbuyamount}" /></td>
            <td>${sin.fsaleweight}</td>
            <td><mw:format label="money" value="${sin.fsaleamount}"/></td>
            <td>${sin.foutweight}</td>
            <td>${sin.sremark}</td>

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



