<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" type="text/css" href="css/side.css"/>
    <meta name="data-spm" content=""/>
    <title>煤亮子(www.meiliangzi.cn)</title>
    <link href="${ctx}/css/page.css" type="text/css" rel="stylesheet"/>
    <script src="${ctx}/js/page.js"></script>

    <style type="text/css">
        .nav-imgs {
            display: block !important;
        }

        .opencamera {
            cursor: pointer;
        }

        /*首页改版*/
        body {
            background: #f0f3ef;
        }

        .floor .main {
            background: #fff;
        }

        #guessyou ul {
            padding-top: 0 !important;
        }

        #guessyou li {
            width: 232px !important;
            padding-bottom: 48px !important;
            margin-bottom: 10px !important;
            background: #fff !important;
            margin-right: 10px !important;
        }

        #guessyou li:nth-child(5) {
            margin-right: 0 !important;
        }

        .layout-top {
            background: #fff;
        }

        #guessyou .list1 {
            border: none !important;
        }

        .clothes .main {
            height: 474px !important;
        }

        .p-info {
            position: relative;
        }

        .p-info img {
            position: absolute;
            width: 22px;
            bottom: 0;
            right: 15px;
        }
    </style>

    <script type="text/javascript">
        var listTotalPages = '${list.totalPages}';//总页数
        var number = '${list.number}';//当前页码
        var he;
        $(function () {
            he = $("#guessyou").offset().top;//div距离顶部的高度

            $("dd a").click(function () {
                $(this).siblings().removeClass('red');
                $(this).addClass('red');

                $('#textt').val('');
                $("#keyword").val($(this).text().trim());
//                commitSearchForm(true);
//
//                $("html,body").animate({scrollTop: he}, 1000);//锚点定位
            });

            $("#mainForm input[type='button']").click(function () {
                whereQuery();
            });

            //监听滚动事件   瀑布流
            $(window).scroll(function () {
                var docHeight = $(document).height();//获取整个页面的高度
                var winHeight = $(window).height();//页面高度
                var winScrollHeight = $(window).scrollTop();//获取滚动条的距离
                if (parseInt(docHeight - 360) <= winHeight + winScrollHeight) {
                    next_page(number);
                }
            });

            if ('${param.flag}')
                whereQuery('${param.keyword}');


            $("#mainForm input[type='button']").click(function () {
                whereQuery('');
            });

            $(".font-item1 .font-lefty dd span").click(function () {
                $(".font-item1 .font-lefty dd span").find('ul').hide();
                if($(this).hasClass('open')){
                    $(this).find('ul').hide();
                    $(this).removeClass('open')
                }
                else{
                    $(this).find('ul').show();
                    $(this).addClass('open')
                }

            });
//            5级菜单
            var trigger = null;
            $(".font-item1 .font-lefty dd a").mouseover(function(){
                console.log("in2");
                var category = $(this).text().trim();
                trigger = setTimeout(function(){
                    querySbrand(category);
                },800); //这里1000就是间隔1秒
            })
            $(".font-item1 .font-lefty dd a").mouseleave(function(){
                console.log("out");
                clearTimeout(trigger);
            })

            $('#closeBrand').click(function(){
                $(".brand-box").hide();
            });
        });

        //提交form查询
        function commitSearchForm(clear) {
            if (!'${keyword}')
                $("#ispottype").val(1);
            $.ajax({
                url: '${ctx}/supermarket/filter.json',
                data: $('#mainForm').serialize(),
                async: false,
                cache: false,
                type: 'POST',
                success: function (html) {
                    if (clear)
                        $("#indentureContent").empty();
                    $("#indentureContent").append(html);
                },
                error: function (html) {
                    $("#indentureContent").append("<div class=\"pager_content\"><input style=\"color: #da7e35;cursor: none;\" value=\"抱歉，没有找到相关数据!\" type=\"button\" class=\"no-border no-bg ac font14\"/></div>");
                }
            });
        }

        function camera(id) {
            //var id=$(this).data("id");
            layer.open({
                type: 2,
                title: '在线监控查看',
                shadeClose: true,
                shade: 0.8,
                offset: 'auto',
                area: ['80%', '80%'],
                content: '${ctx}/wms/warehouse/cameralist.html?storeid=' + id //iframe的url
            });
        }

        function virtualSumbitForm(url,keyword)
        {
            // 创建一个 form
            var form1 = document.createElement("form");
            form1.id = "virtualForm";
            form1.name = "virtualForm";
            // 添加到 body 中
            document.body.appendChild(form1);
            // 创建一个输入
            var input = document.createElement("input");
            // 设置相应参数
            input.type = "text";
            input.name = "keyword";
            input.value = keyword;
            // 将该输入框插入到 form 中
            form1.appendChild(input);
            // form 的提交方式
            form1.method = "POST";
            // form 提交路径
            form1.action = url;
            // 对该 form 执行提交
            form1.submit();
            // 删除该 form
            document.body.removeChild(form1);
        }

        //分页
        function jumpPage(pageNo) {
            var _pageno = $("#to_page").val();
            if (_pageno != null && _pageno != "") {
                if (isNaN(_pageno)) {
                    return;
                }
                if (parseInt(_pageno) > parseInt(listTotalPages)) {
                    return;
                } else
                    $("#pageNo").val(parseInt(_pageno - 1));
            } else
                $("#pageNo").val(pageNo);

            commitSearchForm(true);
        }
        //上一页
        function up_page(pageSize) {
            if (pageSize != null && pageSize != "") {
                if (isNaN(pageSize))
                    return;
                if (parseInt(parseInt(pageSize) - 1) < 1)
                    return;
                else
                    $("#pageNo").val(parseInt(parseInt(pageSize) - 2));
            } else
                return;

            commitSearchForm(true);

        }
        //下一页
        function next_page(pageSize) {
            if (pageSize != null && pageSize != "") {
                if (isNaN(pageSize))
                    return;
                if (parseInt(parseInt(pageSize) + 1) > parseInt(listTotalPages))
                    return;
                else
                    $("#pageNo").val(parseInt(pageSize) + 1);
            } else
                return;

            commitSearchForm(false);

        }

        //首页查询
        function whereQuery(keyword) {
            $("#keyword").val(keyword);
            $("#pageNo").val(0);

            commitSearchForm(true);

            $("html,body").animate({scrollTop: he}, 1000);//锚点定位

        }

        //楼层搜索
        function searchQuery(thisObj) {
            $('#textt').val('');
            $("#keyword").val($(thisObj).text().trim());
            $("#pageNo").val(0);

            commitSearchForm(true);
            $("html,body").animate({scrollTop: he}, 1000);//锚点定位
        }

        function doToResource(type) {
            if(type=="1"){
                window.location.href="${ctx}/mall.html";
            }else{
                window.location.href="${ctx}/goods_stock.html";
            }
        }
        //获取下级品牌，规格型号
        function querySbrand(category) {
            $.ajax({
                url: '${ctx}/sbrand.json',
                data: {sname:category},
                traditional: true,
                success: function (data) {
                    if (data.success) {
                        console.log("成功");
                        var i = 0;
                        $(".brand-box-body").empty();
                        $(".brand-box-head span").text(data.msg);
                        $.each(data.obj,function(index,value){
//                            $(".brand-box-head span").text(value.attributes);
                            $(".brand-box-body").append('<div class="brand-group"><h2><img src="<cs:SysParaType imgurl="1" op="syspara"/>/'+value.iconCls+'" alt="">'+'<a onclick="virtualSumbitForm(\'${ctx}/index2.html\',\''+value.text+'\')">'+value.text+'</a>'+'<button onclick="Exhibition(this)">展开</button></h2><ul class="clearfix brand_box_body'+i+'"></ul></div>');
                            $.each(value.children,function(key,val){
                                $(".brand_box_body"+i).append('<li><a onclick="virtualSumbitForm(\'${ctx}/index2.html\',\''+(val.code?val.code:val.text)+'\')">'+val.text+'</a></li>');
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
</head>
<body>
<div class="w">
    <!--菜单-->
    <div class="dd-inner">
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
                                        <a onclick="virtualSumbitForm('${ctx}/index2.html','${commodity.text}')">${commodity.text}</a>
                                    </c:forEach>
                                </dd>
                            </dl>
                        </c:forEach>
                    </ul>
                        <%--5级菜单--%>
                    <div class="brand-box">
                        <div class="brand-box-head"><i class="icon icon-guanli5"></i><span ></span></div>
                        <div class="brand-box-body" >

                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <!------------------------------------轮播图------------------------------------>

    <div id="lunbo">
        <ul id="one">
            <layout:images key="P00000069" inside="li"/>
        </ul>
        <ul id="two">
            <li class="on"></li>
            <li></li>
        </ul>
    </div>

    <!------------------------------------轮播图右侧一栏------------------------>
    <div class="m">
        <div class="right-tit">
            <h2>Hi，您好！</h2>
            <p>欢迎光临煤亮子电商平台</p>
            <shiro:notAuthenticated>
                <p class="clearfix">
                    <a class="login" href="${ctx}/login.html">登录</a>
                    <a class="reg" href="${ctx}/register.html">注册</a>
                </p>
            </shiro:notAuthenticated>
            <shiro:authenticated>
                <p class="clearfix">
                    <c:if test="${user.authtype eq 0}">
                        <a class="login" href="${ctx}/hy/member/authapply.shtml">会员认证</a>
                    </c:if>
                    <a class="login" href="${ctx}/hy/member/authapply.shtml">认证信息</a>
                    <a class="reg" href="${ctx}/index.shtml">会员中心</a>
                </p>
            </shiro:authenticated>
        </div>
        <div class="blue-head">
            <h2>煤亮子电商平台</h2>
            <p>实时智能监控，更靠谱、更方便</p>
        </div>
        <div class="beauty">
            <ul class="clearfix">
                <li>
                    <span class="num1"></span>
                    <p>快捷</p>
                </li>
                <li>
                    <span class="num2"></span>
                    <p>智能</p>
                </li>
                <li>
                    <span class="num3"></span>
                    <p>安全</p>
                </li>
                <li>
                    <span class="num4"></span>
                    <p>优选</p>
                </li>
            </ul>
        </div>
        <form class="form" id="mainForm" action="${ctx}/mall.html" method="post">
            <input type="hidden" id="resourceType" value="indentureType"/>
            <input type="hidden" id="pageNo" name="pageNo" value="0"/>
            <input type="hidden" id="sort" name="sort" value="desc_dbegindate"/><%--默认排序--%>
            <input type="hidden" id="keyword" name="keyword" value="${keyword}"/>
            <input type="hidden" id="ispottype" name="ispottype"/>

            <div class="form-con">
                <input placeholder="物资名称" name="search_like_scommodityname"/>
                <input class="rg" placeholder="规格型号" name="search_like_sspec"/>
                <ul class="clearfix kinds">
                    <li>
                        <label>
                            <input style="cursor: pointer;" type="radio" onclick="doToResource(1)" class="m_check_checkbox" _parent="flag" name="stockFlag" value="11"
                            <%--disabled="disabled"--%>>
                            <img class="resource" src="${ctx}/images/metriel.png">现货
                        </label>
                    </li>
                    <li>
                        <label>
                            <input style="cursor: pointer" type="radio" onclick="doToResource(2)" class="m_check_checkbox" _parent="flag" name="stockFlag" value="11"
                            <%-- disabled="disabled"--%>>
                            <img class="resource" src="${ctx}/images/sale.png">预售
                        </label>
                    </li>
                </ul>
                <ul class="clearfix kinds">
                    <li>
                        <label>
                            <input style="cursor: pointer" type="radio" onclick="doToResource(1)" class="m_check_checkbox" _parent="flag" name="stockFlag" value="11"
                            <%-- disabled="disabled"--%>>
                            <img class="lamp" src="${ctx}/images/lamp-green.png">已认证
                        </label>
                    </li>
                    <li>
                        <label>
                            <input style="cursor: pointer" type="radio" onclick="doToResource(2)" class="m_check_checkbox" _parent="flag" name="stockFlag" value="11"
                            <%-- disabled="disabled"--%>>
                            <img class="lamp" src="${ctx}/images/lamp-orange.png">未认证
                        </label>
                    </li>
                </ul>
                <input type="submit" class="submit" value="立即搜索"/>
            </div>
        </form>

    </div>
</div>

<div class="w">
    <div id="guessyou" class="top20">
        <div class="mt" style="border:none;height:auto">
            <h3 class="floorhd_tit">资源列表</h3>
        </div>
        <div class="list1" id="indentureContent">
            <ul>
                <c:forEach items="${list.content}" var="obj">
                    <li class="fore1">
                        <div class="p-img">
                            <c:choose>
                                <c:when test="${obj.ispottype == 0}">
                                    <a href="${ctx}/zy/stock/goods_view.html?id=${obj.ssalesourceid}" target="_blank">
                                        <img data-lazy-img="done" width="130" height="130" src="${obj.sbigpic}" class="">
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a href="${ctx}/zy/marginstock/goods_stock_view.html?id=${obj.id}"
                                       target="_blank">
                                        <img data-lazy-img="done" width="130" height="130" src="${obj.sbigpic}"
                                             class="">
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="p-info">
                            <div class="p-name">
                                <a href="${ctx}/zy/stock/goods_view.html?id=${obj.ssalesourceid}" target="_blank">
                                        ${obj.scommodityname} ${obj.sspec} ${obj.smaterial}
                                </a>
                            </div>
                            <div class="p-price" data-lazyload-fn="done">
                                <c:choose>
                                    <c:when test="${obj.fprice eq 0}">价格面议</c:when>
                                    <c:otherwise><i>¥</i><mw:format label="money" value="${obj.fprice}"/>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <c:if test="${obj.ispottype == 0}">
                                <c:if test="${obj.slocation != 'Z'}"><img src="${ctx}/images/view-icon.png" class="opencamera"
                                                                          onclick="camera('${obj.sstockno}')" data-id="${obj.sstockno}"/></c:if>
                            </c:if>
                        </div>
                    </li>
                </c:forEach>
            </ul>
            <%--<div class="pager_content">--%>
            <%--<mw:page pageobj="list"/>--%>
            <%--</div>--%>
        </div>
    </div>
    <!--猜你喜欢结束-->
    <div class="reg-ban">
        <a href="${ctx}/register.html"><img src="${ctx}/images/reg-ban.jpg"/></a>
        <img src="${ctx}/images/page/duo.png" class="top10">
    </div>
</div>

</body>

</html>