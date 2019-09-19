<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<%@ taglib prefix="project" uri="http://www.frogsing.com/tags/project" %>
<!DOCTYPE html >
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="基金协同监管系统沟通,基金协同监管系统沟通"/>
    <meta name="description" content="基金协同监管系统沟通"/>
    <title>普通会员中心-基金协同监管系统沟通</title>
    <link href="${ctx}/css/common.css" rel="stylesheet" type="text/css">
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


        function formOpen(surl) {
            top.layer.open({
                type: 2,
                title: '企业基本信息',
                area: ['95%', '95%'],
                content: surl,
                btn: ['提交信息', '关闭'],
                yes: function (index, layero) {
                    var iframeWin = layero.find('iframe')[0];
                    var $ = iframeWin.contentWindow.$;
                    var doc = $(iframeWin.contentWindow.document);

                    if (iframeWin.contentWindow.valiForm()) {
                        if (iframeWin.contentWindow.check()) {
                            $.post("${ctx}/hy/member/authapply.json", doc.find('#formx').serialize(), function (rs) {
//                            layer.closeAll('loading');
                                if (rs.success) {

                                    layer.close(index);

                                    top.layer.msg("操作成功!", {icon: 1});
                                }
                                else {
                                    top.layer.msg(rs.msg,{icon: 5});
                                }
                            });
                        }
                    }

                },
                cancel: function (index) {
                }
            });
        }

    </script>
</head>
<body>
<div class="wrapper wrapper-content jy-content">
    <div class="apply-con">
        <div class="apply-tips">请选择企业业务类型</div>
        <div class="apply-box clearfix">
            <div class="apply-card apply-card1">
                <h2>有限责任公司</h2>
                <p>拟备案为私募基金管理人</p>
                <a onclick="formOpen('${ctx}/hy/member/authapply.shtml?icorbiztype=10')" href="#">立即申请</a>
            </div>
            <div class="apply-card apply-card2">
                <h2>有限合伙企业</h2>
                <p>拟备案为私募基金管理人</p>
                <a onclick="formOpen('${ctx}/hy/member/authapply.shtml?icorbiztype=20')" href="#">立即申请</a>
            </div>
            <div class="apply-card apply-card3">
                <h2>有限合伙企业</h2>
                <p>拟备案为创投风投基金</p>
                <a onclick="formOpen('${ctx}/hy/member/authapply.shtml?icorbiztype=30')" href="#">立即申请</a>
            </div>
        </div>
    </div>
</div>
<%--<div class="hy-mask">--%>
    <%--<div class="mask-box">--%>
        <%--<fieldset class="layui-elem-field layui-field-title">--%>
            <%--<legend>请修改并完善您的信息</legend>--%>
        <%--</fieldset>--%>
        <%--<form id= action="" method="post">--%>
            <%--<div class="sqcon top30 clearfix">--%>
                <%--<div class="input_group input_group_lg bottom20 left100">--%>
                    <%--<label>手机号：</label><input type="password" name="oldpassword" id="" class="form_control" required placeholder="请输入您的手机号码" />--%>
                <%--</div>--%>
                <%--<div class="input_group input_group_lg bottom20 left100">--%>
                    <%--<label>原密码：</label><input type="password" name="oldpassword" id="oldpassword" class="form_control" required placeholder="请输入您的原密码" />--%>
                <%--</div>--%>
                <%--<div class="input_group input_group_lg bottom20 left100">--%>
                    <%--<label>新密码：</label><input type="password" name="newpassword" id="newpassword1" minlength="6" maxlength="20" class="form_control" required placeholder="密码由6-20字母、字符或数字组成" />--%>
                <%--</div>--%>
                <%--<div class="input_group input_group_lg bottom20 left100">--%>
                    <%--<label>确认新密码：</label><input type="password" name="newpassword2" minlength="6" maxlength="20" class="form_control" required equalTo="#newpassword1" placeholder="请再次输入您的新密码" /><!-- equalTo="newpassword" -->--%>
                <%--</div>--%>
                <%--<button class="layui-btn layui-btn-sm layui-btn-normal" style="float: right;margin-right: 10px">确定</button>--%>
            <%--</div>--%>
        <%--</form>--%>
    <%--</div>--%>
<%--</div>--%>
</body>
</html>
