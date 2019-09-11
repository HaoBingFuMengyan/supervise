<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<%@ taglib prefix="project" uri="http://www.frogsing.com/tags/project" %>
<!DOCTYPE html >
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="基金协同监管系统沟通,基金协同监管系统沟通"/>
    <meta name="description" content="基金协同监管系统沟通(www.mall.meiliangzi.cn)。服务电话：400-086-0101 "/>
    <title>普通会员中心-基金协同监管系统沟通</title>

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
<div class="wrapper wrapper-content jy-content">
    <div class="apply-con">
        <div class="apply-tips">请选择企业业务类型</div>
        <div class="apply-box clearfix">
            <div class="apply-card apply-card1">
                <h2>有限责任公司</h2>
                <p>拟备案为私募基金管理人</p>
                <a href="${ctx}/hy/member/authapply.shtml">立即申请</a>
            </div>
            <div class="apply-card apply-card2">
                <h2>有限合伙企业</h2>
                <p>拟备案为私募基金管理人</p>
                <a href="${ctx}/hy/member/authapply.shtml">立即申请</a>
            </div>
            <div class="apply-card apply-card3">
                <h2>有限合伙企业</h2>
                <p>拟备案为创投风投基金</p>
                <a href="${ctx}/hy/member/authapply.shtml">立即申请</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
