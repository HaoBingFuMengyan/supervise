<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="decorator" content="none">

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <title>基金协同监管系统</title>

	<%@ include file="/include/head.jsp"%>
	<%--<script src="${ctxStatic}/common/inspinia.js?v=3.2.2"></script>--%>
	<script src="${ctxStatic}/common/contabs.js"></script>
		<script src="${ctxStatic}/jquery/jquery.cookie.js"></script> 
	
    <meta name="keywords" content="基金协同监管系统">
    <meta name="description" content="基金协同监管系统">
    <script type="text/javascript">
	$(document).ready(function() {
			 // 默认主题
	        $("body").removeClass("skin-2");
	        $("body").removeClass("skin-3");
	        $("body").removeClass("skin-1");
	        
	        var lasturl= $.cookie('last_frame');
	        if(lasturl){
		        $('.J_menuItem').each(function(){
		        	if($(this).attr('href')==lasturl){
		        		$(this).trigger('click');
		        	}
		        		
		        });
	        }
	       
	       
	 });
			
	</script>
 
</head>

<body class="fixed-sidebar full-height-layout gray-bg" >
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element" style="text-align: center;">

                            <div style="font-size: 20px;font-weight: bold;color:white;">
                                基金协同监管系统
                            </div>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                               <span class="block m-t-xs">欢迎您，<strong class="font-bold"><shiro:principal property="name"></shiro:principal></strong></span>
                               <!-- <span class="text-muted text-xs block">基金协同监管系统<b class="caret"></b></span> -->
                                </span>
                            </a>
                            <a class="changepw" href="javascript:openlog('修改密码','${ctx}/sys/operator/operatorSpassword.shtml','550px','330px')">[修改密码]</a>
                        </div>
                        <div class="logo-element">基金协同监管系统</div>
                    </li>
                     <t:menu menu="${fns:getTopMenu()}" ></t:menu>
                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row content-tabs">
                <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
                <button class="roll-nav roll-left J_tabLeft" style="left:50px;"><i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs J_menuTabs" style="margin-left:90px;width:auto;">
                    <div class="page-tabs-content" style="line-height:31px;">
                        <a href="javascript:;" class="active J_menuTab" data-id="${ctx}/home.shtml">首页</a>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
                </button>
                <div class="btn-group roll-nav roll-right">
                    <button class="dropdown J_tabClose"  data-toggle="dropdown">关闭操作<span class="caret"></span>

                    </button>
                    <ul role="menu" class="dropdown-menu dropdown-menu-right">
                        <li class="J_tabShowActive"><a>定位当前选项卡</a>
                        </li>
                        <li class="divider"></li>
                        <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                        </li>
                        <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                        </li>
                    </ul>
                </div>
                <a href="${ctx}/logout.shtml" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
            </div>
            <div class="row J_mainContent" id="content-main">
                <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${ctx}/home.shtml" frameborder="0" data-id="${ctx}/home.shtml" seamless></iframe>
            </div>
         <!--   <div class="footer">
                <div class="pull-right">上海福人投资集团 &copy; 2015-2025</div>
            </div>  -->
        </div>
        <!--右侧部分结束-->
       
       
    </div>
</body>

<!-- 语言切换插件，为国际化功能预留插件 -->
<script type="text/javascript">

$(document).ready(function(){

	$("a.lang-select").click(function(){
		$(".lang-selected").find(".lang-flag").attr("src",$(this).find(".lang-flag").attr("src"));
		$(".lang-selected").find(".lang-flag").attr("alt",$(this).find(".lang-flag").attr("alt"));
		$(".lang-selected").find(".lang-id").text($(this).find(".lang-id").text());
		$(".lang-selected").find(".lang-name").text($(this).find(".lang-name").text());

	});


});

function changeStyle(){
   $.get('${pageContext.request.contextPath}/theme/ace?url='+window.top.location.href,function(result){   window.location.reload();});
}

</script>
<!-- 即时聊天插件  开始-->
<link href="${ctxStatic}/layer-v3.1.0/layim/layui/css/layui.css" type="text/css" rel="stylesheet"/>



<style>
/*确认样式*/
.layim-sign-box{
	width:95%
}
.layim-sign-hide{
  border:none;background-color:#F5F5F5;
}
</style>

</html>