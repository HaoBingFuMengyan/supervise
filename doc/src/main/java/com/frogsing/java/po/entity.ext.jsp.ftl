<#include  "/function.ftl">
<#assign g_entityname="" />
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
<#list entity.columns as col>
<#if col.domain.consts??>
var g_${col.domain.code}=eval("(<consts:${col.domain.code} op='ext'/>)");
</#if>
</#list>
<#assign g_entityname=toJavaName(entity.code)>

Ext.onReady(function(){
	${g_entityname}View.me=new ${g_entityname}View();
	${g_entityname}.me=new ${g_entityname}();
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
				//<shiro:hasPermission name="${toJavaName(entity.code)?lower_case}:edit">
				op+='<a ext:qtip="编辑" href=javascript:${g_entityname}View.me.edit("' + val + '")>编辑</a>';
				//</shiro:hasPermission>
				//<shiro:hasPermission name="${toJavaName(entity.code)?lower_case}:detail">
				op+='&nbsp;&nbsp;<a ext:qtip="查看" href=javascript:${g_entityname}View.me.detail("' + val + '")>查看</a>';
				//</shiro:hasPermission>
				return op;
			}
		}
	};
	this.tool_bars = {
			
			//<shiro:hasPermission name="${toJavaName(entity.code)?lower_case}:add">
			'10添加': new Ext.Button({
				text : '添加',
				tooltip : '添加${entity.name}',
				iconCls : 'add',
				handler : function() {
					${g_entityname}View.me.add();
				}
			}),
			'15-':'-',
			//</shiro:hasPermission>
			//<shiro:hasPermission name="${toJavaName(entity.code)?lower_case}:delete">
			'20删除': new Ext.Button({
				text : '删除',
				tooltip : '删除${entity.name}',
				iconCls : 'del',
				handler : function() {
					${g_entityname}View.me.del();
				}
			})	, 
			'25-':'-',
			//</shiro:hasPermission>
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
	//列表编辑的函数
    this.edit=function(id){
    	var record=${g_entityname}View.me.ds.getById(id);
    	$tt.setFields(record,${g_entityname}.me.fields);
    	${g_entityname}.me.win.show();
    };
    //列表查看视图
    this.detail=function(id){
    	//var record=${g_entityname}View.me.ds.getById(id);
    	$tt.open('${g_entityname}Detail',g_ctx + '/${toPackageName(entity.code)}/${toJavaName(entity.code)?lower_case}/v/detail.shtml?sframeid=${g_entityname}Detail&id='+id,'查看${entity.name}',700,600);
    };
    //删除数据的函数
     this.del=function(){
    	//得到选择集合
    	var record = this.grid_panel.getSelectionModel().getSelections();	
    	var ary=new Array();
    	for(var i=0;i<record.length;i++){
    		ary[i]=record[i].data.id;
    	}	
    	if(record.length!=0){//如果选择不为空的话	
    		Ext.MessageBox.confirm('确认', '您确定要删除选定记录吗?',function(btn,text){
    			if(btn=='yes'){
    				Ext.Ajax.request({
    					url:g_ctx + '/${toPackageName(entity.code)}/${toJavaName(entity.code)?lower_case}/delete.shtml',
    					params:{checkboxId:ary},
    					success:function(response,action){
    						for(var i=0;i<record.length;i++){
    							${g_entityname}View.me.ds.remove(record[i]);
    						}
    					},
    					failure:function(){
    						alert("删除记录失败");
    					}
    				});
    			}
    		});
    	}else{//选择为空
    		alert("请选择要删除的记录");
    	}
    };
    
    this.add = function(){
    	$tt.setFields(null,${g_entityname}.me.fields);
    	${g_entityname}.me.win.show();
    }    
}
function ${g_entityname}() { 

	${g_entityname}.me=this;
	this.name = '_${g_entityname}';
	this.fields = {
		id : new Ext.form.Hidden({
			id:'id_id',
		    name:'id'
		}),
		<#list entity.columns as col>
		<#if col.code?lower_case != "sguid">		
		<#if col.domain.code="BoolType">
		hdn_${col.code?lower_case} : new Ext.form.Hidden({
			id:'hdn_${col.code?lower_case}_id',
		    name:'${col.code?lower_case}',
		    value:0
		}),
		</#if>
		${col.code?lower_case}:<@docontrol field=col hasnext=col_has_next/>
		</#if>
		</#list>
	};

	this.rows = {
		row1 : {// 行开始
			layout : "column",
			labelWidth : 80,
			items : [
			<#list entity.columns as col>
			<#if col.code?lower_case != "sguid"><#if ((col_index-1) != 0 && (col_index-1) % 3 ==0)>]<#lt>
		},
		row${((col_index-1)/3)?int+1}:{//第${((col_index-1)/3)?int+1}行开始
			layout : "column",
			labelWidth : 80,
			items : [
			</#if><#t>
				$tt.toCol(this.fields.${col.code?lower_case},.3)<#rt>
			<#if col_has_next><#if ((col_index-1) == 0  || (col_index-1) % 3 !=2)>,</#if></#if><#lt>
			</#if><#t>
			</#list><#lt>
			]
		},
		rowhidden:{items:[
			$tt.toCol(this.fields.id,.0)
			<#list entity.columns as col>
			<#if col.domain.code="BoolType">
			,$tt.toCol(this.fields.hdn_${col.code?lower_case},.0)
			</#if>
			</#list>
		]
		}
		
	};

	this.buttons = {
		ok:new Ext.Button({
	            text: '确认',
	            type:'submit',
	            handler:function(btn,e){
	              if(${g_entityname}.me.form_panel.form.isValid()){
	              		//屏蔽按钮，防止多次提交
	              		btn.disable();  
	              		${g_entityname}.me.form_panel.form.doAction('submit',{
		              		url:g_ctx + '/${toPackageName(entity.code)}/${toJavaName(entity.code)?lower_case}/save.shtml',
		              		method:'POST',
		              		success:function(form,action){
		              				//$msg.show("操作成功!");
									${g_entityname}.me.win.hide();
			              			${g_entityname}.me.buttons.ok.disable();//审核按钮不可用
			              			btn.enable();
			              			${g_entityname}View.me.ds.reload();
								
								
		              		},
		              		failure:function(form,action){
		              			btn.enable();
		              			$msg.failure(action);
		          		  		
		                 	}
		             	});
	             	}
	            }
	        }), close:{
	            text: '关 闭',
	            handler:function(){
	            	${g_entityname}.me.win.hide();
	            	${g_entityname}.me.form_panel.form.reset();//form重置
	           }
	        }
	};
	this.form_panel = new Ext.FormPanel({
		id : this.name + "formpanel",
		layout : "form",
		labelAlign : "right",
		border : false,
		buttonAlign : 'center',
		frame : true,
		autoScrool : true,
		anchor : '90%',
		labelWidth : 80,
		items : $tt.toArray(this.rows),
		buttons : $tt.toArray(this.buttons)
	});
	this.win = new Ext.Window({
		id : this.name + "win",
		title : '编辑${entity.name}',
		layout : 'fit', // 之前提到的布局方式fit，自适应布局
		width : 850,
		height : 300,
		plain : true,
		maximizable : false,// 禁止最大化
		closeAction : 'hide',
		// closable:false,//禁止关闭
		// collapsible:true,//可折叠
		plain : true,
		buttonAlign : 'center',
		resizable : false,
		modal : true,
		items : this.form_panel
	});	
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
<#list node.tables  as entity>
<#if entity.code==object()>
<@entityM entity=entity/>
<#break/>
</#if>
</#list>
</#macro>
<#macro docontrol field hasnext>
<#switch field.type?lower_case>
<#case "string">
new Ext.form.TextField({
			fieldLabel: '${field.name}',
	//		id:'${field.code?lower_case}_id',
		    name:'${field.code?lower_case}',
		    maxLength:${field.length?string("0")},
		    allowBlank:<#if field.mandatory==0>true<#else>false</#if>,
		    blankText:'请输入${field.name}'
		})<#if hasnext>,</#if>
<#break>
<#case "int">
<#case "long">
  <#if field.domain.code="BoolType">
new Ext.form.Checkbox({   
		//	id : '${field.code?lower_case}_id',
			hiddenName:'${field.code?lower_case}',
			boxLabel : '${field.name}',  
            checked : false,
        	listeners:{
				check:function(th,checked){
					if(checked)
						${g_entityname}.me.fields.hdn_${field.code?lower_case}.setValue(1);
					else
						${g_entityname}.me.fields.hdn_${field.code?lower_case}.setValue(0);
				}
			}

		})<#if hasnext>,</#if>
  <#else>
  <#if field.domain.consts??>
new Ext.form.ComboBox({
            fieldLabel: '${field.name}',
		//	id:'${field.code?lower_case}_id',
   			hiddenName:'${field.code?lower_case}',
			store : g_${field.domain.code},
			anchor:'94%',
			valueField : "id",
			displayField : "name",
			mode : 'local',
			forceSelection : true,
			editable : false,
			triggerAction : 'all',
          	allowBlank:<#if field.mandatory==0>true<#else>false</#if>,
            blankText:'请输入${field.name}'
		})<#if hasnext>,</#if>
  <#else>
new Ext.form.NumberField({
			fieldLabel: '${field.name}',
		//	id:'${field.code?lower_case}_id',
	        name:'${field.code?lower_case}',
	        allowBlank:<#if field.mandatory==0>true<#else>false</#if>,
	        blankText:'请输入${field.name}',
			regex : $zz.int_0.rule,
			regexText : $zz.int_0.tip
		})<#if hasnext>,</#if>
</#if>
</#if>
	<#break>
<#case "double">
new Ext.form.NumberField({
			fieldLabel: '${field.name}',
		//	id:'${field.code?lower_case}_id',
	        name:'${field.code?lower_case}',
	        allowBlank:<#if field.mandatory==0>true<#else>false</#if>,
	        blankText:'请输入${field.name}',
			regex : $zz.double_2.rule,
			regexText : $zz.double_2.tip
		})<#if hasnext>,</#if>
	<#break>
<#case "date">
new Ext.form.DateField({
			fieldLabel: '${field.name}',
		//	id:'${field.code?lower_case}_id',
	        name:'${field.code?lower_case}',
	        allowBlank:<#if field.mandatory==0>true<#else>false</#if>,
	        blankText:'请输入${field.name}',
			showToday: false,
	        editable : false,
	        format: 'Y-m-d'
		})<#if hasnext>,</#if>
	<#break>
<#default>
new Ext.form.TextField({
			fieldLabel: '${field.name}',
		//	id:'${field.code?lower_case}_id',
	        name:'${field.code?lower_case}',
	        maxLength:${field.length?string("0")},
	        allowBlank:<#if field.mandatory==0>true<#else>false</#if>,//${field.mandatory}
	        blankText:'请输入${field.name}'
		})<#if hasnext>,</#if>
<#break>
</#switch>
</#macro>
<#macro doheader field hasnext>
<#assign headercommon="header:'${field.name}',align:'left',dataIndex:'${field.code?lower_case}'" />
<#switch field.type>
<#case "int">
  <#if field.domain.code="Bool">
{${headercommon},renderer:function(val){
	if(val==0)
		return "否";
	else
		return "是";
}}<#if hasnext>,</#if>
  <#else>
  <#if field.domain.consts??>
{${headercommon},renderer:function(val){
	return $msg.label(g_${field.domain.code},val);
}}<#if hasnext>,</#if>
  <#else>
{${headercommon}}<#if hasnext>,</#if>
  </#if>
</#if>
	<#break>
<#case "double">
{${headercommon},renderer:function(val){
	return $tt.format(val,'0.00');
}}<#if hasnext>,</#if>
	<#break>
<#default>
{${headercommon}}<#if hasnext>,</#if>
<#break>
</#switch>
</#macro>
<@LL node=pdm />