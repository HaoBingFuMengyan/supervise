<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<%@ taglib prefix="contract" uri="http://www.frogsing.com/tags/contract" %>
<html>
<head>
    <title>提货单管理</title>
    <meta name="decorator" content="jj"/>
</head>
<body>
    <form class="layui-form" id="searchForm">

    </form>

<table class="layui-hide" id="stable" lay-filter="stable"></table>

<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    var delivery_istatus = ${contract:OutOrderStatus()};
    layui.use(['table', 'layer'], function () {
        jj.table = layui.table;
        var form = layui.form;
        jj.url = "${ctx}/deliveryorderandind/project-list.json?sprojectid=${data.id}";
        jj.cols = [[
            {type: 'checkbox'}
            , {field: 'sorderno', title: '提货单编号', sort: true}
            , {field: 'ssellermemberid', title: '存货客户', sort: true,templet:function (d) {
                return d.seller.scnname;
            }}
            , {field: 'sdrivername', title: '提货人', sort: true}
            , {field: 'dorderdate', title: '开单日期', sort: true}
            , {field: 'istatus', title: '状态', sort: true,templet:function (d) {
                return delivery_istatus[d.istatus];
            }}

            , {field: 'smobile', title: '手机号', sort: true}
            , {fixed: 'right', align: 'center', toolbar: '#barDemo',width:210} //这里的toolbar值是模板元素的选择器
        ]];

        jj.width = 500;
        jj.height = 530;
        jj.limit=1000;
        jj.showtoolbar=false;
        jj.render({
            initSort: {
                field: "sorderno",
                type: "desc"
            },
            cellMinWidth: 80,
            page: false
        });
        jj.detail = function (obj) {
            jj.height=700;
            jj.width=1200;
            jj.xview({
                content: "${ctx}/jj/deliveryorderandind/detail.shtml?id=" + obj.id
            });
        }
        jj.check = function (obj) {
            layer.prompt({title: '请输入审核意见', formType: 2},function(text, index){
                jj.post("${ctx}/jj/deliveryorderandind/check.json",{id:obj.id,sremark:text},function (rs) {
                    jj.closeAll('loading');
                    if(rs.success){
                        if(rs.msg){
                            jj.msg(rs.msg);
                        }
                        else {
                            jj.msg("操作成功!");
                        }
                        layer.close(index);
                        jj.refresh();
                    }
                    else {
                        jj.msg(rs.msg,5,3);
                    }

                });
            });
        }
        jj.cancle = function (obj) {
            layer.prompt({title: '请输入作废意见', formType: 2},function(text, index){
                jj.post("${ctx}/jj/deliveryorderandind/cancel.json",{id:obj.id,sremark:text},function (rs) {
                    jj.closeAll('loading');
                    if(rs.success){
                        if(rs.msg){
                            jj.msg(rs.msg);
                        }
                        else {
                            jj.msg("操作成功!");
                        }
                        layer.close(index);
                        jj.refresh();
                    }
                    else {
                        jj.msg(rs.msg,5,3);
                    }

                });
            });
        }
    });

</script>
<script type="text/html" id="barDemo">
    <div class="layui-btn-group" data-rowid="{{d.id}}">

    <jj:listbtn name="查看" event="detail"/>
    {{# if(d.bischecked == 0 && d.istatus == 0){ }}
        <jj:listbtn name="审核" event="check"/>
        <jj:listbtn name="作废" event="cancle"/>
    {{#}
    }}
    </div>
</script>


</body>
</html>
