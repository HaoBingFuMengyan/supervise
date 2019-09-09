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

<link rel="stylesheet" type="text/css" href="${ctx}/css/base.css" />
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script type="text/javascript" src="${ctx}/js/quick_links.js?v=2"></script>
<script type="text/javascript">
    function doSubmit(){
        var form=document.getElementById("loginForm");
        if(form.username.value.length==0 || form.username.value==""){
            $(".errorMsg").text("用户名不能为空！");
            $(".errorBox").show();
            return false;
        }
        if(form.password.value.length==0 || form.password.value==""){
            $(".errorMsg").text("密码不能为空！");
            $(".errorBox").show();
            return false;
        }
        if(form.checkword && !form.checkword.value){
            $(".errorMsg").text("验证码不能为空！");
            $(".errorBox").show();
            return false;
        }
        form.submit();
    }

    // 如果在框架或在对话框中，则弹出提示并跳转到首页
    if(self.frameElement && self.frameElement.tagName == "IFRAME" || $('#left').length > 0 || $('.jbox').length > 0){
        alert('未登录或登录超时。请重新登录，谢谢！!');
        top.location = "${ctx}/index.shtml";
    }

    function refreshCaptcha() {

        $('#captchaImg').hide().attr('src','${ctx}/captcha.shtml?a=' + Math.floor(Math.random()*100)).fadeIn();
    }



    function hideDiv(){

        if('${errormsg}'){
            $(".errorBox").show();
        }else{
            $(".errorBox").hide();
        }
        //alert('${errormsg}');
    }

    $().ready(function(){
        hideDiv();
    });
</script>

<body>
<!--右侧贴边导航quick_links.js控制-->
<div class="mui-mbar-tabs">
    <div class="quick_link_mian">
        <div class="quick_links_panel">
            <div id="quick_links" class="quick_links quick_toggle">
                <%--<li>--%>
                <%--<a href="#" class="my_qlinks"><i class="setting"></i></a>--%>
                <%--<div class="ibar_login_box status_login">--%>
                <%--<div class="avatar_box">--%>
                <%--<p class="avatar_imgbox"><img src="${ctx}/images/no-img_mid_.jpg" /></p>--%>
                <%--<ul class="user_info">--%>
                <%--<li>用户名：sl19931003</li>--%>
                <%--<li>级&nbsp;别：普通会员</li>--%>
                <%--</ul>--%>
                <%--</div>--%>
                <%--<div class="login_btnbox">--%>
                <%--<a href="#" class="login_order">我的订单</a>--%>
                <%--<a href="#" class="login_favorite">我的收藏</a>--%>
                <%--</div>--%>
                <%--<i class="icon_arrow_white"></i>--%>
                <%--</div>--%>
                <%--</li>--%>

                <li id="shopCart">
                    <%--<a href="#" class="message_list" ><i class="message"></i><div class="span">购物车</div><span class="cart_num">0</span></a>--%>

                    <div class="ibar_login_box status_login min_box" id="login_min">
                        <div class="login-title">密码登录</div>
                        <form id="loginForm" class="form-signin" method="post" action="${ctx}/login.html">
                            <div class="errorBox" ><i class="icon icon_error"></i><span class="errorMsg" style="color:red;position:absolute;margin-top:-20px;">${errormsg}</span></div>
                            <div class="input_box">
                                <input type="text" id="username" name="username" maxlength="11" class="inputs username" placeholder="请输入11位手机号">
                                <i class="icon icon-yuangongxinxi"></i>
                            </div>
                            <div class="input_box">
                                <input type="password" id="password" name="password" maxlength="18" class="inputs password" placeholder="请输入密码">
                                <i class="icon icon-mima1"></i>
                            </div>
                            <input type="button" class="btns"  onclick="return doSubmit();" id="btn_login" value="登  录">
                            <div class="link">
                                <a href="${ctx}/hy/user/forgetpwdindex.html" class="le">忘记密码？</a>
                                <a href="${ctx}/register.html" class="rg">免费注册</a>
                            </div>
                        </form>
                        <i class="icon_arrow_white"></i>
                    </div>
                </li>
                <li>
                    <a href="#"><i class="kfzx"></i></a>
                    <div class="mp_tooltip">客服中心<i class="icon_arrow_right_black"></i></div>
                    <div class="ibar_login_box status_login amkf" style="top:-142px">
                        <div class="r_code left">
                            <img src="${ctx}/images/r_code.png" />
                            <p>微信直聊</p>
                        </div>
                        <div class="r_kefu right">
                            <img src="${ctx}/images/r_kefu.png" />
                            <div class="r_kf_list top20">
                                <label class="right10">联系人:</label><span class="right5">小媚</span><span>小张</span>
                            </div>
                            <div class="r_kf_list">
                                <label class="right10">电话:</label><span class="right5">18825006092</span><span class="left35">18789257713</span>
                            </div>
                            <div class="r_kf_list">
                                <label class="right10">QQ:</label><a class="qq left10 right10" title="点击进行QQ咨询"></a><a class="qq right10" title="点击进行QQ咨询"></a>
                            </div>
                        </div>
                        <i class="icon_arrow_white" style="top:156px;"></i>
                    </div>
                </li>
                <li>
                    <a href="#none"><i class="mpbtn_qrcode"></i></a>
                    <div class="mp_qrcode" style="display:none;"><img src="${ctx}/images/erweima.png" width="102" height="100" /><i class="icon_arrow_white"></i></div>
                </li>
                <%--<li>--%>
                <%--<a href="#" class="mpbtn_histroy"><i class="zuji"></i></a>--%>
                <%--<div class="mp_tooltip">我的足迹<i class="icon_arrow_right_black"></i></div>--%>
                <%--</li>--%>
                <%--<li>--%>
                <%--<a href="#" class="mpbtn_wdsc"><i class="wdsc"></i></a>--%>
                <%--<div class="mp_tooltip">我的收藏<i class="icon_arrow_right_black"></i></div>--%>
                <%--</li>--%>
                <%--<li>--%>
                <%--<a href="#" class="mpbtn_recharge"><i class="chongzhi"></i></a>--%>
                <%--<div class="mp_tooltip" style=" visibility:hidden;">我的资产<i class="icon_arrow_right_black"></i></div>--%>
                <%--</li>--%>
            </div>
            <div class="quick_toggle">
                <li><a href="#top" class="return_top"><i class="top"></i></a></li>
            </div>
        </div>
        <div id="quick_links_pop" class="quick_links_pop hide"></div>
    </div>
