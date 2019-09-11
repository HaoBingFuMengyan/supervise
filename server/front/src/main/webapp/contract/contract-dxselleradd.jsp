<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="description" content=""/>
    <meta name="decorator" content="jj"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>定向销售-基金协同监管系统沟通</title>
    <style>
        .layui-form-item .layui-input-inline {
            width: 300px ;
        }
        .layui-textarea{
            width:89%;
        }
        .layui-input-sm{
            height: 30px;
        }
    </style>
    <script type="text/javascript">
        var datalist=new Array();
        var tableIns;
        //日期
        layui.use(['layer', 'laydate','upload','form','table'], function () {
            var laydate = layui.laydate;
            layer = layui.layer;
            var table = layui.table;
            //日期
            laydate.render({
                elem: '#ddate'
            });

            var layupload = layui.upload;

            //执行实例
            var demoListView = $('#morefile'),uploadListIns = layupload.render({
                elem: '#addFile'
                ,url: '${ctx}/file/uploadfile.json'
                ,accept: 'file'
                ,multiple: true
                ,auto: false
                ,field:"upfile"
                ,data:{path:'/DxContract'}
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


            tableIns = table.render({
                limit:10000,
                elem: '#detailInfo'
                ,id:"detailInfo"
                ,data:datalist
                ,size:"sm"
                ,cols: [[
                    {field:'no',type:'numbers',title:'序号'}
                    ,{field:'sownername', title:'供应商',minWidth:200,sort: true}
                    ,{field:'scodegood', title:'物资编码',width:120,sort: true}
                    ,{field:'scommodityname', title:'物资名称',minWidth:120, sort: true}
                    ,{field:'sspec', title:'规格型号',minWidth:120}
                    ,{field:'sproducer',title:'生产厂商',minWidth:120}
                    ,{field:'favailableweight',width:80,align:'right',title: '可售量', sort: true,unresize: true,fixed:'right'}
                    ,{field:'fproxyprice',width:90,align:'right',title: '代理价', sort: true,unresize: true,fixed:'right'}
                    ,{field:'forderweight',width:80,title:'销售量',align:'right',edit:'text',style:'background-color:antiquewhite;', unresize: true,fixed:'right'}
                    ,{field:'forderprice',width:90,title:'销售单价',align:'right',edit:'text',style:'background-color:antiquewhite;', unresize: true,fixed:'right'}
                    ,{type:'space',width:60,title:'删除',align:'right',templet:'#detailBar', unresize: true,fixed:'right'}
                ]]
            });

            table.on('tool(detailInfo)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                var data = obj.data; //获得当前行数据
                var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
                var tr = obj.tr; //获得当前行 tr 的DOM对象

                if(layEvent === 'delete'){ //删除
                    obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                    var index = -1;
                    for (var i = 0;i<datalist.length;i++){
                        if (datalist[i].id == data.id){
                            index=i;
                            break;
                        }
                    }
                    if (index > -1) {
                        datalist.splice(index, 1);
                    }
                }
                tableIns.reload({
                    data:datalist
                });
            });
            table.on('edit(detailInfo)', function(obj){ //注：edit是固定事件名，test是table原始容器的属性 lay-filter="对应的值"
                if (obj.field == "forderweight"){
                    var fweight=obj.value;
                    // if(fweight!=""&&fweight!=null&&!isInt3(fweight)){
                    //     jj.error("物资编号为"+obj.data.scodegood+'的数量必须为整数！');
                    //     return;
                    // }

                    if(parseFloat(obj.data.favailableweight)<parseFloat(fweight)){
                        jj.error("物资编号为"+obj.data.scodegood+'的数量不能大于可开单量！');
                        return;
                    }
                }

            });
        });

        $().ready(function () {

            $("#sbuyername").bigAutocomplete({
                url:"${ctx}/hy/member/searchMember.json",
                click: 'true',
                select: true,
                callback:function(data){
                    $("#sbuyerid").val(data.id);
                }
            });
            $('input[data=commitbtn]').click(function () {
                var flag = true;
                var r = $("#formx").valid();
                if (!r || !check()) {
                    flag = false;
                    return;
                }
                if ($("#detailInfo tbody").find("tr").length == 0) {
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

            $("#morefile").delegate('a', 'click', function () {
                $(this).parent().parent().remove();
            });
        });

        function choiceIndenture(){
            var ids = "00000:";
            for (var i=0;i<datalist.length;i++){
                ids+=datalist[i].id+":";
            }
            ids=ids.substring(0,ids.length-1);
            jj.xopen({
                title:'仓单资源',
                area: ['90%', '90%'],
                content:'${ctx}/wms/indenture/choiceindenture.shtml?id='+ids,
                btn: ['确定选择','关闭']
            });
        }

        function Calculation(){
            $("input[name='favailableweights']").each(function(i){
                var favailableweight= $("input[name='favailableweights']")[i].value;//仓单可用量
                var fweight= $("input[name='fweights']")[i].value;//申报数量

                if(fweight!=""&&fweight!=null&&!isInt3(fweight)){
                    layer.msg('申报数量必须为整数！', {icon: 5});
                    $("input[name='fweights']")[i].value=1;
                }

                if(parseFloat(favailableweight)<parseFloat(fweight)){
                    layer.msg('申报数量不能大于仓单可用量！', {icon: 5});
                    $("input[name='fweights']")[i].value=favailableweight;
                }

                var fprice = $("input[name='fprices']")[i].value;//价格
                var indentureid = $("input[name='indentureids']")[i].value;//仓单ID
                var ftotalmoeny = $("#ftotalmoeny_"+indentureid);//列表金额的TD对象
                if(fprice!=null&&fprice!=0&&fweight!=null&&fweight!=0){
                    var singMoeny = getFloatValue(parseFloat($("input[name='fweights']")[i].value)*parseFloat(fprice),2);
                    ftotalmoeny.html(singMoeny);
                }
            });
        }

        function addData(obj) {
            datalist=datalist.concat(obj);
            tableIns.reload({
                data:datalist
            });
            jj.closeChild();
        }

        jj.validate("#formx",{
            submitHandler: function(form){
                var formdata= tt.where($(form));
                for (var i=0;i<datalist.length;i++){
                    var fweight=datalist[i].forderweight;
                    var fprice=datalist[i].forderprice;

                    // if(fweight!=""&&fweight!=null&&!isInt3(fweight)){
                    //     jj.error("物资编号为"+datalist[i].scodegood+'的数量必须为整数！');
                    //     return false;
                    // }
                    if (parseFloat(fweight) <=  0){
                        jj.error("物资编号为"+datalist[i].scodegood+'的数量必须大于零！');
                        return false;
                    }
                    if(parseFloat(datalist[i].favailableweight)<parseFloat(fweight)){
                        jj.error("物资编号为"+datalist[i].scodegood+'的数量不能大于可开单量！');
                        return false;
                    }
                    if (!isPrice(fprice)){
                        jj.error("物资编号为"+datalist[i].scodegood+'的价格输入不正确！');
                        return false;
                    }
                    if (parseFloat(fprice) <=  0){
                        jj.error("物资编号为"+datalist[i].scodegood+'的价格必须大于零！');
                        return false;
                    }
                    formdata["map["+datalist[i].id+"].sresourceid"]=datalist[i].id;
                    formdata["map["+datalist[i].id+"].fweight"]=datalist[i].forderweight;
                    formdata["map["+datalist[i].id+"].fprice"]=datalist[i].forderprice;
                }

                console.log(formdata);
                jj.form("${ctx }/contract/contractbyseller.json",formdata);
                return false;
            }
        })
    </script>
</head>
<body>
<div class="mbody">
    <mw:msg/>

        <form action="${ctx }/contract/contractbyseller.json" method="post" id="formx" lay-filter="formx" class="layui-form" lay-size="sm"  enctype="multipart/form-data" autocomplete="on">
            <input type="hidden" id="id" name="id" value="${obj.id}"/>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">供应商 </label>
                    <div class="layui-input-inline">
                        <input type="text" id="ssellername" name="ssellername" readonly="readonly" value="<shiro:principal property="memberName" />"  placeholder="(必选项)" class="layui-input required" autocomplete="off"/>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">采购商 </label>
                    <div class="layui-input-inline">
                        <input type="hidden" id="sbuyerid" name="sbuyerid" />
                        <input type="text" id="sbuyername" name="sbuyername"  placeholder="(必选项)" class="layui-input required" autocomplete="off"/>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">合同编号 </label>
                    <div class="layui-input-inline">
                        <input type="text" id="scode" name="scode"  required placeholder="(必填项)"  class="layui-input" autocomplete="off"/>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">合同日期 </label>
                    <div class="layui-input-inline">
                        <input type="text" id="ddate" name="ddate" readonly="readonly" required lay-verify="required" placeholder="(必填项)"   class="layui-input" autocomplete="off"/>
                    </div>
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">备注</label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入备注" class="layui-textarea" name="sremark"></textarea>
                </div>
            </div>

            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>订单明细<a id="addDetail" onclick="choiceIndenture()" class="layui-btn layui-btn-xs" style="margin-left: 20px;">添加明细</a></legend>
            </fieldset>
            <table class="layui-table" id="detailInfo" lay-filter="detailInfo" lay-size="sm">
            </table>


            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>附件<a id="addFile" class="layui-btn layui-btn-xs" style="margin-left: 20px;">添加附件</a><label id="doUploadFile"></label></legend>
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
<script type="text/html" id="detailBar">
    <jj:listbtn name="删除" event="delete" type="a"/>
</script>
</body>
</html>