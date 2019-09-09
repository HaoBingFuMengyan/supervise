<#include  "/function.ftl">
<#macro LL node>
<#list node.tables as t>
<#if t.@name!="Database">
<#--
<#assign packageName="com.frogsing.bone.frong" />
blackbox.xml, po/zzz.dao.java.ftl,../../frogsing-sites/frogsing-test/src/main/java/${packageName?replace(".","/")}/${toPackageName(t.@name)}/dao/${toJavaName(t.@name)}Dao.java, null.xml, object:${t.@name};pack:${packageName}
blackbox.xml, po/zzz.service.java.ftl,../../frogsing-sites/frogsing-test/src/main/java/${packageName?replace(".","/")}/${toPackageName(t.@name)}/service/${toJavaName(t.@name)}Service.java, null.xml, object:${t.@name};pack:${packageName}
blackbox.xml, po/zzz.action.java.ftl,../../frogsing-sites/frogsing-test/src/main/java/${packageName?replace(".","/")}/${toPackageName(t.@name)}/web/${toJavaName(t.@name)}Action.java, null.xml, object:${t.@name};pack:${packageName}
blackbox.xml, po/zzz.po.java.ftl,../../frogsing-sites/frogsing-test/src/main/java/${packageName?replace(".","/")}/${toPackageName(t.@name)}/po/${toJavaName(t.@name)}.java, null.xml, object:${t.@name};pack:${packageName}
<#assign packageName="com.frogsing.bone.manage" />
<#assign packageName="com.frogsing.bone.manage" />
blackbox.xml, po/zzz.ext.extaction.java.ftl,../../frogsing-sites/frogsing-test/src/main/java/${packageName?replace(".","/")}/${toPackageName(t.@name)}/web/${toJavaName(t.@name)}Action.java, null.xml, object:${t.@name};pack:${packageName}
<#assign packageName="com.frogsing.bone.common" />
blackbox.xml, po/zzz.dao.java.ftl,../../frogsing-sites/frogsing-test/src/main/java/${packageName?replace(".","/")}/dao/${toPackageName(t.@name)}/${toJavaName(t.@name)}Dao.java, null.xml, object:${t.@name};pack:${packageName}
blackbox.xml, po/zzz.po.java.ftl,../../frogsing-sites/frogsing-test/src/main/java/${packageName?replace(".","/")}/po/${toPackageName(t.@name)}/${toJavaName(t.@name)}.java, null.xml, object:${t.@name};pack:${packageName}
blackbox.xml, po/zzz.service.java.ftl,../../frogsing-sites/frogsing-test/src/main/java/${packageName?replace(".","/")}/service/${toPackageName(t.@name)}/${toJavaName(t.@name)}Service.java, null.xml, object:${t.@name};pack:${packageName}
-->
<#assign packageName="com.frogsing.bone.manage" />
blackbox.xml, po/zzz.ext.extaction.java.ftl,../../frogsing-sites/frogsing-test/src/main/java/${packageName?replace(".","/")}/${toPackageName(t.@name)}/web/${toJavaName(t.@name)}Action.java, null.xml, object:${t.@name};pack:${packageName}
<#assign packageName="com.frogsing.bone.manage" />
blackbox.xml, po/zzz.ext.jsp.ftl,../../frogsing-sites/frogsing-test/src/main/webapp/manage/${toPackageName(t.@name)}/${tojsp(toJavaName(t.@name))}.jsp, null.xml, object:${t.@name};pack:${packageName}
<@LL node=t._complexType />
</#if>
</#list>
</#macro>
<@LL node=pdm />
