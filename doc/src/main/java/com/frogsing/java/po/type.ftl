<#function  fToType p >
<#switch p>
<#case "OperateType"><#assign p1="xs:int"?replace("xs:","")>
<#break>
<#case "Clob"><#assign p1="xs:string"?replace("xs:","")>
<#break>
<#case "LongTitle"><#assign p1="xs:string"?replace("xs:","")>
<#break>
<#case "Remark"><#assign p1="xs:string"?replace("xs:","")>
<#break>
<#case "DateTime"><#assign p1="xs:dateTime"?replace("xs:","")>
<#break>
<#case "WebUrl"><#assign p1="xs:string"?replace("xs:","")>
<#break>
<#case "Sex"><#assign p1="xs:int"?replace("xs:","")>
<#break>
<#case "Mail"><#assign p1="xs:string"?replace("xs:","")>
<#break>
<#case "Phone"><#assign p1="xs:string"?replace("xs:","")>
<#break>
<#case "Mobile"><#assign p1="xs:string"?replace("xs:","")>
<#break>
<#case "Password"><#assign p1="xs:string"?replace("xs:","")>
<#break>
<#case "ShortTitle"><#assign p1="xs:string"?replace("xs:","")>
<#break>
<#case "FilterType"><#assign p1="xs:int"?replace("xs:","")>
<#break>
<#case "MaxRemark"><#assign p1="xs:string"?replace("xs:","")>
<#break>
<#case "File"><#assign p1="xs:base64binary"?replace("xs:","")>
<#break>
<#case "FileType"><#assign p1="xs:int"?replace("xs:","")>
<#break>
<#case "Date"><#assign p1="xs:dateTime"?replace("xs:","")>
<#break>
<#case "LongRemark"><#assign p1="xs:string"?replace("xs:","")>
<#break>
<#case "ShortRemark"><#assign p1="xs:string"?replace("xs:","")>
<#break>
<#case "Bool"><#assign p1="xs:int"?replace("xs:","")>
<#break>
<#case "Shortname"><#assign p1="xs:string"?replace("xs:","")>
<#break>
<#case "Long"><#assign p1="xs:decimal"?replace("xs:","")>
<#break>
<#case "LongName"><#assign p1="xs:string"?replace("xs:","")>
<#break>
<#case "Code"><#assign p1="xs:string"?replace("xs:","")>
<#break>
<#case "Guid"><#assign p1="xs:string"?replace("xs:","")>
<#break>
<#case "MaterailOtherChem"><#assign p1="xs:int"?replace("xs:","")>
<#break>
</#switch>
<#return p1>
</#function>

<#function  fToDesc p >
<#switch p>
<#case "OperateType">
<#assign p1="0:ADD:新增\n      1:MODIFY:修改\n      2:DELETE:删除">
<#break>
<#case "Clob">
<#assign p1="">
<#break>
<#case "LongTitle">
<#assign p1="300">
<#break>
<#case "Remark">
<#assign p1="1000">
<#break>
<#case "DateTime">
<#assign p1="">
<#break>
<#case "WebUrl">
<#assign p1="300">
<#break>
<#case "Sex">
<#assign p1="0:MAN:,男\n      1:WOMAN:女">
<#break>
<#case "Mail">
<#assign p1="100">
<#break>
<#case "Phone">
<#assign p1="20">
<#break>
<#case "Mobile">
<#assign p1="20">
<#break>
<#case "Password">
<#assign p1="33">
<#break>
<#case "ShortTitle">
<#assign p1="100">
<#break>
<#case "FilterType">
<#assign p1="0:NONE:不过滤\n      1:MEMBER:会员\n      2:OPERRATOR:交易员\n      3:ADMIN:管理员">
<#break>
<#case "MaxRemark">
<#assign p1="4000">
<#break>
<#case "File">
<#assign p1="">
<#break>
<#case "FileType">
<#assign p1="0:MEMBER:会员">
<#break>
<#case "Date">
<#assign p1="">
<#break>
<#case "LongRemark">
<#assign p1="2000">
<#break>
<#case "ShortRemark">
<#assign p1="500">
<#break>
<#case "Bool">
<#assign p1="">
<#break>
<#case "Shortname">
<#assign p1="50">
<#break>
<#case "Long">
<#assign p1="">
<#break>
<#case "LongName">
<#assign p1="100">
<#break>
<#case "Code">
<#assign p1="50">
<#break>
<#case "Guid">
<#assign p1="32">
<#break>
<#case "MaterailOtherChem">
<#assign p1="0:EUREACHSVHC:EUREACHSVHC\n      1:OTHER:OTHER">
<#break>
</#switch>
<#return p1>
</#function>