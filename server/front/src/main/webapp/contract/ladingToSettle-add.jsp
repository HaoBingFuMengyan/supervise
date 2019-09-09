<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="keywords" content="煤亮子,煤亮子商城"/>
    <meta name="description" content="煤亮子商城(www.mall.meiliangzi.cn)。服务电话：400-086-0101 "/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="decorator" charset="" content="jj">
    <title>订单发起-煤亮子</title>
    <style>
        .layui-form-item .layui-input-inline {
            width: 270px ;
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
        //日期
        layui.use(['layer', 'laydate','upload','form','element'], function () {
            var laydate = layui.laydate;
            layer = layui.layer;
            //日期
            laydate.render({
                elem: '#dsettledate'
            });

        });

        $(document).ready(function () {
           $("#genFeeDetailBody").on("change","input[data-name='fdiscount']",function () {
               cellAmount();
           })
        });

        function genFeeDetail() {
            var id = $("#id").val();
            var dsettledate = $("#dsettledate").val();

            if(dsettledate==null||dsettledate==""){
                layer.msg("结算日期不能为空！");
                return;
            }
            $.ajax({
                type: "get",
                url: "${ctx}/deliveryorderandind/genFeeDetail.json",
                async : true,
                dataType:"html",//返回整合HTML
                data : {"id":id,"dsettledate":dsettledate},
                contentType:'application/json; charset=utf-8',
                success: function (data) {
                    $("#genFeeDetailBody").html(data);//刷新整个body页面的html
                    cellAmount();
                }
            })
        }

        function cellAmount() {
            var famount=0, fdiscount=0;

            $("#genFeeDetailBody").find("tr").each(function(){
                famount=famount+parseFloat($(this).find("input[data-name='fsettleamount']").val());
                fdiscount=fdiscount+parseFloat($(this).find("input[data-name='fdiscount']").val());
            });
            $("#famount").val(getRoundValue(parseFloat(famount),2));
            $("#fdiscount").val(getRoundValue(parseFloat(fdiscount),2));
        }

    </script>
</head>
<body>
<div class="mbody">
    <mw:msg/>

        <div class="layui-tab-content" style="height: 100%;">

                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>结算单信息</legend>
                </fieldset>
                <form class="layui-form" action="${ctx }/deliveryorderandind/ladingToSettleSave.json" method="post" id="formx" onkeydown="if(event.keyCode==13) return false;" enctype="multipart/form-data" autocomplete="on">
                    <input type="hidden" id="id" name="id" value="${id}"/>
                    <input type="hidden" id="ssourceid" name="ssourceid" value="${id}"/>
                    <input type="hidden" id="sprojectid" name="sprojectid" value="${deliveryOrderAndInd.sprojectid}"/>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">付款单位 </label>
                            <div class="layui-input-inline">
                                <input type="text" value="${deliveryOrderAndInd.buyer.scnname}" placeholder="" class="layui-input readonly" autocomplete="off"  readonly/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">结算日期<font color="red">*</font> </label>
                            <div class="layui-input-inline">
                                <input type="text" name="dsettledate" id="dsettledate" value="${projectSettle.dsettledate}" placeholder="" class="layui-input" autocomplete="off" />
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">结算总额 </label>
                            <div class="layui-input-inline">
                                <input type="text" id="famount" name="famount" value="0" placeholder="" class="layui-input readonly" autocomplete="off"  readonly/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">优惠总额 </label>
                            <div class="layui-input-inline">
                                <input type="text" name="fdiscount" id="fdiscount" value="0" placeholder="" class="layui-input readonly" autocomplete="off"  readonly/>
                            </div>
                        </div>
                    </div>


                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">说明</label>
                        <div class="layui-input-block">
                            <textarea placeholder="请输入备注" class="layui-textarea" name="sremark"></textarea>
                        </div>
                    </div>

                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                        <legend><a id="genFeeDetail" onclick="genFeeDetail()" class="layui-btn layui-btn-normal">点击生成费用明细</a></legend>
                    </fieldset>
                    <table class="layui-table" id="pledges" lay-size="sm">
                        <colgroup>
                            <col width="15%">
                            <col width="20%">
                            <col width="10%">
                            <col width="10%">
                            <col width="30%">
                            <col>
                        </colgroup>
                        <thead>
                        <tr>
                            <th >科目</th>
                            <th >结算周期</th>
                            <th >结算金额(元)</th>
                            <th >优惠金额(元)</th>
                            <th >说明</th>
                        </tr>
                        </thead>
                        <tbody id="genFeeDetailBody">

                        </tbody>
                    </table>

                </form>
        </div>
</div>

</body>
</html>