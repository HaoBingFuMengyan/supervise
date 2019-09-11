<%@ taglib prefix="consts" uri="http://www.frogsing.com/tags/project" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE html >
<html>
<head>
    <meta name="description" content="基金协同监管系统沟通" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>融资项目发起-基金协同监管系统沟通</title>
    <link href="${ctx}/project/css/project.css" rel="stylesheet" type="text/css">

</head>
<body>
<div class="mbody">
    <!-- 导航 -->
    <mw:msg></mw:msg>

    <div class="clear"></div>
    <!-- 搜索层 -->
    <div class="impor">
        <div class="container-inner">
            <div class="xinxi">
                <div class="nicon icon1"></div>
                <div class="new_wz">库存融资</div>
                <div class="new_indetail">企业以其自有存货通过贸易方式或资金方式向平台申请配套融资。</div>

                <a href="javascript:void(-1)" onclick="doAddProject(10)"><div class="last">我要融资 </div></a>

            </div>
            <div class="xinxi">
                <div class="nicon icon2"></div>
                <div class="new_wz">预付融资</div>
                <div class="new_indetail">企业支付部分保证金，由平台提供代为采购的配套融资。</div>

                <a href="javascript:void(-1)" onclick="doAddProject(20)"><div class="last">我要融资</div></a>

            </div>
            <div class="xinxi">
                <div class="nicon icon4"></div>
                <div class="new_wz">应收融资</div>
                <div class="new_indetail">企业以在途货物作为质押物向平台申请配套融资。</div>

                <a href="javascript:void(-1)" onclick="doAddProject(30)"><div class="last">我要融资 </div></a>

            </div>
            <div class="xinxi">
                <div class="nicon icon4"></div>
                <div class="new_wz">代理销售</div>
                <div class="new_indetail">企业以在途货物作为质押物向平台申请配套融资。</div>

                <a href="javascript:void(-1)" onclick="doAddProject(40)"><div class="last">我要融资 </div></a>

            </div>


        </div>
    </div>
</div>


<script>

    function doAddProject(type){
            var url = "${ctx}/projectstock/add.shtml";
            switch(type)
            {
                case 10:
                    url = "${ctx}/projectstock/add.shtml";
                    break;
                case 20:
                    url = "${ctx}/xm/advance/add.shtml";
                    break;
                case 30:
                    url = "${ctx}/xm/receivable/add.shtml";
                    break;
                case 40:
                    url = "${ctx}/projectproxy/add.shtml";
                    break;
                default:
                    url = "";
            }
            jj.width=1024;
            jj.height=768;
            jj.open({
                content:url
            });
    }


</script>
</body>
</html>