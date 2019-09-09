<!--  异步删除
把要删除的复选框的value设成id
 例子链接（括号以内要全部复制）：（ https://shimo.im/doc/NPWz54CncfUfajO2/「deleteSome()」） -->

<!-- 参数1提示语，参数2是链接 ，在jeeplus.js中定义了deleteSome() -->
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="message" type="java.lang.String" required="true"%>
<%@ attribute name="url" type="java.lang.String" required="true"%>
<%@ attribute name="callback" type="java.lang.String" required="false"%>
<button class="btn btn-white btn-sm" onclick="deleteSome('${message}','${url}','',${callback})" data-toggle="tooltip" data-placement="top"><i class="fa fa-trash-o"></i>删除</button>

<script type="text/javascript">
$(document).ready(function() {
	$("thead input.i-checks").on('ifChecked', function(event){ //ifCreated 事件应该在插件初始化之前绑定 
		$("input.i-checks").iCheck('check');
    	});

	$("thead input.i-checks").on('ifUnchecked', function(event){ //ifCreated 事件应该在插件初始化之前绑定 
		$("input.i-checks").iCheck('uncheck');
    	});
    
});

</script>