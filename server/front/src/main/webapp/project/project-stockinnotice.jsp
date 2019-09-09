]<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<%@ taglib prefix="contract" uri="http://www.frogsing.com/tags/contract" %>
<html>
<head>
 <title>入库通知单管理</title>
 <meta name="decorator" content="jj"/>
</head>
<body >
<div class="search">
 <form  class="layui-form" id="searchForm">

 </form>
</div>


<table class="layui-hide" id="stable" lay-filter="stable"></table>

<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    var g_StockInStatus = ${contract:StockInStatus()};
    layui.use(['table','layer'],function(){
        jj.table =layui.table;
        var form = layui.form;
        jj.url="${ctx}/stockinnotice/project-list.json?sprojectid=${data.id}";
        jj.xurl="${ctx}/jj/stockinnotice/";
        jj.cols= [[
            {field:'sorderno', title: '编号',sort: true}
            ,{field: 'istatus', title: '状态', sort: true, templet: function (d) {
                    return g_StockInStatus[d.istatus];
                }
            }
            ,{field:'id', title: '项目编号',sort: true,templet:function (d) {

                    return d.sprojectcode;
                }}
            ,{field:'id', title: '货主',minWidth:150,sort: true,templet:function (d) {
                    return d.member.scnname;
                }}
            ,{field:'id', title: '供应商',minWidth:150,sort: true,templet:function (d) {
                    return d.owner.scnname;
                }}
            ,{field:'id', title: '通知仓库',minWidth:150,sort: true,templet:function (d) {
                    return d.warehouse.swarehousename;
                }}
            ,{field:'dorderdate', title: '日期',sort: true}
            //,{field:'bischecked', title: '审核',sort: true,templet:"#bischeckedtpl"}
            //,{field:'bisfinish', title: '入库完成',sort: true,templet:"#bisfinishtpl"}
            ,{fixed: 'right', align:'center', toolbar: '#barDemo',width:200} //这里的toolbar值是模板元素的选择器
        ]];

        jj.limit=1000;
        jj.showtoolbar=false;
        jj.render({
            initSort:{
                field:"sorderno",
                type:"desc"
            },
            cellMinWidth:120,
            page: false
        });
        jj.check=function(obj){
            layer.prompt({title: '请输入审核意见', formType: 2},function(text, index){
                jj.post("${ctx}/stockinnotice/check.json",{id:obj.id,checkok:true,sinfo:text},function (rs) {
                    jj.closeAll('loading');
                    if(rs.success){
                        if(rs.msg){
                            jj.msg(rs.msg);
                        }
                        else {
                            jj.msg("操作成功!");
                        }
                        layer.close(index);
                        jj.refresh();
                    }
                    else {
                        jj.msg(rs.msg,5,3);
                    }

                });
            });
        };
        jj.reject=function(obj){
            layer.prompt({title: '请输入拒绝理由', formType: 2},function(text, index){
                jj.post("${ctx}/stockinnotice/check.json",{id:obj.id,checkok:false,sinfo:text},function (rs) {
                    jj.closeAll('loading');
                    if(rs.success){
                        if(rs.msg){
                            jj.msg(rs.msg);
                        }
                        else {
                            jj.msg("操作成功!");
                        }
                        layer.close(index);
                        jj.refresh();
                    }
                    else {
                        jj.msg(rs.msg,5,3);
                        return false;
                    }

                });
            });
        };
    });

</script>
<script type="text/html" id="barDemo">
 <div class="layui-btn-group" data-rowid="{{d.id}}">
   <jj:listbtn name="查看" event="detail"/>
  {{#  if(d.istatus==20){ }}
   <jj:listbtn name="审核通过" event="check"/>
   <jj:listbtn name="拒绝" event="reject"/>
  {{#  } }}
 </div>
</script>

<script type="text/html" id="bischeckedtpl">
 <!-- 这里的 checked 的状态只是演示 -->
 <input type="checkbox" name="bischecked" value="{{d.bischecked}}" lay-skin="switch" lay-text="是|否" disabled=""  {{ d.bischecked == 1 ? "checked" : "" }}/>
</script>
<script type="text/html" id="bisfinishtpl">
 <!-- 这里的 checked 的状态只是演示 -->
 <input type="checkbox" name="bisfinish" value="{{d.bisfinish}}" lay-skin="switch" lay-text="是|否" disabled=""  {{ d.bisfinish == 1 ? "checked" : "" }}/>
</script>

</body>
</html>
