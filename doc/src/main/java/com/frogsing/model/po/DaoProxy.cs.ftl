<#include  "/function.ftl">
<#include "type.ftl">
<#macro entityM entity>
        virtual public ${toJavaName(entity.code)}Dao ${toJavaName(entity.code)}Dao{ get; set; }
</#macro>
<#macro LL node>
<#list node.tables  as entity>
<@entityM entity=entity/>
</#list>
<#list node.views  as entity>
<@entityM entity=entity/>
</#list>
</#macro>
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
namespace frogsing
{
    public class DaoProxy
    {
		<@LL node=pdm />
 	}
}