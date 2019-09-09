<#include  "/function.ftl">
<#macro LL node>
<#list node.tables as t>
blackbox.xml , po/entity.cs.ftl,../client/model/po/${toJavaName(t.code)}.cs, null.xml, object:${t.code};pack:po
blackbox.xml , po/entity.hbm.ftl,../client/model/hbm/${toJavaName(t.code)}.hbm.xml, null.xml, object:${t.code};pack:hbm
</#list>
<#list node.views as t>
blackbox.xml , po/view.cs.ftl,../client/model/po/${toJavaName(t.code)}.cs, null.xml, object:${t.code};pack:po
blackbox.xml , po/view.hbm.ftl,../client/model/hbm/${toJavaName(t.code)}.hbm.xml, null.xml, object:${t.code};pack:hbm
</#list>
</#macro>
<@LL node=pdm />
