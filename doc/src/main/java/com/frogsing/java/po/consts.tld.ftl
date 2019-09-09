<?xml version="1.0" encoding="UTF-8"?>
<taglib xmlns="http://java.sun.com/xml/ns/j2ee"
		xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
		xsi:schemaLocation="http://java.sun.com/xml/ns/j2ee http://java.sun.com/xml/ns/j2ee/web-jsptaglibrary_2_0.xsd"
		version="2.0">

	<description>frogsing常量</description>
	<tlib-version>1.0</tlib-version>
	<short-name>${pack()?lower_case}</short-name>
	<uri>http://www.frogsing.com/tags/${pack()?lower_case}</uri>
	<#list pdm.domains as t>
	<#if t.consts?? && t.code?lower_case != "booltype">
	<function>
		<description>${t.code}</description>
		<name>${t.code}</name>
		<function-class>com.frogsing.${pack()?lower_case}.utils.${pack()?upper_case}$${t.code}</function-class>
		<function-signature> java.lang.String json()</function-signature>
		<example>obj:json()</example>
	</function>
	<function>
		<description>${t.code}Map</description>
		<name>${t.code}Map</name>
		<function-class>com.frogsing.${pack()?lower_case}.utils.${pack()?upper_case}$${t.code}</function-class>
		<function-signature> java.util.Map map()</function-signature>
		<example>obj:json()</example>
	</function>

        <tag>
 		<description></description> 
 		<name>${t.code}</name>
		<#if "${t.code}"="SysParaType" || "${t.code}"="BizParaType" >
            <tag-class>com.frogsing.${pack()?lower_case}.utils.Tag${t.code}Ext</tag-class>
		<#else>
            <tag-class>com.frogsing.${pack()?lower_case}.utils.${pack()}Tag$Tag${t.code}</tag-class>
		</#if>
		 <body-content>scriptless</body-content>
		 <variable>
 			<description></description>
 			<name-given>count</name-given>
 		</variable> 
 		 <attribute> 
 			<name>op</name>
			<required>false</required> 
 			<rtexprvalue>true</rtexprvalue> 
 		</attribute> 
 		<attribute> 
 			<name>val</name>
			<required>false</required> 
 			<rtexprvalue>true</rtexprvalue> 
 		</attribute> 
 		<attribute> 
 			<name>option</name>
			<required>false</required> 
 			<rtexprvalue>true</rtexprvalue> 
 		</attribute> 
 		<attribute> 
 			<name>name</name>
			<required>false</required> 
 			<rtexprvalue>true</rtexprvalue> 
 		</attribute> 
 		<attribute> 
 			<name>id</name>
			<required>false</required> 
 			<rtexprvalue>true</rtexprvalue> 
 		</attribute> 
		<attribute> 
 			<name>defname</name>
			<required>false</required> 
 			<rtexprvalue>true</rtexprvalue> 
 		</attribute> 
 		<attribute> 
 			<name>defval</name>
			<required>false</required> 
 			<rtexprvalue>true</rtexprvalue> 
 		</attribute> 
 		<attribute> 
 			<name>nshow</name>
			<required>false</required> 
 			<rtexprvalue>true</rtexprvalue> 
 		</attribute> 
 		<#list t.consts as row>
 		<attribute> 
 			<name>${row.name?lower_case}</name>
			<required>false</required> 
			<rtexprvalue>true</rtexprvalue> 
 		</attribute> 
 		
 		</#list>
 	</tag> 
 	<#else>
	<#if t.type?lower_case=="double">
 	<tag>
 		<description>${t.name}*******</description> 
 		<name>${t.code}</name> 
 		<tag-class>com.frogsing.${pack()?lower_case}.utils.${pack()}Tag$Tag${t.code}</tag-class> 
		 <body-content>scriptless</body-content>
 		<attribute> 
 			<name>op</name>
			<required>false</required> 
 			<rtexprvalue>true</rtexprvalue> 
 		</attribute> 
 		<attribute> 
 			<name>val</name>
			<required>true</required> 
 			<rtexprvalue>true</rtexprvalue> 
 		</attribute> 
 	</tag>
 	</#if>
 	</#if>
</#list>
<#if frogsingcode[0]?? && (frogsingcode[0]?length>40)>
${frogsingcode[0]}
<#else>
    <!--frogsingcode-->

	<!--frogsingcode-->
</#if>
</taglib>
