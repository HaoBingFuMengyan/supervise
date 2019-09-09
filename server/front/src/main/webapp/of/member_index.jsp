<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<%@ taglib prefix="project" uri="http://www.frogsing.com/tags/project" %>
<%@ taglib prefix="contract" uri="http://www.frogsing.com/tags/contract" %>
<!DOCTYPE html >
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="煤亮子,煤亮子商城"/>
    <meta name="description" content="煤亮子商城(www.mall.meiliangzi.cn)。服务电话：400-086-0101 "/>
    <title>普通会员中心-煤亮子</title>
    <style>
        .mycontainer {
            background: #fff;
        }

        .jy-container .layui-table-body {
            min-height: auto !important;
        }
        #leftbar .menu{
            background: #f1f1f1;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            if (false) {
                setTimeout("$('#messageBox').hide(500)", 3000);
            }
        });

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

        function openMemberShop() {
            layer.open({
                type: 2,
                title: "申请开通店铺",
                area: ['75%', '75%'],
                content: '${ctx}/hy/membershopapply/open.shtml',
                btn: ['申请开通', '关闭'],
                yes: function (index, layero) {
                    var iframeWin = layero.find('iframe')[0];
                    var $ = iframeWin.contentWindow.$;
                    var doc = $(iframeWin.contentWindow.document);
                    doc.find('form').first().submit();
                },
                cancel: function (index) {
                }
            });
        }
    </script>
</head>
<body>
<div class="wrapper wrapper-content jy-content">
    <div class="clearfix">
        <div class="jy-le">
            <div class="left-block block1">
                <img class="vip" src="${ctx}/of/images/center-icon.png"/>
                <div class="vip-infor">
                    <h2><shiro:principal
                            property="memberName"/><label>(${ (empty mw:user().name) ? mw:user().loginName : mw:user().name})</label>
                    </h2>
                    <div class="zl top10">
                        <div class="zl_list left">
                            <p><img src="${ctx}/images/ad_list1.png"/><img class="done" title="已认证"
                                                                           src="${ctx}/images/ad_done.png"/></p>
                            <a class="link" href="${ctx}/hy/user/modifysmobile.shtml">修改手机</a>
                        </div>
                        <div class="zl_list left">
                            <p><img src="${ctx}/images/ad_list22.png"/>
                                <c:choose>
                                    <c:when test="${user.member.iauthtype eq 20}">
                                        <img class="done" title="认证通过" src="${ctx}/images/ad_done.png"/>
                                        <a href="${ctx}/hy/member/authapply.shtml" class="link">企业信息</a>
                                    </c:when>
                                    <c:otherwise>
                                        <img title="请进行企业认证" class="done" src="${ctx}/images/ad_tip.png"/>
                                        <a class="link" href="${ctx}/hy/member/authapply.shtml">完善资料</a>
                                    </c:otherwise>
                                </c:choose>
                            </p>
                        </div>
                        <c:choose>
                            <c:when test="${user.member.iauthtype eq 20 && user.member.bisopenshop eq 0}">
                                <div class="zl_list left">
                                    <p><img src="${ctx}/images/ad_list1.png"/></p>
                                    <a class="link" onclick="openMemberShop()">开通店铺</a>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="zl_list left">
                                    <p><img src="${ctx}/images/ad_list1.png"/><img class="done" title="已开通"
                                            src="${ctx}/images/ad_done.png"/></p>
                                    <a class="link" href="${ctx}/shop.html?id=${membershop.id}">店铺信息</a>
                                </div>
                            </c:otherwise>
                        </c:choose>
                        <div class="zl_list left">
                            <p><img src="${ctx}/images/ad_list5.png"/>
                                <c:choose>
                                    <c:when test="${ not empty inlist }"><img class="done" title="已认证"
                                                                              src="${ctx}/images/ad_done.png"/></c:when>
                                    <c:otherwise><img title="修改密码" class="done"
                                                      src="${ctx}/images/ad_tip.png"/></c:otherwise>
                                </c:choose>
                            </p>
                            <a class="link" href="${ctx}/hy/user/gopassword.shtml">修改密码</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="left-block block2">
                <div class="block-tit">我的订单</div>
                <div class="block2-con clearfix top20">
                    <div class="data-list-first data-list">
                        <h3>煤亮子商城<br/>物资齐全，技术全面</h3>
                        <a href="${ctx}/index.html">立即购买</a>
                    </div>
                    <div class="data-list">
                        <div class="for-border">
                            <h2>我的结算单</h2>
                            <p>${projectSettle}</p>
                        </div>
                    </div>
                    <div class="data-list">
                        <div class="for-border">
                            <h2>我的付款单</h2>
                            <p>${billpay}</p>
                        </div>
                    </div>
                    <div class="data-list">
                        <div class="for-border">
                            <h2>我的提货单</h2>
                            <p>${deliveryorderandind}</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="left-block block2">
                <div class="block-tit">预采购订单</div>
                <div class="layui-colla-item">
                    <%--<div class="layui-colla-content layui-show">--%>
                    <table class="layui-table" lay-size="sm" lay-filter="detail">
                        <thead>
                        <tr>
                            <th lay-data="{field:'scontractsellerno', width:150}">合同编号</th>
                            <th lay-data="{field:'ssellermembername', width:150}">卖方名称</th>
                            <th lay-data="{field:'swarehouse', width:150}">交货仓库</th>
                            <th lay-data="{field:'iprogress', width:120}">合同进度</th>
                            <th lay-data="{field:'iinvoicestatus', width:100}">开票状态</th>
                            <th lay-data="{field:'ftotalamount', width:150}">合同总额(元)</th>
                            <th lay-data="{field:'fbuyerpaid', width:120}">已付金额(元)</th>
                            <th lay-data="{field:'dadddate', width:100}">日期</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${handlestatusList.content}" var="obj">
                            <tr>
                                <td>${obj.scontractsellerno}</td>
                                <td>${obj.ssellermembername}</td>
                                <td>${obj.swarehouse}</td>
                                <td><contract:ContractProgress op="label" val="${obj.iprogress}"/></td>
                                <td><contract:IInvoiceStatus op="label" val="${obj.iinvoicestatus}"/></td>
                                <td>${mw:money(obj.ftotalamount)}</td>
                                <td>${mw:money(obj.fbuyerpaid)}</td>
                                <td>${mw:datetime(obj.dadddate)}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <%--</div>--%>
                </div>
            </div>
        </div>
        <div class="jy-rg">
            <div class="right-block">
                <div class="block-tit">购买流程</div>
                <img class="cur" src="${ctx}/of/images/center-cur.png">
            </div>
            <div class="right-block">
                <div class="block-tit">客户服务</div>
                <img class="kefu" src="${ctx}/of/images/center-kefu.png">
                <p>工作日8:00-18:00</p>
                <h2><i class="icon icon-telepphone right5 left10"></i>400-086-0101</h2>
            </div>
        </div>
    </div>
</div>
</body>
</html>
