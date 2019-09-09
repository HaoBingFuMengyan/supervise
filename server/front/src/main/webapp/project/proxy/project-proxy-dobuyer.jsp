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
    <title>入库通知单</title>
    <style>
        .layui-table-body{
            min-height: auto;
        }
        .layui-inline{
            width:32%;
        }
        .layui-form-label{
            width:60px;
        }
        .layui-input-block {
             margin-left: 90px;
        }
    </style>
    <script type="text/javascript">
        $(function(){
            layui.use(['layer', 'form','upload','element','table'], function(){
                var element = layui.element;
                var layer = layui.layer
                    ,form = layui.form;
                var table = layui.table;

                table.render({
                    elem: '#detail'
                    ,data:${detail}
                    ,size:"sm"
                    ,cols: [[
                        {field:'scommodityname', title:'物资名称',width:'19%', sort: true}
                        ,{field:'sspec', width:'15%',title:'规格型号'}
                        ,{field:'sproducer', width:'10%',title:'生产厂商'}
                        ,{field:'fproxyprice', width:'10%',title:'代理单价(元)'}
                        ,{field:'fcanproxyweight',width:'10%',align:'right',title: '可采购量', sort: true}
                        ,{field:'forderweight',width:'15%',title:'本次采购量(可输入)',align:'right',edit:'text',style:'background-color:antiquewhite;', unresize: true}
                        ,{field:'fsaleweight',width:'10%',align:'right',title: '已代理销售量', sort: true}
                        ,{field:'fbuyweight',width:'10%',align:'right',title: '已采购量', sort: true}
                        //,{type:'space',width:'19%',title:'开单量(可输入)',align:'right',templet:'#foderweightTpl', unresize: true}
                    ]]
                });
                //监听单元格编辑
                table.on('edit(detail)', function(obj){
                    var value = obj.value //得到修改后的值
                        ,data = obj.data //得到所在行所有键值
                        ,field = obj.field; //得到字段

                        $("#formx").find("input[name='inputmap["+obj.data.id+"].fweight']").remove();
                        //$("#formx").find("input[name='inputmap["+obj.data.id+"].fprice']").remove();
                        $("#formx").find("input[name='inputmap["+obj.data.id+"].sresourceid']").remove();
                        if (isEmpty(obj.value)){
                            return false;
                        }
                        if (!isDouble(obj.value)){
                            jj.error("采购量输入不合法");
                            obj.field.value=0;
                            return;
                        }
                        $("#formx").prepend("<input type='hidden' name='inputmap["+obj.data.id+"].fweight' data-price='"+obj.data.fproxyprice+"' data-max='"+obj.data.fcanproxyweight+"' data-type='inputweight' value='"+obj.value+"'>");
                        //$("#formx").prepend("<input type='hidden' name='inputmap["+obj.data.id+"].fprice' data-type='fprice' value='"+obj.data.fproxyprice+"'>");
                        $("#formx").prepend("<input type='hidden' name='inputmap["+obj.data.id+"].sresourceid' data-type='sresourceid' value='"+obj.data.id+"'>");
                    cellAmount();
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
                    ,data:{path:'/Contract'}
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


                jj.validate("#formx",{
                    check:function(){
                        var items=$("#formx").find('input[data-type=inputweight]');
                        if (items.length == 0)
                            return "请输入采购量";
                        var gt0=0;
                        for(var i=0;i<items.length;i++){
                            var item=$(items[i]);
                            var v=item.val()||0;
                            item.val(v);
                            // if(parseInt(v)!=v)
                            //     return "第"+(i+1)+"行采购量格式不正确";
                            if (v > 0){
                                gt0++;
                            }
                            if(v>item.data('max'))
                                return "第"+(i+1)+"行采购量不能超过可采购量";
                        }
                        if (gt0 == 0){
                            return "采购量至少有一条不能为零";
                        }

                    }
                });
            });
        });

        //计算总额
        function cellAmount(){
            var fbuyamount=0;

            $("#formx").find('input[data-type=inputweight]').each(function(){
                fbuyamount=fbuyamount+parseFloat($(this).val())*parseFloat($(this).data("price"));
            });

            $("#fbuyamount").val(getRoundValue(parseFloat(fbuyamount),2));//采购价总额
        }
    </script>
</head>
<body>
<form action="${ctx}/projectproxy/dobuyer.json" method="post" id="formx" class="layui-form" lay-size="sm" lay-filter="formDemo">
    <input type="hidden" name="id" value=""/>
    <input type="hidden" name="sprojectid" value="${project.id}"/>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">供应商</label>
            <div class="layui-input-inline">
                <input type="text" name="ssalename" value="${project.ssalename}" class="layui-input readonly" readonly="readonly" autocomplete="off"/>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">合同编号</label>
            <div class="layui-input-inline">
                <input type="text" id="contractno" name="contractno" value="" placeholder="(必填项)" class="layui-input required" autocomplete="off"/>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">采购总额</label>
            <div class="layui-input-inline">
                <input type="text" name="fbuyamount" id="fbuyamount" value="" placeholder="" readonly="readonly" class="layui-input readonly" autocomplete="off"/>
            </div>
        </div>
    </div>

    <div class="layui-form-item">
            <label class="layui-form-label">备注 </label>
            <div class="layui-input-block">
                <input type="text" id="sremark" name="sremark" value="" placeholder="" class="layui-input" autocomplete="off"/>
            </div>
    </div>

    <fieldset class="layui-elem-field layui-field-title">
        <legend>合同明细</legend>
    </fieldset>
    <table class="layui-table" id="detail" lay-filter="detail"></table>
    <fieldset class="layui-elem-field layui-field-title" >
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
                    <input type="hidden" name="files[${file.id}].sfileremark" value="${file.sremark}"/>
                        ${file.sname}</td>
                <td>${file.sremark }</td>
                <td><button class="layui-btn layui-btn-sm"><i class="layui-icon">&#xe640;</i></button></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</form>
<script type="text/html" id="foderweightTpl">
    <!-- 这里的 checked 的状态只是演示 -->
    <input type="text" name="foderweight" class="layui-input layui-input-table" value="" placeholder="请输入开单量"/>
</script>
</body>
</html>
