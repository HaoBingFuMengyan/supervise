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
</head>
<body>
<div class="fillIn">
    <div class="fill-box">
        <div class="fill-form">
            <form id="orderForm" action="">
                <div class="input_group bottom20 input_group_half">
                    <div class="fill-label"><em class="red">*</em>注册资本</div>
                    <input name="" class="form_control" placeholder="请填写注册资本">万元
                </div>
                <div class="input_group bottom20 input_group_half">
                    <div class="fill-label"><em class="red">*</em>执行董事信息</div>
                    <div >
                        <input name="" class="form_control" placeholder="姓名">
                        <select>
                            <option value="">下拉选择证件类别</option>
                            <option value="">身份证</option>
                            <option value="">护照</option>
                            <option value="">港澳台通行证</option>
                        </select>
                        <input name="" class="form_control" placeholder="证件号码">
                    </div>
                    <div class="checkbox">
                        <p>兼职情况</p>
                        <input onclick="" type="radio">在XXXXXXXXXXX担任股东/董事/法定代表人/监事等职务
                        <input onclick="" type="radio">未在其他公司担任股东/董事/法定代表人/监事等职务
                    </div>
                </div>
                <div class="input_group bottom20 input_group_half">
                    <div class="fill-label"><em class="red">*</em>公司经理信息</div>
                    <div >
                        <input name="" class="form_control" placeholder="姓名">
                        <select>
                            <option value="">下拉选择证件类别</option>
                            <option value="">身份证</option>
                            <option value="">护照</option>
                            <option value="">港澳台通行证</option>
                        </select>
                        <input name="" class="form_control" placeholder="证件号码">
                    </div>
                    <div class="checkbox">
                        <p>兼职情况</p>
                        <input onclick="" type="radio">在XXXXXXXXXXX担任股东/董事/法定代表人/监事等职务
                        <input onclick="" type="radio">未在其他公司担任股东/董事/法定代表人/监事等职务
                    </div>
                </div>
                <div class="input_group bottom20 input_group_half">
                    <div class="fill-label"><em class="red">*</em>选择法定代表人</div>
                    <select>
                        <option value="">下拉选择法定代表人</option>
                        <option value="">执行董事</option>
                        <option value="">经理</option>
                        <option value="">执行董事兼经理</option>
                    </select>
                </div>
                <div class="input_group bottom20 input_group_half">
                    <div class="fill-label"><em class="red">*</em>填写自然人股东信息<button id="addbtn" type="button"><img src="${ctx}/images/add.png">添加</button></div>
                    <div >
                        <input name="" class="form_control" placeholder="股东姓名">
                        <select>
                            <option value="">下拉选择证件类别</option>
                            <option value="">身份证</option>
                            <option value="">护照</option>
                            <option value="">港澳台通行证</option>
                        </select>
                        <input name="" class="form_control" placeholder="证件号码">
                        <input name="" class="form_control" placeholder="认缴出资额">万元
                    </div>
                    <div class="checkbox">
                        <p>兼职情况</p>
                        <input onclick="" type="radio">在XXXXXXXXXXX担任股东/董事/法定代表人/监事等职务
                        <input onclick="" type="radio">未在其他公司担任股东/董事/法定代表人/监事等职务
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>