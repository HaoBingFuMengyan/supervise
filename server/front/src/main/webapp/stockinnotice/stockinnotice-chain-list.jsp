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
                    <label class="layui-form-label">供应商</label>
                    <div class="layui-input-inline">
                        <input type="text" id="membername" name="search_like_project.ssalename" placeholder="" autocomplete="off" class="layui-input"/>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">入库通知单编号</label>
                    <div class="layui-input-inline">
                        <input type="text" name="search_like_sorderno" placeholder="" autocomplete="off" class="layui-input"/>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">项目编号</label>
                    <div class="layui-input-inline">
                        <input type="text" name="search_like_sprojectcode" placeholder="" autocomplete="off" class="layui-input"/>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">状态</label>
                    <div class="layui-input-inline">
                        <contract:StockInStatus op="select" option="class='layui-input'" name="search_eq_istatus" defval="" defname="全部"/>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">日期</label>
                    <div class="layui-input-inline">
                        <input type="text" id="dorderdatestart" name="search_gtetime_dorderdate" class="layui-input" placeholder="开始日期" readonly/>
                    </div>
                    <div class="layui-form-mid layui-word-aux">-</div>
                    <div class="layui-input-inline">
                        <input type="text" id="dorderdateend" name="search_ltetime_dorderdate" class="layui-input" placeholder="截止日期" readonly/>
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
        jj.url="${ctx}/stockinnotice/chain-list.json";
        jj.xurl="${ctx}/stockinnotice/";
        jj.cols= [[
            {field:'sorderno', title: '入库通知单编号',sort: true}
            ,{field:'id', title: '项目编号',sort: true,templet:function (d) {

                    return d.sprojectcode;
                }}
            ,{field: 'istatus', title: '状态', sort: true, templet: function (d) {
                return g_StockInStatus[d.istatus];
            }
            }
            ,{field:'id', title: '供应商',minWidth:150,sort: true,templet:function (d) {
                return d.project.ssalename;
            }}
            ,{field:'id', title: '通知仓库',minWidth:150,sort: true,templet:function (d) {
                return d.warehouse.swarehousename;
            }}
            ,{field:'dorderdate', title: '日期',sort: true,templet:function (obj) {return tt.toDate(obj.dorderdate);}}
            ,{fixed: 'right', align:'left', toolbar: '#barDemo',width:100} //这里的toolbar值是模板元素的选择器
        ]];

        jj.render({
            initSort:{
                field:"sorderno",
                type:"desc"
            },
            cellMinWidth:120,
            page: true
        });

        jj.detail=function (d) {
            layer.open({
                type: 2,
                title:'入库通知单详情',
                area: ['80%', '80%'],
                content: '${ctx}/stockinnotice/chain-view-'+d.id+'.shtml',
                btn: ['关闭'],
                cancel: function(index){}
            });
        }


    });

</script>
<script type="text/html" id="barDemo">
    <div class="layui-btn-group" data-rowid="{{d.id}}">
        <jj:listbtn name="查看" event="detail" purview="" type="a"/>
        {{# if(d.istatus==30) { }}
        <%--<jj:listbtn name="生成付款单" event="projectsettlepay" purview="" type="a"/>--%>
        {{#  } }}
    </div>
</script>


</body>
</html>