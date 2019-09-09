<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="decorator" charset="" content="jj">

    <script type="text/javascript">
        var num = "";
        var beforenum = "";
        var g_ctx = '${ctx}';

        layui.use('form', function () {
            var form = layui.form;
            //监听提交
            /*form.on('submit(formDemo)', function (data) {

            });*/

            jj.validate("#formx",{
                submitHandler: function(form){
                    var add = false;
                    if (isEmpty(num)) {//新增
                        for (var int = 0; int < 10; int++) {
                            num += Math.floor(Math.random() * 10);
                        }
                        add = true;
                    }

                    var indentureRows = ""
                    var scommodityid = $("#scommodityid").val();
                    var sid = $("#sid").val();
                    var svarietyname = $("#svarietyname").val();
                    var scommodityname = $("#scommodityname").val();
                    var sspec = $("#sspec").val();
                    var sproducer = $("#sproducer").val();
                    var shostname = $("#shostname").val();
                    var shostmodel = $("#shostmodel").val();
                    var shostbrand = $("#shostbrand").val();
                    var fweight = $("#fweight").val();
                    /*var fbuyprice = $("#fbuyprice").val();
                    var fbuyamount = getRoundValue(parseFloat(fweight)*parseFloat(fbuyprice),2)*1;
                    var fsaleprice = $("#fsaleprice").val();
                    var fsaleamount = getRoundValue(parseFloat(fweight)*parseFloat(fsaleprice),2)*1;*/
                    var fproxyprice = $("#fproxyprice").val();
                    var fproxyamount = getRoundValue(parseFloat(fweight)*parseFloat(fproxyprice),2)*1;
                    var sweightunit = $("#sweightunit").val();
                    var sremark = $("#sremark").val();
                    //indentureRows+="<tr data-flag=\'"+num+"\'>";
                    var hash = scommodityname + "," + sspec + "," + sproducer + "," + shostname + "," + shostmodel + "," + shostbrand;
                    if(fproxyprice==0){
                        layer.msg("代理单价不能为0")
                        return false;
                    }
                    if (window.parent.checkhad(num, hash)) {
                        indentureRows += "<td class=\"tc\">" + svarietyname + "</td>";
                        indentureRows += "<td class=\"tc\"><input type=\"hidden\" name=\"num\" id=\"num_" + num + "\" value=\"" + num + "\"/>"
                            + "<input type=\"hidden\" name=\"sid\" id=\"id_" + num + "\" value=\"" + sid + "\"/>"
                            + "<input type=\"hidden\" data-name=\"scommodityid\" name=\"details["+num+"].scommodityid\" id=\"scommodityid_" + num + "\" value=\"" + scommodityid + "\"/>"
                            + "<input type=\"hidden\" data-name=\"svarietyname\" name=\"details["+num+"].svarietyname\" id=\"svarietyname_" + num + "\" value=\"" + svarietyname + "\"/>"
                            + "<input type=\"hidden\" data-name=\"scommodityname\" name=\"details["+num+"].scommodityname\" id=\"scommodityname_" + num + "\" value=\"" + scommodityname + "\"/>"
                            + "<input type=\"hidden\" data-name=\"sspec\" name=\"details["+num+"].sspec\" id=\"sspec_" + num + "\" value=\"" + sspec + "\"/>"
                            + "<input type=\"hidden\" data-name=\"sproducer\" name=\"details["+num+"].sproducer\" id=\"sproducer_" + num + "\" value=\"" + sproducer + "\"/>"
                            + "<input type=\"hidden\" data-name=\"shostname\" name=\"details["+num+"].shostname\" id=\"shostname_" + num + "\" value=\"" + shostname + "\"/>"
                            + "<input type=\"hidden\" data-name=\"shostmodel\" name=\"details["+num+"].shostmodel\" id=\"shostmodel_" + num + "\" value=\"" + shostmodel + "\"/>"
                            + "<input type=\"hidden\" data-name=\"shostbrand\" name=\"details["+num+"].shostbrand\" id=\"shostbrand_" + num + "\" value=\"" + shostbrand + "\"/>"
                            + "<input type=\"hidden\" data-name=\"fweight\" name=\"details["+num+"].fweight\" id=\"fweight_" + num + "\" value=\"" + fweight + "\"/>"
                            //+ "<input type=\"hidden\" data-name=\"fbuyprice\" name=\"details["+num+"].fbuyprice\" id=\"fbuyprice_" + num + "\" value=\"" + fbuyprice + "\"/>"
                            //+ "<input type=\"hidden\" data-name=\"fbuyamount\" name=\"details["+num+"].fbuyamount\" id=\"fbuyamount_" + num + "\" value=\"" + fbuyamount + "\"/>"
                            //+ "<input type=\"hidden\" data-name=\"fsaleprice\" name=\"details["+num+"].fsaleprice\" id=\"fsaleprice_" + num + "\" value=\"" + fsaleprice + "\"/>"
                            //+ "<input type=\"hidden\" data-name=\"fsaleamount\" name=\"details["+num+"].fsaleamount\" id=\"fsaleamount_" + num + "\" value=\"" + fsaleamount + "\"/>"
                            + "<input type=\"hidden\" data-name=\"fproxyprice\" name=\"details["+num+"].fproxyprice\" id=\"fproxyprice_" + num + "\" value=\"" + fproxyprice + "\"/>"
                            + "<input type=\"hidden\" data-name=\"fproxyamount\" name=\"details["+num+"].fproxyamount\" id=\"fproxyamount_" + num + "\" value=\"" + fproxyamount + "\"/>"
                            + "<input type=\"hidden\" data-name=\"sweightunit\" name=\"details["+num+"].sweightunit\" id=\"sweightunit_" + num + "\" value=\"" + sweightunit + "\"/>"
                            + "<input type=\"hidden\" data-name=\"hashcode\" name=\"hashcode\" id=\"hashcode_" + num + "\" value=\"" + hash + "\"/>"
                            + "<input type=\"hidden\" data-name=\"sremark\" name=\"details["+num+"].sremark\" id=\"sremark_" + num + "\" value=\"" + sremark + "\"/>"
                            + scommodityname + "</td>";
                        indentureRows += "<td class=\"tc\">" + sspec + "</td>";
                        indentureRows += "<td class=\"tc\">" + sproducer + "</td>";
//                        indentureRows += "<td class=\"tc\">" + shostname + "、" + shostmodel + "、" + shostbrand + "</td>";
                        indentureRows += "<td class=\"tc\">" + fweight+"&nbsp;"+sweightunit + "</td>";
                        //indentureRows += "<td class=\"tc\">" + fmt(getRoundValue(parseFloat(fbuyprice), 2) * 1, "#,##0.00") + "</td>";
                        //indentureRows+="<td class=\"tc\">"+fmt(getRoundValue(parseFloat(fweight*fbuyprice),2)*1,"#,##0.00")+"</td>";
                        //indentureRows += "<td class=\"tc\" data-name=\"fsaleprice\">" + fmt(getRoundValue(parseFloat(fsaleprice), 2) * 1, "#,##0.00") + "</td>";//销售单价
                        //indentureRows+="<td class=\"tc\" data-name=\"fsaleamount\">"+fmt(getRoundValue(parseFloat(fweight*fsaleprice),2)*1,"#,##0.00")+"</td>";
                        indentureRows += "<td class=\"tc\">" + fmt(getRoundValue(parseFloat(fproxyprice), 2) * 1, "#,##0.00") + "</td>";//代理单价
                        indentureRows += "<td class=\"tc\">" + sremark + "</td>";
                        if (isNull(sid))
                            indentureRows += "<td class=\"tc\"><a class=\"layui-abtn\" href=\"javascript:void(-1)\" onclick=\"doEditDetail('" + num + "');\">编辑</a><a class=\"layui-abtn\"  href=\"javascript:void(-1)\" data-flag='remove'>删除</a></td>";
                        else
                            indentureRows += "<td class=\"tc\"><a class=\"layui-abtn\"  href=\"javascript:void(-1)\" onclick=\"doEditDetail('" + num + "');\">编辑</a><a class=\"layui-abtn\" onclick=\"javascript:deletedetail('" + num + "')\" href=\"javascript:void(-1)\" data-flag='remove'>删除</a></td>";
                        //indentureRows+="</tr>";
                        window.parent.doInsertIndentureDetail(indentureRows, window.parent.bisadd, num);
                    }
                    return false;

                }
            });
        });

        $().ready(function () {
            num = parent._docurnum;

            $("#scommodityname").bigAutocomplete({
                url: "${ctx}/sp/commodity/searchcomodity.json",
                click: 'true',
                select: true,
                callback: function (data) {
                    $("#scommodityid").val(data.id);
                    $("#scommodityname").val(data.sname);
                    $("#sspec").val(data.sspec);
                    $("#sproducer").val(data.sproducer);
                    $("#sweightunit").val(data.unit);
                    $(".xunit").html("(单位："+data.unit+")");
                }
            });

            //新增明细
            if (isEmpty(num)) {

            } else {//修改明细
                var objTR = $("tr[data-flag='" + num + "']", window.parent.document);
                $("#sid").val(objTR.find("input[name='sid']").val());
                //$("#smainid").val(objTR.find("input[name='smainid']").val());
                $("#scommodityid").val(objTR.find("input[data-name='scommodityid']").val());
                $("#svarietyname").val(objTR.find("input[data-name='svarietyname']").val());
                $("#scommodityname").val(objTR.find("input[data-name='scommodityname']").val());
                $("#sspec").val(objTR.find("input[data-name='sspec']").val());
                $("#sproducer").val(objTR.find("input[data-name='sproducer']").val());
                $("#shostname").val(objTR.find("input[data-name='shostname']").val());
                $("#shostmodel").val(objTR.find("input[data-name='shostmodel']").val());
                $("#shostbrand").val(objTR.find("input[data-name='shostbrand']").val());
                //$("#fbuyprice").val(objTR.find("input[data-name='fbuyprice']").val());
                $("#fweight").val(objTR.find("input[data-name='fweight']").val());
                //$("#fsaleprice").val(objTR.find("input[data-name='fsaleprice']").val());
                $("#fproxyprice").val(objTR.find("input[data-name='fproxyprice']").val());
                $("#sweightunit").val(objTR.find("input[data-name='sweightunit']").val());

                $(".xunit").html(objTR.find("input[data-name='sweightunit']").val());
                $("#sremark").val(objTR.find("input[data-name='sremark']").val());
                //$("#fotherprice").val($("#fotherprice",window.parent.document).val());

            }

        });


    </script>
