<#include  "/function.ftl">
<#include "type.ftl">
<?xml version="1.0" encoding="utf-8" ?>
<objects xmlns='http://www.springframework.net'>
<#macro entityM entity>
  <object  id="${toJavaName(entity.code)}Dao" type="frogsing.${toJavaName(entity.code)}Dao, sing">
    <property name="SessionFactory" ref="SessionFactory"/>
  </object>
</#macro>
<#macro entityM1 entity>
  <property name="${toJavaName(entity.code)}Dao" ref="${toJavaName(entity.code)}Dao"/>
</#macro>
<#macro LL node>
<#list node.tables  as entity>
<@entityM entity=entity/>
</#list>
<#list node.views  as entity>
<@entityM entity=entity/>
</#list>
</#macro>
<#macro LL1 node>
<#list node.tables  as entity>
<@entityM1 entity=entity/>
</#list>
<#list node.views  as entity>
<@entityM1 entity=entity/>
</#list>
</#macro>
<@LL node=pdm />
  <object  id="DaoProxy" type="frogsing.DaoProxy, sing">
   	<@LL1 node=pdm />
  </object>
</objects>