</div>


<!--[if lte IE 8]>
<script src="${ctx}/js/ieBetter.js"></script>
<![endif]-->

<script type="text/javascript" src="${ctx}/js/parabola.js"></script>
<script type="text/javascript">
    function  addToCart(id) {
        var me=event.target;
        if($(me).hasClass('gocar'))
            $(me).css('background','gray');
        else
            $(me).css('color','gray');
        $.getJSON("${ctx}/cart/addToCart.json",{"sresourceid":id},function (rs) {
            if(rs.success){

//			   layer.msg("",{
//			       offset:'',
//				   icon:6
//			   })
                layer.tips('已经帮你放入购物车了,继续逛吧!<a class="guitar">去购物车结算</a>', $(me), {
                    tips: [1, '#444851'],
                    time: 10000
                });
                cartcount();
            }
            else
            {

                if(!rs.obj){//已登录
                    layer.tips(rs.msg, $(me), {
                        tips: [1, '#ff0000'],
                        time: 4000
                    });
                }else
                {
                    alertx("<div class='hello' id='say_hello'>您好，请登录，如您还没有账号请先注册!</div><div class='acti'><a class='mybtn red_btn' href='${ctx}/login.html'>登录</a><a class='mybtn blue_btn' href='${ctx}/register.html'>注册</a></div>");
                }
            }

        });
    }
    function getTypeData(type,callback){
        if(type=="message_list"){  //购物车
            $.get("${ctx}/cart/rightlist.json",function(rs){

                if(rs.trim().substr(0,1)=="{")
                {
                    $("#login_min").css("display","block");
                    $("#shopCart").click(function(){
                        $("#login_min").css("display","block");
                    })
                    $("#login_min").mouseleave(function(){
                        $("#login_min").css("display","none");
                    })
                    <%--alertx("请先登录!",function(){--%>
                    <%--window.location.href="${ctx}/login.html";--%>
                    <%--});--%>
                    return;
                }
                callback(rs);
            });
        }
        if(type=="history_list"){ //我的资产

        }
        if(type=="mpbtn_histroy"){ //我的足迹

        }
        if(type=="mpbtn_wdsc"){ //我的收藏

        }
        if(type=="mpbtn_recharge"){ //我要充值

        }

    }
    function cartcount() {
        $.getJSON("${ctx}/cart/cartcount.json",function (i) {
            if(i.success){
                $('#shopCart').find(".cart_num").html(i.obj);
                $('div.shopcar').find(".count").html(i.obj);
            }

        });
    }
    $(document).ready(function () {
        $("#supermarket-sorting-li").delegate("a.car","click",function(event){
            addToCart.call(this,$(this).data("id"));
        });
        $('.g_buy').click(function(event){
            addToCart.call(this,$(this).data("id"));
        });
        cartcount();
    });

    $(".quick_links_panel li").mouseenter(function(){
        $(this).children(".mp_tooltip").animate({left:-92,queue:true});
        $(this).children(".mp_tooltip").css("visibility","visible");
        $(this).children(".amkf").css("display","block");
    });
    $(".quick_links_panel li").mouseleave(function(){
        $(this).children(".mp_tooltip").css("visibility","hidden");
        $(this).children(".mp_tooltip").animate({left:-121,queue:true});
        $(this).children(".amkf").css("display","none");
    });
    $(".quick_toggle li").mouseover(function(){
        $(this).children(".mp_qrcode").show();
    });
    $(".quick_toggle li").mouseleave(function(){
        $(this).children(".mp_qrcode").hide();
    });

    // 元素以及其他一些变量
    var eleFlyElement = document.querySelector("#flyItem"), eleShopCart = document.querySelector("#shopCart");
    var numberItem = 0;
    // 抛物线运动
    var myParabola = funParabola(eleFlyElement, eleShopCart, {
        speed: 400, //抛物线速度
        curvature: 0.0008, //控制抛物线弧度
        complete: function() {
            eleFlyElement.style.visibility = "hidden";
            eleShopCart.querySelector("span").innerHTML = ++numberItem;
        }
    });
    // 绑定点击事件
    if (eleFlyElement && eleShopCart) {

        [].slice.call(document.getElementsByClassName("btnCart")).forEach(function(button) {
            button.addEventListener("click", function(event) {
                // 滚动大小
                var scrollLeft = document.documentElement.scrollLeft || document.body.scrollLeft || 0,
                    scrollTop = document.documentElement.scrollTop || document.body.scrollTop || 0;
                eleFlyElement.style.left = event.clientX + scrollLeft + "px";
                eleFlyElement.style.top = event.clientY + scrollTop + "px";
                eleFlyElement.style.visibility = "visible";

                // 需要重定位
                myParabola.position().move();
            });
        });
    }
</script>