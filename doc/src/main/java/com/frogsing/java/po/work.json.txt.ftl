<#include  "/function.ftl">
<#macro LL node>
<#list node.tables as t>
<#assign packageName="com.frogsing.admin.web" />
mtl.xml, po/json.txt.ftl,../../webs/admin/src/test/json/${toPackageName(t.code)}/${(t.code)?lower_case}.ftl, null.xml, object:${t.code};pack:${packageName}
</#list>
</#macro>
<@LL node=pdm />
