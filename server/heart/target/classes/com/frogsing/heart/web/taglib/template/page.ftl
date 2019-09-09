<#function path url,pageNo>
<#if (url?? && (url?length > 0))>
	<#if (url?index_of("?") > 0)>
		<#return url+"&pageNo="+pageNo/>
	<#else>
		<#return url+"?pageNo="+pageNo/>
	</#if>
<#else>
	<#return "javascript:jumpPage("+pageNo+")"/>
</#if>
</#function>
<#if page??>
<#assign page=page/>
<#assign url=url/>
<div class='scott'>
	<#if (page.number>0)>
		<a href="${path(url,0)}">首页</a>
		<a href="${path(url,(page.number-1))}">上一页</a>
	<#else>
		<span class='disabled'>首页</span>
		<span class='disabled'>上一页</span>
	</#if>
	
	<#assign pageNo=page.number+1/>
	<#assign pageCount=page.totalPages/>
	<#if pageCount=0 >
		<#assign pageCount=1/>
	</#if>
	<#assign start=1/>
	<#assign end=pageCount/>	
	<#if (pageCount > 7)>
		<#-- 显示当前页号和它附近的页号 -->
		<#assign end=(pageNo + 3)/>
		<#if (end < 7)>
			<#assign end=7/>
		</#if>
		
	 	<#if (pageNo > 4) >
			<a href="${path(url,0)}">1</a>
			&hellip;
			<#assign start=(pageNo - 3)/>
		</#if>
		
		
		<#if (end > pageCount)>
			<#assign end=pageCount/>
			<#assign start=(pageCount - 7)/>
		</#if>
		
		<#if ((pageNo+4)>=pageCount)>
			<#assign start=(pageCount-6)/>
		</#if>
		
		<#if (start < 1)>
			<#assign start=1/>
		</#if>
	</#if>
		
	<#list start..end as i>
	    <#if (pageNo==i)>
			<span id="page_current" class="current">${i}</span>
	  	<#else>
	 		<a href="${path(url,(i-1))}">${i}</a>
		</#if>
	 </#list>

	<#-- 如果后面页数过多,显示... -->
  	<#if (end < pageCount - 1)>&hellip;</#if>
  	<#if (end < pageCount&&(pageCount!=0))>
		<a href="${path(url,(pageCount-1))}">${pageCount}</a>
  	</#if>
	<#if ((page.number + 1) * page.size < page.totalElements)>
		<a href="${path(url,(page.number+1))}">下一页</a>
		<a href="${path(url,(page.totalPages-1))}">末页</a>
	<#else>
		<span class='disabled'>下一页</span>
		<span class='disabled'>末页</span>
	</#if>
	<#if (pageCount>7)>
		第<input type="text" name="to_page" id="to_page" value="" style="height:23px;line-height:23px;width:40px;border:1px solid #cccccc;color:#cccccc;text-align:center;margin:0 5px;"/>页
		<a href="${path(url,'')}">跳转</a>
	</#if>
</div>
</#if>