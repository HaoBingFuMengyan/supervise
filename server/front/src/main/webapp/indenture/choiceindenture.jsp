<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE html >
<html>
<head>
    <title>仓单选择</title>
    <meta name="decorator" content="jj"/>
    <script type="text/javascript">
        $().ready(function () {
            $("#sownername").bigAutocomplete({
                url: "${ctx}/hy/member/searchMember.json",
                click: 'true',
                select: true
            });
            $("#scommodityname").bigAutocomplete({
                url: "${ctx}/sp/commodity/searchcomodity.json",
                click: 'true',
                select: true,
                callback: function (data) {
                    $("#scommodityname").val(data.sname);
                }
            });
        });
    </script>
</head>
<body >
<form  id="searchForm" class="layui-form">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">项目编号</label>
            <div class="layui-input-inline">
                <input type="text" id="sprojectno" name="search_like_sprojectno" placeholder="" autocomplete="off" class="layui-input"/>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">供应商</label>
            <div class="layui-input-inline">
                <input type="text" id="sownername" name="search_like_sownername" placeholder="" autocomplete="off" class="layui-input"/>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">物资名称</label>
            <div class="layui-input-inline">
                <input type="text" id="scommodityname" name="search_like_scommodityname" placeholder="" autocomplete="off" class="layui-input"/>
            </div>
        </div>

    </div>
</form>

<table class="layui-hide" id="stable" lay-filter="stable"></table>

<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    var selectarr=[];
    layui.use(['table','layer'],function(){
        jj.table =layui.table;
        jj.url="${ctx}/wms/indenture/choiceindenture.json?id=${id}";
        //jj.showtoolbar=false;
        jj.limit=50;
        jj.limits=[50,100,200];
        jj.cols= [[
            {checkbox: true}
            ,{field:'sprojectno', title: '项目编号',sort: true,minWidth:150}
            ,{field:'sownername', title: '供应商',sort: true,minWidth:200}
            ,{field:'scodegood', title: '物资编码',minWidth:150,sort: true}
            ,{field:'scommodityname', title: '物资名称',minWidth:120,sort: true}
            ,{field:'sspec', title: '规格型号',minWidth:120,sort: true}
            ,{field:'sproducer', title: '生产厂商',minWidth:100,sort: true}
            ,{field:'favailableweight', title: '库存量',width:100,sort: true,style:'color:red;',align:'right',templet:function (d) {
                    return d.favailableweight+"&nbsp;"+d.sweightunit;
                }}
            ,{field:'fproxyprice', title: '代理价格',width:150,align:'right',style:'color:red;',sort: true,templet:function (d) {
                    return d.fproxyprice+"&nbsp;元";
                }}
            ,{field:'slocation', title: '库位',minWidth:150,sort: true}
            ,{field:'dindate', title: '入库日期',width:120,sort: true,templet:function (d) {
                    return tt.toDate(d.dindate);
                }}
            ,{field:'swarehousename', title: '存货仓库',minWidth:150,sort: true}

        ]];


        jj.render({
            initSort:{
                field:"smembername",
                type:"desc"
            },
            height:"full-75",
            cellMinWidth:80,
            page: true
        });
    });

    jj.validate("#searchForm",{
        submitHandler: function(form){
            var checkStatus = jj.table.checkStatus(jj.xtable); //test即为基础参数id对应的值
            jj.parent.addData(checkStatus.data);
            return false;
        }});


</script>

</body>
</html>