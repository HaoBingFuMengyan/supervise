<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp"%>
<%@ taglib prefix="contract" uri="http://www.frogsing.com/tags/contract" %>
<%@ taglib prefix="mv" uri="http://www.frogsing.com/tags/frogsing" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>提货单列表</title>
    <link href="${ctx}/css/salelist.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/css/main.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/css/common.css" rel="stylesheet" type="text/css">
</head>
<body>
    <form  id="searchForm" class="layui-form">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">提货单编号</label>
                        <div class="layui-input-inline">
                            <input type="text" name="search_like_sorderno" placeholder="" autocomplete="off" class="layui-input"/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">项目编号</label>
                        <div class="layui-input-inline">
                            <input type="text" name="search_like_project.scode" placeholder="" autocomplete="off" class="layui-input"/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">提货仓库</label>
                        <div class="layui-input-inline">
                            <input type="text" name="search_like_warehouse.swarehousename" placeholder="" autocomplete="off" class="layui-input"/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">状态</label>
                        <div class="layui-input-inline">
                            <contract:OutOrderStatus op="select" defval="" defname="全部" option="class='layui-input'" name="search_eq_istatus"/>
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
            <table class="layui-hide" id="stable" lay-filter="stable" lay-size="sm"></table>

    <!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

    <script>
        var delivery_istatus = ${contract:OutOrderStatus()};
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
            jj.url="${ctx}/deliveryorderandind/buy-list.json";

            jj.cols= [[
                //{type:'checkbox'}
                {field:'sorderno', title: '提货单编号',sort: true}
                , {field: '', title: '项目/合同编号', sort: true,width:150,templet:'#on'}
                ,{field:'sdrivername', title: '提货人',sort: true,templet:function (d) {
                      return d.sdrivername;
                }}
                ,{field:'istatus', title: '提货单状态',sort: true,templet:function (d) {
                    return delivery_istatus[d.istatus];
                }}
                ,{field:'bischecked', title: '是否已审核',sort: true,templet:'#checkedTp'}
                ,{field:'dorderdate', title: '开单日期',sort: true,templet:function (obj) {return tt.toDate(obj.dorderdate);}}
                ,{align:'left', toolbar: '#barDemo',width:180} //这里的toolbar值是模板元素的选择器

            ]];

            jj.render({
                initSort:{
                    field:"dorderdate",
                    type:"desc"
                },
                cellMinWidth:80,
                page: true
            });
            jj.detail=function (obj) {
                layer.open({
                    type: 2,
                    title:"提货单详情",
                    area: ['80%', '80%'],
                    content: '${ctx}/deliveryorderandind/buy-view-'+obj.id+'.shtml',
                    btn: ['关闭'],
                    cancel: function(index){}
                });

            }
        });

    </script>

    <script type="text/html" id="barDemo">
        <div class="layui-btn-group" data-rowid="{{d.id}}">
            <jj:listbtn name="查看" event="detail" css="layui-abtn" type="a" purview=""/>
        </div>
    </script>
    <script type="text/html" id="checkedTp">
        {{#  if(d.bischecked==0){ }}
        否
        {{#  } else{ }}
        是
        {{#  } }}
    </script>
    <script type="text/html" id="on">
        {{#  if(d.project.scode==null){ }}
        {{ d.contract.scontractno}}
        {{#  } else{ }}
        {{d.project.scode}}
        {{#  } }}
    </script>

</body>
</html>

