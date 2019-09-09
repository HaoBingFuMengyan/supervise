<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <link href="${ctx}/static/bigautocomplete/jquery.bigautocomplete.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/layui-v2.4.2/layui/css/layui.css" type="text/css" rel="stylesheet"/>
    <script src="${ctx}/static/common/common.js" type="text/javascript"></script>
    <script src="${ctx}/static/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/bigautocomplete/jquery.bigautocomplete.js" type="text/javascript"></script>
    <script src="${ctx}/static/layui-v2.4.2/layui/layui.js" type="text/javascript"></script>

    <style>
        .layui-textarea{
            min-height: 80px;
            width: 100%;
        }
    </style>
    <script type="text/javascript">
        var num = "";
        var beforenum = "";
        var g_ctx = '${ctx}';


        layui.use(['form','laydate'], function () {
            var laydate = layui.laydate;

            //执行一个laydate实例
            laydate.render({
                elem: '#searchdate' //指定元素
                ,range: '~'
                ,done: function(value, date, endDate){
                    $("#dstart").val(date.year+"-"+date.month+"-"+date.date);
                    $("#dend").val(endDate.year+"-"+endDate.month+"-"+endDate.date);
                }
            });

            var form = layui.form;
            //监听提交
            form.on('submit(formDemo)', function (data) {
                var add = false;
                if (isEmpty(num)) {//新增
                    for (var int = 0; int < 10; int++) {
                        num += Math.floor(Math.random() * 10);
                    }
                    add = true;
                }

                var indentureRows = "";
                var ssubject = $("#ssubject").val();
                var sid = $("#sid").val();
                var fsettleamount = $("#fsettleamount").val();
                var fdiscount = $("#fdiscount").val();

                var dstart = $("#dstart").val();
                var dend = $("#dend").val();
                var searchdate = $("#searchdate").val();
                var sremark = $("#sremark").val();

                indentureRows += "<td><input type=\"hidden\" name=\"num\" id=\"num_" + num + "\" value=\"" + num + "\"/>"
                    + "<input type=\"hidden\" name=\"sid\" id=\"id_" + num + "\" value=\"" + sid + "\"/>"
                    + "<input type=\"hidden\" data-name=\"ssubject\" name=\"inputmap["+num+"].ssubject\" id=\"ssubject_" + num + "\" value=\"" + ssubject + "\"/>"
                    + "<input type=\"hidden\" data-name=\"fsettleamount\" name=\"inputmap["+num+"].fsettleamount\" id=\"fsettleamount_" + num + "\" value=\"" + fsettleamount + "\"/>"
                    + "<input type=\"hidden\" data-name=\"fdiscount\" name=\"inputmap["+num+"].fdiscount\" id=\"fdiscount_" + num + "\" value=\"" + fdiscount + "\"/>"
                    + "<input type=\"hidden\" data-name=\"dstart\" name=\"inputmap["+num+"].dstart\" id=\"dstart_" + num + "\" value=\"" + dstart + "\"/>"
                    + "<input type=\"hidden\" data-name=\"dend\" name=\"inputmap["+num+"].dend\" id=\"dend_" + num + "\" value=\"" + dend + "\"/>"
                    + "<input type=\"hidden\" data-name=\"showdate\" name=\"\" id=\"showdate_" + num + "\" value=\"" + searchdate + "\"/>"
                    + "<input type=\"hidden\" data-name=\"sremark\" name=\"inputmap["+num+"].sremark\" id=\"sremark_" + num + "\" value=\"" + sremark + "\"/>"
                    + ssubject + "</td>";
                indentureRows += "<td>" + fsettleamount + "</td>";
                indentureRows += "<td>" + fdiscount + "</td>";
                indentureRows += "<td>" + searchdate+ "</td>";
                indentureRows += "<td>" + sremark + "</td>";
                indentureRows += "<td class=\"tc\"><a  href=\"javascript:void(-1)\" onclick=\"doEditDetail('" + num + "');\">编辑</a><a  href=\"javascript:void(-1)\" data-flag='remove'>删除</a></td>";
                window.parent.doInsertIndentureDetail(indentureRows, window.parent.bisadd, num);
                var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                parent.layer.close(index);
                return false;
            });

        });

        $().ready(function () {
            num = parent._docurnum;

            //新增明细
            if (isEmpty(num)) {

            } else {//修改明细
                var objTR = $("tr[data-flag='" + num + "']", window.parent.document);
                $("#sid").val(objTR.find("input[name='sid']").val());
                $("#ssubject").val(objTR.find("input[data-name='ssubject']").val());
                $("#fsettleamount").val(objTR.find("input[data-name='fsettleamount']").val());
                $("#fdiscount").val(objTR.find("input[data-name='fdiscount']").val());
                $("#dstart").val(objTR.find("input[data-name='dstart']").val());
                $("#dend").val(objTR.find("input[data-name='dend']").val());
                $("#sremark").val(objTR.find("input[data-name='sremark']").val());
                $("#searchdate").val(objTR.find("input[data-name='showdate']").val());

            }

        });


    </script>
</head>
<body>
<form action="" method="post" id="formx" class="layui-form">
    <input type="hidden" name="id" id="sid" value=""/>
    <div class="layui-form-item">
            <label class="layui-form-label">结算科目</label>
            <div class="layui-input-block">
                <project:ProjectSettleSubject op="select" option=" class='layui-input required' " name="ssubject"/>
            </div>
        </div>
    <div class="layui-form-item">
            <label class="layui-form-label">结算金额 </label>
            <div class="layui-input-block">
                <input type="text" id="fsettleamount" name="fsettleamount" value="" placeholder="(必填项)" required
                       lay-verify="required|number" class="layui-input" autocomplete="off"/>
            </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">优惠金额 </label>
        <div class="layui-input-block">
            <input type="text" id="fdiscount" name="fdiscount" value="" placeholder="" required
                   lay-verify="number" class="layui-input" autocomplete="off"/>
            </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">结算周期 </label>
        <div class="layui-input-block">
            <input type="hidden" name="dstart" id="dstart"/>
            <input type="hidden" name="dend" id="dend"/>
            <input type="text" name="searchdate" id="searchdate" autocomplete="off" class="layui-input" lay-key="7">
        </div>
    </div>

    <div class="layui-form-item">
            <label class="layui-form-label">说明</label>
            <div class="layui-input-block">
                <textarea id="sremark" placeholder="请输入结算单说明" name="sremark" class="layui-textarea"></textarea>
            </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo">提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>

</form>
</body>
</html>