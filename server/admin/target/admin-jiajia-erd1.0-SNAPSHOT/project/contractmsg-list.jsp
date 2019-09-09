<%@ taglib prefix="jj" uri="http://www.frogsing.com/tags/jj" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
    <title>合约-消息</title>
    <meta name="decorator" content="jj" />
</head>
<div style="padding: 20px; background-color: #F2F2F2;">
    <mw:msg></mw:msg>
    <div class="layui-row layui-col-space15">
        <form id="inputForm" class="layui-form layui-form-pane" modelAttribute="data" action="${ctx}/contractmsg/save.shtml" method="post">
            <input type="hidden" id="spic" name="spic" value="">
            <div class="layui-col-md12">
                <div class="layui-card">
                    <div class="layui-card-header"><strong>第一合约</strong></div>
                    <div class="layui-card-body">
                        <div class="layui-row">
                            <div class="layui-col-md6">
                                <div class="grid-demo grid-demo-bg1">
                                    <div class="layui-form-item layui-form-text">
                                        <label class="layui-form-label">名称</label>
                                        <div class="layui-input-block">
                                            <input type="text" id="smaincontractname" value="<cs:SysParaType onecon="1"  op="syspara"/>" readonly="readonly" name="smaincontractname" autocomplete="off" class="layui-input required readonly">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-col-md6">
                                <div class="grid-demo">
                                    <div class="layui-form-item layui-form-text">
                                        <label class="layui-form-label">价格</label>
                                        <div class="layui-input-block">
                                            <input type="text" id="fmaincontractprice" name="fmaincontractprice" autocomplete="off" class="layui-input required">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="layui-card">
                    <div class="layui-card-header"><strong>第二合约</strong></div>
                    <div class="layui-card-body">
                        <div class="layui-row">
                            <div class="layui-col-md6">
                                <div class="grid-demo grid-demo-bg1">
                                    <div class="layui-form-item layui-form-text">
                                        <label class="layui-form-label">名称</label>
                                        <div class="layui-input-block">
                                            <input type="text" id="snextcontractname" name="snextcontractname" value="<cs:SysParaType twocon="1"  op="syspara"/>" readonly="readonly" autocomplete="off" class="layui-input required readonly">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-col-md6">
                                <div class="grid-demo">
                                    <div class="layui-form-item layui-form-text">
                                        <label class="layui-form-label">价格</label>
                                        <div class="layui-input-block">
                                            <input type="text" id="fnextcontractprice" name="fnextcontractprice" autocomplete="off" class="layui-input required">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="layui-card">
                    <div class="layui-card-header"><strong>第三合约</strong></div>
                    <div class="layui-card-body">
                        <div class="layui-row">
                            <div class="layui-col-md6">
                                <div class="grid-demo grid-demo-bg1">
                                    <div class="layui-form-item layui-form-text">
                                        <label class="layui-form-label">名称</label>
                                        <div class="layui-input-block">
                                            <input type="text" id="snextnextcontractname" name="snextnextcontractname" value="<cs:SysParaType threecon="1"  op="syspara"/>"  readonly="readonly" autocomplete="off" class="layui-input required readonly">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-col-md6">
                                <div class="grid-demo">
                                    <div class="layui-form-item layui-form-text">
                                        <label class="layui-form-label">价格</label>
                                        <div class="layui-input-block">
                                            <input type="text" id="fnextnextcontractprice" name="fnextnextcontractprice" autocomplete="off" class="layui-input required">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-card">
                    <div class="layui-card-header"><strong>走势图</strong></div>
                <div class="layui-inline">
                    <div class="layui-upload-drag layui-input-inline"  align="center" id="test10">
                        <i class="layui-icon"></i>
                        <p>点击上传，或将文件拖拽到此处</p>
                    </div>
                </div>
                </div>
                <div class="layui-row">
                    <button type="button" onclick="doSubmit()" class="layui-btn layui-btn-lg layui-btn-normal">保存</button>
                </div>
            </div>

        </form>




        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header"><strong>合约信息</strong></div>
                <div class="layui-card-body">
                    <div class="search">
                        <form  class="layui-form" id="searchForm">
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">查询条件</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="search_like_srolename" placeholder="" autocomplete="off" class="layui-input"/>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>

                    <table class="layui-hide" id="stable" lay-filter="stable"></table>

                    <!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

                    <script>
                        layui.use(['table','layer',"upload"],function(){
                            var layupload = layui.upload;
                            jj.table =layui.table;
                            var form = layui.form;
                            jj.url="${ctx}/jj/contractmsg/list.json";
                            jj.xurl="${ctx}/jj/contractmsg/";
                            jj.cols= [[
                                {field:'dadddate', title: '时间',sort: true,width:150}
                                ,{field:'smaincontractname', title: '第一合约名称',sort: true}
                                ,{field:'fmaincontractprice', title: '第一合约价格',sort: true}
                                ,{field:'snextcontractname', title: '第二合约名称',sort: true}
                                ,{field:'fnextcontractprice', title: '第二合约价格',sort: true}
                                ,{field:'snextnextcontractname', title: '第三合约名称',sort: true}
                                ,{field:'fnextnextcontractprice', title: '第三合约价格',sort: true}
                                // ,{field:'spic', title: '图片',sort: true}
                                ,{ fixed:'right', align:'left',width:100, toolbar: '#operation',} //这里的toolbar值是模板元素的选择器
                            ]];

                            jj.width=500;
                            jj.height=530;

                            jj.render({
                                initSort:{
                                    field:"dadddate",
                                    type:"desc"
                                },
                                cellMinWidth:80,
                                page: true
                            });

                            //jj.validate();

                            //拖拽上传
                            layupload.render({
                                elem: '#test10'
                                ,url: '${ctx}/file/upload.json'
                                , field: "upfile"
                                , data: {path: '/coupon'}
                                ,done: function(res){
                                    if (res.state == "SUCCESS") { //上传成功
                                        $("#spic").val(res.url);
                                        $("#test10").empty();
                                        $("#test10").append('<img width="200" height="100" src="'+res.url+'">');

                                    } else {
                                        layer.msg(res.original + "上传失败，失败原因：" + res.state);
                                        this.error(index, upload);
                                    }
                                }
                            });


                        });

                        
                        function doSubmit() {
                            var smaincontractname = $("#smaincontractname").val();
                            var fmaincontractprice = $("#fmaincontractprice").val();
                            var snextcontractname = $("#snextcontractname").val();
                            var fnextcontractprice = $("#fnextcontractprice").val();
                            var snextnextcontractname = $("#snextnextcontractname").val();
                            var fnextnextcontractprice = $("#fnextnextcontractprice").val();

                            if(smaincontractname==""||smaincontractname==null){
                                jj.error("第一合约名称不能为空！")
                                return;
                            }
                            if(fmaincontractprice==""||fmaincontractprice==null){
                                jj.error("第一合约价格不能为空！")
                                return;
                            }
                            if(snextcontractname==""||snextcontractname==null){
                                jj.error("第二合约名称不能为空！")
                                return;
                            }
                            if(fnextcontractprice==""||fnextcontractprice==null){
                                jj.error("第二合约价格不能为空！")
                                return;
                            }
                            if(snextnextcontractname==""||snextnextcontractname==null){
                                jj.error("第三合约名称不能为空！")
                                return;
                            }
                            if(fnextnextcontractprice==""||fnextnextcontractprice==null){
                                jj.error("第三合约价格不能为空！")
                                return;
                            }
                            $("#inputForm").submit();
                        }
                    </script>



                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/html" id="operation">
    <div class="layui-btn-group" data-rowid="{{d.id}}">
        <jj:listbtn name="删除" event="delete" purview=""/>
        {{#  if(d.spic!=""){ }}
            <div class="layui-btn-group" > <a href="{{d.spic}}" target="_blank" class="layui-btn layui-btn-xs" data-toggle="tooltip" data-placement="left" title="查看图片">图片</a> </div>
        {{#  } }}
    </div>
</script>
</body>
</html>