<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="decorator" charset="" content="jj">
    <script type="text/javascript">

        layui.use(['layer', 'form','element','upload'], function () {
            var form = layui.form;
            var upload = layui.upload;
            //监听提交
            form.on('submit(formDemo)', function (data) {

                var errorhtmls = $("#errorTemplete").html();
                if(errorhtmls.length>0){
                    jj.error("请先处理失败的明细，在确认提交！")
                    return;
                }

                var htmls = $("#successTemplete").html();
                htmls=htmls.replace(/display:none/g,'');
                window.parent.doInsertExcelDetail(htmls);
            });

            //绑定原始文件域
            upload.render({
                elem: '#excel'
                ,exts:'xls|xlsx'
                ,url: '${ctx}/project/readExcel.json'
                ,dataType:"html"//返回整合HTML
                ,before: function(obj){
                    jj.loading(); //上传loading
                }
                ,done: function(res){
                   if(!res.success){
                       jj.error(res.msg);
                       return;
                   }else{
                       layer.msg(res.msg);
                       genRowData(res.obj);
                   }
                    jj.closeAll('loading'); //关闭loading
                }
                ,error: function(index, upload){
                    jj.closeAll('loading'); //关闭loading
                }
            });
        });

        $().ready(function () {


        });

        function doclose() {
            var index=parent.layer.getFrameIndex(window.name); //获取当前窗口的name
            parent.layer.close(index);		//关闭窗口
        }
        
        
        function genRowData(jsonObj) {
            var indentureSuccessRows = "";
            var indentureErrorRows = "";
            for(var i=0;i<jsonObj.length;i++){
                if(jsonObj[i].sproducer!="error"){
                    var num = i;
                    indentureSuccessRows += "<tr data-flag='"+i+"'>";
                    indentureSuccessRows += "<input type=\"hidden\" name=\"num\" id=\"num_" + num + "\" value=\"" + num + "\"/>"
                        + "<input type=\"hidden\" name=\"sid\" id=\"id_" + num + "\" value=\"\"/>"
                        + "<input type=\"hidden\" data-name=\"scommodityid\" name=\"details["+num+"].scommodityid\" id=\"scommodityid_" + num + "\" value=\"" + jsonObj[i].scommodityid + "\"/>"
                        + "<input type=\"hidden\" data-name=\"svarietyname\" name=\"details["+num+"].svarietyname\" id=\"svarietyname_" + num + "\" value=\"" + jsonObj[i].svarietyname + "\"/>"
                        + "<input type=\"hidden\" data-name=\"scommodityname\" name=\"details["+num+"].scommodityname\" id=\"scommodityname_" + num + "\" value=\"" + jsonObj[i].scommodityname + "\"/>"
                        + "<input type=\"hidden\" data-name=\"sspec\" name=\"details["+num+"].sspec\" id=\"sspec_" + num + "\" value=\"" + jsonObj[i].sspec + "\"/>"
                        + "<input type=\"hidden\" data-name=\"sproducer\" name=\"details["+num+"].sproducer\" id=\"sproducer_" + num + "\" value=\"" + jsonObj[i].sproducer + "\"/>"
                        + "<input type=\"hidden\" data-name=\"shostname\" name=\"details["+num+"].shostname\" id=\"shostname_" + num + "\" value=\"" + jsonObj[i].shostname + "\"/>"
                        + "<input type=\"hidden\" data-name=\"shostmodel\" name=\"details["+num+"].shostmodel\" id=\"shostmodel_" + num + "\" value=\"" + jsonObj[i].shostmodel + "\"/>"
                        + "<input type=\"hidden\" data-name=\"shostbrand\" name=\"details["+num+"].shostbrand\" id=\"shostbrand_" + num + "\" value=\"" + jsonObj[i].shostbrand + "\"/>"
                        + "<input type=\"hidden\" data-name=\"fweight\" name=\"details["+num+"].fweight\" id=\"fweight_" + num + "\" value=\"" + jsonObj[i].fweight + "\"/>"
                        + "<input type=\"hidden\" data-name=\"fbuyprice\" name=\"details["+num+"].fbuyprice\" id=\"fbuyprice_" + num + "\" value=\"" + jsonObj[i].fbuyprice + "\"/>"
                        + "<input type=\"hidden\" data-name=\"fbuyamount\" name=\"details["+num+"].fbuyamount\" id=\"fbuyamount_" + num + "\" value=\"" + jsonObj[i].fbuyamount + "\"/>"
                        + "<input type=\"hidden\" data-name=\"fsaleprice\" name=\"details["+num+"].fsaleprice\" id=\"fsaleprice_" + num + "\" value=\"" + jsonObj[i].fsaleprice + "\"/>"
                        + "<input type=\"hidden\" data-name=\"fsaleamount\" name=\"details["+num+"].fsaleamount\" id=\"fsaleamount_" + num + "\" value=\"" + jsonObj[i].fsaleamount + "\"/>"
                        + "<input type=\"hidden\" data-name=\"fproxyprice\" name=\"details["+num+"].fproxyprice\" id=\"fproxyprice_" + num + "\" value=\"" + jsonObj[i].fproxyprice + "\"/>"
                        + "<input type=\"hidden\" data-name=\"fproxyamount\" name=\"details["+num+"].fproxyamount\" id=\"fproxyamount_" + num + "\" value=\"" + jsonObj[i].fproxyamount + "\"/>"
                        + "<input type=\"hidden\" data-name=\"sweightunit\" name=\"details["+num+"].sweightunit\" id=\"sweightunit_" + num + "\" value=\"" + jsonObj[i].sweightunit + "\"/>"
                        + "<input type=\"hidden\" data-name=\"sremark\" name=\"details["+num+"].sremark\" id=\"sremark_" + num + "\" value=\"" + jsonObj[i].sremark + "\"/>"
                        + "<input type=\"hidden\" data-name=\"hashcode\" name=\"hashcode\" id=\"hashcode_" + num + "\" value=\"" + jsonObj[i].hash + "\"/>"

                    indentureSuccessRows += "<td class=\"tc\">" + jsonObj[i].svarietyname + "</td>";
                    indentureSuccessRows += "<td class=\"tc\">" + jsonObj[i].scommodityname + "</td>";
                    indentureSuccessRows += "<td class=\"tc\">" + jsonObj[i].sspec+ "</td>";
                    indentureSuccessRows += "<td class=\"tc\">" + jsonObj[i].sproducer + "</td>";
//                    indentureSuccessRows += "<td class=\"tc\">" + jsonObj[i].shostname + "、" + jsonObj[i].shostmodel + "、" + jsonObj[i].shostbrand + "</td>";
                    indentureSuccessRows += "<td class=\"tc\">" + jsonObj[i].fweight +"&nbsp;"+ jsonObj[i].sweightunit+"</td>";
                    indentureSuccessRows += "<td class=\"tc\">" + fmt(getRoundValue(parseFloat(jsonObj[i].fbuyprice), 2) * 1, "#,##0.00") + "</td>";
                    indentureSuccessRows += "<td class=\"tc\" data-name=\"fsaleprice\">" + fmt(getRoundValue(parseFloat(jsonObj[i].fsaleprice), 2) * 1, "#,##0.00") + "</td>";//销售单价
                    indentureSuccessRows += "<td class=\"tc\">" + fmt(getRoundValue(parseFloat(jsonObj[i].fproxyprice), 2) * 1, "#,##0.00") + "</td>";//代理单价
                    indentureSuccessRows += "<td class=\"tc\">" + jsonObj[i].sremark + "</td>";//代理单价
                    indentureSuccessRows += "<td style=\"display:none\" class=\"tc\"><a  href=\"javascript:void(-1)\" class=\"layui-abtn\" onclick=\"doEditDetail('" + num + "');\">编辑</a><a  class=\"layui-abtn\" href=\"javascript:void(-1)\" data-flag='remove'>删除</a></td>";
                    indentureSuccessRows +="</tr>"
                }else{
                    indentureErrorRows += "<tr data-flag='"+i+1+"'>";
                    indentureErrorRows += "<td class=\"tc\">" + jsonObj[i].svarietyname + "</td>";
                    indentureErrorRows += "<td class=\"tc\">" + jsonObj[i].scommodityname + "</td>";
                    indentureErrorRows += "<td class=\"tc\">" + jsonObj[i].sspec+ "</td>";
                    indentureErrorRows += "<td class=\"tc\">" + jsonObj[i].sremark + "</td>";
                }

            }
            $("#successTemplete").html(indentureSuccessRows);
            $("#errorTemplete").html(indentureErrorRows);
        }

    </script>
