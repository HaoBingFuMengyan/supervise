<#macro upper1 str><#assign strlen=str?length-1 /><#assign right=str[1..strlen] /><#assign left=str[0..0]?upper_case/>${left+right}</#macro>


<#macro typeDefaultValue field>
<#switch field.type?lower_case>
<#case "string"><#break>
<#case "timestamp"><#break>
<#case "date"><#break>
<#case "number">=0<#break>
<#case "int"><#if field.defaultValue??>=${field.defaultValue}<#else>=0</#if><#break>
<#case "double"><#if field.defaultValue??>=<#if (field.defaultValue =='0') >0.0<#else>${field.defaultValue}</#if></#if><#break>
<#case "long"><#if field.defaultValue??>=${field.defaultValue}l</#if><#break>
<#default><#break>
</#switch>
</#macro>
<#function fToJavaType field>
<#switch field.type?lower_case>
<#case "string"><#return "String"><#break>
<#case "timestamp"><#return "Date"><#break>
<#case "dateTime"><#return "Date"><#break>
<#case "date"><#return "Date"><#break>
<#case "number"><#return "long"><#break>
<#case "int"><#return "int"><#break>
<#case "float"><#return "double"><#break>
<#case "decimal"><#if field.domain.code=="Long"||field.domain.code=="VersionNo"||field.domain.code=="CurrentVersion"><#return "long"><#else><#return "double"></#if><#break>
<#case "base64binary"><#return "byte[]"><#break>
<#default><#return field.domain.code><#break>
</#switch>
</#function>
<#function fToOracleType field>
<#switch field.type>
<#case "string"><#return "String"><#break>
<#case "timestamp"><#return "Date"><#break>
<#case "date"><#return "Date"><#break>
<#case "number"><#return "long"><#break>
<#case "int"><#return "int"><#break>
<#case "float"><#return "double"><#break>
<#case "decimal"><#if field.domain.code=="Long"||field.domain.code=="VersionNo"||field.domain.code=="CurrentVersion"><#return "long"><#else><#return "double"></#if><#break>
<#case "base64binary"><#return "byte[]"><#break>
<#default><#return field.domain.code><#break>
</#switch>
</#function>
<#macro typeToJavaType field>${fToJavaType(field)?trim}</#macro>

<#macro typeToHiberateType field>
<#switch field.domain.code>
<#case "string"><#if (field.@len?number<4000) >string<#else>org.springframework.orm.hibernate3.support.ClobStringType</#if><#break>
<#case "timestamp">timestamp<#break>
<#case "date">date<#break>
<#default>${field.domain.code}<#break>
</#switch>
</#macro>
<#macro javaValueObjectToJavaValue field>
<#switch field.domain.code>
<#case "string"><#nested><#break>
<#case "timestamp"><#nested><#break>
<#case "date"><#nested><#break>
<#case "int"><#nested>.intValue<#break>
<#case "long"><#nested>.longValue<#break>
<#case "double"><#nested>.doubleValue<#break>
<#default><#nested><#break>
</#switch>
</#macro>

<#macro typeToJavaObjectType field>
<#switch field.domain.code>
<#case "string">String<#break>
<#case "timestamp">DATE<#break>
<#case "date">DATE<#break>
<#case "int">Integer<#break>
<#case "long">Long<#break>
<#case "double">Double<#break>
<#default>${field.domain.code}<#break>
</#switch>
</#macro>

<#macro typeToSqlType field>
<#switch field.domain.code>
<#case "string"><#if (field.@len?number>4000) >CLOB<#else>VARCHAR(${field.@len})</#if><#break>
<#case "timestamp">DATE<#break>
<#case "date">DATE<#break>
<#case "int">NUMBER(6,0)<#break>
<#case "long">NUMBER(12,0)<#break>
<#case "double">NUMBER(${field.@len})<#break>
<#default>${field.domain.code}<#break>
</#switch>
</#macro>




