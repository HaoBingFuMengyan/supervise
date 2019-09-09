<${"#"}function  fToType p >
<${"#"}switch p>
<#list pdm.domains as s>
<${"#"}case "${s.@name}"><${"#"}assign p1="${s._restriction.@base}"?replace("xs:","")>
<${"#"}break>
</#list>
</${"#"}switch>
<${"#"}return p1>
</${"#"}function>

<${"#"}function  fToDesc p >
<${"#"}switch p>
<#list pdm.domains as s>
<${"#"}case "${s.@name}">
<#assign x="${s.desc!''}"?trim?js_string>
<${"#"}assign p1="${x}">
<${"#"}break>
</#list>
</${"#"}switch>
<${"#"}return p1>
</${"#"}function>