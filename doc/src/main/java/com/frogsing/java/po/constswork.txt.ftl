<#include  "/function.ftl">
<#macro LL node>
<#list node.tables as t>
<#assign packageName="com.frogsing.po.entityBase" />
mtl.xml , po/entitybase.java.ftl,../po/src/main/java/${packageName?replace(".","/")}/${toPackageName(t.code)}/${toJavaName(t.code)}Base.java, null.xml, object:${t.code};pack:${packageName}
</#list>
</#macro>
<@LL node=pdm />
