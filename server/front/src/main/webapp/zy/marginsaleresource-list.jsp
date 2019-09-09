<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp"%>
<%@ taglib prefix="resource" uri="http://www.frogsing.com/tags/resource" %>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>已挂牌资源</title>
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
            <label class="layui-form-label">所属品种</label>
            <div class="layui-input-inline">
                <input type="text" name="search_like_scategory" placeholder="" autocomplete="off" class="layui-input"/>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">物资名称</label>
            <div class="layui-input-inline">
                <input type="text" name="search_like_scommodityname" placeholder="" autocomplete="off" class="layui-input"/>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">规格</label>
            <div class="layui-input-inline">
                <input type="text" name="search_like_sspec" placeholder="" autocomplete="off" class="layui-input"/>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">生产厂商</label>
            <div class="layui-input-inline">
                <input type="text" name="search_like_sproducer" placeholder="" autocomplete="off" class="layui-input"/>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">供应商</label>
            <div class="layui-input-inline">
                <input type="text" name="search_like_sownername" placeholder="" autocomplete="off" class="layui-input"/>
            </div>
        </div>
    </div>
</form>
<table class="layui-hide" id="stable" lay-filter="stable"></table>


<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    var goodtype = ${resource:GoodsType()};
    layui.use(['table','layer','laydate'],function(){
        var laydate=layui.laydate;

        jj.table =layui.table;
        jj.url="${ctx}/zy/marginsaleresource/list.json";

        jj.cols= [[
             {type:'checkbox'}
            ,{field:'scategory', title: '所属品种',width:150,sort: true}
            ,{field:'scommodityname', title: '物资名称',width:150,sort: true}
            ,{field:'sspec', title: '规格',width:150,sort: true}
            ,{field:'sproducer', title: '生产厂商',width:150,sort: true}
            ,{field:'sownername', title: '供应商',width:150,sort: true}
            ,{field:'fweight', title: '可用数量',width:100,sort: true,align:'left'}
            ,{field:'fprice', title: '挂牌单价(元)',width:150,sort: true}
            ,{field:'fprotocolprice', title: '单价(元)',width:150,sort: true}
//            ,{field:'fproxyprice', title: '代理销售单价',width:130,sort: true,align:'right'}
//            ,{field:'dindate', title: '入库时间',width:160,sort: true}
            ,{ align:'left', toolbar: '#barDemo',width:80,fixed:'right'} //这里的toolbar值是模板元素的选择器

        ]];

        jj.render({
            initSort:{
                field:"dbegindate",
                type:"desc"
            },
            cellMinWidth:80,
            page: true
        });

        jj.do_cancle=function(obj) {
            top.layer.confirm('确定对选择的资源进行撤牌吗?', {icon: 3, title:'系统提示'},function(index){
                window.location.href = '${ctx}/zy/marginsaleresource/cancle.shtml' + '?ids=' + obj.id;
                top.layer.close(index);//关闭提示信息
                jj.msg("操作成功!");
            });
        };
        jj.do_cancleall=function(obj) {
            var ids=[];
            var checkStatus = jj.table.checkStatus(jj.xtable)
                ,data = checkStatus.data;

            for(var i=0;i<data.length;i++){    //循环筛选出id
                ids.push(data[i].id);
            }
            if (ids.length > 0){
                top.layer.confirm('确定对选择的资源进行撤牌吗?', {icon: 3, title:'系统提示'},function(index){
                    window.location.href = '${ctx}/zy/marginsaleresource/cancle.shtml' + '?ids=' + ids;
                    top.layer.close(index);//关闭提示信息
                    jj.msg("操作成功!");
                });
            }else
                jj.msg("请先选择撤牌资源");
        };

        jj.modify_fprice=function (obj) {
            var ids=[];
            var checkStatus = jj.table.checkStatus(jj.xtable)
                ,data = checkStatus.data;

            for(var i=0;i<data.length;i++){    //循环筛选出id
                ids.push(data[i].id);
            }
            if (ids.length > 0){
                jj.xopen({
                    area:['45%','40%'],
                    title:'批量调价',
                    content:'${ctx}/zy/marginstock/modify-fprice.shtml?ids='+ids,
                    btn: ['确定','关闭']
                });
            }else
                jj.msg("请先选择资源");
        };

        jj.modify_fstockweight = function (obj) {
            var ids=[];
            var checkStatus = jj.table.checkStatus(jj.xtable)
                ,data = checkStatus.data;

            for(var i=0;i<data.length;i++){    //循环筛选出id
                ids.push(data[i].id);
            }
            if (ids.length > 0){
                jj.xopen({
                    area:['45%','40%'],
                    title:'批量调量',
                    content:'${ctx}/zy/marginstock/modify-fstockweight.shtml?ids='+ids,
                    btn: ['确定','关闭']
                });
            }else
                jj.msg("请先选择资源");
        }

    });

</script>
<script type="text/html" id="barDemo">
    <div class="layui-btn-group" data-rowid="{{d.id}}">
        <jj:listbtn name="撤牌" event="do_cancle" purview="" type="a" />
    </div>
</script>
<script type="text/html" id="xtoolbar">
    <jj:btn event="do_cancleall" name="批量撤牌" purview=""/>

    <jj:btn event="modify_fprice" name="批量调价" purview=""/>

    <jj:btn event="modify_fstockweight" name="批量调量" purview=""/>
</script>
</div>
</body>
</html>
