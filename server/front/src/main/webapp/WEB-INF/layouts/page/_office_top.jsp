<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<%@ taglib prefix="layout" uri="http://www.frogsing.com/tags/layout" %>
<link rel="stylesheet" href="${ctx}/font/iconfont.css"/>
<script type="text/javascript">
    $().ready(function () {
        $.post("${ctx}/zy/cart/cartcount.json",{},function(result){
            $("#addcart").html(result.obj);
        });
    });
</script>
<c:if test="${mw:user().membertype eq 1}">
    <div class="layout-top" style="background: #fff">
        <!-----------------------------------------顶部-------------->
        <header style="clear:both;width:100%;height:30px;line-height:30px;background:#F1F1F1;">
            <div class="header-box">
                <ul class="header-left">
                    <shiro:notAuthenticated>
                        <li class="denglu"><a href="${ctx}/login.html">您好，请登录</a> <a href="${ctx}/register.html"
                                                                                     class="red">免费注册</a></li>
                    </shiro:notAuthenticated>
                    <shiro:authenticated>
                    <li class="denglu">您好，<a href="${ctx}/index.shtml" class="red"><shiro:principal
                            property="memberName"/> <c:set var="user" value="${mw:user()}"/>
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
                    <li class="shouji bj">
                        <a href="#">Android客户端</a>
                        <i class="ci-right ">
                            <s class="jt">◇</s>
                        </i>
                        <div class="shouji1">
                            <img src="${ctx}/images/page/androia1.png" class="shouji4">
                            <div class="shouji2">
                                <p style="margin-top:10px;">Android客户端</p>
                                <p class="red">煤亮子商城</p>
                                <img src="${ctx}/images/page/333.jpg" class="shouji3">
                            </div>
                        </div>
                    </li>
                    <li class="shouji bj">
                        <a href="#">IOS客户端</a>
                        <i class="ci-right ">
                            <s class="jt">◇</s>
                        </i>
                        <div class="shouji1">
                            <img src="${ctx}/images/page/ios1.jpg" class="shouji4">
                            <div class="shouji2">
                                <p style="margin-top:10px;">IOS客户端</p>
                                <p class="red">煤亮子商城</p>
                                <img src="${ctx}/images/page/ios-icon.jpg" class="shouji3">
                            </div>
                        </div>
                    </li>
                    <li class="shu"></li>
                    <li class="denglu"><a href="${ctx}/index.shtml">会员中心</a></li>
                </ul>
            </div>
        </header>
        <div class="w clearfix">
            <div class="logo"><a href="${ctx}/index.html"><img src="${ctx}/images/logo-zi.png"></a></div>
            <div class="search">
                <input type="text" placeholder="请输入关键词" class="text" id="textt">
                <input type="button" class="button" value="搜索"/>
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
                <%--<div class="right" style="width:54px;padding: 0 28px 0 40px;">--%>
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
            <div class="nav-imgs"
                 style="background:url(${ctx}/images/page/568a0a8eNe8f4df82.jpg) no-repeat center top"></div>
        </div>
        <div class="focus">
            <div class="focus-a">
                <div class="fouc-img1"><img src="${ctx}/images/page/5689d4ebN19f155a6.jpg" class="nav-img2"></div>
                <div class="fouc-font"><a href="">全部商品分类</a></div>
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
                        <%--<li><a href="http://meiliangzi.zlw.net/vipcenter/vip/index.html" target="_blank">电子招标</a></li>--%>
                        <%--&lt;%&ndash;<li><a href="http://www.meiliangzi.cn/meeting2" target="_blank">在线诊断</a></li>&ndash;%&gt;--%>
                        <%--<li><a href="http://www.meiliangzi.cn/requirement" target="_blank">信息集市</a></li>--%>
                        <%--<li><a href="http://www.meiliangzi.cn/news" target="_blank">行业资讯</a></li>--%>
                </ul>
            </div>
            <div class="focus-d"><a href=""><img src="${ctx}/images/page/nianhuo.jpg"></a></div>
            <!--轮播图左边当行蓝-->
            <div class="bb"></div>
        </div>
    </div>
</c:if>
<c:if test="${mw:user().membertype eq 2}">
    <div class="header">
        <div class="topbar">
            <div class="topLogo">
                <div class="logo-gly">
                    <div class="gly-img">
                        <a href="${ctx}/index.html"><img height="50" src="${ctx }/of/images/frontlogo2.png" border="0"
                                                         style="margin-top: 5px;"/></a>
                    </div>
                </div>

            </div>
            <div class="frontright">
                <ul>
                    <li>
                        <a href="${ctx}/index.shtml" class="red"><shiro:principal property="memberName"/> <c:set
                                var="user" value="${mw:user()}"/>
                                ${ (empty mw:user().name)?mw:user().loginName: mw:user().name}
                            </font>,</a>
                        <a href="${ctx}/logout.html" style="margin-left:5px;">退出</a></li>
                </ul>
            </div>
            <div class="center_dh">
                <ul>
                    <li style="width:80px;"><a style="width:80px;" href="${ctx}/index.html" target="_blank">煤亮子商城</a>
                    </li>
                </ul>
            </div>


        </div>
    </div>
</c:if>
<c:if test="${mw:user().membertype eq 3}">
    <div class="header">
        <div class="topbar">
            <div class="topLogo" >
                <div class="logo-gly">
                    <div class="gly-img">
                        <a href="${ctx}/index.html"><img height="50" src="${ctx }/of/images/frontlogo2.png" border="0"
                                                         style="margin-top: 5px;"/></a>
                    </div>
                </div>
            </div>
            <div class="frontright" >
                <ul>
                    <li>
                        <a href="${ctx}/index.shtml" class="red"><shiro:principal property="memberName"/> <c:set
                                var="user" value="${mw:user()}"/>
                                ${ (empty mw:user().name)?mw:user().loginName: mw:user().name}
                            </font>,</a>
                        <a href="${ctx}/logout.html" style="margin-left:5px;">退出</a></li>
                </ul>
            </div>
            <div class="center_dh" style="width: 884px;">
                <ul>
                    <li style="width:auto;">煤亮子平台金融机构工作台</li>
                </ul>
            </div>
        </div>
    </div>
</c:if>