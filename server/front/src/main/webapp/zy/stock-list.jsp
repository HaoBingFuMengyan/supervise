
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp"%>
<%@ taglib prefix="resource" uri="http://www.frogsing.com/tags/resource" %>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>库存列表</title>
    <script type="text/javascript">
        $(function () {
            $("#owner").bigAutocomplete({
                url: "${ctx}/hy/member/searchMember.json",
                click: 'true',
                select: true
            });
        });
    </script>
</head>
<body>
<form  id="searchForm" class="layui-form">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">项目编号</label>
                    <div class="layui-input-inline">
                        <input type="text" name="search_like_sprojectno" placeholder="" autocomplete="off" class="layui-input"/>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">货主</label>
                    <div class="layui-input-inline">
                        <input type="text" id="owner"  name="search_eq_sownername" placeholder="" autocomplete="off" class="layui-input"/>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">物资名称</label>
                    <div class="layui-input-inline">
                        <input type="text" id="scommodityname" name="search_like_scommodityname" placeholder="" autocomplete="off" class="layui-input"/>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">规格</label>
                    <div class="layui-input-inline">
                        <input type="text" id="sspec" name="search_like_sspec" placeholder="" autocomplete="off" class="layui-input"/>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">日期</label>
                    <div class="layui-input-inline">
                        <input type="text" id="dindatestart" name="search_gtetime_dindate" class="layui-input" placeholder="开始日期" readonly/>
                    </div>
                    <div class="layui-form-mid layui-word-aux">-</div>
                    <div class="layui-input-inline">
                        <input type="text" id="dindateend" name="search_ltetimedindate" class="layui-input" placeholder="截止日期" readonly/>
                    </div>
                </div>
            </div>
        </form>
        <table class="layui-hide" id="stable" lay-filter="stable"></table>


<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    layui.use(['table','layer','laydate'],function(){
        var laydate=layui.laydate;
        laydate.render({
            elem: '#dindatestart',
            event: 'focus'
        });
        laydate.render({
            elem: '#dindateend',
            event: 'focus'
        });
        jj.table =layui.table;
        jj.url="${ctx}/zy/stock/list.json";

        jj.cols= [[
            //{type:'checkbox'}
            {field:'sprojectno', title: '项目编号',width:150,sort: true}
            ,{field:'sownername', title: '货主',width:150,sort: true}
            ,{field:'swarehousename', title: '仓库',width:150,sort: true}
            ,{field:'scommodityname', title: '物资名称',width:150,sort: true}
            ,{field:'sspec', title: '规格',width:150,sort: true}
            ,{field:'favailableweight', title: '可用数量',width:100,sort: true,align:'right'}
            ,{field:'fproxyprice', title: '代理销售单价',width:130,sort: true,align:'right'}
            ,{field:'dindate', title: '入库时间',width:160,sort: true}
            ,{ align:'left', toolbar: '#barDemo',width:80,fixed:'right'} //这里的toolbar值是模板元素的选择器

        ]];

        jj.render({
            initSort:{
                field:"dmodifydate",
                type:"desc"
            },
            cellMinWidth:80,
            page: true
        });
        jj.do_GuaPai=function(obj){
            jj.height=450;
            jj.width=650;
            jj.xopen({
                title:'库存挂牌',
                content:'${ctx}/zy/stock/open.shtml?type=1&ids='+obj.id,
                btn: ['确定','关闭']
            });
        };


    });

</script>
<script type="text/html" id="barDemo">
    <div class="layui-btn-group" data-rowid="{{d.id}}">
        <jj:listbtn name="挂牌" event="do_GuaPai" purview="stock:gp" type="a" />
    </div>
</script>
</div>
</body>
</html>
