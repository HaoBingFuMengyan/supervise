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

        #right {
            background: #f2f2f2;
            padding-left: 0;
            width: calc(100% - 190px);
            width: -moz-calc(100% - 190px);
            width: -webkit-calc(100% - 190px);
        }
    </style>
    <script type="text/javascript">
        layui.use(['table', 'layer', 'element'], function () {
            var table = layui.table;
            var element = layui.element;
            var layer = layui.layer;
            //转换静态表格
            table.init('detail', {
                //totalRow:true,
                limit: 10 //注意：请务必确保 limit 参数（默认：10）是与你服务端限定的数据条数一致
            });
        });

    </script>
</head>
<body>
<div class="wrapper wrapper-content">
    <%--<div class="workplat">--%>
    <%--<a class="cur">会员中心</a>--%>
    <%--<a>资金管理</a>--%>
    <%--<a>推荐资讯</a>--%>
    <%--</div>--%>
    <div class="layui-row">
        <div class="layui-col-xs6">
            <div class="zf-block le">
                <div class="zf-le">
                    <div class="block-top">
                        <h2>账户信息</h2>
                        <p>Hi,<shiro:principal property="memberName"/></p>
                        <img src="${ctx}/images/zf-man.gif"/>
                    </div>
                    <div class="block-bottom">
                        <p>公司名称：<label><a href="${ctx}/index.shtml" class="red"><shiro:principal
                                property="memberName"/></a></label></p>
                        <p>手机号码：<label class="red"> <c:set var="user" value="${mw:user()}"/>
                            ${ (empty mw:user().name)?mw:user().loginName: mw:user().name}</label></p>
                    </div>

                </div>
            </div>
        </div>
        <div class="layui-col-xs6">
            <div class="zf-block rg">
                <div class="zf-rg">
                    <div class="block-top">
                        <div class="data">
                            <span class="year">今年</span>
                            <p>融资金额</p>
                        </div>
                        <div class="data">
                            <span>当月</span>
                            <p>融资金额</p>
                        </div>
                    </div>
                    <div class="block-bottom">
                        <div class="data">
                            <h3>0.00</h3>
                        </div>
                        <div class="data">
                            <h3>0.00</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="zf-project">
        <div class="layui-row">
            <div class="layui-col-xs4">
                <div class="zf-block">
                    <div class="zf-k">
                        <h2>0</h2>
                        <p>库存融资项目</p>
                        <img src="${ctx}/images/zf-icon1.png">
                        <div class="deal">
                            <a class="le">待支付</a>
                            <a>待审核</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="layui-col-xs4">
                <div class="zf-block">
                    <div class="zf-k">
                        <h2>0</h2>
                        <p>预付融资项目</p>
                        <img src="${ctx}/images/zf-icon3.png">
                        <div class="deal">
                            <a class="le">待支付</a>
                            <a>待审核</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="layui-col-xs4">
                <div class="zf-block mid">
                    <div class="zf-k">
                        <h2>0</h2>
                        <p>代理融资项目</p>
                        <img src="${ctx}/images/zf-icon2.png">
                        <div class="deal">
                            <a class="le">待支付</a>
                            <a>待审核</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="zf-order">
        <div class="zf-order-row ">
            <h2>待还款订单</h2>
            <div class="zf-order-content">
                <table class="layui-table" lay-size="sm" lay-filter="detail">
                    <thead>
                    <tr>
                        <th lay-data="{field:'', width:150}">项目编号</th>
                        <th lay-data="{field:'', width:150}">采购商</th>
                        <th lay-data="{field:'', width:150}">供应商</th>
                        <th lay-data="{field:'', width:120}">合同进度</th>
                        <th lay-data="{field:'', width:100}">项目周期</th>
                        <th lay-data="{field:'', width:150}">月利率</th>
                        <th lay-data="{field:'', width:120}">采购总额(元)</th>
                        <th lay-data="{field:'', width:120}">融资金额(元)</th>
                        <th lay-data="{field:'', width:120}">存货仓库</th>
                        <th lay-data="{field:'', width:120}">状态</th>
                        <th lay-data="{field:'', width:120}">入库状态</th>
                        <th lay-data="{field:'', width:120}">出库状态</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
</body>
</html>