</head>
<body>
<form action="" method="post" id="formx" class="layui-form">
    <input type="hidden" name="id" id="sid" value=""/>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">物资名称</label>
            <div class="layui-input-inline">
                <input type="hidden" id="scommodityid" name="scommodityid" value=""/>
                <input type="hidden" id="sweightunit" name="sweightunit" value=""/>
                <input type="hidden" id="svarietyname" name="svarietyname" value=""/>
                <input type="text" id="scommodityname" name="scommodityname" value="" placeholder="(必选项)"
                       class="layui-input required" autocomplete="off"/>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">规格型号 </label>
            <div class="layui-input-inline">
                <input type="text" name="sspec" id="sspec" value="" placeholder="" class="layui-input"
                       autocomplete="off"/>
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">生产厂商 </label>
            <div class="layui-input-inline">
                <input type="text" id="sproducer" name="sproducer" value="" placeholder="" class="layui-input"
                       autocomplete="off"/>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">所属设备 </label>
            <div class="layui-input-inline">
                <input type="text" id="shostname" name="shostname" value="" placeholder="" class="layui-input"
                       autocomplete="off"/>
            </div>
        </div>

    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">所属设备型号 </label>
            <div class="layui-input-inline">
                <input type="text" id="shostmodel" name="shostmodel" value="" placeholder=""
                       class="layui-input" autocomplete="off"/>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">所属设备厂商 </label>
            <div class="layui-input-inline">
                <input type="text" id="shostbrand" name="shostbrand" value="" placeholder=""
                       class="layui-input" autocomplete="off"/>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">数量</label>
            <div class="layui-input-inline">
                <input type="text" id="fweight" name="fweight"
                       value="<mw:format label="weight" value='' format='###.###'/>" placeholder="(必填项)"
                       class="layui-input required  gt0" autocomplete="off"/>
            </div>
            <div style="display: block;    padding: 9px 0!important" class="layui-word-aux xunit">(单位：)</div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">代理单价</label>
            <div class="layui-input-inline">
                <input type="text" id="fproxyprice" name="fproxyprice"
                       value="<mw:format label="money" value='' format='###.##'/>" placeholder="(必填项)"
                        class="layui-input required money" autocomplete="off"/>
            </div>
            <div class="layui-form-mid layui-word-aux">元</div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">交货周期 </label>
            <div class="layui-input-block">
                <input type="text" id="sremark" name="sremark" value="" placeholder="" class="layui-input" autocomplete="off" style="width: 82%;"/>
            </div>
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