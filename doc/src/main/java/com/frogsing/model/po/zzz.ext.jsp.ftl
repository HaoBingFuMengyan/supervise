<#include  "/function.ftl">
<#include "type.ftl">
<#t>
<#macro entityM entity>
<#assign fname=flower1(toJavaName(object())) />
<#assign oname=toJavaName(object()) />
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/manage/include/header.jsp"%>
<%@ taglib prefix="ts" uri="/todaysteel-tags"%>
<#assign ctx="$"+"{ctx}" />
<script type="text/javascript" src="${ctx}/manage/extjs/todaysteel/comboxtree/ComboBoxTree.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/manage/common/css/fileuploadfield.css" />
<style type=text/css>
<!--
    .upload-icon {
        background: url('${ctx}/manage/images/image_add.png') no-repeat 0 0 !important;
    }
    #fi-button-msg {
        border: 2px solid #ccc;
        padding: 5px 10px;
        background: #eee;
        margin: 5px;
        float: left;
    }
    #basic, #animated {
	    border:1px solid #c3daf9;
	    color:#1e4e8f;
	    font:bold 14px tahoma,verdana,helvetica;
	    text-align:center;
	    padding-top:20px;
	}
	#snap {
	    border:1px solid #c3daf9;
	    overflow:hidden;
	}
	#custom {
	    cursor:move;
	}
	#custom-rzwrap{
	    z-index: 100;
	}
	#custom-rzwrap .x-resizable-handle{
	    width:11px;
	    height:11px;
	    background:transparent url(${ctx}/manage/images/square.gif) no-repeat;
	    margin:0px;
	}
	#custom-rzwrap .x-resizable-handle-east, #custom-rzwrap .x-resizable-handle-west{
	    top:45%;
	}
	#custom-rzwrap .x-resizable-handle-north, #custom-rzwrap .x-resizable-handle-south{
	    left:45%;
	}
	#wrap {
		position: absolute;
		width: 800px;
		height: 200px;
		left: 50%;
		top: 50%;
		margin-left: -450px;
		margin-top: -80px;
	}
	.test {
		background:#D6E3F2;
	}
	-->
</style>
<script type="text/javascript" src="${ctx}/manage/extjs/todaysteel/fileupload/FileUploadField.js"></script>
<script type="text/javascript">
	Ext.onReady(function(){
		
		//保存设置状态到Cookie
        //Ext.state.Manager.setProvider(new Ext.state.CookieProvider());
        Ext.QuickTips.init();
        Ext.form.Field.prototype.msgTarget='side';
        
        var win;  //${entity.code} ${entity.name}
        
        
		var recordInfo = Ext.data.Record.create(
				[
				 	<#list entity._complexType._attribute as field>
					   <#if (field.@name?upper_case="SGUID" )>
					{name : 'id'}<#if field_has_next>,</#if> //${field.@label}
					<#else>
					{name : '${field.@name?lower_case}'}<#if field_has_next>,</#if> //${field.@label}
					 	</#if>
					</#list>
				]);
		
		//友情链接数据源
		var recordDs = new Ext.data.Store({
			proxy : new Ext.data.HttpProxy({
				url:'${ctx}/manage/${toPackageName(entity.code)}/${tojsp(oname)}!getAll.action'
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
   					<#list entity._complexType._attribute as field>
					   <#if (field.@name?upper_case!="SGUID" )>
					   		//${field.@label}
							<@fToExtHeader field /><#t>,
					  </#if>
					</#list>
					{header : "编辑",dataIndex:'id',width:40,align:'center',sortable: false,renderer:function(value, cellmeta, record, rowIndex, columnIndex, store){
						return '<a ext:qtip="编辑" href=javascript:editRecord("'+value+'")>编辑</a>' ;
					}}
   			]
		});
		
		
		//构造友情链接grid	
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
					<#list entity._complexType._attribute as field>
					 <#if (field.@name?upper_case!="SGUID" )>
							<#t>//,'${field.@name?lower_case}_id'
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
										url:'${ctx}/manage/${toPackageName(entity.code)}/${tojsp(oname)}!!delete.action',
										params:{checkboxId:ary},
										callback:function(opertion,success,response){
											if(success){//请求是否成功
												if(isSuccess(response)){//根据后台提示判断是否成功，后台是success就成功，是failure就else
													for(var i=0;i<record.length;i++){
														store.remove(record[i]);
													}
													showInfoMsg("删除成功！");
												}else{
													showErrorMsg(formatStr(response));
												}
											}
										}
									});
								}
							});
						}else{//选择为空
							showInfoMsg("请选择......");
						}
					}
				},
			
				{text : '刷新',id : 'refresh',tooltip : '刷新数据',iconCls : 'refresh',handler:function(){
					var ary=['f_scontent'];
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
			var params = {
					content:Ext.getCmp('f_scontent').getValue()
				};
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
	        <#list entity._complexType._attribute as field>
			<#if (field.@name?upper_case!="SGUID" )>
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
	              		url:'${ctx}/manage/${toPackageName(entity.code)}/${tojsp(oname)}!save.action',
	              		method:'POST',
	              		success:function(form,action){
	              			
	              			win.hide();
	              			recordDs.reload();
	              			btn.enable();
	              			recordFormPanel.form.reset();
	              			showInfoMsg("保存成功！");
	              		},
	              		failure:function(form,action){
	              			showErrorMsg("保存失败！");
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
		
		//友情链接窗体
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
	
	//修改友情链接
	function editRecord(id){
		//Grid对象
		var recordGrid= Ext.getCmp('recordGrid');
		var store = recordGrid.getStore();
		var record=store.getById(id);
		var val;
		Ext.getCmp("hidden_id").enable();
		Ext.getCmp("hidden_id").setValue(record.get("id"));
		<#list entity._complexType._attribute as field>
		 <#if (field.@name?upper_case!="SGUID" )>
		val=record.get("${field.@name?lower_case}"); if(val!=null) Ext.getCmp("${field.@name?lower_case}_id").setValue(val);
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
<#else>
<@LL node=entity._complexType />
</#if>
</#list>
</#macro>
<@LL node=pdm />
