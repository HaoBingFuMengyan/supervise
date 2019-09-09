<%@ taglib prefix="contract" uri="http://www.frogsing.com/tags/contract" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
    <title>入库单</title>
    <script type="text/javascript">
        $(function () {
            $("#membername").bigAutocomplete({
                url: "${ctx}/hy/member/searchMember.json",
                click: 'true',
                select: true
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
                        <input type="text" name="search_like_sprojectcode" placeholder="" autocomplete="off" class="layui-input"/>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">状态</label>
                    <div class="layui-input-inline">
                        <project:OverdueStatus op="select" option="class='layui-input'" name="search_eq_istatus" defval="10"/>
                    </div>
                </div>

            </div>
        </form>
        <table class="layui-hide" id="stable" lay-filter="stable"></table>


<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    var g_StockInStatus = ${contract:StockInStatus()};
    layui.use(['table','layer','laydate'],function(){
        var laydate=layui.laydate;
        laydate.render({
            elem: '#dorderdatestart',
            event: 'focus'
        });
        laydate.render({
            elem: '#dorderdateend',
            event: 'focus'
        });
        jj.table =layui.table;
        var form = layui.form;
        jj.url="${ctx}/overduebill/list.json";
        jj.xurl="${ctx}/overduebill/";
        jj.cols= [[
            {field:'sprojectcode', title: '项目编号',sort: true}
            ,{field:'dplanpaydate', title: '计划付款日期',sort: true,templet:function (d) {
                    return tt.toDate(d.dplanpaydate);
                }}
            ,{field: 'fplanpayment', title: '计划付款金额', sort: true, templet: function (d) {
                return d.fplanpayment;
            }}
            ,{field:'dpredictpaydate', title: '预计付款日期',minWidth:150,sort: true,templet:function (d) {
                return d.dpredictpaydate?tt.toDate(d.dpredictpaydate):'';
            }}
            ,{field:'drealpaydate', title: '实际付款日期',minWidth:150,sort: true,templet:function (d) {
                return d.drealpaydate?tt.toDate(d.drealpaydate):d.drealpaydate;
            }}
            ,{field:'ioverdays', title: '逾期天数',sort: true}
            ,{field:'fpenalty', title: '应收违约金',sort: true}
            ,{field:'frealpenalty', title: '实收违约金',sort: true}
            ,{fixed: 'right', align:'left', toolbar: '#barDemo',width:100} //这里的toolbar值是模板元素的选择器
        ]];

        jj.render({
            initSort:{
                field:"dplanpaydate",
                type:"desc"
            },
            page: true
        });

        jj.handle = function (d) {
            jj.xopen({
                area: ['700px', '550px'],
                content: '${ctx}/overduebill/tohandle.shtml?id=' + d.id
            });
        };
        jj.cancel=function (d) {
            layer.confirm('要作废吗？',function (index,layro) {
                layer.close(index);
                jj.post("${ctx}/overduebill/cancle.shtml",{id:d.id});
            });
        }

    });

</script>
<script type="text/html" id="barDemo">
    <div class="layui-btn-group" data-rowid="{{d.id}}">
        <%--<jj:listbtn name="查看" event="detail" purview="" type="a"/>--%>
        {{# if(d.istatus==10) { }}
            <jj:listbtn name="处理" event="handle" purview="" type="a"/>
            <jj:listbtn name="作废" event="cancel" purview="" type="a"/>
        {{#  } }}
    </div>
</script>


</body>
</html>