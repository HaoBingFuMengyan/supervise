<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp"%>
<%@ taglib prefix="resource" uri="http://www.frogsing.com/tags/resource" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>库存列表</title>
    <script type="text/javascript">
        $(function () {
            /*$("#scommodityname").bigAutocomplete({
                url: "${ctx}/sp/commodity/searchcomodity.json",
                click: 'true',
                select: true,
                callback: function (data) {
                    $("#scommodityname").val(data.sname);
                    $("#sspec").val(data.sspec);
                }
            });*/
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
                        <input type="text" id="dmodifydatestart" name="search_gtetime_dmodifydate" class="layui-input" placeholder="开始日期" readonly/>
                    </div>
                    <div class="layui-form-mid layui-word-aux">-</div>
                    <div class="layui-input-inline">
                        <input type="text" id="dmodifydateend" name="search_ltetime_dmodifydate" class="layui-input" placeholder="截止日期" readonly/>
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
            elem: '#dmodifydatestart',
            event: 'focus'
        });
        laydate.render({
            elem: '#dmodifydateend',
            event: 'focus'
        });
        jj.table =layui.table;
        jj.url="${ctx}/zy/saleresource/list.json";

        jj.cols= [[
            {type:'checkbox'}

            ,{field:'sprojectno', title: '项目编号',width:150,sort: true}
            ,{field:'sownername', title: '货主',width:150,sort: true}
            ,{field:'swarehousename', title: '仓库',width:150,sort: true}
            ,{field:'scommodityname', title: '物资名称',width:150,sort: true}
            ,{field:'sspec', title: '规格',width:150,sort: true}
            ,{field:'favailableweight', title: '可用数量',width:100,sort: true,align:'right'}
            ,{field:'favailableweight', title: '挂牌数量',width:100,sort: true,align:'right'}
            ,{field:'fprice', title: '销售定价',width:100,sort: true,align:'right'}
            ,{field:'fproxyprice', title: '代理销售单价',width:100,sort: true,align:'right'}
            ,{field:'dmodifydate', title: '入库时间',width:150,sort: true}
            ,{ align:'left',fixed:'right',width:100, toolbar: '#barDemo'} //这里的toolbar值是模板元素的选择器

        ]];

        jj.render({
            initSort:{
                field:"dmodifydate",
                type:"desc"
            },
            cellMinWidth:80,
            page: true
        });
        jj.do_changeFprice=function(obj){
            layer.open({
                type: 2,
                title:'资源调价：',
                area: ['565px', '355px;'],
                content: '${ctx}/zy/stock/open.shtml'+'?type='+2+'&ids='+obj.id,
                btn: ['确定', '关闭'],
                btn1:function (index,layero) {
                    var iframeWin = layero.find('iframe')[0];
                    var $=iframeWin.contentWindow.$;
                    var doc=$(iframeWin.contentWindow.document);

                    if (!doc.find("#fprice").val()) {
                        layer.msg('请输入调价幅度!', {icon: 5});
                        return;
                    }
                    doc.find('form').first().submit() ;
                },
                cancel: function(index){}
            });
        };
        jj.do_cancle=function(obj) {
            top.layer.confirm('确定对选择的资源进行撤牌吗?', {icon: 3, title:'系统提示'},function(index){
                window.location.href = '${ctx}/zy/saleresource/cancle.shtml' + '?ids=' + obj.id;
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
            top.layer.confirm('确定对选择的资源进行撤牌吗?', {icon: 3, title:'系统提示'},function(index){
                window.location.href = '${ctx}/zy/saleresource/cancle.shtml' + '?ids=' + ids;
                top.layer.close(index);//关闭提示信息
                jj.msg("操作成功!");
            });

        }


    });

</script>
<script type="text/html" id="barDemo">
    <div class="layui-btn-group" data-rowid="{{d.id}}">
        <jj:listbtn name="撤牌" event="do_cancle" purview="saleresource:cancel" type="a"/>
        <jj:listbtn name="调价" event="do_changeFprice" purview="stock:open" type="a"/>


    </div>
</script>
<script type="text/html" id="xtoolbar">
    <jj:btn event="do_cancleall" name="批量撤牌" purview="saleresource:cancel"/>
</script>
</body>
</html>
