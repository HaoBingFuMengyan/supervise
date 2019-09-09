<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ include file="/include/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
    <meta name="decorator" content="jj"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>合同上传文件</title>

    <script type="text/javascript">
        $(document).ready(function() {

            //日期
            layui.use(['layer', 'laydate','upload','form'], function () {
                var laydate = layui.laydate;
                layer = layui.layer;

                var layupload = layui.upload;

                //执行实例
                var demoListView = $('#morefile'),uploadListIns = layupload.render({
                    elem: '#addFile'
                    ,url: '${ctx}/file/uploadfile.json'
                    ,accept: 'file'
                    ,multiple: true
                    ,auto: false
                    ,field:"upfile"
                    ,data:{path:'/contract'}
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
                                ' <input type="hidden" name="sfileid" value=""/>' +
                                ' <input type="hidden" name="sfilename" value="'+res.original+'"/>' +
                                '<input type="hidden" name="sfilepath" value="'+res.path+'"/> '+ res.original +'</td>'
                                ,'<td><input type="text" name="sfileremark" autocomplete="off" class="layui-input layui-input-sm"/></td>'
                                ,'<td>'
                                ,'<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>'
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
            });

            $("#morefile").delegate('a', 'click', function () {
                $(this).parent().parent().remove();
            });

        });

    </script>

    <style type="text/css">
        .alert-danger {
            font-size: 12px;
            background: #fecccb;
            line-height: 50px;
            box-sizing: border-box;
            color: #ff0000;
            position: relative;
            padding-left: 20px;
            margin-bottom: 10px;
        }
        .alert-danger .close{
            position: absolute;
            right: 5px;
            top: 5px;
            background: none;
            border: none;
            font-size: 16px;
            color: red;
            width: 18px;
            height: 18px;
            background: #fff;
            border-radius: 50%;
            text-align: center;
            line-height: 18px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<sys:message content="${message}"/>
<%@include file="/contract/buy-common-view.jsp"%>
<form action="${ctx}/contract/uploadfile.shtml" method="post" id="formx" enctype="multipart/form-data" novalidate="novalidate">

    <input type="hidden" name="id" id="id" value="${contract.id }"/>

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
                    <td><input type="hidden" id="pufs" name="sfileid" value="${file.id}"/>
                        <input type="hidden" name="sfilepath" value="${file.surl}"/>
                        <input type="hidden" name="sfilename" value="${file.sname}"/>

                            ${file.sname}</td>
                    <td><input type="text" name="sfileremark" autocomplete="off" class="layui-input layui-input-sm" value="${file.sremark}"/></td>
                    <td><a class="layui-abtn demo-delete">删除</a></td>
                </tr>
            </c:forEach>

            <%--<td><a class="layui-abtn" href="${ctx}/download.html?path=${file.surl}&filename=${file.sname}">下载</a></td>--%>

        </tbody>
    </table>
</form>
<script type="text/javascript">
    layui.use(['layer', 'laydate'], function () {
        var table = layui.table;

        table.init('detail', {
            //totalRow:true,
            limit: 10000 //注意：请务必确保 limit 参数（默认：10）是与你服务端限定的数据条数一致
        });
    })
</script>
</body>
</html>