</head>
<body>
<div class="mbody">
    <mw:msg/>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 10px;">
        <legend>请选择Excel文件
            <input type="file" name="excel" id="excel">&nbsp;<a target="_blank" style="color: #1d74e0;text-decoration:underline;"href="<cs:SysParaType imgurl="1" op="syspara"/>/dinner/model/项目资源导入模板.xls">下载模版</a>
        </legend>
    </fieldset>


    <div class="layui-tab layui-tab-card">
        <ul class="layui-tab-title">
            <li class="layui-this">成功的明细</li>
            <li>失败的明细</li>
        </ul>
        <div class="layui-tab-content" style="height: 100%;">
            <div class="layui-tab-item layui-show" style="overflow-x: auto; overflow-y: auto;height:200px;width:1050px;">
                <table class="layui-table" lay-size="sm" >
                    <colgroup>
                        <col>
                        <col width="9%">
                        <col width="9%">
                        <col width="9%">
                        <col width="13%">
                        <%--<col width="9%">--%>
                        <col width="11%">
                        <col width="11%">
                        <col width="11%">
                        <col width="10%">
                        <col width="9%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th >所属品种名称</th>
                        <th >物资名称</th>
                        <th >规格型号</th>
                        <th >生产厂商</th>
                        <%--<th >所属设备信息</th>--%>
                        <th >数量</th>
                        <th >采购单价(元)</th>
                        <th >销售单价(元)</th>
                        <th >代理单价(元)</th>
                        <th >交货周期</th>
                        <%--<th >操作</th>--%>
                    </tr>
                    </thead>
                    <tbody id="successTemplete">

                    </tbody>
                </table>

            </div>
            <div class="layui-tab-item" style="overflow-x: auto; overflow-y: auto; height: 280px; width:1050px;">
                <table class="layui-table" lay-size="sm">
                    <colgroup>
                        <col width="15%">
                        <col width="9%">
                        <col width="9%">
                        <col width="82%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th >所属品种名称</th>
                        <th >物资名称</th>
                        <th >规格型号</th>
                        <th >错误信息</th>
                    </tr>
                    </thead>
                    <tbody id="errorTemplete"></tbody>
                </table>
            </div>
        </div>
    </div>




    <div class="layui-form-item">
        <div class="layui-input-block" style="margin-left: 400px;">
            <button class="layui-btn" lay-submit lay-filter="formDemo">确定</button>
            <button type="button" class="layui-btn layui-btn-primary" onclick="doclose()">取消</button>
        </div>
    </div>
</div>
</body>
</html>