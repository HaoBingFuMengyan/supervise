<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="keywords" content="煤亮子,煤亮子商城"/>
    <meta name="description" content="煤亮子商城(www.mall.meiliangzi.cn)。服务电话：400-086-0101 "/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="decorator" charset="" content="jj">
    <script src="https://cdn.staticfile.org/vue/2.2.2/vue.min.js"></script>
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
        var fTatalBuyamount = ${empty obj.fbuyamount?0:obj.fbuyamount};
        var fTatalSaleamount = ${empty obj.fsaleamount?0:obj.fsaleamount};
        var index=0;
        var repalce = true;
        //日期
        layui.use(['layer', 'laydate','upload','form','element'], function () {



            var form = layui.form;
            form.on('submit(formDemo)', function (data) {

            });

        });



        //计算总额
        function cellAmount(){
            var fbuyamount=0, fsaleamount=0,fproxyamount=0;

            $("#pledges tbody").find("tr").each(function(){
                fbuyamount = getRoundValue(fbuyamount + parseFloat($(this).find("input[data-name='fbuyamount']").val()), 2);
                fsaleamount = getRoundValue(fsaleamount + parseFloat($(this).find("input[data-name='fsaleamount']").val()), 2);
                fproxyamount = getRoundValue(fproxyamount + parseFloat($(this).find("input[data-name='fproxyamount']").val()), 2);
            });

            $("#fbuyamount").val(getRoundValue(parseFloat(fbuyamount),2));//采购价总额
            fTatalBuyamount = getRoundValue(parseFloat(fbuyamount), 2);
            $("#floanamount").val(getRoundValue(parseFloat(fbuyamount),2));//采购价总额
            $("#fsaleamount").val(getRoundValue(parseFloat(fsaleamount),2));//销售总额
            fTatalSaleamount = getRoundValue(parseFloat(fsaleamount), 2);
            $("#fproxyamount").val(getRoundValue(parseFloat(fproxyamount),2));//代理总额
//            cellRate();
        }

        jj.validate("#formx",{
            check:function () {
                var floanamount = ${obj.fsaleamount};//销售总额
                var fbuyamount= ${obj.fbuyamount};//采购总额
                var paymentPlanAmount=0;//应付金额
                var receipPlanAmount=0;//应收金额

                $.each($("#repaymentPlan").find("tr"),function (ind,item) {
                    paymentPlanAmount = getRoundValue(paymentPlanAmount + parseFloat($(item).find("input[data-name='fpaymentplanback']").val()),2);

                });
                if (getRoundValue(paymentPlanAmount, 2) != fbuyamount) {
                    return "付款计划总额不等于采购总额";
                }


            }
        });




    </script>
