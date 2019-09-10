<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<%@ taglib prefix="project" uri="http://www.frogsing.com/tags/project" %>
<!DOCTYPE html >
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="煤亮子,煤亮子商城"/>
    <meta name="description" content="煤亮子商城(www.mall.meiliangzi.cn)。服务电话：400-086-0101 "/>
    <title>普通会员中心-煤亮子</title>

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

</div>
</body>
</html>
