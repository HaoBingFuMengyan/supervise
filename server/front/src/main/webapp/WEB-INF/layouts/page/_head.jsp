<%--
  Created by IntelliJ IDEA.
  User: wesson
  Date: 2017/9/26
  Time: 下午2:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="shiro" uri="http://www.frogsing.com/tags/shiro" %>
<%@ taglib prefix="mw" uri="http://www.frogsing.com/tags/frogsing" %>
<%@ taglib prefix="layout" uri="http://www.frogsing.com/tags/layout" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="cs" uri="http://www.frogsing.com/tags/parameter" %>
<link href="${ctx}/css/page.css" type="text/css" rel="stylesheet">
<script>
    $(function(){
        $(".focus-b ul li a").each(function(){
            $this = $(this);
            if($this[0].href==String(window.location)){
                $this.parent('li').addClass("active");
            }
        });
        $(".w .search ul li").click(function(){
            var index=$(this).index();
            $(this).addClass('select').siblings().removeClass('select');
        });

        $.post("${ctx}/zy/cart/cartcount.json",{},function(result){
            $("#addcart").html(result.obj);
        });
    });
    function searchResource(){
        var keys=[];
        var values=[];
        for(var i=0; i<arguments.length; i++){
            if (i % 2 == 0) {
               keys.push(arguments[i]);
            }else {
               values.push(arguments[i]);
            }
        }
        for(var i=0; i<keys.length; i++){
            var key=keys[i];
            var val=values[i];
            var input ='';
            input='<input name='+key+' value='+val+' >';
            $('#searchResourceForm').append(input);
        }
        $('#searchResourceForm').submit()


    }

    //获取下级品牌，规格型号
    function querySbrand(category,categoryid) {
        $.ajax({
            url: '${ctx}/sbrand.json',
            data: {sname:category},
            traditional: true,
            success: function (data) {
                if (data.success) {
                    var i = 0;
                    $(".brand-box-body").empty();
                    $(".brand-box-head span").text(data.msg);
                    $.each(data.obj,function(index,value){
                        $(".brand-box-body").append('<div class="brand-group"><h2><img src="<cs:SysParaType imgurl="1" op="syspara"/>/'+value.iconCls+'" alt="">'+'<a onclick="searchResource(\'search_like_sdetailkeyword\',\''+value.text+'~1~\',\'search_eq_scategoryid\',\''+categoryid+'\')">'+value.text+'</a>'+'<button onclick="Exhibition(this)">展开</button></h2><ul class="clearfix brand_box_body'+i+'"></ul></div>');
                        $.each(value.children,function(key,val){
                            var text=val.code?val.code+'~1~'+value.text:val.text+'~1~'+value.text;
                            $(".brand_box_body"+i).append('<li><a onclick="searchResource(\'search_like_sdetailkeyword\',\''+text+'\',\'search_eq_scategoryid\',\''+categoryid+'\')">'+val.text+'</a></li>');
                        });
                        i++;
                    });
                    $(".brand-box").show();
                } else {
                    if (data.msg)
                        layer.msg(data.msg);
                    else
                        layer.msg("未知错误,返回消息格式不正确!需要异步提交");
                }
            },
            error: function () {
                layer.msg("系统错误，请联系管理员");
            }
        });
    }

    function Exhibition(obj){
        if($(obj).hasClass('open')){
            $(obj).html('展开');
            $(obj).removeClass('open');
            $(obj).parents('.brand-group').find('ul').animate({"max-height":"52px"},500)
        }
        else{
            $(obj).html('收起');
            $(obj).addClass('open');
            $(obj).parents('.brand-group').find('ul').animate({"max-height":"500px"},500)
        }
    }
