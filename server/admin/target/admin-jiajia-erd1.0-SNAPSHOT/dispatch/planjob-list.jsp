<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<html>
<head>
    <title>定时任务管理</title>
    <meta name="decorator" content="jj"/>
</head>

<body>
<form class="layui-form" id="searchForm">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">任务名称</label>
            <div class="layui-input-inline">
                <input type="text" name="search_like_sname" placeholder="" autocomplete="off"
                       class="layui-input"/>
            </div>
        </div>
    </div>
</form>
<table class="layui-hide" id="stable" lay-filter="stable"></table>
<script>
    var g_tasktype=${ds:PeriodTaskType()};
    layui.use(['table', 'layer'], function () {

        jj.table = layui.table;
        var form = layui.form;
        jj.url = "${ctx}/jj/planjob/list.json";
        jj.cols = [[
            {type: 'checkbox'}
            , {field: 'sversion', title: '执行版本', sort: true,width:150}
            , {field: 'sname', title: '任务名称', sort: true,width:250}
            , {field: 'sclsname', title: '执行类', sort: true}
            , {
                field: 'itasktype', title: '类型', sort: true, templet: function (d) {
                    return g_tasktype[d.itasktype];
                }
            }
            , {
                field: 'dplanexectime', title: '计划执行日期', sort: true,
                templet: function (d) {
                    return d.dplanexectime;
                }
            }
            , {field: 'dexectime', title: '执行日期', sort: true,
                    templet: function (d) {
                    return d.bisover==1?d.dexectime:"";
                }}
            , {field: 'bissuccess', title: '状态', sort: true,
                templet: function (d) {
                    return d.bisdelete==1?"已删除":(d.bissuccess==1?"成功执行":"执行失败:"+d.sremark);
                }}
            , {field: 'bisfailstop', title: '重试状态', sort: true,
                templet: function (d) {
                    return d.bisfailstop==1?"一次性任务":("尝试"+d.ifailcount+"次,最大"+(d.iresendcount)+"次");
                }}

            , {fixed: 'right', align: 'center', toolbar: '#barDemo'} //这里的toolbar值是模板元素的选择器
        ]];



        jj.width = 500;
        jj.height = 530;

        jj.render({
            initSort: {
                field: "dplanexectime",
                type: "desc"
            },
            cellMinWidth: 80,
            page: true
        });
        jj.detail = function (obj) {
            jj.xview({
                title: '查看合同详情',
                area: ['1200px', '80%'],
                content: "${ctx}/jj/planjob/detail.shtml?id=" + obj.id
            });
        }
        jj.reexec=function(d) {

            layer.prompt({title: '请问您需要再几分钟后执行该任务?', formType: 0,value:0},function(text, index){
                if(tt.isNumber(text)){
                    jj.post("${ctx}/jj/planjob/reexec.json",{id:d.id,minute:text},function (rs) {
                        if(rs.success){
                            jj.refresh();
                            layer.close(index);
                            if(rs.msg){
                                jj.msg(rs.msg);
                            }
                            else {
                                jj.msg("操作成功!");
                            }

                        }
                        else {
                            jj.msg(rs.msg,5,3);
                        }
                    });
                }
                else
                    jj.error("请输入数字!");

            });
        }


    });
</script>
<script type="text/html" id="barDemo">
    <div class="layui-btn-group" data-rowid="{{d.id}}">

    <jj:listbtn name="查看" event="detail"/>
    {{# if(d.bisover ==1 ){ }}
        <jj:listbtn name="重新执行" event="reexec" purview="planjob:edit"/>
         <jj:listbtn name="删除" event="delete" purview="planjob:delete"/>
    {{# }
    }}
    </div>
</script>
<!-- 模态框 -->
<script type="text/html" class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">定时任务</h4>
            </div>
            <div class="modal-body">
                <form id="planjob" action="${ctx}/dt/planjob/reexec.json" method="POST">
                    <input type='hidden' name='id' id="jobid" value="" />
                    <span style="font-family:microsoft YaHei;">计划在
	            		<input type="text" id="minute" name="minute" class="form-control required" style="ime-mode:disabled;margin: 0px 5px 0px 5px; display:inline; width:170px;font-family:microsoft YaHei;font-size: 12px;" onkeydown="if(event.keyCode==13)event.keyCode=9" onkeypress="if ((event.keyCode<48 || event.keyCode>57)) event.returnValue=false" placeholder="请输入分钟数，默认为0" />
	            		分钟后执行任务</span>
                </form>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary" onclick="onSubmit();">确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal" >取消</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</script>
</body>
</html>