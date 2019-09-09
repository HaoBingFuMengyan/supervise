<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
    <title>应收融资项目管理</title>
    <script type="text/javascript">
        $(function () {
            $("#sellname").bigAutocomplete({
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
                        <input type="text" name="search_like_scode" placeholder="" autocomplete="off" class="layui-input"/>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">供应商</label>
                    <div class="layui-input-inline">
                        <input type="text" id="sellname" name="search_like_ssalename" placeholder="" autocomplete="off" class="layui-input"/>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">状态</label>
                    <div class="layui-input-inline">
                        <project:ProjectStatus op="select" option="class='layui-input'" name="search_eq_istatus" defval="" defname="全部"/>
                    </div>
                </div>

            </div>
        </form>

        <table class="layui-hide" id="stable" lay-filter="stable"></table>





<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    var g_istatus=${project:ProjectStatus()};
    layui.use(['table','layer'],function(){
        jj.table =layui.table;
        jj.url="${ctx}/projectreceivable/receivable-list.json";

        jj.cols= [[
            {field:'scode', title: '项目编号',width:150,sort: true}
            ,{field:'scontractno', title: '采购合同号',width:150,sort: true,hide:true}
            ,{field:'ssalecontractno', title: '销售合同号',width:150,sort: true,hide:true}
            ,{field:'swarehousecontractno', title: '仓储合同号',width:150,sort: true,hide:true}
            ,{field:'ssalename', title: '供应商',minWidth:200,sort: true}
            ,{field:'ssupplychainname', title: '供应链',minWidth:200,sort: true}
            ,{field:'icycle', title: '项目周期',width:100,sort: true,templet:function (d) {
                return d.icycle+"个月"
            }}
            ,{field:'fcontractrate', title: '月利率',width:100,sort: true,templet:function (d) {
                return d.fcontractrate+"%"
            }}
            ,{field:'fbuyamount', title: '采购总额(元)',width:120,sort: true,align:'right',templet:function (d) {
                return d.fbuyamount;
            }}
            ,{field:'floanamount', title: '融资金额(元)',width:120,sort: true,align:'right'}
            ,{field:'swarehousename', title: '存货仓库',minWidth:120,sort: true}
            ,{field:'istatus', title: '状态',width:100,sort: true,templet:function(d){
                return g_istatus[d.istatus];
            }}
            ,{field:'bisstock', title: '入库状态',width:100,sort: true,templet:'#stockinstatusTp'}
            ,{field:'', title: '出库状态',sort: true,width:100,templet:"#stockoutstatus"}
            ,{fixed: 'right', align:'center', toolbar: '#barDemo' ,width:150} //这里的toolbar值是模板元素的选择器

        ]];

        jj.render({
            initSort:{
                field:"scode",
                type:"desc"
            },
            cellMinWidth:80,
            page: true
        });
        jj.shure=function (obj) {
            var projectid=obj.id;
            layer.confirm('您确定要确认此项目吗？', {
                btn: ['确认','取消'] //按钮
            }, function(){
                jj.post("${ctx}/projectreceivable/buyer-shure.json",{id:projectid});
            }, function(){
                jj.closeAll();
            });
        };
        jj.deliveryorderadd=function (d) {
            jj.xopen({
                area: ['80%', '80%'],
                content:'${ctx}/contract/deliveryorderadd.shtml?sprojectid='+d.id
            });

        };
        jj.detail=function(d){
            layer.open({
                type:2,
                title:"查看项目详情",
                area: ['80%', '80%'],
                content:"${ctx}/project/index.shtml?id="+d.id,
                btn: ['关闭'],
                cancel: function(index){}
            });
        };

    });

</script>

<script type="text/html" id="barDemo">
    <div class="layui-btn-group" data-rowid="{{d.id}}">
        <jj:listbtn name="查看" event="detail" type="a" purview=""/>
        {{#  if(d.istatus==200 && d.bisbuyshure == 0){ }}
        <jj:listbtn name="确认项目" event="shure" type="a"/>
        {{#  } }}

        {{#  if(d.istatus==320 || d.istatus==330){ }}
        &nbsp;|&nbsp;<jj:listbtn name="开提货单" event="deliveryorderadd" type="a" purview="deliveryorder:add"/>

        {{#  } }}
    </div>
</script>

<jsp:include page="../project-common-templete.jsp"/>

</body>
</html>