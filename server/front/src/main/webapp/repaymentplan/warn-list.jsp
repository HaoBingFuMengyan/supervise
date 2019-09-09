<%@ taglib prefix="contract" uri="http://www.frogsing.com/tags/contract" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
    <title>还款预警</title>
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
                    <label class="layui-form-label">采购商</label>
                    <div class="layui-input-inline">
                        <input type="text" id="membername" name="search_like_project.sbuyname" placeholder="" autocomplete="off" class="layui-input"/>
                    </div>
                </div>

                <div class="layui-inline">
                    <label class="layui-form-label">项目编号</label>
                    <div class="layui-input-inline">
                        <input type="text" name="search_like_project.scode" placeholder="" autocomplete="off" class="layui-input"/>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">预警天数</label>
                    <div class="layui-input-inline">
                        <select name="days" lay-filter="aihao">
                            <option value="5">5天内</option>
                            <option value="6">6天内</option>
                            <option value="7">7天内</option>
                            <option value="8">8天内</option>
                            <option value="9">9天内</option>
                            <option value="10">10天内</option>
                            <option value="11">11天内</option>
                            <option value="12">12天内</option>
                            <option value="13">13天内</option>
                            <option value="14">14天内</option>
                            <option value="15">15天内</option>
                            <option value="16">16天内</option>
                            <option value="17">17天内</option>
                            <option value="18">18天内</option>
                            <option value="19">19天内</option>
                            <option value="20">20天内</option>
                            <option value="21">21天内</option>
                            <option value="22">22天内</option>
                            <option value="23">23天内</option>
                            <option value="24">24天内</option>
                            <option value="25">25天内</option>
                            <option value="26">26天内</option>
                            <option value="27">27天内</option>
                            <option value="28">28天内</option>
                            <option value="29">29天内</option>
                            <option value="30">30天内</option>
                        </select>
                    </div>
                </div>
            </div>
        </form>

        <table class="layui-hide" id="stable" lay-filter="stable"></table>


<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    var g_StockInStatus = ${contract:StockInStatus()};
    layui.use(['table','layer','laydate','slider'],function(){
        var laydate=layui.laydate;
        var slider=layui.slider;
        laydate.render({
            elem: '#dorderdatestart',
            event: 'focus'
        });
        laydate.render({
            elem: '#dorderdateend',
            event: 'focus'
        });
        slider.render({
            elem: '#slideDays'
            ,step: 1 //步长
            ,max:30
            ,min:5
            //,showstep: true //开启间隔点
        });
        jj.table =layui.table;
        var form = layui.form;
        jj.url="${ctx}/repaymentplan/warn-list.json";
        jj.cols= [[
            {field:'code', title: '项目编号',sort: true,minWidth:150,templet:function (d) {
                    return d.project.scode;
                }}
            ,{field:'code', title: '采购商',minWidth:200,sort: true,templet:function (d) {
                    return d.project.sbuyname;
                }}
            ,{field:'ino', title: '期数',sort: true}
            ,{field:'dplandate', title: '应还日期',sort: true,style:'color:red;',templet:function(d){
                    return tt.toDate(d.dplandate);
                }}
            ,{field:'fplanback', title: '应还本金',sort: true}
//            ,{field:'frealback', title: '已还本金',sort: true}
            ,{field:'fplaninterest', title: '应还利息',sort: true}
            ,{field:'frealinterest', title: '已还利息',sort: true}
            ,{field:'fdefaultinterest', title: '罚息',sort: true}
            ,{field:'freceivabletotal', title: '累计应还本金',sort: true}
            ,{field:'frefundtotal', title: '累计已还本金',sort: true}
//            ,{field:'fless', title: '剩余本金',sort: true,templet:function(d){
//                    return d.fless;
//            }}
            ,{field:'brefund', title: '是否已结清',sort: true,templet:'#checkedTp'}
        ]];

        jj.render({
            initSort:{
                field:"dplandate",
                type:"desc"
            },
            cellMinWidth:120,
            page: true
        });

    });

</script>
<script type="text/html" id="checkedTp">
    {{#  if(d.brefund==0){ }}
    否
    {{#  } else{ }}
    是
    {{#  } }}
</script>
</body>
</html>