</head>
<body>
<div class="mbody">
    <mw:msg/>
    <form class="layui-form" action="${ctx }/repaymentplan/save.shtml" method="post" id="formx" onkeydown="if(event.keyCode==13) return false;">
        <input type="hidden" name="sprojectid" value="${obj.id}">
        <div class="layui-tab layui-tab-card">
            <ul class="layui-tab-title">
                <li class="layui-this">付款计划</li>
            </ul>
            <div class="layui-tab-content" style="height: 100%;">

                <div id="caluclateEarnings" class="layui-tab-item layui-show">

                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                        <legend>付款计划表<c:if test="${obj.istatus eq 100}"><a @click="addPlan('payments')" class="layui-btn layui-btn-sm" style="margin-left: 20px;">增加付款计划</a></c:if></legend>
                    </fieldset>
                    <table class="layui-table" >

                        <thead>
                        <tr>
                            <th style="width:40px;">期数</th>
                            <th style="width:140px;">应付日期</th>
                            <th style="width:100px;">应付金额</th>
                            <th style="width:100px;">累计应付金额</th>
                            <th style="width:100px;">剩余金额</th>
                            <th style="width:100px;">备注</th>
                            <th style="width:50px;">操作</th>
                        </tr>
                        </thead>
                        <tbody id="repaymentPlan">
                        <tr v-for="(payment,index) in payments">
                            <td><span>{{payment.ino}}</span><input type='hidden' :name="'payments['+index+'].ino'"   v-model="payment.ino"/></td>
                            <td><input type='text' :name="'payments['+index+'].dplandate'"  v-model="payment.dplandate" placeholder='(格式：2019-01-01)' class='layui-input required dateISO' autocomplete='off'/></td>
                            <td><input type='text' :name="'payments['+index+'].fplanback'"  data-name="fpaymentplanback" v-model="payment.fplanback" placeholder='(必填项)' class='layui-input required number' autocomplete='off' @change='calculAmount("payments")'/></td>
                            <td><input type='text' :name="'payments['+index+'].freceivabletotal'" v-model="payment.freceivabletotal" class='layui-input readonly' readonly='readonly' autocomplete='off'/></td>
                            <td><input type='text' :name="'payments['+index+'].fless'" v-model="payment.fless" class='layui-input readonly' readonly='readonly' autocomplete='off'/></td>
                            <td><input type='text' :name="'payments['+index+'].sremark'" v-model="payment.sremark" class='layui-input' autocomplete='off'/></td>
                            <td>
                                <a v-if="${obj.istatus eq 100}" v-on:click="del(index,'payments')" class='layui-abtn demo-delete'>删除</a>
                                <a v-if="${obj.istatus eq 100}" v-on:click="del(index,'payments')" class='layui-abtn demo-delete'>删除</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>

                </div>


            </div>

        </div>
    </form>

</div>

<script type="text/javascript">
    var vm = new Vue({
        el: '#formx',
        data: {
            receipts:[],
            payments:[]
        },
        mounted: function () {
            this.loadPlants();
        },
        methods: {
            loadPlants: function () {
                var thice=this;
                jj.post("${ctx }/repaymentplan/payments.json",{"id":'${obj.id}'},function (data) {
                    thice.payments = data.obj.map(x => {
                        x.dplandate= x.dplandate.substring(0,10);
                        x['isoverdue'] = new Date(x.dplandate)<new Date() && x.istatus!=30;
                        return x;
                    });
                });

            },
            del: function (index,type) {
                var array;
                if (type == 'payments') {
                    array = this.payments;
                }else{
                    array = this.receipts;
                }
                array.splice(index, 1);

                array.forEach(function(element,i) {
                    element.ino = i + 1;
                });

                this.calculAmount(type);

            },
            addPlan : function (type) {
                var array;
                if (type == 'payments') {
                    array=this.payments;
                }else{
                    array=this.receipts;
                }
                var plan = {
                    'ino': array.length+1,
                    'dplandate': '',
                    'fplanback': '',
                    'freceivabletotal': '',
                    'fless': '',
                    'sremark': ''
                };
                array.push(plan);
            },
            calculAmount:function (type) {
                //只要一改就全部重新计算
                var fplanback = 0;
                var amount = 0;
                var array;
                if (type == 'receipts') {
                    array = this.receipts;
                    amount = fTatalSaleamount;
                }else{
                    array = this.payments;
                    amount = fTatalBuyamount;
                }
                array.forEach(function(element,i) {
                    fplanback += getRoundValue(element.fplanback, 2);
                    element.freceivabletotal = getRoundValue(fplanback,2);
                    element.fless = getRoundValue(amount - fplanback, 2);
                });



            },
            buildBill:function (id,index) {
                var thice = this;
                layer.confirm('要生成逾期单吗？', function (i, layero) {
                    layer.close(i);
                    jj.post("${ctx}/overduebill/save.json", {id:id},function (result) {
                        if (result.success) {
                            thice.receipts[index].isoverdue = false;
                            jj.msg("生成成功");
                        }else{
                            jj.msg(result.msg);
                        }
                    });
                });
            }
        }
    })
</script>

</body>
</html>