<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp"%>
<%@ taglib prefix="contract" uri="http://www.frogsing.com/tags/contract" %>
<%@ taglib prefix="mv" uri="http://www.frogsing.com/tags/frogsing" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="decorator" content="jj"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>结算单</title>
    <style>
        .layui-table-body{
            min-height: auto;
        }

    </style>
    <script type="text/javascript">
        $(function(){
            layui.use(['layer', 'form','element','table'], function(){
                var element = layui.element;
                var layer = layui.layer
                    ,form = layui.form;
                var table = layui.table;
                //监听提交
                form.on('submit(*)', function(data){
                    return true;
                });
            });
        });

        var _docurnum = "";
        var _bool = true;
        var bisadd = true;
        var index;
        $().ready(function () {
            $("#addDetail").click(function(){
                bisadd = true;
                _docurnum = "";
                index = layer.open({
                    id:"addSettleDetail",
                    type: 2,
                    title: '添加明细',
                    area: ['600px', '400px'],
                    content: ['${ctx}/project/projectsettle-detailadd.jsp', 'no'] //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
                });
            });
            $("#pledges").delegate('a', 'click', function () {
                if ($(this).data("flag") == "remove") {
                    $(this).parent().parent().remove();
                    cellAmount();
                }
            });
        });

        function doEditDetail(id) {
            bisadd = false;
            _docurnum = id;
            layer.open({
                type: 2,
                title: '修改明细',
                area: ['600px', '400px'],
                content: ['${ctx}/project/projectsettle-detailadd.jsp', 'no'] //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
            });
        }

        function doInsertIndentureDetail(htmls, add, num) {
            if (add) {
                $("#pledges tbody").append("<tr data-flag=\'" + num + "\'>" + htmls + "</tr>");
            } else {
                $("#pledges").find("tr[data-flag='" + num + "']").html(htmls);
            }
            var layer = layui.layer;
            if (top.layer)
                layer = top.layer;
            cellAmount();
            //layer.close(index);
        }
        
        function cellAmount() {
            var famount=0, fdiscount=0;

            $("#pledges tbody").find("tr").each(function(){
                famount=famount+parseFloat($(this).find("input[data-name='fsettleamount']").val());
                fdiscount=fdiscount+parseFloat($(this).find("input[data-name='fdiscount']").val());
            });

            $("#famount").val(getRoundValue(parseFloat(famount),2));//采购价总额
            $("#fdiscount").val(getRoundValue(parseFloat(fdiscount),2));//销售总额
        }
    </script>
</head>
<body>
<form action="${ctx}/projectsettle/save.json" method="post" id="formx" class="layui-form" lay-size="sm" lay-filter="formDemo">
    <input type="hidden" name="id" value=""/>
    <input type="hidden" name="sprojectid" value="${sprojectid}"/>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">结算总额</label>
            <div class="layui-input-inline">
                <input type="text" id="famount" name="famount" value="" placeholder="" class="layui-input" autocomplete="off" readonly/>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">优惠总额 </label>
            <div class="layui-input-inline">
                <input type="text" name="fdiscount" id="fdiscount" value="" placeholder="" class="layui-input" autocomplete="off"  readonly/>
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">说明 </label>
        <div class="layui-input-block">
            <textarea placeholder="请输入结算单说明" name="sremark" class="layui-textarea"></textarea>
        </div>
    </div>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;font-size: 12px;">
        <legend>结算明细<a id="addDetail" class="layui-btn layui-btn-sm" style="margin-left: 20px;">添加</a></legend>
    </fieldset>
    <table class="layui-table" id="pledges" lay-size="sm">
        <colgroup>
            <col width="15%">
            <col width="10%">
            <col width="10%">
            <%--<col width="10%">--%>
            <col width="20%">
            <col>
            <col width="10%">
        </colgroup>
        <thead>
        <tr>
            <th >科目</th>
            <th >结算金额(元)</th>
            <th >优惠金额(元)</th>
            <%--<th >应收金额(元)</th>--%>
            <th >结算周期</th>
            <th >说明</th>
            <th >操作</th>
        </tr>
        </thead>
        <tbody>

        </tbody>
    </table>
</form>
</body>
</html>
