<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE html >
<html>
<head>
	<title>库存项目管理</title>
	<meta name="decorator" charset="" content="jj">
</head>
<body>
<script>
	$(document).ready(function(){
	    tt.readonly();
	});
</script>
<div class="mbody">
	<c:set var="p" value="${data}"/>
	<mw:msg/>
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
		<legend>概要</legend>
	</fieldset>
	<div >
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">存货方 </label>
					<div class="layui-form-mid ">
						${p.ssalename }
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">项目周期 </label>
					<div class="layui-input-inline">
						<input type="text" id="icycle" name="icycle" value='${p.icycle }' required lay-verify="required|number" placeholder="(必填项)"  class="layui-input" autocomplete="off"/>
					</div>
					<div class="layui-form-mid layui-word-aux">月</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">计息日 </label>
					<div class="layui-input-inline">
						<input type="text" id="dintereststart" name="dintereststart"
							   value='<mw:format label="date" value="${p.dintereststart }" format="yyyy-MM-dd"></mw:format>' required lay-verify="required" placeholder="(必填项)"   class="layui-input" autocomplete="off"/>
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">采购总额 </label>
					<div class="layui-input-inline">
						<input id="fbuyamount" type="text" name="fbuyamount"
							   value="<mw:format label='money' value='${p.fbuyamount}'/>" readonly="readonly"  class="layui-input" autocomplete="off"/>
					</div>
					<div class="layui-form-mid layui-word-aux">元</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">销售总额 </label>
					<div class="layui-input-inline">
						<input id="fsaleamount" type="text" name="fsaleamount"
							   value="<mw:format label='money' value='${p.fsaleamount }'/>" readonly="readonly" class="layui-input" autocomplete="off"/>
					</div>
					<div class="layui-form-mid layui-word-aux">元</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">代理总额 </label>
					<div class="layui-input-inline">
						<input id="fproxyamount" type="text" name="fproxyamount"
							   value="<mw:format label='money' value='${p.fproxyamount}'/>" readonly="readonly" class="layui-input" autocomplete="off"/>
					</div>
					<div class="layui-form-mid layui-word-aux">元</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">融资金额 </label>
					<div class="layui-input-inline">
						<input type="text" id="floanamount" name="floanamount"
							   value="<mw:format label='money' value='${p.floanamount }'/>" required lay-verify="required|number" placeholder="(必填项)"  class="layui-input" autocomplete="off"/>
					</div>
					<div class="layui-form-mid layui-word-aux">元</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">年化利率 </label>
					<div class="layui-input-inline">
						<input type="text" id="fcontractrate" name="fcontractrate"
							   value="<mw:format label='percent' value='${p.fcontractrate }'/>" required lay-verify="required|number" placeholder="(必填项)"  class="layui-input" autocomplete="off"/>
					</div>
					<div class="layui-form-mid layui-word-aux">%</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">存货仓库 </label>
					<div class="layui-input-inline">
						<input type="hidden" id="swarehouseid" name="swarehouseid" value="${p.swarehouseid }"/>
						<input type="text" id="swarehousename" name="swarehousename" value="${p.swarehousename }" required lay-verify="required" placeholder="(必选项)"  class="layui-input" autocomplete="off"/>
					</div>
				</div>
			</div>
			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">备注</label>
				<div class="layui-input-block">
					<textarea placeholder="请输入备注" class="layui-textarea" name="sremark">${p.sremark }</textarea>
				</div>
			</div>

			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
				<legend>明细</legend>
			</fieldset>
			<table   lay-filter="pledges" id="pledges" lay-size="sm" style="display:none;">
				<thead>
				<tr>
					<th lay-data="{field:'a',width:150}">物资名称</th>
					<th lay-data="{field:'b',width:150}">规格型号</th>
					<th lay-data="{field:'c',width:150}">生产厂商</th>
					<th lay-data="{field:'d',width:150}">所属设备信息</th>
					<th lay-data="{field:'e',width:150}">数量</th>

					<th lay-data="{field:'f',width:150}">采购单价(元)</th>
					<th lay-data="{field:'g',width:150}">销售单价(元)</th>
					<th lay-data="{field:'h',width:150}">代理单价(元)</th>
					<th lay-data="{field:'i',width:150}">应入库量</th>
					<th lay-data="{field:'j',width:150}">已入库量</th>
					<th lay-data="{field:'k',width:150}">可用量</th>
					<th lay-data="{field:'l',width:150}">冻结量</th>
					<th lay-data="{field:'m',width:150}">出库量</th>
				</tr>
				</thead>
				<tbody>

					<c:forEach items="${p.detailsList}" var="sin" varStatus="ind">
						<tr data-flag="${sin.id }" id="${sin.id}_data">
							<td>
								${sin.scommodityname }</td>
							<td>${sin.sspec }</td>
							<td>${sin.sproducer }</td>
							<td>${sin.shostname }、${sin.shostmodel }、${sin.shostbrand }</td>
							<td>${jj:weight(sin.fweight)}&nbsp;${sin.sweightunit}</td>

							<td><mw:format label="money" value="${sin.fbuyprice}"/></td>
							<td data-name="fsaleprice">
							<mw:format label="money" value="${sin.fsaleprice}"/></td>
							<td>${jj:weight(sin.fproxyprice)}</td>
							<td>${jj:weight(sin.fnoticeinweight)}</td>
							<td>${jj:weight(sin.finwegith)}</td>
							<td>${jj:weight(map[sin.id].fcanuse)}</td>
							<td>${jj:weight(map[sin.id].flock)}</td>
							<td>${jj:weight(map[sin.id].fout)}</td>


						</tr>
					</c:forEach>

				</tbody>
			</table>

		<script>
            layui.use('table', function(){
                var table = layui.table;
                table.init('pledges', { //转化静态表格
                });

            });
		</script>
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
				<legend>附件 </legend>
			</fieldset>

			<table class="layui-table" lay-size="sm">
				<colgroup>
					<col width="40%">
					<col>
					<col width="10%">
				</colgroup>
				<thead>
				<tr>
					<th >附件</th>
					<th >说明</th>
				</tr>
				</thead>
				<tbody id="morefile">
				<c:forEach items="${flist}" var="file" varStatus="stat">
					<tr>
						<td>
							<a href="${file.surl}" target="_blank"> ${file.sname}</a></td>
						   <td>${file.sremark }</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>

	</div>


</div>

</body>
</html>