</script>
<div class="layout-top">
    <!-----------------------------------------顶部-------------->
    <header id="header">
        <div class="header-box">
            <ul class="header-left">
                <shiro:notAuthenticated>
                    <li class="denglu"><a href="${ctx}/index.html" class="right10">煤亮子商城</a><a href="${ctx}/login.html">您好，请登录</a> <a href="${ctx}/register.html"  class="red">免费注册</a></li>
                </shiro:notAuthenticated>
                <shiro:authenticated>
                     <li class="denglu"><a href="${ctx}/index.html" class="right10">煤亮子商城</a>您好，<a href="${ctx}/index.shtml" class="red"><shiro:principal property="memberName"/> <c:set var="user" value="${mw:user()}"/>
                             ${ (empty mw:user().name)?mw:user().loginName: mw:user().name}
                         </font></a><a href="${ctx}/logout.html">,退出</a>
                </shiro:authenticated>
            </ul>
            <ul class="header-right">
              <%--  <li class="shu"></li>
                <li class="shouji bj">
                    <a href="#">手机煤亮子</a>
                    <i class="ci-right ">
                        <s class="jt">◇</s>
                    </i>
                    <div class="shouji1">
                        <img src="${ctx}/images/page/11.jpg"class="shouji4">
                    </div>
                </li>
                <li class="shu"></li>
                <li class="kehu bj">
                    <a href="#">客户服务</a>
                    <i class="ci-right ">
                        <s class="jt">◇</s>
                    </i>
                    <div class="kehu1">
                        <h3 class="neirong2">客户</h3>
                        <ul class="kehu2">
                            <li><a href="">帮助中心</a></li>
                            <li><a href="">售后服务</a></li>
                            <li><a href="">在线客服</a></li>
                            <li><a href="">客服邮箱</a></li>
                        </ul>
                    </div>--%>
                </li>
                <%--<li class="shouji bj">--%>
                    <%--<a href="#">Android客户端</a>--%>
                    <%--<i class="ci-right ">--%>
                        <%--<s class="jt">◇</s>--%>
                    <%--</i>--%>
                    <%--<div class="shouji1">--%>
                        <%--<img src="${ctx}/images/page/androia1.png" class="shouji4">--%>
                        <%--<div class="shouji2">--%>
                            <%--<p style="margin-top:10px;">Android客户端</p>--%>
                            <%--<p class="red">煤亮子商城</p>--%>
                            <%--<img src="${ctx}/images/page/333.jpg" class="shouji3">--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</li>--%>
                  <li class="shouji bj">
                      <a href="#">手机客户端</a>
                      <i class="ci-right ">
                          <s class="jt">◇</s>
                      </i>
                      <div class="shouji1">
                          <img src="${ctx}/images/page/app-code.png" class="shouji4">
                          <div class="shouji2">
                              <p style="margin-top:10px;">手机客户端</p>
                              <p class="red">煤亮子商城</p>
                              <img src="${ctx}/images/page/333.jpg" class="shouji3"><img src="${ctx}/images/page/ios-icon.jpg" class="shouji3">
                          </div>
                      </div>
                  </li>
              <li class="shu"></li>
              <li class="denglu"><a href="${ctx}/index.shtml">会员中心</a></li>
            </ul>
        </div>
    </header>
    <div class="w clearfix w-search">
        <div class="logo"><a href="http://z.meiliangzi.cn/" target= _blank><img src="${ctx}/images/logo-zi.png"></a></div>
        <div class="search">
            <input type="text" placeholder="请输入关键词" class="text" id="textt">
            <input type="button" class="button" value="搜索"/>
            <ul  class="clearfix">
                <%--<li  data-type="indentureType" ${(empty param.searchType || param.searchType eq 'indentureType') ?'class="select"':''}>现货</li>--%>
                <%--<li data-type="resourceType" ${param.searchType eq 'resourceType'?'class="select"':''}>闲置</li>--%>
                <%--<li>商家</li>--%>
            </ul>
        </div>
        <div class="right" style="width:48px;padding: 0 28px 0 40px;color:#f10214">
            <i class="gw-left icon icon-gouwuche3"></i>
            <a href="${ctx}/zy/cart/addcart.shtml">购物车</a>
            <span id="addcart">0</span>
        </div>
        <%--<shiro:notAuthenticated>--%>
            <%--<div class="right">--%>
                <%--<i class="gw-left icon icon-wsmp-payuser"></i>--%>
                <%--<a href="${ctx}/login.html">登录</a>／<a href="${ctx}/register.html">注册</a>--%>
            <%--</div>--%>
        <%--</shiro:notAuthenticated>--%>
        <%--<shiro:authenticated>--%>
            <%--<div class="right" style="width:48px;padding: 0 28px 0 40px;">--%>
            <%--<i class="gw-left icon icon-wsmp-payuser"></i>--%>
            <%--<a href="${ctx}/logout.html">退出账户</a>--%>
            <%--</div>--%>
        <%--</shiro:authenticated>--%>
        <div class="hotwords">
            <a href="#" class="red">采煤机配件</a>
            <a href="#">输送机配件</a>
            <a href="#">轴承</a>
            <a href="#">矿用特种车</a>
            <a href="#">皮带机配件</a>
        </div>
    </div>

    <div class="clear"></div>
    <!--轮播图上方导航栏  一栏-->
    <div id="navv">
        <div class="nav-img" style="background:url(${ctx}/images/page/568a1258N2edec1ab.jpg) repeat-x"></div>
        <%--<div class="nav-imgs" style="background:url(${ctx}/images/page/568a0a8eNe8f4df82.jpg) no-repeat center top"></div>--%>
    </div>
    <div class="focus">
        <div class="focus-a">
            <div class="fouc-img1"><img src="${ctx}/images/page/5689d4ebN19f155a6.jpg" class="nav-img2"></div>
            <div class="fouc-font"><a href="">全部商品分类</a> </div>
            <div class="dd-inner">
                <div class="dd-inner1">
                    <div class="dd-inner2">
                        <c:forEach items="${treeVoList}" var="obj">
                            <div class="font-item">
                                <div class="item fore1">
                                    <h3><a href="#">${obj.text}</a></h3>
                                    <p>
                                        <c:forEach items="${obj.children}" var="label" varStatus="labelIndex">
                                            <c:if test="${labelIndex.index < 5}"><a>
                                                <c:if test="${labelIndex.index gt 0}">&nbsp;|&nbsp;</c:if>
                                                    ${label.text}</a>
                                            </c:if>
                                        </c:forEach>
                                    </p>
                                    <i>></i>
                                </div>
                                <div class="font-item1">
                                    <ul class="font-lefty">
                                        <c:forEach items="${obj.children}" var="children">
                                            <dl class="fore1 clearfix">
                                                <dt><a>${children.text}<i>></i></a></dt>
                                                <dd>
                                                    <c:forEach items="${children.children}" var="commodity">
                                                        <a data-id="${commodity.id}" onclick="searchResource('search_eq_scategoryid','${commodity.id}','')">${commodity.text}</a>
                                                    </c:forEach>
                                                </dd>
                                            </dl>
                                        </c:forEach>

                                    </ul>
                                        <%--5级菜单--%>
                                    <div class="brand-box">
                                        <div class="brand-box-head"><i class="icon icon-guanli5"></i><span></span></div>
                                        <div class="brand-box-body">

                                        </div>
                                            <%--<div class="brand-box-footer">--%>
                                            <%--<button id="closeBrand">关闭</button>--%>
                                            <%--</div>--%>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

            </div>
        </div>
        <div class="focus-b">
            <ul>
                <layout:text key="head_top"></layout:text>
                <%--<li><a href="http://www.meiliangzi.cn" target="_blank">首页</a></li>--%>
                <%--<li><a href="http://www.meiliangzi.cn/operate" target="_blank">生产运营</a></li>--%>
                <%--<li><a href="${ctx}/index.html">设备物资</a></li>--%>
                <%--&lt;%&ndash;<li><a href="${ctx}/goods_stock.html">资源专区</a></li>&ndash;%&gt;--%>
                <%--<li><a href="http://www.meiliangzi.cn/professional" target="_blank">专业技术</a></li>--%>
                <%--<li><a href="http://www.meiliangzi.cn/cultivate" target="_blank">人力资源</a></li>--%>
                <%--<li><a href="http://www.meiliangzi.cn/finance" target="_blank">金融服务</a></li>--%>
                <%--<li><a href="http://www.snincubator.cn" target="_blank">科技孵化</a></li>--%>
                <%--&lt;%&ndash;<li><a href="http://meiliangzi.zlw.net/vipcenter/vip/index.html" target="_blank">电子招标</a></li>&ndash;%&gt;--%>
                <%--<li><a href="http://www.meiliangzi.cn/meeting2" target="_blank">在线诊断</a></li>--%>
                <%--<li><a href="http://www.meiliangzi.cn/requirement" target="_blank">信息集市</a></li>--%>
                <%--<li><a href="http://www.meiliangzi.cn/news" target="_blank">行业资讯</a></li>--%>
            </ul>
        </div>
        <%--<div class="focus-d"><a href=""><img src="${ctx}/images/page/nianhuo.jpg"></a></div>--%>
        <!--轮播图左边当行蓝-->
        <div class="bb"></div>
    </div>
</div>


<form id="searchResourceForm" action="${ctx}/resource.html" style="display: none;" method="post"></form>

