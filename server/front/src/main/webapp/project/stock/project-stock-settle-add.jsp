<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp"%>
<%@ taglib prefix="contract" uri="http://www.frogsing.com/tags/contract" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="decorator" content="jj"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link href="${ctx}/css/main.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/of/css/common.css" rel="stylesheet" type="text/css">
    <title>结算单</title>
    <style>
        .layui-table-body{
            min-height: auto;
        }

    </style>
    <link rel="stylesheet" href="${ctx}/static/steps/style.css">
    <script type="text/javascript">
        $(function(){
            layui.config({
                version: 1.0
                ,debug: true
                ,base: '${ctx}/static/'
            }).extend({
                steps:"steps/steps"
            });

            var stepCount = 1;
            layui.use(['layer', 'form','element','table','steps'], function(){
                var element = layui.element;
                var layer = layui.layer,form = layui.form;

                //监听提交
                form.on('submit(*)', function(data){
                    return true;
                });

                var $step= $("#step_demo").step();

                $("#preBtn").click(function(event) {
                    if(stepCount>1){
                        $step.goStep(stepCount-1);//上一步
                        stepCount=stepCount-1;
                    }
                });
                $("#nextBtn").click(function(event) {

                    if(stepCount==1){

                        if($(":radio:checked").length==0){
                            alert("请选择还款计划！");
                            return;
                        }

                        $step.goStep(2);//第二步
                        stepCount=stepCount+1;
                        return;
                    }


                    if(stepCount==2){

                        if($(":checkbox:checked").length==0){
                            alert("请选择项目明细！");
                            return;
                        }
                        $step.goStep(3);//第三步
                        stepCount=stepCount+1;
                    }

                });
                $("#goBtn").click(function(event) {
                    $step.goStep(3);//到指定步
                });
            });
        });


    </script>
