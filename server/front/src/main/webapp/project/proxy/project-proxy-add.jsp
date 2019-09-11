<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="keywords" content="基金协同监管系统沟通,基金协同监管系统沟通"/>
    <meta name="description" content="基金协同监管系统沟通(www.mall.meiliangzi.cn)。服务电话：400-086-0101 "/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="decorator" charset="" content="jj">
    <title>订单发起-基金协同监管系统沟通</title>
    <style>
        .layui-form-item .layui-input-inline {
            width: 290px ;
        }
        .layui-textarea{
            width:89%;
        }
        .layui-input-sm{
            height: 30px;
        }
    </style>
    <script type="text/javascript">
        var index=0;
        var _docurnum = "";
        var _bool = true;
        var bisadd = true;
        $().ready(function () {
            //  focusmenu('库存融资', true);
            //日期
            layui.use(['form','upload','layer','laydate'], function () {
                var layupload = layui.upload;
                var laydate = layui.laydate;
                layer = layui.layer;
                //日期
                laydate.render({
                    elem: '#dbegindate',
                    trigger: 'click'
                });
                laydate.render({
                    elem: '#dsigndate',
                    trigger: 'click'
                });
                laydate.render({
                    elem: '#dvaliddate',
                    trigger: 'click'
                });

                //执行实例
                var demoListView = $('#morefile'),uploadListIns = layupload.render({
                    elem: '#addFile'
                    ,url: '${ctx}/file/uploadfile.json'
                    ,accept: 'file'
                    ,multiple: true
                    ,auto: false
                    ,field:"upfile"
                    ,data:{path:'/Project'}
                    ,choose: function(obj){
                        var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
                        obj.preview(function(index, file, result){
                            obj.upload(index, file);
                        });
                    }
                    ,before: function(obj){ //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
                        layer.load(1); //上传loading
                    }
                    ,allDone:function (obj) {
                        layer.closeAll('loading'); //关闭loadin
                    }
                    ,done: function(res, index, upload){
                        if(res.state == "SUCCESS"){ //上传成功
                            var tr = $(['<tr id="upload-'+ index +'">'
                                ,'<td>' +
                                '<input type="hidden" name="files['+index+'].sfileid" value=""/>' +
                                '<input type="hidden" name="files['+index+'].sfilename" value="'+res.original+'"/>' +
                                '<input type="hidden" name="files['+index+'].sfilepath" value="'+res.path+'"/> '+ res.original +'</td>'
                                ,'<td><input type="text" name="files['+index+'].sfileremark" autocomplete="off" class="layui-input layui-input-sm"/></td>'
                                ,'<td>'
                                ,'<a class="layui-abtn demo-delete">删除</a>'
                                ,'</td>'
                                ,'</tr>'].join(''));
                            //删除
                            tr.find('.demo-delete').on('click', function(){
                                tr.remove();
                                uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
                            });
                            demoListView.append(tr);
                            return delete this.files[index]; //删除文件队列已经上传成功的文件
                        }else{
                            layer.msg(res.original+"上传失败，失败原因："+res.state);
                            this.error(index, upload);
                        }
                    }
                    ,error: function(index, upload){
                        layer.closeAll('loading'); //关闭loadin
                        return delete this.files[index]; //删除文件队列已经上传成功的文件
                    }
                });

                var form = layui.form;
                form.on('submit(formDemo)', function (data) {

                });

            });

            $("#ssalename").bigAutocomplete({
                url: "${ctx}/hy/member/searchMember.json",
                click: 'true',
                select: true,
                callback: function (data) {
                    $("#ssaleid").val(data.id);
                }
            });


            $("#swarehousename").bigAutocomplete({
                url: "${ctx}/wms/warehouse/searchWarehouse.json",
                click: 'true',
                select: true,
                callback: function (data) {
                    $("#swarehouseid").val(data.id);
                }
            });

            $('input[data=commitbtn]').click(function () {
                var flag = true;
                var r = $("#formx").valid();
                if (!r || !check()) {
                    flag = false;
                    return;
                }
                if ($("#pledges tbody").find("tr").length == 0) {
                    alert("请先添加订单明细");
                    flag = false;
                    return;
                }
                var sfileid = $("#morefile").find("input[name=sfileid]");
                if (sfileid.length == 0) {
                    alert("请上传合同等附件");
                    flag = false;
                    return false;
                }

                $("#iscommit").val("true");
                if (flag) {
                    $('#formx').submit();
                    $(this).attr("disabled", "disabled");
                }
            });


            $("#pledges").delegate('a', 'click', function () {
                if ($(this).data("flag") == "remove") {
                    $(this).parent().parent().remove();
                    cellAmount();
                }
            });


            $("#morefile").delegate('a', 'click', function () {
                $(this).parent().parent().remove();
            });

            $("#addDetail").click(function(){
                bisadd = true;
                _docurnum = "";
                layer.open({
                    type: 2,
                    title: '添加项目明细',
                    area: ['900px', '350px'],
                    content: ['${ctx}/projectproxy/detailadd.shtml', 'no'] //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
                });
            });

            $("#excelDetail").click(function(){
                bisadd = true;
                _docurnum = "";
                layer.open({
                    type: 2,
                    title: 'EXCEL导入明细',
                    area: ['90%', '90%'],
                    content: ['${ctx}/projectproxy/exceldetailadd.shtml', 'no'] //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
                });
            });

        });



        function doEditDetail(id) {
            bisadd = false;
            _docurnum = id;
            layer.open({
                type: 2,
                title: '修改项目明细',
                area: ['900px', '350px'],
                content: ['${ctx}/projectproxy/detailadd.shtml', 'no'] //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
            });
        }

        function checkhad(num, val) {
            _bool = true;
            $("#pledges").find("tbody tr").each(function () {
                var _had = $(this).find("td").first().find("input[name='hashcode']").val();
                var _num = ($(this).find("td").first().find("input[name='num']").val());
                if (num == _num)
                    _had = "";
                if (_had == val) {
                    layer.msg("同一订单下，相同物资口称,规格型号,生产厂商,所属设备信息的数据只允许有一条");
                    _bool = false;
                }

            });
            return _bool;
        }

        function doInsertExcelDetail(htmls) {
            $("#pledges tbody").html(htmls);
            cellAmount();
            var layer = layui.layer;
            layer.closeAll();

        }

        function doInsertIndentureDetail(htmls, add, num) {
            if (add) {
                $("#pledges tbody").append("<tr data-flag=\'" + num + "\'>" + htmls + "</tr>");
            } else {
                $("#pledges").find("tr[data-flag='" + num + "']").html(htmls);
            }

            cellAmount();
            var layer = layui.layer;
            layer.closeAll();

        }

        //计算总额
        function cellAmount(){
            var fproxyamount=0;

            $("#pledges tbody").find("tr").each(function(){
                //fbuyamount=fbuyamount+parseFloat($(this).find("input[data-name='fbuyamount']").val());
                //fsaleamount=fsaleamount+parseFloat($(this).find("input[data-name='fsaleamount']").val());
                fproxyamount=getRoundValue(fproxyamount+parseFloat($(this).find("input[data-name='fproxyamount']").val()),2);
            });

            //$("#fbuyamount").val(getRoundValue(parseFloat(fbuyamount),2));//采购价总额
            //$("#fsaleamount").val(getRoundValue(parseFloat(fsaleamount),2));//销售总额
            $("#fproxyamount").val(getRoundValue(parseFloat(fproxyamount),2));//代理总额
        }

        jj.validate();
    </script>
