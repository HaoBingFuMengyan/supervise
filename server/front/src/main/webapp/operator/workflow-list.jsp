<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp"%>
<%@ taglib prefix="mv" uri="http://www.frogsing.com/tags/frogsing" %>
<%@ taglib prefix="wf" uri="http://www.frogsing.com/tags/operator" %>

<html>
<head>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>工作流</title>
    <link href="${ctx}/css/salelist.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/css/main.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/css/common.css" rel="stylesheet" type="text/css">
    <style>
        .layui-progress{
            text-align: left;
        }
        .layui-progress-bar span{
            font-size: 12px;
            position: absolute;
            right: -18px;
            top: -7px;
            transform: scale(0.7);
            color: #000;
        }
        .ischeckTitle{
            color: #0663A2;
            font-weight:600;
        }
        .checkTitle{
            color: #666;
            font-weight:600;
        }
        .content{
            font-size:13px !important;
            color: #666;
        }
        .noColor{
            background-color: #f10214 !important;
        }
        .processColor{
            background-color: #f4ea2a !important;
        }
         .pass{
             background: #5FB878;
             width: 16px;
             height:16px;
             line-height: 16px;
             left:-3px;
         }
        .color{
            color: #666666;
            background: #fff;
        }
        .layui-anim-rotate{
            background: #fff;
        }
    </style>
    <script type="text/javascript">
        $(function () {
        });
    </script>
</head>
<body>
<form  id="searchForm" class="layui-form">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">业务类型</label>
            <div class="layui-input-inline">
                <wf:WfBizType op="select" defval="" defname="全部" name="search_eq_ibiztype" option="class='layui-input'" nshow="1,3"/>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-inline">
                <wf:WfStatus op="select" defval="" defname="全部" name="search_eq_istatus" option="class='layui-input'" nshow="0"/>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">业务编号</label>
            <div class="layui-input-inline">
                <input type="text" name="search_like_sbizno" placeholder="" autocomplete="off" class="layui-input"/>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">承办人</label>
            <div class="layui-input-inline">
                <input type="text" name="search_like_saddoperator" placeholder="" autocomplete="off" class="layui-input"/>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">日期</label>
            <div class="layui-input-inline">
                <input type="text" id="dadddatestart" name="search_gtetime_dadddate" class="layui-input" placeholder="开始日期" readonly/>
            </div>
            <div class="layui-form-mid layui-word-aux">-</div>
            <div class="layui-input-inline">
                <input type="text" id="dadddateend" name="search_ltetime_dadddate" class="layui-input" placeholder="截止日期" readonly/>
            </div>
        </div>

    </div>
</form>
<table class="layui-hide" id="stable" lay-filter="stable" lay-size="sm"></table>

<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    var g_istatus = ${wf:WfStatus()};
    var g_ibiztype = ${wf:WfBizType()};
    layui.use(['table','layer','laydate','element'],function(){
        var laydate = layui.laydate;
        var element = layui.element;
        laydate.render({
            elem: '#dadddatestart',
            trigger: 'click'
        });
        laydate.render({
            elem: '#dadddateend',
            trigger: 'click'
        });
        jj.table =layui.table;
        jj.url="${ctx}/wf/workflow/list.json";

        jj.cols= [[
//            {type:'checkbox'}
            {field:'sno', title: '流程编号',width:120,sort: true,align:'left'}
            ,{field:'ibiztype', title: '业务类型',width:100,sort: true,align:'left',templet:function (d) {
                return g_ibiztype[d.ibiztype];
            }}
            ,{field:'sbizno', title: '业务编号',width:140,sort: true,align:'left'}
            ,{field:'sname', title: '流程名称',width:190,sort: true,align:'left'}
            ,{field:'process', title: '流程进度',width:200,align:'center',templet:'#process'}
            ,{field:'saddoperator', title: '承办人',width:120,sort: true,align:'left'}
            ,{field:'istatus', title: '状态',width:120,sort: true,align:'left',templet:function (d) {
                return g_istatus[d.istatus];
             }}
            ,{field:'dadddate', title: '发起时间',width:170,sort: true,align:'left'}
            ,{align:'left',title:'操作', toolbar: '#barDemo',width:150,fixed:'right'} //这里的toolbar值是模板元素的选择器

        ]];

        jj.render({
            initSort:{
                field:"istatus",
                type:"asc"
            },
            cellMinWidth:80,
            page: true
        });
        jj.detail=function (obj) {
            layer.open({
                type: 2,
                title:"工作流管理",
                area: ['90%', '90%'],
                content: '${ctx}/wf/workflow/index.shtml?id='+obj.id+'&ischeck=false',
                btn: ['关闭'],
                cancel: function(index){}
            });
        };

        jj.print = function (obj) {
            layer.open({
                type: 2,
                title:"工作流管理",
                area: ['90%', '90%'],
                content: '${ctx}/wf/workflow/index.shtml?id='+obj.id+'&ischeck=false',
                btn: ['打印','关闭'],
                yes:function(index,layero){
                    window.open('${ctx}/wf/workflow/print.shtml?id='+obj.id,'_blank');
                },
                cancel: function(index){}
            });
        }

    });

    function show_shopm(t){
        var row=$(t).attr('data-ssteplistjson'); //获取显示内容
        console.log(row);
        //小tips
        layer.tips('<ul class="layui-timeline">'+row+'</ul>',t,{
            tips:[4,'#ffffff'],
            time:4000
        })
    }
</script>
<script type="text/html" id="process">
    <div class="layui-progress" lay-showpercent="true" style="margin: 8px 0 0 0;">
        <a data-ssteplistjson='{{d.ssteplistjson}}' onmouseover="show_shopm(this)" >
            {{# if(d.istatus == 1){ }}
                <div class="layui-progress-bar processColor" style="width:{{d.iprocess}}%;position: relative;">
                    <span>{{d.iprocess}}%</span>
                </div>
            {{# }else if(d.istatus == 3){ }}
                <div class="layui-progress-bar noColor" style="width:{{d.iprocess}}%;position: relative;">
                    <span>{{d.iprocess}}%</span>
                </div>
            {{# }else { }}
                <div class="layui-progress-bar" style="width:{{d.iprocess}}%;position: relative;">
                    <span>{{d.iprocess}}%</span>
                </div>
            {{# } }}
        </a>
    </div>
</script>
<script type="text/html" id="barDemo">
    <div class="layui-btn-group" data-rowid="{{d.id}}">
        <jj:listbtn name="查看" event="detail" type="a" purview=""/>

        {{# if(d.istatus === 2){ }}
            <jj:listbtn name="打印" event="print" type="a" purview="workflow:print"/>
        {{# } }}
    </div>
</script>
</body>
</html>