</head>
<body>
<div id="step_demo" class="step-body">
    <div class="step-header" style="width:80%;overflow: hidden;margin-top: 20px;margin-bottom: 20px;">
        <ul>
            <li>
                <span class="step-name">选择还款计划表</span>
            </li>
            <li>
                <span class="step-name">选择项目明细</span>
            </li>
            <li>
                <span class="step-name">项目结算</span>
            </li>
        </ul>
    </div>
    <div class="step-content">
        <div class="step-list">
            <div class="billwish-table-body">
                <table class="table billWishTable">
                    <thead>
                    <tr>
                        <th width="3%">选择</th>
                        <th width="10%">应还开始日期</th>
                        <th width="10%">应还结束日期</th>
                        <th width="10%">应还本金</th>
                        <th width="10%">应还利息</th>
                        <th width="8%">累计应还本金</th>
                        <th width="8%">罚息</th>
                        <th width="8%">累计已还本金</th>
                        <%--<th width="10%">剩余本金</th>--%>
                        <th width="10%">实还日期</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${repaymentPlans}" var="obj">
                        <tr class="headerrow" id="${obj.id}content">
                            <td><input type="radio" name="repaymentradio" class="i-checks" value="${obj.id}"/></td>
                            <td><mw:format label="date" value="${obj.dplandate}"/></td>
                            <td><mw:format label="date" value="${obj.denddate}"/></td>
                            <td><mw:format label="money" value="${obj.fplanback}"/></td>
                            <td><mw:format label="money" value="${obj.fplaninterest}"/></td>
                            <td><mw:format label="money" value="${obj.fplanback+obj.fplaninterest}"/></td>
                            <td><mw:format label="money" value="${obj.fdefaultinterest}"/></td>
                            <td><mw:format label="money" value="${obj.frealback+obj.frealinterest}"/></td>
                            <%--<td class="orangefont"><mw:format label="money" value="${obj.denddate}"/>${obj.fless}</td>--%>
                            <td><mw:format label="date" value="${obj.drealdate}"/></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

        </div>
        <div class="step-list">
            <div class="billwish-table-body">
                <table class="table billWishTable">
                    <thead>
                    <tr>
                        <th width="3%">选择</th>
                        <th width="10%">物资名称</th>
                        <th width="10%">规格型号</th>
                        <th width="10%">生产厂商</th>
                        <th width="10%">所属设备信息</th>
                        <th width="8%">采购数量</th>
                        <th width="8%">可用数量</th>
                        <th width="8%">提货量</th>
                        <th width="8%">采购价(元)</th>
                        <th width="8%">销售价(元)</th>
                        <th width="10%">代理价(元)</th>
                        <%--<th width="10%">应入库量</th>--%>
                        <%--<th width="10%">已入库量</th>--%>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${project.detailsList}" var="sin">
                        <tr class="headerrow" id="${obj.id}content">
                            <td><input type="checkbox" class="i-checks" value="${sin.id}"/></td>
                            <td>${sin.scommodityname }</td>
                            <td>${sin.sspec }</td>
                            <td>${sin.sproducer }</td>
                            <td>${sin.shostname }、${sin.shostmodel }、${sin.shostbrand }</td>
                            <td>${jj:weight(sin.fweight)}&nbsp;${sin.sweightunit}</td>
                            <td>${jj:weight(sin.fweight-sin.fselfladingweight)}&nbsp;${sin.sweightunit}</td>
                            <td><input style="width:100px" type="number" class="layui-input"  name="fweights" value="${sin.fweight-sin.fselfladingweight}" /></td>
                            <td><mw:format label="money" value="${sin.fbuyprice}"/></td>
                            <td data-name="fsaleprice"><mw:format label="money" value="${sin.fsaleprice}"/></td>
                            <td><mw:format label="money" value="${sin.fproxyprice}"/></td>
                            <%--<td><mw:format label="money" value="${sin.fnoticeinweight}"/></td>--%>
                            <%--<td><mw:format label="money" value="${sin.finwegith}"/></td>--%>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="step-list">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;font-size: 12px;">
                <legend>结算主项</legend>
            </fieldset>
            <form action="${ctx}/projectsettle/save.json" method="post" id="formx" class="layui-form" lay-size="sm" lay-filter="formDemo">
                <input type="hidden" name="id" value=""/>
                <input type="hidden" name="sprojectid" value="${project.id}"/>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">结算总额</label>
                        <div class="layui-input-inline">
                            <input type="text" id="famount" name="famount" value="" placeholder="" class="layui-input" autocomplete="off" readonly/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">优惠总额 </label>
                        <div class="layui-input-inline">
                            <input type="text" name="fdiscount" id="fdiscount" value="" placeholder="" class="layui-input" autocomplete="off"  readonly/>
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">说明 </label>
                    <div class="layui-input-block">
                        <textarea placeholder="请输入结算单说明" name="sremark" class="layui-textarea"></textarea>
                    </div>
                </div>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;font-size: 12px;">
                    <legend>结算明细</legend>
                </fieldset>
                <table class="layui-table" id="pledges" lay-size="sm">
                    <colgroup>
                        <col width="15%">
                        <col width="10%">
                        <col width="10%">
                        <%--<col width="10%">--%>
                        <col width="20%">
                        <col>
                        <col width="10%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th >科目</th>
                        <th >结算金额(元)</th>
                        <th >优惠金额(元)</th>
                        <%--<th >应收金额(元)</th>--%>
                        <th >结算周期</th>
                        <th >说明</th>
                        <th >操作</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </form>
        </div>
    </div>

</div>
<div style="text-align: center;">
    <button id="preBtn" data-type="add" class="layui-btn  layui-btn-sm" data-toggle="tooltip" data-placement="left" title="上一步"><i class="fa fa-plus"></i>上一步</button>
    <button id="nextBtn" class="layui-btn layui-btn-sm layui-btn-normal">下一步</button>
</div>
</body>
</html>
