<${"#"}function  fToType p >
<${"#"}switch p>
<#list doc._schema._simpleType as s>
<${"#"}case "${s.@name}"><${"#"}assign p1="${s._restriction.@base}"?replace("xs:","")>
<${"#"}break>
</#list>
</${"#"}switch>
<${"#"}if p1?lower_case?starts_with("numeric")>
	<${"#"}if (p1?index_of(",")>1)>
	<${"#"}return "double">
	<${"#"}else>
	<${"#"}return "long">
	</${"#"}if>
<${"#"}else>
	<${"#"}if p1?lower_case?starts_with("varchar")>
	<${"#"}return "string">
	<${"#"}else>
	<${"#"}return p1>
	</${"#"}if>
</${"#"}if>
</${"#"}function>

<${"#"}function  fToDesc p >
<${"#"}switch p>
<#list doc._schema._simpleType as s>
<${"#"}case "${s.@name}">
<#assign x="${s.desc!''}"?trim?js_string>
<${"#"}assign p1="${x}">
<${"#"}break>
</#list>
</${"#"}switch>
<${"#"}return p1>
</${"#"}function>