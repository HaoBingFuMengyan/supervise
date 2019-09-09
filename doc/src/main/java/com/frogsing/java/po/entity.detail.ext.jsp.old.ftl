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
	${g_entityname}.me=new ${g_entityname}();
	// 放到容器中
	new Ext.Viewport({
		layout : 'fit',
		items : [${g_entityname}.me.form_panel]
	});
});

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
		${col.code?lower_case}:<@dodetail field=col hasnext=col_has_next/>
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
		 close:{
	            text: '关 闭',
	            handler:function(){
	            	
	            	window.parent.Ext.getCmp('${"$"}{sframeid}').close();
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
			id:'${field.code?lower_case}_id',
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
			id : '${field.code?lower_case}_id',
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
          	allowBlank:<#if field.mandatory==0>true<#else>false</#if>,
            blankText:'请输入${field.name}'
		})<#if hasnext>,</#if>
  <#else>
new Ext.form.NumberField({
			fieldLabel: '${field.name}',
			id:'${field.code?lower_case}_id',
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
			id:'${field.code?lower_case}_id',
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
			id:'${field.code?lower_case}_id',
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
			id:'${field.code?lower_case}_id',
	        name:'${field.code?lower_case}',
	        maxLength:${field.length?string("0")},
	        allowBlank:<#if field.mandatory==0>true<#else>false</#if>,//${field.mandatory}
	        blankText:'请输入${field.name}'
		})<#if hasnext>,</#if>
<#break>
</#switch>
</#macro>
<#macro dodetail field hasnext>
<#switch field.type?lower_case>
<#case "string">
new Ext.form.TextField({
			fieldLabel: '${field.name}',readOnly:true,
			id:'${field.code?lower_case}_id',
		    name:'${field.code?lower_case}',
		    value:'${"$"}{model.${field.code?lower_case}}'
		})<#if hasnext>,</#if>
<#break>
<#case "int">
<#case "long">
  <#if field.domain.code="BoolType">
new Ext.form.Checkbox({   
			id : '${field.code?lower_case}_id',readOnly:true,
			hiddenName:'${field.code?lower_case}',
			boxLabel : '${field.name}',  
            checked : ${"$"}{model.${field.code?lower_case}}==1,
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
            fieldLabel: '${field.name}',readOnly:true,
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
            value:'${"$"}{model.${field.code?lower_case}}'
		})<#if hasnext>,</#if>
  <#else>
new Ext.form.NumberField({
			fieldLabel: '${field.name}',readOnly:true,
			id:'${field.code?lower_case}_id',
	        name:'${field.code?lower_case}',
	        value:'${"$"}{model.${field.code?lower_case}}'
		})<#if hasnext>,</#if>
</#if>
</#if>
	<#break>
<#case "double">
new Ext.form.NumberField({
			fieldLabel: '${field.name}',readOnly:true,
			id:'${field.code?lower_case}_id',
	        name:'${field.code?lower_case}',
	        value:'${"$"}{model.${field.code?lower_case}}'
		})<#if hasnext>,</#if>
	<#break>
<#case "date">
new Ext.form.DateField({
			fieldLabel: '${field.name}',
			id:'${field.code?lower_case}_id',readOnly:true,
	        name:'${field.code?lower_case}',
	        allowBlank:<#if field.mandatory==0>true<#else>false</#if>,
	        blankText:'请输入${field.name}',
			showToday: false,
	        editable : false,
	        format: 'Y-m-d',
	        value: $tt.toDateType('${"$"}{model.${field.code?lower_case}}')
		})<#if hasnext>,</#if>
	<#break>
<#default>
new Ext.form.TextField({
			fieldLabel: '${field.name}',readOnly:true,
			id:'${field.code?lower_case}_id',
	        name:'${field.code?lower_case}',
	        value:'${"$"}{model.${field.code?lower_case}}'
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