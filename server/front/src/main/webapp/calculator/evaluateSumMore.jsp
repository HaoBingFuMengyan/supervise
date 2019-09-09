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
</head>
<body>
<div id="app" class="body">
	<div class="moreTop">
		<div class="moreList md" v-if="tapIndex==0">设备类型：设备、大型部件贸易</div>
		<div class="moreList md" v-if="tapIndex==1">配件贸易</div>
		<div class="moreList md" v-if="tapIndex==2">耗材贸易</div>
		<div class="moreList md" @click="gobaidu()">合同额：{{obj.heTongE}}W</div>
		<div class="moreList md">进货成本：{{obj.jinHuoCB}}W</div>
	</div>
	<div class="moreSpace">合同款项</div>
	<div class="moreTop">
		<div class="moreList md">首款：{{obj.shouKuan}}W</div>
		<div class="moreList md">付款周期：{{obj.shouKuanZQ}}天</div>
		<div class="moreList md" v-show="tapIndex==0">二期款：{{obj.erQiKuan}}W</div>
		<div class="moreList md" v-show="tapIndex==0">付款周期：{{obj.erKuanZQ}}天</div>
		<div class="moreList md">尾款：{{obj.weiKuan}}W</div>
		<div class="moreList md">付款周期：{{obj.weiKuanZQ}}天</div>
	</div>
	<div class="moreSpace">汇票利率</div>
	<div class="moreTop">
		<div class="moreList md">汇票周期：{{obj.huipiaoZQ}}</div>
		<div class="moreList md">资金利率（年化）：{{obj.ziJinLiLv}}%</div>
		<div class="moreList md">需付利息：{{obj.resultSet.xuFuLiXi}}W</div>
		<div class="moreList md" v-show="type=='yuanyou'">贴现成本（年化）：{{obj.tieXianCB}}%</div>
		<div class="moreList md" v-show="type!='yuanyou'">服务费用：{{obj.fuWuFY}}W</div>
	</div>
	<div class="moreSpace">汇总结果</div>
	<div class="moreTop">
		<div class="moreList md">总成本：{{obj.resultSet.zongCB}}W</div>
		<div class="moreList md">企业收益：{{obj.resultSet.qiYeSY}}W</div>
	</div>
</div>




<script>
    new Vue({
        el: '#app',
        data() {
            return {
                tapIndex:${tapIndex},
                obj:${obj},
                type:'${type}'
            };
        },
        methods:{
            gobaidu:function(){
                location.href="https://www.baidu.com"
            }
        }
    })
</script>
</body>
</html>
