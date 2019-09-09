<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ include file="/include/taglib.jsp" %>
<!DOCTYPE>
<html>
<head>
    <meta name="decorator" content="blank"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>合同审批打印</title>
    <style>
        body{
            font-family: "宋体";
        }
        .table-con {
            width: 1000px;
            margin: 0 auto;
            padding-top: 50px;
        }

        .table-con .title {
            text-align: center;
            font-size: 24px;
            line-height: 1.8;
        }

        .ht-number {
            margin-top: 20px;
            font-size: 14px;
            padding-left: 39px;
            padding-bottom: 5px;
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
            padding: 20px;
            border: 1px solid #999;
            line-height: 1.6;
            vertical-align: top;
            font-size: 16px;
            position: relative
        }

        .table-con .table table td.center {
            text-align: center
        }

        .table-con .table table td.word {
            height: 80px;
        }
        .margin100{
            margin-left: 100px;
            display: block;
            float: left;
            margin-top: 30px;
        }
        .margin700{
            margin-left: 700px;
            display: block;
            float: left;
        }
        .ht-name{
            padding-top: 80px!important;
        }
    </style>
</head>
<body>
<div class="table-con">
    <div class="title">陕煤集团神南产业发展有限公司<br/>“煤亮子”合同审批表</div>
    <div class="ht-number">合同编号：${data.sbizno}</div>
    <div class="table">
        <table style="table-layout:fixed; width:100%;" cellspacing="0">

            <colgroup width="10%"></colgroup>
            <colgroup width="15%"></colgroup>
            <colgroup width="30%"></colgroup>
            <colgroup width="20%"></colgroup>
            <colgroup width="25%"></colgroup>
            <tr>
                <td rowspan="4" class="center ht-name">合<br>同<br>简<br>介</td>
                <td class="center">合同名称</td>
                <td colspan="3" class="center">${data.sname}</td>
            </tr>
            <tr>
                <td class="center">签约主体</td>
                <td colspan="3" class="center">${data.ssignbody}</td>
            </tr>
            <tr>
                <td class="center">履约期限</td>
                <td class="center">${data.icycle}（个月）</td>
                <td class="center">合同标的额</td>
                <td><mw:format label="money" value="${data.ftotalamount}"/>（元）</td>
            </tr>
            <tr>
                <td colspan="4">对方资信简介:<br/>${data.screditbrief}</td>
            </tr>
            <tr>
                <td colspan="2" class="center">实施单位</td>
                <td>神煤科技服务事业部</td>
                <td class="center">承办人</td>
                <td>${data.saddoperator}</td>
            </tr>
            <tr>
                <td colspan="5" class="word">实施单位意见:<br/><span class="margin100">同意</span><span class="margin700"><img width="120" src="${ctx}/images/sign-cxl.png"></span></td>
            </tr>
            <tr>
                <td colspan="5" class="word">财务部审核意见:<br/><span class="margin100">同意</span><span class="margin700"><img width="120" src="${ctx}/images/sign-cf.png"></span></td>
            </tr>
            <tr>
                <td colspan="5" class="word">企业管理部审核意见:<br/><span class="margin100">同意</span><span class="margin700"><img width="120" src="${ctx}/images/sign-zt.png"></span></td>
            </tr>
            <tr>
                <td colspan="5" class="word">分管领导批示:<br/><span class="margin100">同意</span><span class="margin700"><img width="120" src="${ctx}/images/sign-zwb.png"></span></td>
            </tr>
            <tr>
                <td colspan="5" class="word">法定代表人批示:<br/><span class="margin100">同意</span><span class="margin700"><img width="120" src="${ctx}/images/sign-qsb.png"></span></td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>