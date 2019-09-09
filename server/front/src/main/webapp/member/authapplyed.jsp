<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ include file="/include/taglib.jsp" %>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>会员认证详情</title>
    <link href="${ctx}/member/css/open.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/css/common.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="${ctxStatic}/common/jquery.searchableSelect.css"/>

    <style type="text/css">
        h1 {
            font-size: 20px
        }

        .content {
            max-width: 90%;
            margin: auto;
            background: white;
            padding: 40px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            color: #666;
        }

        .ibox-content {
            overflow: hidden;
            padding: 20px;
        }

        .ibox-content-row {
            border-bottom: #eee 1px solid;
            overflow: hidden;
            margin-bottom: 10px;
        }

        .ibox-content-inline {
            width: 33%;
            margin-right: 0;
            vertical-align: middle;
            position: relative;
            display: inline-block;
        }

        .ibox-content-row .ibox-content-inline label {
            width: 100px;
            float: left;
            display: block;
            font-weight: 400;
            line-height: 20px;
            text-align: right;
            padding: 6px 5px;
            font-size: 13px;
        }

        .ibox-content-row .ibox-content-inline .child-inline {
            width: auto;
            padding: 6px 5px;
            line-height: 20px;
            text-align: left;
            font-size: 13px;
            display: inline-block;
            vertical-align: middle;
            position: relative;
        }
    </style>
</head>
<body>
<sys:message content="${message}"/>
<div class="content top30">
    <h1>会员信息</h1>
    <div class="ibox-content">
        <div class="ibox-content-row">
            <div class="ibox-content-inline">
                <label>企业名称：</label>
                <div class="child-inline">${data.scnname}</div>
            </div>
            <div class="ibox-content-inline">
                <label>社会信用代码：</label>
                <div class="child-inline">${data.ssocialcreditno}</div>
            </div>
            <div class="ibox-content-inline">
                <label>公司类型：</label>
                <div class="child-inline">
                    <member:CompanyType op="label" val="${data.icompanytype}"/>
                </div>
            </div>
        </div>
        <div class="ibox-content-row">
            <div class="ibox-content-inline">
                <label>账户全称：</label>
                <div class="child-inline">${data.sopenname}</div>
            </div>
            <div class="ibox-content-inline">
                <label>开户行：</label>
                <div class="child-inline">${data.sopenbank}</div>
            </div>
            <div class="ibox-content-inline">
                <label>账号：</label>
                <div class="child-inline">${data.sopenaccount}</div>
            </div>
        </div>
        <div class="ibox-content-row">
            <div class="ibox-content-inline">
                <label>联行号：</label>
                <div class="child-inline">${data.sunionaccount}</div>
            </div>
            <div class="ibox-content-inline">
                <label>联系人：</label>
                <div class="child-inline">${data.slinkman}</div>
            </div>
            <div class="ibox-content-inline">
                <label>电话：</label>
                <div class="child-inline">${data.sphone}</div>
            </div>
        </div>
        <div class="ibox-content-row">
            <div class="ibox-content-inline" style="width: 100%">
                <label>公司地址：</label>
                <div class="child-inline">${data.sprovince }&nbsp;${data.scity }&nbsp;${data.sregion }&nbsp;${data.sbusaddress}</div>
            </div>
        </div>
        <div class="ibox-content-row">
            <div class="ibox-content-inline" style="width: 100%">
                <label>其他描述：</label>
                <div class="child-inline">${data.scompanydesc}</div>
            </div>
        </div>
        <div class="ibox-content-row">
            <div class="ibox-content-inline" style="width: 100%">
                <label>营业执照：</label>
                <div class="child-inline" style="width: 30%">
                    <a href="<cs:SysParaType imgurl="1" op="syspara"/>/${data.sbusinessno}" target="_blank">
                        <img width="100%" src="<cs:SysParaType imgurl="1" op="syspara"/>/${data.sbusinessno}"/>
                    </a>
                </div>

            </div>
        </div>

    </div>
</div>
</body>
</html>