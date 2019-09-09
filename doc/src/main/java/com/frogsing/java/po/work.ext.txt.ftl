<#include  "/function.ftl">
<#macro LL node>
<#list node.tables as t>
<#assign packageName="com.frogsing.admin.web" />
mtl.xml, po/entity.ext.jsp.ftl,../../webs/admin/src/test/webapp/${toPackageName(t.code)}/${toJavaName(t.code)?lower_case}.jsp, null.xml, object:${t.code};pack:${packageName}
mtl.xml, po/entity.detail.ext.jsp.ftl,../../webs/admin/src/test/webapp/${toPackageName(t.code)}/${toJavaName(t.code)?lower_case}-detail.jsp, null.xml, object:${t.code};pack:${packageName}
mtl.xml, po/entity_.action.java.ftl,../../webs/admin/src/test/webapp/${toPackageName(t.code)}/${toJavaName(t.code)}Controller.java, null.xml, object:${t.code};pack:${packageName}
<#assign packageName="com.frogsing.service" />
mtl.xml, po/entity_service.java.ftl,../../webs/admin/src/test/webapp/${toPackageName(t.code)}/${toJavaName(t.code)}Service.java, null.xml, object:${t.code};pack:${packageName}
</#list>
</#macro>
<@LL node=pdm />
