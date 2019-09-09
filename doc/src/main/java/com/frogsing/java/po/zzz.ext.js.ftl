<#include  "/function.ftl">
<#macro entityM entity>
var listview;
var panelForm;
function main(){
	new ${toJavaName(entity.code)}View();
	new ${toJavaName(entity.code)}();
}

function ${toJavaName(entity.code)}View() {
	listview=this;
	this.name = '${entity.code?lower_case}';
	this.url = g_ctx + '/${toPackageName(entity.code)}/${tojsp(toJavaName(entity.code))}!pagelist.action';
	this.delUrl = g_ctx + '/${toPackageName(entity.code)}/${tojsp(toJavaName(entity.code))}!delete.action';
	this.sm = new Ext.grid.CheckboxSelectionModel();
	this.ds_fmt = Ext.data.Record.create([
			{name:"id"},
			<#list entity.columns as col><#if col.code?lower_case != "sguid">{name:"${col.code?lower_case}"}<#if col_has_next>,
			</#if></#if></#list>]);
	//构造DS		
	this.ds = new Ext.data.Store({
				proxy : new Ext.data.HttpProxy({
							url : this.url
						}),
				reader : new Ext.data.JsonReader({
							root : 'rows',
							totalProperty : 'totalProperty'
						}, this.ds_fmt)
			});
	// 构造每一列
	this.columns = {
		'1':new Ext.grid.RowNumberer(),
		'2':this.sm,
		<#list entity.columns as col><#if col.code?lower_case != "sguid">		'${col_index+2}':<@doheader field=col hasnext=true/></#if></#list>
		'编辑':{
			header : "<center>编辑</center>",
			width : 80,
			align : 'left',
			dataIndex : 'id',
			renderer : function(val, cellmeta, record, rowIndex, columnIndex, store) {
				return '<a ext:qtip="编辑" href=javascript:listview.edit("' + val + '")>编辑</a>';
			}
		}
	};
	this.tool_bars = {
			'刷新':new Ext.Button({
				text : '刷新',
				tooltip : '刷新数据',
				iconCls : 'refresh',
				handler : function() {
					listview.ds.load();
				}
			}),
			'3':'-',
			'添加': new Ext.Button({
				text : '添加',
				tooltip : '添加${entity.name}',
				iconCls : 'add',
				handler : function() {
					listview.add();
				}
			}),
			'删除': new Ext.Button({
				text : '删除',
				tooltip : '删除${entity.name}',
				iconCls : 'del',
				handler : function() {
					listview.del();
				}
			}), 
			'查询': new Ext.Button({
				text : '查询',
				iconCls : 'bbcx',
				handler : function() {
					listview.ds.load();
				}
			}),
			'清除':new Ext.Button({
				text : '清除',
				iconCls : 'xgmm',
				handler : function() {
				}
			})
	};
	this.bottom_bar = new Ext.PagingToolbar({
		pageSize : g_limit,
		store : this.ds,
		displayInfo : true,
		displayMsg : '显示第 {0} 条到 {1} 条记录，共 {2} 条',
		emptyMsg : "无记录！"
	});
	// 构造友情链接grid
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
			columns : ExtUtils.toArray(this.columns)
		}),
		tbar : ExtUtils.toArray(this.tool_bars),
		bbar : this.bottom_bar
	});

	// 放到容器中
	this.viewport = new Ext.Viewport({
		layout : 'fit',
		items : [this.grid_panel]
	});

	this.ds_on_beforeload = function(e) {
		var params = {
				
		};
		Ext.apply(listview.ds.baseParams, params);
	};
	
	this.ds.on('beforeload', this.ds_on_beforeload);
	this.ds.load();
	//列表编辑的函数
    this.edit=function(id){
    	var record=this.ds.getById(id);
    	ExtUtils.setPanelFromValue(record,panelForm.fields);
    	panelForm.win.show();
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
    					url:listview.delUrl,
    					params:{checkboxId:ary},
    					success:function(response,action){
    						for(var i=0;i<record.length;i++){
    							listview.ds.remove(record[i]);
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
    	ExtUtils.setPanelFromValue(null,panelForm.fields);
    	panelForm.win.show();
    }    
}
function ${toJavaName(entity.code)}() { 
	panelForm=this;
	this.name = '_${toJavaName(entity.code)}';
	this.url = g_ctx + '/${toPackageName(entity.code)}/${tojsp(toJavaName(entity.code))}!save.action';
	this.fields = {
		id : new Ext.form.Hidden({
			id:'id_id',
		    name:'id'
		}),
		<#list entity.columns as col><#if col.code?lower_case != "sguid">		${col.code?lower_case}:<@docontrol field=col hasnext=col_has_next/></#if></#list>
	};

	this.rows = {
		row1 : {// 行开始
			layout : "column",
			labelWidth : 80,
			items : [ExtUtils.renderColumn(this.fields.id,.3),<#list entity.columns as col><#if col.code?lower_case != "sguid"><#if ((col_index-1) != 0 && (col_index-1) % 3 ==0)>]
		},
		row${((col_index-1)/3)?int+1}:{//第${((col_index-1)/3)?int+1}行开始
			layout : "column",
			labelWidth : 80,
			items : [</#if>ExtUtils.renderColumn(this.fields.${col.code?lower_case},.3)<#if col_has_next><#if ((col_index-1) == 0  || (col_index-1) % 3 !=2)>,</#if></#if></#if></#list>]
		}
		
	};

	this.buttons = {
		ok:new Ext.Button({
	            text: '确认',
	            type:'submit',
	            handler:function(btn,e){
	              if(panelForm.form_panel.form.isValid()){
	              		//屏蔽按钮，防止多次提交
	              		btn.disable();  
	              		panelForm.form_panel.form.doAction('submit',{
		              		url:panelForm.url,
		              		method:'POST',
		              		success:function(form,action){
		              			showInfoMsg("操作成功！");
		              			panelForm.win.hide();
		              			panelForm.buttons.ok.disable();//审核按钮不可用
		              			btn.enable();
		              			listview.ds.load();
		              		},
		              		failure:function(form,action){
		              			showInfoMsg(action.result.msg);
		          		  		btn.enable();
		                 	}
		             	});
	             	}
	            }
	        }), close:{
	            text: '关 闭',
	            handler:function(){
	            	panelForm.win.hide();
	            	panelForm.form_panel.form.reset();//form重置
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
		items : ExtUtils.toArray(this.rows),
		buttons : ExtUtils.toArray(this.buttons)
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
			id:'${field.code?lower_case}_id',
		    name:'${field.code?lower_case}',
		    maxLength:${field.length?string("0")},
		    allowBlank:true,
		    blankText:'请输入${field.name}'
		})<#if hasnext>,</#if>
<#break>
<#case "int">
  <#if field.domain.code="Bool">
new Ext.form.Checkbox({   
			id : '${field.code?lower_case}_hid',
			boxLabel : '${field.name}',  
            checked : false,
        	listeners:{
				check:function(th,checked){
					if(checked)
						panelForm.fields.${field.code?lower_case}.setValue(1);
					else
						panelForm.fields.${field.code?lower_case}.setValue(0);
				}
			}

		})<#if hasnext>,</#if>
  <#else>
  <#if field.domain.consts??>
new Ext.form.ComboBox({
            fieldLabel: '${field.name}',
			id:'${field.code?lower_case}_id',
   			hiddenName:'${field.code?lower_case}',
			store : g_${field.domain.code},
			anchor:'94%',
			valueField : "id",
			displayField : "name",
			mode : 'local',
			forceSelection : true,
			editable : false,
			triggerAction : 'all',
            allowBlank:false,
            blankText:'请输入${field.name}'
		})<#if hasnext>,</#if>
  <#else>
new Ext.form.NumberField({
			fieldLabel: '${field.name}',
			id:'${field.code?lower_case}_id',
	        name:'${field.code?lower_case}',
	        allowBlank:true,
	        blankText:'请输入${field.name}',
			regex : ExtRegex.int_0.rule,
			regexText : ExtRegex.int_0.tip
		})<#if hasnext>,</#if>
</#if>
</#if>
	<#break>
<#case "double">
new Ext.form.NumberField({
			fieldLabel: '${field.name}',
			id:'${field.code?lower_case}_id',
	        name:'${field.code?lower_case}',
	        allowBlank:true,
	        blankText:'请输入${field.name}',
			regex : ExtRegex.double_2.rule,
			regexText : ExtRegex.double_2.tip
		})<#if hasnext>,</#if>
	<#break>
<#case "date">
new Ext.form.DateField({
			fieldLabel: '${field.name}',
			id:'${field.code?lower_case}_id',
	        name:'${field.code?lower_case}',
	        allowBlank:true,
	        blankText:'请输入${field.name}',
			showToday: false,
	        editable : false,
	        format: 'Y-m-d'
		})<#if hasnext>,</#if>
	<#break>
<#default>
new Ext.form.TextField({
			fieldLabel: '${field.name}',
			id:'${field.code?lower_case}_id',
	        name:'${field.code?lower_case}',
	        maxLength:${field.length?string("0")},
	        allowBlank:true,
	        blankText:'请输入${field.name}'
		})<#if hasnext>,</#if>
<#break>
</#switch>
</#macro>
<#macro doheader field hasnext>
<#assign headercommon="header:'<center>${field.name}</center>',dataIndex:'${field.code?lower_case}'" />
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
	return getNameById(g_${field.domain.code},val);
}}<#if hasnext>,</#if>
  <#else>
{${headercommon}}<#if hasnext>,</#if>
  </#if>
</#if>
	<#break>
<#case "double">
{${headercommon},renderer:function(val){
	return formatNumber(val);
}}<#if hasnext>,</#if>
	<#break>
<#default>
{${headercommon}}<#if hasnext>,</#if>
<#break>
</#switch>
</#macro>
<@LL node=pdm />