<#macro objectToJavaType field>
<#switch field.domain.code>
<#case "string">ObjectChangeTool.getString(<#nested>)<#break>
<#case "double">ObjectChangeTool.getDouble(<#nested>)<#break>
<#case "float">ObjectChangeTool.getFloat(<#nested>)<#break>
<#case "int">ObjectChangeTool.getInt(<#nested>)<#break>
<#case "long">ObjectChangeTool.getLong(<#nested>)<#break>
<#case "timestamp">ObjectChangeTool.getTime(<#nested>)<#break>
<#case "date">ObjectChangeTool.getDate(<#nested>)<#break>
<#default>get${field.domain.code}(<#nested>)<#break>
</#switch>
</#macro>


<#macro stringToFieldValue field>
	<#switch field.domain.code>
	<#case "string"><#nested><#break>
	<#case "double">(<#nested>==""?consts.double_min:Convert.ToDouble(<#nested>))<#break>
	<#case "int" >(<#nested>==""?consts.int_min:Convert.ToInt32(<#nested>))<#break>
	<#case "long" >(<#nested>==""?consts.long_min:Convert.ToInt32(<#nested>))<#break>
	<#case "DateTime" >(<#nested>==""?new DateTime(1000,1,1):Convert.ToDateTime(<#nested>))<#break>
	<#default>
	 do note suppoert this type ${field.domain.code}
	</#switch>