</head>
<body>
<div class="mbody">
    <div >
        <form class="layui-form" action="${ctx }/projectproxy/save.shtml" method="post" id="formx" onkeydown="if(event.keyCode==13) return false;"
              enctype="multipart/form-data" autocomplete="on">
            <input type="hidden" id="id" name="id" value="${obj.id}"/>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">供应商 </label>
                    <div class="layui-input-inline">
                        <input type="hidden" id="ssaleid" name="ssaleid" value="${obj.ssaleid }"/>
                        <input type="text" id="ssalename" name="ssalename" value="${obj.ssalename }"  placeholder="(必选项)" class="layui-input required" autocomplete="off"/>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">代理总额 </label>
                    <div class="layui-input-inline">
                        <input id="fproxyamount" type="text" name="fproxyamount"
                               value="${obj.fproxyamount}" readonly="readonly" class="layui-input readonly" autocomplete="off"/>
                    </div>
                    <div class="layui-form-mid layui-word-aux">元</div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">项目周期 </label>
                    <div class="layui-input-inline">
                        <input type="text" id="icycle" name="icycle" value='${obj.icycle }'  placeholder="(必填项)"  class="layui-input required onumber gt0" autocomplete="off"/>
                    </div>
                    <div class="layui-form-mid layui-word-aux">月</div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">开始日期 </label>
                    <div class="layui-input-inline">
                        <input type="text" id="dbegindate" name="dbegindate"
                               value='<mw:format label="date" value="${obj.dbegindate }" format="yyyy-MM-dd"></mw:format>'  placeholder="(必填项)"   class="layui-input required" autocomplete="off"/>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">项目签订日期 </label>
                    <div class="layui-input-inline">
                        <input type="text" id="dsigndate" name="dsigndate" value="<mw:format label='date' value='${obj.dsigndate }'/>" placeholder="(必选项)"  class="layui-input required" autocomplete="off"/>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">项目生效日期 </label>
                    <div class="layui-input-inline">
                        <input id="dvaliddate" type="text" name="dvaliddate" value="<mw:format label='date' value='${obj.dvaliddate}'/>" placeholder="(必填项)" class="layui-input required" autocomplete="off"/>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">仓储合同号 </label>
                    <div class="layui-input-inline">
                        <input type="text" id="swarehousecontractno" name="swarehousecontractno"
                               value="${obj.swarehousecontractno }"  placeholder="(必填项)"  class="layui-input required" autocomplete="off"/>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">代理合同号 </label>
                    <div class="layui-input-inline">
                        <input type="text" id="scontractno" name="scontractno" value="${obj.scontractno }" placeholder="(必选项)"  class="layui-input required" autocomplete="off"/>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">月周转率 </label>
                    <div class="layui-input-inline">
                        <input type="text" id="fturnoverrate" name="fturnoverrate" value="${obj.fturnoverrate }" class="layui-input " />
                    </div>
                    <div class="layui-form-mid layui-word-aux">%</div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">月提货日 </label>
                    <div class="layui-input-inline">
                        <input type="text" id="imonthlydelivery" name="imonthlydelivery" value="${obj.imonthlydelivery }"  class="layui-input  gt0 onumber" />
                    </div>
                    <div class="layui-form-mid layui-word-aux">号</div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">存货仓库 </label>
                    <div class="layui-input-inline">
                        <input type="hidden" id="swarehouseid" name="swarehouseid" value="${obj.swarehouseid }"/>
                        <input type="text" id="swarehousename" name="swarehousename" value="${obj.swarehousename }" required lay-verify="required" placeholder="(必选项)"  class="layui-input" autocomplete="off"/>
                    </div>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">备注</label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入备注" class="layui-textarea" name="sremark">${obj.sremark }</textarea>
                </div>
            </div>

            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>项目明细
                    <a id="addDetail" class="layui-btn layui-btn-sm" style="margin-left: 20px;">添加明细</a>
                    <a id="excelDetail" class="layui-btn layui-btn-sm" style="margin-left: 20px;">Excel导入</a>
                </legend>
            </fieldset>
            <table class="layui-table" id="pledges" lay-size="sm">
                <colgroup>
                    <col>
                    <col width="15%">
                    <col width="15%">
                    <col width="20%">
                    <col width="12%">
                    <col width="12%">
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
                    <%--<th >采购单价(元)</th>--%>
                    <%--<th  >采购总额(元)</th>--%>
                    <%--<th >销售单价(元)</th>--%>
                    <%--<th  >销售总额(元)</th>--%>
                    <th >代理单价(元)</th>
                    <th >交货周期</th>
                    <th >操作</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${not empty obj.detailsList }">
                    <c:forEach items="${obj.detailsList}" var="sin" varStatus="ind">
                        <tr data-flag="${sin.id }" id="${sin.id}_data">
                            <td>${sin.svarietyname}</td>
                            <td>
                                <input type="hidden" name="sid" id="id_${sin.id }" value="${sin.id }"/>
                                <input type="hidden" name="num" id="num_${sin.id }" value="${sin.id }"/>
                                    <%-- <input type="hidden" name="smainid" id="smainid_${sin.id }" value="${sin.id }"/> --%>
                                <input type="hidden" data-name="scommodityid" name="details[${sin.id }].scommodityid" id="scommodityid_${sin.id }" value="${sin.scommodityid}"/>
                                <input type="hidden" data-name="svarietyname" name="details[${sin.id }].svarietyname" id="svarietyname_${sin.id }" value="${sin.svarietyname}"/>
                                <input type="hidden" data-name="scommodityname" name="details[${sin.id }].scommodityname" id="scommodityname_${sin.id }" value="${sin.scommodityname}"/>
                                <input type="hidden" data-name="sspec" name="details[${sin.id }].sspec" id="sspec_${sin.id }" value="${sin.sspec}"/>
                                <input type="hidden" data-name="sproducer" name="details[${sin.id }].sproducer" id="sproducer_${sin.id }" value="${sin.sproducer}"/>
                                <%--<input type="hidden" data-name="shostname" name="details[${sin.id }].shostname" id="shostname_${sin.id }" value="${sin.shostname}"/>--%>
                                <%--<input type="hidden" data-name="shostmodel" name="details[${sin.id }].shostmodel" id="shostmodel_${sin.id }" value="${sin.shostmodel}"/>--%>
                                <%--<input type="hidden" data-name="shostbrand" name="details[${sin.id }].shostbrand" id="shostbrand_${sin.id }" value="${sin.shostbrand}"/>--%>
                                <input type="hidden" data-name="fweight" name="details[${sin.id }].fweight" id="fweight_${sin.id }" value='${sin.fweight}'/>
                                <%--<input type="hidden" data-name="fbuyprice" name="details[${sin.id }].fbuyprice" id="fbuyprice_${sin.id }" value="${sin.fbuyprice}"/>
                                <input type="hidden" data-name="fbuyamount" name="details[${sin.id }].fbuyamount" id="fbuyamount_${sin.id }" value="${sin.fbuyamount}"/>
                                <input type="hidden" data-name="fsaleprice" name="details[${sin.id }].fsaleprice" id="fsaleprice_${sin.id }" value="${sin.fsaleprice}"/>
                                <input type="hidden" data-name="fsaleamount_" name="details[${sin.id }].fsaleamount" id="fsaleamount_${sin.id }" value="${sin.fsaleamount}"/>--%>
                                <input type="hidden" data-name="fproxyprice" name="details[${sin.id }].fproxyprice" id="fproxyprice_${sin.id }" value="${sin.fproxyprice}"/>
                                <input type="hidden" data-name="fproxyamount" name="details[${sin.id }].fproxyamount" id="fproxyamount_${sin.id }" value="${sin.fproxyamount}"/>
                                <input type="hidden" data-name="sweightunit" name="details[${sin.id }].sweightunit" id="sweightunit_${sin.id }" value="${sin.sweightunit}"/>
                                <input type="hidden" data-name="hashcode" name="details[${sin.id }].hashcode" id="hashcode_${sin.id }" value="${sin.scommodityname},${sin.sspec},${sin.sproducer},${sin.shostname},${sin.shostmodel},${sin.shostbrand}"/>
                                <input type="hidden" data-name="sremark" name="details[${sin.id }].sremark" id="sremark_${sin.id }" value="${sin.sremark}"/>
                                    ${sin.scommodityname }</td>
                            <td>${sin.sspec }</td>
                            <td>${sin.sproducer }</td>
                            <%--<td>${sin.shostname }、${sin.shostmodel }、${sin.shostbrand }</td>--%>
                            <td>${sin.fweight}&nbsp;${sin.sweightunit}</td>
                            <%--<td><mw:format label="money" value="${sin.fprice}"/></td>--%>
                                <%--<td><mw:format label="money" value="${sin.fweight*sin.fprice}" /></td>--%>
                            <%--<td data-name="fsaleprice"><mw:format label="money" value="${sin.fsaleprice}"/></td>--%>
                                <%--<td data-name="fsaleamount"><mw:format label="money" value="${sin.fweight*sin.fsaleprice}" /></td>--%>
                            <td><mw:format label="money" value="${sin.fproxyprice}"/></td>
                            <td>${sin.sremark}</td>
                            <td><a href="javascript:void(-1)" class="layui-abtn"  title="修改明细" onclick="doEditDetail('${sin.id}');">编辑</a><a
                                    class="layui-abtn" onclick="javascript:deletedetail('${sin.id}')" href="javascript:void(0);"
                                    data-flag="remove">删除</a>&nbsp;
                            </td>

                        </tr>
                    </c:forEach>
                </c:if>
                </tbody>
            </table>


            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>附件<a id="addFile" class="layui-btn layui-btn-sm" style="margin-left: 20px;">添加附件</a><label id="doUploadFile"></label></legend>
            </fieldset>

            <table class="layui-table" lay-size="sm">
                <colgroup>
                    <col width="40%">
                    <col>
                    <col width="10%">
                </colgroup>
                <thead>
                <tr>
                    <th >附件</th>
                    <th >说明</th>
                    <th >操作</th>
                </tr>
                </thead>
                <tbody id="morefile">
                <c:forEach items="${files}" var="file" varStatus="stat">
                    <tr>
                        <td><input type="hidden" id="pufs" name="files[${file.id}].sfileid" value="${file.id}"/>
                            <input type="hidden" name="files[${file.id}].sfilepath" value="${file.surl}"/>
                            <input type="hidden" name="files[${file.id}].sfilename" value="${file.sname}"/>

                                ${file.sname}</td>
                        <td><input type="text" name="files[${file.id}].sfileremark" autocomplete="off" class="layui-input layui-input-sm" value="${file.sremark}"/></td>
                        <td><a class="layui-abtn demo-delete">删除</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

        </form>
    </div>


</div>
</body>
</html>