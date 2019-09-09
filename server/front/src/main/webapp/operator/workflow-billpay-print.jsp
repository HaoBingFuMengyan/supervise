<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ include file="/include/taglib.jsp" %>
<!DOCTYPE>
<html>
<head>
    <meta name="decorator" content="blank"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>支付单审批打印</title>

    <style>
        body{
            font-family: "宋体";
        }
        .table-con {
            width: 1100px;
            margin: 0 auto;
            padding-top: 20px;
        }

        .table-con .title {
            text-align: center;
            font-size: 24px;
            line-height: 1.8;
        }

        .ht-number {
            padding-left: 50px;
            margin-top: 30px;
            font-size: 14px;
        }

        .table-con .table {
            width: 100%
        }

        .table-con .table table {
            width: 100%;
            table-layout: fixed;
            border-collapse: collapse;
        }

        .table-con .table table td {
            padding: 15px 20px;
            border: 1px solid #999;
            line-height: 1.6;
            /*vertical-align: top;*/
            font-size: 14px;
        }

        .table-con .table table td.center {
            text-align: center
        }

        .table-con .table table td.word {
            height: 80px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="table-con">
    <div class="title">陕煤集团神南产业发展有限公司<br/>“煤亮子”煤炭生产综合服务平台付款单</div>
    <div class="table">
        <table style="table-layout:fixed; width:100%;" cellspacing="0">
            <colgroup width="12%"></colgroup>
            <colgroup width="8%"></colgroup>
            <colgroup width="8%"></colgroup>
            <colgroup width="8%"></colgroup>
            <colgroup width="10%"></colgroup>
            <colgroup width="8%"></colgroup>
            <colgroup width="10%"></colgroup>
            <colgroup width="18%"></colgroup>
            <colgroup width="18%"></colgroup>
            <tr>
                <td class="center" width="12%">经办人</td>
                <td class="center" colspan="3" width="24%">${data.saddoperator}</td>
                <td class="center" width="10%">日期</td>
                <td class="center" colspan="2" width="18%"><mw:format label="datetime" value="${data.dadddate}"/></td>
                <td class="center" width="18%">后附单据(大写)</td>
                <td class="center" width="18%"></td>
            </tr>
            <tr>
                <td class="center" width="12%">合同名称</td>
                <td colspan="6" width="52%">${data.sname}</td>
                <td class="center" width="18%">合同编号</td>
                <td class="center" width="18%">${data.sbizno}</td>
            </tr>
            <tr>
                <td class="center" width="12%">领款单位全称</td>
                <td colspan="8" width="88%">${data.ssignbody}</td>
            </tr>
            <tr>
                <td class="center">支付事由</td>
                <td colspan="8">${data.screditbrief}</td>
            </tr>
            <tr>
                <td class="center">金额</td>
                <td class="center">大写</td>
                <td class="center" colspan="4"><mw:format label="bigmoney" value="${data.famount}"/></td>
                <td class="center">小写</td>
                <td class="center" colspan="2"><mw:format label="money" value="${data.famount}"/>（元）</td>
            </tr>
            <tr>
                <td class="center">收款信息</td>
                <td colspan="4">收款人公司全称:<br/><c:choose><c:when test="${data.spaymemberid == mw:user().memberId}">${data.srecename}</c:when><c:otherwise>${data.spayname}</c:otherwise></c:choose></td>
                <td colspan="2">开户行:<br/><c:choose><c:when test="${data.spaymemberid == mw:user().memberId}">${data.sreceopenname}</c:when><c:otherwise>${data.spayopenname}</c:otherwise></c:choose></td>
                <td>账号:<br/><c:choose><c:when test="${data.spaymemberid == mw:user().memberId}">${data.sreceopenaccount}</c:when><c:otherwise>${data.spayopenaccount}</c:otherwise></c:choose></td>
                <td>联行号:<br/><c:choose><c:when test="${data.spaymemberid == mw:user().memberId}">${data.sreceunionaccount}</c:when><c:otherwise>${data.spayunionaccount}</c:otherwise></c:choose></td>
            </tr>
            <tr>
                <td class="center">支付方式</td>
                <td colspan="2">银行<input type="checkbox" checked="checked" /></td>
                <td colspan="2">银行承兑</td>
                <td colspan="2">商业承兑</td>
                <td>内行</td>
                <td>现金</td>
            </tr>
            <tr>
                <td colspan="3">总经理</td>
                <td colspan="2">分管领导</td>
                <td colspan="2">财务部负责人</td>
                <td>会计审核</td>
                <td>部门负责人</td>
            </tr>
            <tr>
                <td colspan="3" class="word"><span class=""><img width="120" src="${ctx}/images/sign-qsb.png"></span></td>
                <td colspan="2" class="word"><span class=""><img width="120" src="${ctx}/images/sign-zwb.png"></span></td>
                <td colspan="2" class="word"><span class=""><img width="120" src="${ctx}/images/sign-cf.png"></span></td>
                <td class="word"><span class=""><img width="120" src="${ctx}/images/sign-cl.png"></span></td>
                <td class="word"><span class=""><img width="120" src="${ctx}/images/sign-cxl.png"></span></td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>
