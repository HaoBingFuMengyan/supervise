<#include  "/function.ftl">
<#macro LL node>
<#list node.tables as t>
<#assign packageName="com.frogsing.${node.code}.po" />
mtl.xml , po/entity.java.ftl,../server/${(node.code)}/${(node.code)}-api/src/main/java/${packageName?replace(".","/")}/${toJavaName(t.code)}.java, null.xml, object:${t.code};pack:${packageName};replace:no
<#assign packageName="com.frogsing.${node.code}.po" />
mtl.xml , po/entitybase.java.ftl,../server/${(node.code)}/${(node.code)}-api/src/main/java/${packageName?replace(".","/")}/${toJavaName(t.code)}Base.java, null.xml, object:${t.code};pack:${packageName}
<#assign packageName="com.frogsing.${node.code}.dao" />
mtl.xml , po/entity_dao.java.ftl,../server/${(node.code)}/${(node.code)}-service/src/main/java/${packageName?replace(".","/")}/${toJavaName(t.code)}Dao.java, null.xml, object:${t.code};pack:${packageName};replace:no
</#list>
<#list node.views as t>
<#assign packageName="com.frogsing.${node.code}.po" />
mtl.xml , po/view.java.ftl,../server/${(node.code)}/${(node.code)}-api/src/main/java/${packageName?replace(".","/")}/${toJavaName(t.code)}.java, null.xml, object:${t.code};pack:${packageName};replace:no
<#assign packageName="com.frogsing.${node.code}.po" />
mtl.xml , po/viewbase.java.ftl,../server/${(node.code)}/${(node.code)}-api/src/main/java/${packageName?replace(".","/")}/${toJavaName(t.code)}Base.java, null.xml, object:${t.code};pack:${packageName}
<#assign packageName="com.frogsing.${node.code}.dao" />
mtl.xml , po/view_dao.java.ftl,../server/${(node.code)}/${(node.code)}-service/src/main/java/${packageName?replace(".","/")}/${toJavaName(t.code)}Dao.java, null.xml, object:${t.code};pack:${packageName};replace:no
</#list>
</#macro>
<@LL node=pdm />
