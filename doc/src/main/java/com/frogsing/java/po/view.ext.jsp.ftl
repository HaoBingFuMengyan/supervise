<#include  "/function.ftl">
<#assign g_entityname="" />
<#function toMyType field>
<#assign t=field.type />
<#if field.domain?? && field.domain.consts??><#assign t=field.type /> <#else><#assign  t=field.type /></#if>
<#if field.type="int">
<#return "Integer">
<#else>
<#if field.type="long">
<#return "Long">
<#else>
<#if field.type="double">
<#return "Double">
</#if>

<#return field.type>
</#if>
</#if>

</#function>
<#macro entityM entity>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/include/exthead.jsp" %> 
//<%--
/*
--%>
<html>
<head>
<script type="text/javascript">
<%--*///--%>
<#assign ctx="$"+"{ctx}" />
<#assign limit="$"+"{limit}"  />
var g_ctx='${ctx}';
var g_limit='${limit}';

<#assign g_entityname=toJavaName(entity.code)>

Ext.onReady(function(){
	${g_entityname}View.me=new ${g_entityname}View();
	// 放到容器中
	new Ext.Viewport({
		layout : 'fit',
		items : [${g_entityname}View.me.grid_panel]
	});
});

function ${g_entityname}View() {
	${g_entityname}View.me=this; 
	this.name = '${entity.code?lower_case}';
	this.sm = new Ext.grid.CheckboxSelectionModel();
	this.ds_fmt = Ext.data.Record.create([
			{name:"id"},
			<#list entity.columns as col><#if col.code?lower_case != "sguid">{name:"${col.code?lower_case}"}<#if col_has_next>,
			</#if></#if></#list>]);
	//构造DS		
	this.ds = new Ext.data.Store({
				proxy : new Ext.data.HttpProxy({
							url :  g_ctx + '/${toPackageName(entity.code)}/${toJavaName(entity.code)?lower_case}/list.shtml'
						}),
				reader : new Ext.data.JsonReader({
							root : 'content',
							totalProperty : 'totalElements'
						}, this.ds_fmt)
			});
	// 构造每一列
	this.columns = {
		'1':new Ext.grid.RowNumberer(),
		'2':this.sm,
		<#list entity.columns as col><#if col.code?lower_case != "sguid">		'${col_index+2}':<#if col_has_next><@doheader field=col hasnext=true/><#else><@doheader field=col hasnext=false/></#if></#if></#list>
		,
		'操作':{
			header : "操作",
			width : 80,
			align : 'left',
			dataIndex : 'id',
			renderer : function(val, cellmeta, record, rowIndex, columnIndex, store) {
				var op="";
				//<shiro:hasPermission name="${toJavaName(entity.code)?lower_case}:detail">
				op+='&nbsp;&nbsp;<a ext:qtip="查看" href=javascript:${g_entityname}View.me.detail("' + val + '")>查看</a>';
				//</shiro:hasPermission>
				return op;
			}
		}
	};
	this.tool_bars = {
			'30刷新':new Ext.Button({
				text : '刷新',
				tooltip : '刷新数据',
				iconCls : 'refresh',
				handler : function() {
					$tt.clearSearch(${g_entityname}View.me.tool_bars);
					${g_entityname}View.me.ds.reload();
				}
			}),
			'40-':'-',
			'50查询': new Ext.Button({
				text : '查询',
				iconCls : 'bbcx',
				handler : function() {
					${g_entityname}View.me.ds.load();
				}
			}),
			'90清除':new Ext.Button({
				text : '清除',
				iconCls : 'xgmm',
				handler : function() {
					$tt.clearSearch(${g_entityname}View.me.tool_bars);
				}
			})
	};
	this.bottom_bar = new Ext.PagingToolbar({
		pageSize : Number(g_limit),
		store : this.ds,
		displayInfo : true,
		displayMsg : '显示第 {0} 条到 {1} 条记录，共 {2} 条',
		emptyMsg : "无记录！"
	});
	// 构造grid
	this.grid_panel = new Ext.grid.GridPanel({
		clicksToEdit : 1,// 点击编辑次数
		id : this.name + "grid_panel",
		store : this.ds,
		trackMouseOver : true,// 移动行变亮
		border : false,
		viewConfig : {
			forceFit : true
		},
		height : 550,
		loadMask : true,
		loadMask : {
			msg : '正在加载数据...'
		},
		renderTo : Ext.getBody(),
		sm : this.sm,
		cm : new Ext.grid.ColumnModel({
			defaults : {
				sortable : true, // columns are not sortable
				align : 'center'
			},
			columns : $tt.toArray(this.columns)
		}),
		tbar : $tt.toArray(this.tool_bars),
		bbar : this.bottom_bar
	});

	

	this.ds_on_beforeload = function(e) {
		var params = $tt.toPara(${g_entityname}View.me.tool_bars);
		//<c:forEach var="obj" items="${'$'}{searchs}" >
		params['${'$'}{obj.key}']='${'$'}{obj.value}';
		//</c:forEach>
		Ext.apply(${g_entityname}View.me.ds.baseParams, params);
	};
	
	this.ds.on('beforeload', this.ds_on_beforeload);
	this.ds.load();

    //列表查看视图
    this.detail=function(id){
    	//var record=${g_entityname}View.me.ds.getById(id);
    	$tt.open('${g_entityname}Detail',g_ctx + '/${toPackageName(entity.code)}/${toJavaName(entity.code)?lower_case}/v/details.shtml?sframeid=${g_entityname}Detail&id='+id,'查看${entity.name}',700,600);
    };
      
}
	//<%--
	/*--%>
	</script>
</head>
<body>
</body>
</html>
<%--*/
//--%>
</#macro>
<#macro LL node>
<#list node.views  as entity>
<#if entity.code==object()>
<@entityM entity=entity/>
<#break/>
</#if>
</#list>
</#macro>
<#macro doheader field hasnext>
<#assign headercommon="header:'${field.name}',align:'left',dataIndex:'${field.code?lower_case}'" />
{${headercommon}}<#if hasnext>,</#if>
</#macro>
<@LL node=pdm />