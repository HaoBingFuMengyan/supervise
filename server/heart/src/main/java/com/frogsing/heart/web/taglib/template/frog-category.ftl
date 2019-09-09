<#function c2 pluspara,para,py,jp,iscommon>
<#return "['"+pluspara+"','"+para+"','"+py+"', '"+jp+"',"+iscommon +"]" />
</#function>
<#assign rs="" />
<#if list??>
	<#list list as entity>
			<#assign rs=rs+c2(entity.id!"",entity.sname!""?js_string,entity.spyname?js_string,entity.sjpname?js_string,entity.biscommon!"1") />
			<#if entity_has_next>
			<#assign rs=rs+"," />
			</#if>
	</#list>
</#if>
[${rs}]
