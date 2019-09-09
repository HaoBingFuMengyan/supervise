<#include  "/function.ftl">
<#include "type.ftl">
<#t>
<#macro entityM entity>
<#assign fname=flower1(toJavaName(object())) />
<#assign oname=toJavaName(object()) />
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<%@ taglib prefix="wm" uri="/frogsing-tags"%>
<script type="text/javascript">
	Ext.onReady(function(){
        Ext.QuickTips.init();
        Ext.form.Field.prototype.msgTarget='side';
        
        var win;  //${entity.code} ${entity.name}
        
        
		var recordInfo = Ext.data.Record.create(
				[
				 	<#list entity.columns as field>
					   <#if (field.code?upper_case="SGUID" )>
					{name : 'id'}<#if field_has_next>,</#if> //${field.name}
					<#else>
					{name : '${field.code?lower_case}'}<#if field_has_next>,</#if> //${field.name}
					 	</#if>
					</#list>
				]);
		
		//${entity.name}数据源
		var recordDs = new Ext.data.Store({
			proxy : new Ext.data.HttpProxy({
				url:'${ctx}/${toPackageName(entity.code)}/${tojsp(oname)}!getAll.action'
			}),
			reader : new Ext.data.JsonReader({root : 'rows',totalProperty:'totalProperty'}, recordInfo)
		});
		
		//构造checkbox
		var recordsm = new Ext.grid.CheckboxSelectionModel();
		
		
		var cm = new Ext.grid.ColumnModel({
			defaults: {
	            sortable: true, // columns are not sortable by default
	            align:'left'
	        },
	        columns : [
   				new Ext.grid.RowNumberer(),recordsm,
   					<#list entity.columns as field>
					   <#if (field.code?upper_case!="SGUID" )>
					   		//${field.name}
							<@fToExtHeader field /><#t>,
					  </#if>
					</#list>
					{header : "编辑",dataIndex:'id',width:40,align:'center',sortable: false,renderer:function(value, cellmeta, record, rowIndex, columnIndex, store){
						return '<a ext:qtip="编辑" href=javascript:editRecord("'+value+'")>编辑</a>' ;
					}}
   			]
		});
		
		
		//构造${entity.name}grid	
		var recordGrid = new Ext.grid.GridPanel({
		    clicksToEdit:1,//点击编辑次数
			id : 'recordGrid',
			store : recordDs,
			//width:'800',
			//stripeRows : true,//隔行变色
			trackMouseOver :true,//移动行变亮
			border:false,
			viewConfig: {
		        forceFit: true
		    },
			height:550,
		    loadMask : true,
			loadMask:{msg:'正在加载数据...'},
			renderTo:Ext.getBody(),
	        sm: recordsm,
			cm:cm,
		    tbar:[
			
				{text : '添 加',id : 'add',tooltip : '添加${entity.name}',iconCls : 'add',handler :function(){
					Ext.getCmp("hidden_id").enable();
					var ary=['hidden_id'
					<#list entity.columns as field>
					 <#if (field.code?upper_case!="SGUID" )>
							<#t>,'${field.code?lower_case}_id'
					 	</#if>
					</#list>];
					clear(ary);
					win.show();
				}},
			
	
				{text : '删 除',id : 'del',tooltip : '删除选中的记录',iconCls : 'del',handler :function(){
					
						var store = recordGrid.getStore();
						
						//得到选择集合
						var record = recordGrid.getSelectionModel().getSelections();	
						var ary=new Array();
						
						for(var i=0;i<record.length;i++){
							ary[i]=record[i].data.id;
						}	
						if(record.length!=0){//如果选择不为空的话	
							Ext.MessageBox.confirm('确认', '您确定要删除选定记录吗?',function(btn,text){
								if(btn=='yes'){
									Ext.Ajax.request({
										url:'${ctx}/${toPackageName(entity.code)}/${tojsp(oname)}!delete.action',
										params:{checkboxId:ary},
										callback:function(opertion,success,response){
											if(success){//请求是否成功
												if(isSuccess(response)){//根据后台提示判断是否成功，后台是success就成功，是failure就else
													for(var i=0;i<record.length;i++){
														store.remove(record[i]);
													}
													$msg.show("删除成功！");
												}else{
													$msg.showError($msg.get(response));
												}
											}
										}
									});
								}
							});
						}else{//选择为空
							$msg.show("请选择......");
						}
					}
				},
			
				{text : '刷新',id : 'refresh',tooltip : '刷新数据',iconCls : 'refresh',handler:function(){
					var ary=[];
					clear(ary);
					recordDs.reload();
				}},'-',
				'${entity.name}名称',
				new Ext.form.TextField({
					id:'t_scontent',
					name:'content'
				}),'-',
				new Ext.Button({
					text:'查询',
					iconCls:'bbcx',
					handler:function(){
						recordDs.load();
					}
				}),'-',
				new Ext.Button({
					text:'清除',
					iconCls:'xgmm',
					handler:function(){
						var ary=[];
						clear(ary);
					}
				})
			],
			bbar: new Ext.PagingToolbar({
	            pageSize: Number('${"$"+"{limit}"}'),
	            store: recordDs,
	            displayInfo: true,
	            displayMsg: '显示第 {0} 条到 {1} 条记录，共 {2} 条',
	            emptyMsg: "无记录！"
	        })
		});
		//加载15条数据
		recordDs.load();	
		
		recordDs.on('beforeload',function(e){
			var params = {};
			Ext.apply(recordDs.baseParams, params);
		});
		
		//放到容器中
		var viewport = new Ext.Viewport({
			layout : 'fit',
			items : [recordGrid]
		});
		
		/*
		//双击${entity.name}
		recordGrid.on('celldblclick',function(th,rowIndex,cellIndex,e){
			editRecord(rowIndex);			
		});
		*/
		
		//构造基础编码FormPanel
	    recordFormPanel = new Ext.FormPanel({
	       	id : 'recordFormPanel',
			layout : "form",
			labelAlign : "right",
			border : false,
			buttonAlign : 'center',
			frame : true,
			autoScrool : true,
			labelWidth : 80,
	        items: [
	        <#assign i=0 />
	        <#list entity.columns as field>
			<#if (field.code?upper_case!="SGUID" )>
				 <#assign i=i+1>
			<#switch i>
			<#case 1>
	            {//行开始
							layout : "column",
							labelWidth : 80,
							items : [
								{
									columnWidth : .33,
									layout : "form",
									items : [ 
											<@fToExtField field/>
									]
								}
							<#if field_has_next>,<#else> 
								]	
				},</#if>
									
				<#break>
			<#case 2>
	            				{
									columnWidth : .33,
									layout : "form",
									items : [ 
											<@fToExtField field/>
									]
								}	
								<#if field_has_next>,<#else> 
								]	
				},</#if>
									
				<#break>
				<#case 3>
	           					{
									columnWidth : .33,
									layout : "form",
									items : [
											<@fToExtField field/>
									]
								}	
								]	
				},
				<#assign i=0 />
				<#break>
				</#switch>
		 	</#if>
			</#list>
	            {
		            id:'hidden_id',
		            name:'id',
		            xtype: 'hidden'
	            }
	        ],
	        buttons: [{
	            id:'login-bt',
	            text: '提交',
	            type:'submit',
	            handler:function(btn,e){
	              if(recordFormPanel.form.isValid()){
	              		btn.disable();  //屏蔽按钮防止重复提交
	              		recordFormPanel.form.doAction('submit',{
	              		url:'${ctx}/${toPackageName(entity.code)}/${tojsp(oname)}!save.action',
	              		method:'POST',
	              		success:function(form,action){
	              			
	              			win.hide();
	              			recordDs.reload();
	              			btn.enable();
	              			recordFormPanel.form.reset();
	              			$msg.show("保存成功！");
	              		},
	              		failure:function(form,action){
	              			$msg.showError("保存失败！");
	          		  		btn.enable();
	                 	}
	             	});
	             }
	            }
	        },{
	            text: '关 闭',
	            handler:function(){
	           		win.hide();
          			recordFormPanel.form.reset();
	           }
	        }]
	    });
		
		//${entity.name}窗体
		if(!win){
			win = new Ext.Window({
				id:'win',
				title:'',
				layout:'fit', //之前提到的布局方式fit，自适应布局 
				width:750,
				height:450,
				plain:true,
			    maximizable:false,//禁止最大化
				closeAction:'hide',
				//closable:false,//禁止关闭
				//collapsible:true,//可折叠
				plain: true,
				buttonAlign:'center',
				resizable :false,
				modal :true,
				items:recordFormPanel //将表单作为窗体元素嵌套布局
			});
		}
    });
	
	//修改${entity.name}
	function editRecord(id){
		//Grid对象
		var recordGrid= Ext.getCmp('recordGrid');
		var store = recordGrid.getStore();
		var record=store.getById(id);
		var val;
		var field;
		Ext.getCmp("hidden_id").enable();
		Ext.getCmp("hidden_id").setValue(record.get("id"));
		<#list entity.columns as field>
		 <#if (field.code?upper_case!="SGUID" )>
		val=record.get("${field.code?lower_case}"); field=Ext.getCmp("${field.code?lower_case}_id"); if(val!=null&&field!=null) field.setValue(val);
		</#if>
		</#list>
		

		Ext.getCmp("win").show();
	}
	
    </script>
</head>
<body>
</body>
</html>
</#macro>
<#macro LL node>
<#list node.tables  as entity>
<#if entity.code==object()>
<@entityM entity=entity/>
<#break/>
</#if>
</#list>
</#macro>
<@LL node=pdm />
