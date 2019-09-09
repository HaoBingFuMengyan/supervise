<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="decorator" content="no"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>盈利测算</title>
<link rel="stylesheet" href="${ctx}/calculator/css/calculator.css" type="text/css">
<script src="${ctx}/js/jquery-1.11.3.js" type="text/javascript"></script>
<script src="${ctxStatic}/layer-v3.1.0/layer/layer.js"></script>
<script src="https://unpkg.com/vue/dist/vue.js"></script>
	<script>
        $(function(){
            $(".closeBtn").click(function(){
                $('.body1').show();
                $('.body2').hide();
            })
        })

	</script>
</head>
<div id="app">

<div  class="body body1">
	<div class="evaSum">
		<div class="name md">合同总额</div>
		<div class="value black">{{yuanyou.heTongE}}万元</div>
	</div>
	<div class="sumModle">
		<div class="modleList" @click="goMore1('yuanyou')">
			<div class="name black">传统贸易模式</div>
			<div class="value">
				<div class="black">成本:{{yuanyou.resultSet.zongCB}}万元</div>
				<div class="black">盈利:{{yuanyou.resultSet.qiYeSY}}万元</div>
			</div>
		</div>
		<div class="modleList" @click="goMore1('caigou')">
			<div class="name black">煤亮子采购</div>
			<div class="value">
				<div class="black">成本:{{caigou.resultSet.zongCB}}万元</div>
				<div class="black">盈利:{{caigou.resultSet.qiYeSY}}万元</div>
			</div>
		</div>
		<div class="modleList" @click="goMore1('gongyinglian')">
			<div class="name black">煤亮子采购+供应链金融</div>
			<div class="value">
				<div class="black">成本:{{gongyinglian.resultSet.zongCB}}万元</div>
				<div class="black">盈利:{{gongyinglian.resultSet.qiYeSY}}万元</div>
			</div>
		</div>
	</div>

	<form action="${ctx}/mb/calculator/evaluateSumMore.html" method="post">
		<input type="hidden" name="obj"/>
		<input type="hidden" name="tapIndex"/>
		<input type="hidden" name="type"/>

	</form>
</div>


<div  class="body body2" style="display:none">
	<div class="moreTop">
		<div class="moreList md" v-if="tapIndex==0">设备类型：设备、大型部件贸易</div>
		<div class="moreList md" v-if="tapIndex==1">配件贸易</div>
		<div class="moreList md" v-if="tapIndex==2">耗材贸易</div>
		<div class="moreList md" @click="gobaidu()">合同额：{{obj.heTongE}}万元</div>
		<div class="moreList md">进货成本：{{obj.jinHuoCB}}万元</div>
	</div>
	<div class="moreSpace">合同款项</div>
	<div class="moreTop">
		<div class="moreList md">首款：{{obj.shouKuan}}万元</div>
		<div class="moreList md">付款周期：{{obj.shouKuanZQ}}天</div>
		<div class="moreList md" v-show="tapIndex==0">二期款：{{obj.erQiKuan}}万元</div>
		<div class="moreList md" v-show="tapIndex==0">付款周期：{{obj.erKuanZQ}}天</div>
		<div class="moreList md">尾款：{{obj.weiKuan}}万元</div>
		<div class="moreList md">付款周期：{{obj.weiKuanZQ}}天</div>
	</div>
	<div class="moreSpace">汇票利率</div>
	<div class="moreTop">
		<div class="moreList md">汇票周期：{{obj.huipiaoZQ}}</div>
		<div class="moreList md">资金利率（年化）：{{obj.ziJinLiLv}}%</div>
		<div class="moreList md">需付利息：{{obj.resultSet.xuFuLiXi}}万元</div>
		<div class="moreList md" v-show="type=='yuanyou'">贴现成本（年化）：{{obj.tieXianCB}}%</div>
		<div class="moreList md" v-show="type!='yuanyou'">服务费用：{{obj.fuWuFY}}万元</div>
	</div>
	<div class="moreSpace">汇总结果</div>
	<div class="moreTop list-last">
		<div class="moreList md">总成本：{{obj.resultSet.zongCB}}万元</div>
		<div class="moreList md">企业收益：{{obj.resultSet.qiYeSY}}万元</div>
	</div>
	<div class="sure-btn">
		<div class="btn closeBtn">确定</div>
	</div>
</div>
</div>


<script>
    new Vue({
        el: '#app',
        data() {
            return {
                type:0,
                obj:{resultSet:{}},
                tapIndex:${tapIndex},
                yuanyou:${yuanyou},
                caigou:${caigou},
                gongyinglian:${gongyinglian}
            };
        },
		<%--mounted:function(){--%>
            <%--this.tapIndex=;--%>
            <%--this.yuanyou= JSON.parse('${yuanyou}');--%>
            <%--this.caigou= JSON.parse('${caigou}');--%>
            <%--this.gongyinglian= JSON.parse('${gongyinglian}');--%>

            <%--console.log(JSON.stringify(this.yuanyou));--%>
		<%--},--%>
        methods:{
            goMore1:function(type){
                switch(type){
                    case 'yuanyou':
                        this.obj=this.yuanyou;
                        break;
                    case 'caigou':
                        this.obj=this.caigou;
                        break;
                    case 'gongyinglian':
                        this.obj=this.gongyinglian;
                        break;

                }

				this.type=type;
                $('.body1').hide();
                $('.body2').show();



                // $('input[name="obj"]').val(JSON.stringify(obj));
                // $('input[name="tapIndex"]').val(this.tapIndex);
                // $('input[name="type"]').val(type);
                // $('form').submit();

                <%--uni.navigateTo({--%>
                    <%--url: '/pages/center/evaluateSumMore?obj={JSON.stringify(obj)}&tapIndex={this.tapIndex}&type=${type}',--%>
                <%--});--%>
            }
        }
    })
</script>
</body>
</html>
