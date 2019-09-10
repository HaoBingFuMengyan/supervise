<%@ taglib prefix="mw" uri="http://www.frogsing.com/tags/frogsing" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<link rel="stylesheet" href="${ctx}/font/iconfont.css"/>
<script type="text/javascript">
    $(function(){
        $(".has-login").click(function(){
            if($(this).hasClass('open')){
                $(this).unbind('focus');
                $(this).removeClass('open');
                $(this).find('img.icon').attr('src','${ctx}/images/menber-open-black.png');
                $(this).find('ul').animate({"max-height":0},500);
                $(this).find('ul').css({"border":"none"})
            }
            else{
                $(this).focus();
                $(this).addClass('open');
                $(this).find('img.icon').attr('src','${ctx}/images/menber-close-black.png');
                $(this).find('ul').animate({"max-height":"200px"},500);
                $(this).find('ul').css({"border":"1px solid #d9d9d9"})
            }
        })
        $(".has-login").blur(function(){
            if($(this).hasClass('open')){
                $(this).unbind('focus');
                $(this).removeClass('open');
                $(this).find('img.icon').attr('src','${ctx}/images/menber-open-black.png');
                $(this).find('ul').animate({"max-height":0},500);
                $(this).find('ul').css({"border":"none"})
            }
        })
        $(".membertype").click(function(){
            if($(this).hasClass('open')){
                $(this).unbind('focus');
                $(this).removeClass('open');
                $(this).parents('.admin-nav-btn').find('ul').animate({"max-height":0},500);
                $(this).parents('.admin-nav-btn').find('ul').css({"border":"none"})
            }
            else{
                $(this).focus();
                $(this).addClass('open');
                $(this).parents('.admin-nav-btn').find('ul').animate({"max-height":"200px"},500);
                $(this).parents('.admin-nav-btn').find('ul').css({"border":"1px solid #d9d9d9"})
            }
        })
        $(".membertype").blur(function(){
            if($(this).hasClass('open')){
                $(this).removeClass('open');
                $(this).parents('.admin-nav-btn').find('ul').animate({"max-height":0},500);
                $(this).parents('.admin-nav-btn').find('ul').css({"border":"none"})
            }
        })
    })
</script>
<div class="header">
    <div class="topbar">
        <div class="topLogo">
            <div class="logo-gly">
                <div class="gly-img">
                    <a href="${ctx}/index.html"><img src="${ctx }/images/logo.png" border="0" style="margin-left: 10px;"/></a>
                </div>
            </div>

        </div>
        <div class="nav-btn">
            <div class="has-login" tabindex="1">
                <img id="memberlogo" width="28" width="28" src="${ctx}/images/personimg.png" />
                <span>001</span>
                <img class="icon" src="${ctx}/images/menber-open-black.png">
                <ul>
                    <li><a href="${ctx}/index.shtml">管理中心</a></li>
                    <li><a href="${ctx}/user/modify.shtml">账户设置</a></li>
                    <li><a href="${ctx}/logout.html">退出登入</a></li>
                </ul>
            </div>
            <a class="imformations" href="${ctx}/message/list.shtml?search_eq_bisread=0"><i class="icon icon-xinxi1"></i><label id="countUnRead">(0)</label></a>
        </div>

            <div class="admin-nav-btn">
                <a class="btn membertype" tabindex="1">提交/参与<i class="icon icon-xia2"></i></a>
                <ul class="clearfix">
                    <li>
                        <a href="${ctx}/projectinformation/add.shtml">提交情报</a>
                    </li>
                    <li>
                        <a href="${ctx}/projectloophole/add.shtml">提交漏洞</a>
                    </li>
                    <li>
                        <a href="${ctx}/memberarticle/list.shtml?add=1">提交资讯</a>
                    </li>
                    <li>
                        <a href="${ctx}/reward.html">参与悬赏</a>
                    </li>
                </ul>
            </div>
    </div>
</div>