</#macro>
<#macro fieldValueToString entity field>
<#if (field.enum?if_exists?size>0)>
	${entity.@entity_name}.enum_${field.code}[<#nested>.ToString()].ToString()
<#else>
	<#switch field.domain.code>
	<#case "string"><#nested><#break>
	<#case "double">(<#if (field.@notnull?if_exists?size>0)&&(field.@notnull="no") >
					Convert.ToDouble(<#if (field.@size?if_exists?size>0)>string.Format("{0:F${field.@size}}",<#nested>)<#else>string.Format("{0:F0}",<#nested>)</#if>)<consts.double_min+1)?"":<#if (field.@size?if_exists?size>0)>string.Format("{0:F${field.@size}}",<#nested>)<#else>string.Format("{0:F0}",<#nested>)</#if>
					<#else>
						<#if (field.@size?if_exists?size>0)>string.Format("{0:F${field.@size}}",<#nested>)<#else>string.Format("{0:F0}",<#nested>)</#if>
					</#if>)
					<#break>
	<#case "int" >(<#if (field.@notnull?if_exists?size>0)&&(field.@notnull="no") >
				  Convert.ToInt32(string.Format("{0}",<#nested>))<consts.int_min+1)?"":string.Format("{0}",<#nested>)
				 <#else>
				  string.Format("{0}",<#nested>)
				  </#if>)
				  <#break>
	<#case "long" >
				(<#if (field.@notnull?if_exists?size>0)&&(field.@notnull="no") >
				  Convert.ToInt32(string.Format("{0}",<#nested>))<consts.int_min+1)?"":string.Format("{0}",<#nested>)
				 <#else>
				  string.Format("{0}",<#nested>)
				  </#if>)
				  <#break>
	<#case "DateTime" >
		<#if (field.@size?if_exists?size>0)>
			<#nested>.ToString().CompareTo("1001-1-1")<0?"":string.Format("{0:${field.@size}}",<#nested>)
		<#else>
			<#nested>.ToString().CompareTo("1001-1-1")<0?"":((DateTime)<#nested>).Hour + ((DateTime)<#nested>).Minute==0?string.Format("{0:d}",<#nested>):string.Format("{0:G}",<#nested>)
		</#if>
	<#break>
	<#default>
	do note suppoert this type ${field.domain.code}
	</#switch>
</#if>
</#macro>
<#macro objectToFieldValue entity field>

	<#switch field.domain.code>
	<#case "string"><#nested>.ToString()<#break>
	<#case "double">Convert.ToDouble(<#nested>)
					<#break>
	<#case "int" >Convert.ToInt32(<#nested>)
				  <#break>
	<#case "long" >Convert.ToInt64(<#nested>)
				  <#break>	
	<#case "DateTime">Convert.ToDateTime(<#nested>)
				<#break>
	<#default>
	do note suppoert this type ${field.domain.code}
	</#switch>
</#macro>

<#macro fieldValueObjectToString entity field>
<#if (field.enum?if_exists?size>0)>
	${entity.@entity_name}.enum_${field.code}[<#nested>.ToString()].ToString()
<#else>
	<#switch field.domain.code>
	<#case "string"><#nested>.ToString()<#break>
	<#case "double">(<#if (field.@notnull?if_exists?size>0)&&(field.@notnull="no") >
					Convert.ToDouble(<#if (field.@size?if_exists?size>0)>string.Format("{0:F${field.@size}}",<#nested>)<#else>string.Format("{0:F0}",<#nested>)</#if>)<consts.double_min+1)?"":<#if (field.@size?if_exists?size>0)>string.Format("{0:F${field.@size}}",<#nested>)<#else>string.Format("{0:F0}",<#nested>)</#if>
					<#else>
					<#if (field.@size?if_exists?size>0)>string.Format("{0:F${field.@size}}",<#nested>)<#else>string.Format("{0:F0}",<#nested>)</#if>
					</#if>)
					<#break>
	<#case "int" >(<#if (field.@notnull?if_exists?size>0)&&(field.@notnull="no") >
				  Convert.ToInt32(string.Format("{0}",<#nested>))<consts.int_min+1)?"":string.Format("{0}",<#nested>)
				 <#else>
				  string.Format("{0}",<#nested>)
				  </#if>)
				  <#break>
	<#case "long" >
				(<#if (field.@notnull?if_exists?size>0)&&(field.@notnull="no") >
				  Convert.ToInt32(string.Format("{0}",<#nested>))<consts.int_min+1)?"":string.Format("{0}",<#nested>)
				 <#else>
				  string.Format("{0}",<#nested>)
				  </#if>)
				  <#break>
	<#case "DateTime" >
		<#if (field.@size?if_exists?size>0)>
			<#nested>.ToString().CompareTo("1001-1-1")<0?"":string.Format("{0:${field.@size}}",<#nested>)
		<#else>
			<#nested>.ToString().CompareTo("1001-1-1")<0?"":((DateTime)<#nested>).Hour + ((DateTime)<#nested>).Minute==0?string.Format("{0:d}",<#nested>):string.Format("{0:G}",<#nested>)
		</#if>
	<#break>
	<#default>
	do note suppoert this type ${field.domain.code}
	</#switch>
</#if>
</#macro>

<#macro fieldValueToShow field>
<#if (field.enum?if_exists?size>0)>
	m_enum_${field.code}[<#nested>.ToString()]
<#else>
	<#if (field.show?if_exists?size>0)>
	<#switch field.domain.code>
	<#case "string"><#nested><#break>
	<#case "double">(<#if (field.@notnull?if_exists?size>0)&&(field.@notnull="no") >
					Convert.ToDouble(<#if (field.@size?if_exists?size>0)>string.Format("{0:F${field.@size}}",<#nested>)<#else>string.Format("{0:F0}",<#nested>)</#if>)<consts.double_min+1)?"":<#if (field.@size?if_exists?size>0)>string.Format("{0:F${field.@size}}",<#nested>)<#else>string.Format("{0:F0}",<#nested>)</#if>
					<#else>string.Format("{0:F0}",<#nested>)
					</#if>)
					<#break>
	<#case "int" >(<#if (field.@notnull?if_exists?size>0)&&(field.@notnull="no") >
				  Convert.ToInt32(string.Format("{0}",<#nested>))<consts.int_min+1)?"":string.Format("{0}",<#nested>)
				 <#else>
				  string.Format("{0}",<#nested>)
				  </#if>)
				  <#break>
	<#case "long" >
				(<#if (field.@notnull?if_exists?size>0)&&(field.@notnull="no") >
				  Convert.ToInt32(string.Format("{0}",<#nested>))<consts.int_min+1)?"":string.Format("{0}",<#nested>)
				 <#else>
				  string.Format("{0}",<#nested>)
				  </#if>)
				  <#break>
	<#case "DateTime" >((DateTime)<#nested>).Hour + ((DateTime)<#nested>).Minute==0?string.Format("{0:d}",<#nested>):string.Format("{0:G}",<#nested>)
	<#break>
	<#default>
	do note suppoert this type ${field.domain.code}
	</#switch>
	<#else>
	<#switch field.domain.code>
	<#case "string"><#nested><#break>
	<#case "double">(<#if (field.@notnull?if_exists?size>0)&&(field.@notnull="no") >
					Convert.ToDouble(<#if (field.@size?if_exists?size>0)>string.Format("{0:F${field.@size}}",<#nested>)<#else>string.Format("{0:F0}",<#nested>)</#if>)<consts.double_min+1)?"":<#if (field.@size?if_exists?size>0)>string.Format("{0:F${field.@size}}",<#nested>)<#else>string.Format("{0:F0}",<#nested>)</#if>
					<#else>string.Format("{0:F0}",<#nested>)
					</#if>)
					<#break>
	<#case "int" >(<#if (field.@notnull?if_exists?size>0)&&(field.@notnull="no") >
				  Convert.ToInt32(string.Format("{0}",<#nested>))<consts.int_min+1)?"":string.Format("{0}",<#nested>)
				 <#else>
				  string.Format("{0}",<#nested>)
				  </#if>)
				  <#break>
	<#case "long" >
				(<#if (field.@notnull?if_exists?size>0)&&(field.@notnull="no") >
				  Convert.ToInt32(string.Format("{0}",<#nested>))<consts.int_min+1)?"":string.Format("{0}",<#nested>)
				 <#else>
				  string.Format("{0}",<#nested>)
				  </#if>)
				  <#break>	<#case "DateTime" >((DateTime)<#nested>).Hour + ((DateTime)<#nested>).Minute==0?string.Format("{0:d}",<#nested>):string.Format("{0:G}",<#nested>)
	<#break>
	<#default>
	do note suppoert this type ${field.domain.code}
	</#switch>
	</#if>
</#if>
</#macro>
<#macro numberToFieldValue field>
	<#switch field.domain.code>
	<#case "string">string.Format("{0}",<#nested>)<#break>
	<#case "double"><#nested><#break>
	<#case "int" ><#nested><#break>
	<#case "long" ><#nested><#break>
	<#case "DateTime" >Convert.ToDateTime(<#nested>)<#break>
	<#default>
	do note suppoert this type ${field.domain.code}
	</#switch>
</#macro>

<#macro fieldValueToSqlValue field>
	<#switch field.domain.code>
	<#case "string">string.Format("'{0}'",<#nested>)<#break>
	<#case "double"><#nested><#break>
	<#case "int" ><#nested><#break>
	<#case "long" ><#nested><#break>
	<#case "DateTime" >string.Format("${"#"+"{0:G}#"}",<#nested>)<#break>
	<#default>
	do note suppoert this type ${field.domain.code}
	</#switch>
</#macro>
<#macro javaScriptFieldValueToSqlValue field>
	<#switch field.domain.code>
	<#case "string">""(${field.code} like '%""+<#nested>+""%')""<#break>
	<#case "double">""(int(${field.code}+0.00001)=""+<#nested>+"")""<#break>
	<#case "int" >""(${field.code}=""+<#nested>+"")""<#break>
	<#case "long" >""(${field.code}=""+<#nested>+"")""<#break>
	<#case "DateTime" >""(${field.code}>=#""+<#nested>+""#""+"" and ${field.code}<=#""+<#nested>+"" 23:59:59#)""<#break>
	<#default>
	do note suppoert this type ${field.domain.code}
	</#switch>
</#macro>

<#macro isPrimKeyDo entity field>
	<#assign c=0>
	<#list entity.prim_key as primkey>
				<#if field.code=primkey.@field >
				<#assign c=c+1>
	<#nested>
				<#break>
				</#if>
	</#list>
</#macro>
<#macro notPrimKeyDo entity field>
	<#local isp=0 />
	<#list entity.prim_key as primkey>
				<#if (field.code=primkey.@field) >
				<#local isp=1 />
				<#break>
				</#if>
	</#list>
	<#if isp=0>
	<#nested>
	</#if>
</#macro>
<#macro fieldAtrributeToFieldValue field>
	<#switch field.domain.code>
	<#case "string">"<#nested>"<#break>
	<#case "double"><#nested><#break>
	<#case "int" ><#nested><#break>
	<#case "long" ><#nested><#break>
	<#case "DateTime" >Convert.ToDateTime("<#nested>")<#break>
	<#default>
	do note suppoert this type ${field.domain.code}
	</#switch>
</#macro>

<#macro fieldValueInit field>
	<#switch field.domain.code>
	<#case "string">"<#nested>"<#break>
	<#case "double">consts.double_min<#break>
	<#case "int" >consts.int_min<#break>
	<#case "long" >consts.long_min<#break>
	<#case "DateTime" >DateTime.Now<#break>
	<#default>
	do note suppoert this type ${field.domain.code}
	</#switch>
</#macro>





<#macro fieldViewParaList entity=entity field=field>
<#if (field.@viewtype?if_exists?size>0) >
<#if (field.enum?if_exists?size>0)><#-- **************************************************************************** -->
<#switch field.@viewtype>
<#case "combox">
		{  
           ${entity.@entity_name} p = new ${entity.@entity_name}();
            foreach (DictionaryEntry objDE in ${entity.@entity_name}.enum_${field.code})
            {
                ListItem item1 = new ListItem(objDE.Value.ToString(), objDE.Key.ToString());
                ${field.code}.Items.Add(item1);
            }
            ${field.code}.SelectedValue =  ${entity.@entity_name}.<#list field.enum as enum>${enum.@name}<#break></#list>.ToString();
            
        }
		<#break>
<#case "DropDownList">
		{
           ${entity.@entity_name} p = new ${entity.@entity_name}();
            foreach (DictionaryEntry objDE in ${entity.@entity_name}.enum_${field.code})
            {
                ListItem item1 = new ListItem(objDE.Value.ToString(), objDE.Key.ToString());
                ${field.code}.Items.Add(item1);
            }
            ${field.code}.SelectedValue = ${entity.@entity_name}.<#list field.enum as enum>${enum.@name}<#break></#list>.ToString();
            
        }
		<#break>
<#default>
		<#break>
</#switch>
<#else><#-- **************************************************************************** -->
<#if (field.show?if_exists?size>0)>
<#list field.show as show>
<#switch field.@viewtype>
<#case "combox">
		{
            ${show.@entity_name} p = new ${show.@entity_name}();
            DataSet set = p.query("", "");
            DataTable dt = set.Tables[0];
            foreach (DataRow r in dt.Rows)
            {
				ListItem item1 = new ListItem(r["${show.@refvalue}"].ToString(), r["${show.@ref}"].ToString());
                ${field.code}.Items.Add(item1);
            }
        }
		<#break>
<#case "DropDownList">
		{
		
            ${show.@entity_name} p = new ${show.@entity_name}();
            DataSet set = p.query("", "");
            DataTable dt = set.Tables[0];
            ${field.code}.Items.Add(new ListItem("",""));
            foreach (DataRow r in dt.Rows)
            {
				ListItem item1 = new ListItem(r["${show.@refvalue}"].ToString(), r["${show.@ref}"].ToString());
                ${field.code}.Items.Add(item1);
            }
        }
		<#break>
<#default>
		<#break>
</#switch>
</#list>
</#if>
</#if><#-- **************************************************************************** -->
</#if>
</#macro>


<#macro fieldToQuery  field=field>
<#if (field.@show?if_exists?size>0) ><#-- **************************************************************************** -->
<#if (field.enum?if_exists?size>0)><#-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
sb.Append(@"<td style=""width:${field.@show}px"">
	<select id=""p${field.code}""  >
	<option  value=""""></option>
	<#list field.enum as enum>
            <option  value=""${enum.@value}"">${enum.@label}</option>
	</#list>
     </select>
     </td>");
<#else><#-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
<#if (field.show?if_exists?size>0)><#-- **************************************************************************** -->
		{
		<#list field.show as show>
		${show.@entity_name} pEntity=new ${show.@entity_name}();
		 DataSet pset=pEntity.query("","");
		 DataTable pdt=pset.Tables[0];
		 sb.Append(@"<td style=""width:${field.@show}px"">
		<select id=""p${field.code}""  ><option value="""" ></option> ");
		 foreach (DataRow row in pdt.Rows)
		 {
			sb.Append(string.Format(@"<option  value=""{1}"">{0}</option>",row["${show.@refvalue}"].ToString(),row["${show.@ref}"].ToString()));
		 }	 
		 sb.Append(@"
		</select>
		</td>");
		</#list>
		}
<#else>
	sb.Append(@"<td style=""width:${field.@show}px"">
	<input id=""p${field.code}"" type=""text"" />
	</td>");
</#if>
</#if><#-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
</#if><#-- **************************************************************************** -->

</#macro>

<#macro fieldTypeToSqlType field>
	<#switch field.domain.code>
	<#case "string">
<#if (field.@size?if_exists?size>0)>
	<#if ("${field.@size}"?number >254)>
	${field.code} longText
	<#else>
	${field.code} ${field.domain.code}(${field.@size})
	</#if>
<#else>
	${field.code} ${field.domain.code}
</#if>
	<#break>
	<#case "double">${field.code} ${field.domain.code}<#break>
	<#case "int" >${field.code} ${field.domain.code}<#break>
	<#case "long" >${field.code} ${field.domain.code}<#break>
	<#case "DateTime" >${field.code} ${field.domain.code}<#break>
	<#default>
	error.........
	</#switch>
</#macro>

<#macro entityToTableSql entity >
create table ${entity.@entity_name} (
	<#list entity.field as field>
		<@fieldTypeToSqlType field=field />
	<#if (field.@notnull?if_exists?size>0) && (field.@notnull="yes")>
	not null 
	</#if>
	<@isPrimKeyDo entity=entity field=field>primary key</@isPrimKeyDo><#if field_has_next>,</#if>
	</#list>
)
</#macro>

<#function toJavaName p>
	<#return p?substring(p?index_of('_')+1)?cap_first>
</#function>
<#function toPackageName p>
	<#assign a=p?index_of('_')>
	<#if a<0>
	<#assign a=0 >
	</#if>
	<#return p?substring(0,a)?lower_case>
</#function>
<#function fupper1 p>
<#assign str=p?lower_case>
<#assign strlen=str?length-1 />
<#assign right=str[1..strlen] />
<#assign left=str[0..0]?upper_case/>
<#return left+right>
</#function>
<#function flower1 p>
<#assign str=p>
<#assign strlen=str?length-1 />
<#assign right=str[1..strlen] />
<#assign left=str[0..0]?lower_case/>
<#return left+right>
</#function>
	
<#function tojsp p >
<#assign res = p?matches("(.+)([A-Z])(.+)")>
<#if res>
<#list res as m>
<#assign r= m?groups />
<#assign str=""/>
<#list r as a>
<#if (a_index>0)>
<#if (a_index==2)>
<#assign str=str+ "-"+a?uncap_first/>
<#else>
<#assign str=str+ a?uncap_first/>
</#if>
</#if>
</#list>
</#list>  
<#else>
<#assign str=p/>
</#if>
<#return str?lower_case />  
</#function>
<#macro fToExtField field>
<#switch field.type>
<#case "string">
{
		fieldLabel: '${field.name}',
		id:'${field.code?lower_case}_id',
        name:'${field.code?lower_case}',
        maxLength:${fToDesc(field.domain.code)},
        allowBlank:false,
        xtype:'textfield',
        blankText:'请输入${field.name}'
	//	regex : /^\+?[1-9][0-9]*$/,
	//	regexText : '${field.name}格式不正確!'
}
<#break>
<#case "number">
<#case "int">
  <#if field.domain.code="Bool">
				new Ext.form.Checkbox({   
					id : '${field.code?lower_case}_hid',
					boxLabel : '${field.name}',  
                    checked : false,
                	listeners:{
        				check:function(th,checked){
        						if(checked)
        							Ext.getCmp("${field.code?lower_case}_id").setValue(1);
        						else
        							Ext.getCmp("${field.code?lower_case}_id").setValue(0);
        				}
        			}

				}),
				{ id:'${field.code?lower_case}_id',name:'${field.code?lower_case}', xtype : 'hidden',value:0}
  <#else>
  <#if fToDesc(field.domain.code)!="">
  new Ext.form.ComboBox({
	            fieldLabel: '${field.name}',
				id:'${field.code?lower_case}_id',
       			hiddenName:'${field.code?lower_case}',
	  				store : <ts:label name='${field.domain.code}'/>,
	  				anchor:'94%',
					valueField : "id",
					displayField : "name",
					mode : 'local',
					forceSelection : true,
					editable : false,
					triggerAction : 'all',
	                allowBlank:false,
	                blankText:'请输入${field.name}'
	 			})
  <#else>
	{
		fieldLabel: '${field.name}',
		id:'${field.code?lower_case}_id',
        name:'${field.code?lower_case}',
      // maxLength:100,
        allowBlank:false,
        xtype:'textfield',
        blankText:'请输入${field.name}',
		regex : /^\+?[1-9][0-9]*$/,
		regexText : '${field.name}格式不正確!'
	}
</#if>
</#if>
	<#break>
<#case "float"><#break>
<#case "decimal">
{
		fieldLabel: '${field.name}',
		id:'${field.code?lower_case}_id',
        name:'${field.code?lower_case}',
      // maxLength:100,
        allowBlank:false,
        xtype:'textfield',
        blankText:'请输入${field.name}',
		regex : /^[0-9]+(.[0-9]{2})?$/,
		regexText : '${field.name}格式不正確!'
}
	<#break>
<#default>
   {
		fieldLabel: '${field.name}',
		id:'${field.code?lower_case}_id',
        name:'${field.code?lower_case}',
      // maxLength:100,
        allowBlank:false,
        xtype:'textfield',
        blankText:'请输入${field.name}'
	//	regex : /^[0-9]+(.[0-9]{2})?$/,
	//	regexText : '${field.name}格式不正確!''
	}
<#break>
</#switch>
</#macro>


<#macro fToExtHeader field>
<#assign headercommon="header : '<center>${field.name}</center>',dataIndex:'${field.code?lower_case}'" />
<#switch field.type>
<#case "int">
  <#if field.domain.code="Bool">
	{${headercommon},renderer:function(val){
						if(val==0)
							return "否";
						else
							return "是";
					}}			
  <#else>
  <#if field.domain.consts??>
 	{${headercommon},renderer:function(val){
				return $msg.label(<ts:label name='${field.domain.code}'/>,val);
			}}
  <#else>
	 {${headercommon}}
</#if>
</#if>
	<#break>
<#case "double">
		{${headercommon},renderer:function(val){
				return $tt.format(val);
			}}
	
	<#break>
<#default>
 {${headercommon}}
<#break>
</#switch>
</#macro>
