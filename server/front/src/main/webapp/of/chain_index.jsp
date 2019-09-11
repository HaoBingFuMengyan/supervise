<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<%@ taglib prefix="contract" uri="http://www.frogsing.com/tags/contract" %>
<!DOCTYPE html >
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="基金协同监管系统沟通,基金协同监管系统沟通"/>
    <meta name="description" content="基金协同监管系统沟通(www.mall.meiliangzi.cn)。服务电话：400-086-0101 "/>
    <title>供应链会员中心-基金协同监管系统沟通</title>
    <link href="${ctx}/of/css/office.css" rel="stylesheet" type="text/css"/>
    <script src="${ctx }/echarts/echarts.js" type="text/javascript"></script>
    <script src="${ctx }/echarts/jquery-1.9.1.min.js" type="text/javascript"></script>
    <style>
        .mycontainer {
            background: #fff;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            top.$.jBox.closeTip();
            if (false) {
                setTimeout("$('#messageBox').hide(500)", 3000);
            }
        });

    </script>
</head>
<body>
<div class="wrapper wrapper-content">
    <div class="workplat"><p>工作台</p></div>
    <div class="colorkuai clearfix">
        <div class="centerbk clearfix">
            <div class="centerbk_1">
                <div class="color_left">
                    <img src="${ctx}/images/colorkuai4.png">
                </div>
                <div class="color_right">
                    <div class="color_right metion">项目总额(元)</div>
                    <div class="color_right">￥${mw:money(loanbalance)}</div>
                </div>
            </div>
        </div>
        <div class="centerbk clearfix">
            <div class="centerbk_2">
                <div class="color_left">
                    <img src="${ctx}/images/colorkuai5.png">
                </div>
                <div class="color_right">
                    <div class="color_right metion">违约金额(元)</div>
                    <div class="color_right">￥${mw:money(fpayinterest)}</div>
                </div>
            </div>
        </div>
        <div class="centerbk clearfix">
            <div class="centerbk_3">
                <div class="color_left">
                    <img src="${ctx}/images/colorkuai6.png">
                </div>
                <div class="color_right">
                    <div class="color_right metion">库存余额</div>
                    <div class="color_right">${jj:weight(favailableweight)}</div>
                </div>
            </div>
        </div>
    </div>
    <!-- 普通会员 -->
    <div class="workplat"><p>常用</p></div>
    <div class="uasual clearfix">
        <a class="J_menuItem" href="${ctx}/projectstock/chain-list.shtml">
            <div class="ususer">
                <img src="${ctx}/images/uasual1.png">
                <p>库存项目</p>
            </div>
        </a>
        <a href="#">
            <div class="ususer">
                <img src="${ctx}/images/uasual2.png">
                <p>预付款项目</p>
            </div>
        </a>
        <a href="${ctx}/projectproxy/chain-list.shtml">
            <div class="ususer">
                <img src="${ctx}/images/uasual3.png">
                <p>代理销售</p>
            </div>
        </a>
        <a href="${ctx}/contract/dxsalelist.shtml">
            <div class="ususer">
                <img src="${ctx}/images/uasual4.png">
                <p>定向销售合同</p>
            </div>
        </a>
        <a href="${ctx}/contract/gpsalelist.shtml">
            <div class="ususer">
                <img src="${ctx}/images/uasual5.png">
                <p>预销售订单</p>
            </div>
        </a>
        <a href="${ctx}/zy/saleresource/list.shtml">
            <div class="ususer">
                <img src="${ctx}/images/uasual6.png">
                <p>我的挂牌</p>
            </div>
        </a>
    </div>
    <div class="workplat"><p>待处理订单</p></div>
    <div class="layui-form">
        <table id="contentTable" class="layui-table">
            <thead>
            <tr>
                <th class="sort-column">合同编号</th>
                <th class="sort-column">合同状态</th>
                <th class="sort-column">卖方会员</th>
                <th class="sort-column">买方会员</th>
                <th class="sort-column">交货仓库</th>
                <th class="sort-column">合同金额(元)</th>
                <th class="sort-column">合同进度</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${handlestatusList.content}" var="obj">
                <tr>
                    <td>${obj.scontractno}</td>
                    <td>
                        <contract:ContractStatus op="label" val="${obj.icontractstatus}"/>
                    </td>
                    <td>${obj.ssellermembername}</td>
                    <td>${obj.sbuyermembername}</td>
                    <td>${obj.swarehouse}</td>
                    <td>
                        <mw:format label="money" value="${obj.ftotalamount}"/>
                    </td>
                    <td>
                        <contract:ContractProgress op="label" val="${obj.iprogress}"/>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
