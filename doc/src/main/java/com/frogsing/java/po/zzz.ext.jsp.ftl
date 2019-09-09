<#include  "/function.ftl">
<#include "type.ftl">
<#t>
<#macro entityM entity>
<#assign fname=flower1(toJavaName(object())) />
<#assign oname=toJavaName(object()) />
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<%@ taglib prefix="wm" uri="/frogsing-tags"%>
<script type="text/javascript" src="_${fname}.js"></script>
<script type="text/javascript">
	var g_limit=${"$"}{limit};
	var g_ctx="${"$"}{ctx}";
	<#list entity.columns as col><#if col.domain.consts??>var g_${col.domain.code}=<wm:label name="${col.domain.code}" /></#if></#list>
	Ext.onReady(function(){
        Ext.QuickTips.init();
        Ext.form.Field.prototype.msgTarget='side';
        
        main();
	});
	
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
