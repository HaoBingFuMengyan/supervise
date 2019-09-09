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
//		点击选择，弹窗
        $("#choose").click(function(){
            $(".mask").show();
            $(".tab-con").animate({"bottom":"10px"},500)
        })
        //		关闭弹窗
        $(".mask").click(function(){
            $(".mask").hide();
            $(".tab-con").animate({"bottom":"-100%"},500)
        })
    })

</script>
</head>
<body>

    <div id="app" class="body">
        <div class="mask"></div>
        <div class="tab-con">
            <ul>
                <li @click="choose(0)">设备、大型部件贸易</li>
                <li @click="choose(1)">配件贸易</li>
                <li @click="choose(2)">耗材贸易</li>
            </ul>
        </div>
        <div id="choose" class="list dope-list noTop" >
            <div class="uni-list-cell-navigate uni-list-cell-pd">
                <div class="word">
                    <div class="md black">{{title}}</div>
                </div>
                <div class="more md">选择</div>
            </div>
        </div>
        <div class="list dope-list noTop">
            <div class="uni-list-cell-navigate uni-list-cell-pd">
                <div class="word">
                    <div class="md black">合同额（万元）</div>
                </div>
                <div class="more black md"><input class="black" type="text" v-model="yuanyou.heTongE"/></div>
            </div>
        </div>
        <div class="list dope-list noTop">
            <div class="uni-list-cell-navigate uni-list-cell-pd">
                <div class="word">
                    <div class="md black">进货成本（万元）</div>
                </div>
                <div class="more black md">
                    <input type="number" class="value" v-model="yuanyou.jinHuoCB" placeholder="请输入金额" />
                </div>
            </div>
        </div>
        <div class="evaluate-tit md gray">合同款项分期</div>
        <div class="list dope-list noTop">
            <div class="uni-list-cell-navigate uni-list-cell-pd">
                <div class="word">
                    <div class="md black">首款（万元）</div>
                </div>
                <div class="more black md"><input class="black" type="number" v-model="yuanyou.shouKuan"/></div>
            </div>
        </div>
        <div class="list dope-list noTop">
            <div class="uni-list-cell-navigate uni-list-cell-pd">
                <div class="word">
                    <div class="md black">付款周期（天）</div>
                </div>
                <div class="more black md">
                    <input class="value" type="number" v-model="yuanyou.shouKuanZQ" placeholder="请输入天数" />
                </div>
            </div>
        </div>
        <div class="list dope-list noTop" v-show="tapIndex==0">
            <div class="uni-list-cell-navigate uni-list-cell-pd">
                <div class="word">
                    <div class="md black">二期款（万元）</div>
                </div>
                <div class="more black md"><input class="black" type="number" v-model="yuanyou.erQiKuan"/></div>
            </div>
        </div>
        <div class="list dope-list noTop" v-show="tapIndex==0">
            <div class="uni-list-cell-navigate uni-list-cell-pd">
                <div class="word">
                    <div class="md black">付款周期（天）</div>
                </div>
                <div class="more black md">
                    <input class="value" type="number" v-model="yuanyou.erKuanZQ" placeholder="请输入天数" />
                </div>
            </div>
        </div>
        <div class="list dope-list noTop">
            <div class="uni-list-cell-navigate uni-list-cell-pd">
                <div class="word">
                    <div class="md black">尾款（万元）</div>
                </div>
                <div class="more black md"><input class="black" type="number" v-model="yuanyou.weiKuan" placeholder="请输入尾款" /></div>
            </div>
        </div>
        <div class="list dope-list noTop">
            <div class="uni-list-cell-navigate uni-list-cell-pd">
                <div class="word">
                    <div class="md black">付款周期（天）</div>
                </div>
                <div class="more black md">
                    <input class="value" type="number" v-model="yuanyou.weiKuanZQ" placeholder="请输入天数" />
                </div>
            </div>
        </div>
        <div class="evaluate-tit md gray">利率</div>
        <div class="list dope-list noTop">
            <div class="uni-list-cell-navigate uni-list-cell-pd">
                <div class="word">
                    <div class="md black">汇票周期（天）</div>
                </div>
                <div class="more black md">
                    <input class="value" type="number" v-model="yuanyou.huipiaoZQ" placeholder="请输入天数" />
                </div>
            </div>
        </div>
        <div class="list dope-list noTop">
            <div class="uni-list-cell-navigate uni-list-cell-pd">
                <div class="word">
                    <div class="md black">资金利率（年化）</div>
                </div>
                <div class="more black md">
                    <input class="value" type="number" v-model="yuanyou.ziJinLiLv" placeholder="请输入利率" />%
                </div>
            </div>
        </div>
        <div class="list dope-list noTop list-last">
            <div class="uni-list-cell-navigate uni-list-cell-pd">
                <div class="word">
                    <div class="md black">贴现成本（年化）</div>
                </div>
                <div class="more black md">
                    <input class="value" type="number" v-model="yuanyou.tieXianCB" placeholder="请输入利率" />%
                </div>
            </div>
        </div>
        <div class="sure-btn">
            <div class="btn" @click="goSum()">确定</div>
        </div>
    </div>


<script>

    new Vue({
        el: '#app',
        data() {
            return {
                title:'设备、大型部件贸易',
                tapIndex:0,
                success:true,
                //原有贸易模式
                yuanyou:{

                    heTongE:1000,  //合同额
                    jinHuoCB:'',   //进货成本
                    erQiKuan:600,  //二期款
                    weiKuan:100,
                    shouKuan:300,
                    shouKuanZQ:'',   // 守款付款周期
                    erKuanZQ:'',   // 二期款付款周期
                    weiKuanZQ:'',   // 尾款付款周期
                    ziJinLiLv:'',
                    huipiaoZQ:'',	//汇票周期
                    tieXianCB:'',  //贴现成本
                    resultSet:{   //计算出来的结果集
                        xuFuLiXi:0,
                        zongCB:0,
                        qiYeSY:0
                    }
                },
                //煤亮子采购
                caigou:{
                    heTongE:0,  //合同额
                    jinHuoCB:0,   //进货成本
                    erQiKuan:0,  //二期款
                    weiKuan:0,
                    shouKuan:0,
                    shouKuanZQ:0,   // 守款付款周期
                    erKuanZQ:0,   // 二期款付款周期
                    weiKuanZQ:0,   // 尾款付款周期
                    ziJinLiLv:0,
                    huipiaoZQ:'',	//汇票周期
                    tieXianCB:0,  //贴现成本
                    fuWuFY:0,	//服务费用
                    resultSet:{   //计算出来的结果集
                        xuFuLiXi:0,
                        zongCB:0,
                        qiYeSY:0
                    }
                },
                //煤亮子采购+供应链金融
                gongyinglian:{
                    heTongE:0,  //合同额
                    jinHuoCB:0,   //进货成本
                    erQiKuan:0,  //二期款
                    weiKuan:0,
                    shouKuan:0,
                    shouKuanZQ:0,   // 守款付款周期
                    erKuanZQ:0,   // 二期款付款周期
                    weiKuanZQ:0,   // 尾款付款周期
                    ziJinLiLv:0,
                    huipiaoZQ:'',	//汇票周期
                    fuWuFY:0,	//服务费用
                    tieXianCB:0 , //贴现成本
                    resultSet:{   //计算出来的结果集
                        xuFuLiXi:0,
                        zongCB:0,
                        qiYeSY:0
                    }
                },




            }
        },

        methods:{
            calculation: function(){
                this.check();
                //原有贸易模式
                var D3= new Number(this.yuanyou.heTongE);  //合同额
                var F3=new Number(this.yuanyou.jinHuoCB);  //进货成本
                var D4 =new Number(this.yuanyou.shouKuan); //:首款
                var F4 =new Number(this.yuanyou.shouKuanZQ) ;//:首款付款周期
                var D5 = new Number(this.yuanyou.erQiKuan);//:二期款
                var F5 =new Number(this.yuanyou.erKuanZQ);//:二期款付款周期
                var D6 =new Number(this.yuanyou.weiKuan);//:尾款
                var F6 =new Number(this.yuanyou.weiKuanZQ);//:尾款付款周期
                var D7= new Number(this.yuanyou.huipiaoZQ);
                var D8 = new Number(this.yuanyou.ziJinLiLv)/100;//:资金利率
                var D9 =new Number(this.yuanyou.tieXianCB)/100; //:贴现成本
                var D10=0;
                if(this.tapIndex==0){
                    D10= D4*(F4/360)*D8+D5*(F5/360)*D8+D6*(F6/360)*D8+D3*(D7/360)*D9;
                }else{
                    D10=D4*(F4/360)*D8+D6*(F6/360)*D8+D3*(D7/360)*D9;
                }
                this.yuanyou.resultSet.xuFuLiXi=this.toMoney(D10);

                var D11=F3+D10;
                this.yuanyou.resultSet.zongCB= this.toMoney(D11);
                this.yuanyou.resultSet.qiYeSY=this.toMoney(D3-D11) ;


                //煤亮子采购模式
                var D13=this.caigou.heTongE=D3;

                var F13=this.caigou.jinHuoCB=F3;
                var D14= this.caigou.shouKuan=D4;
                var F14= this.caigou.shouKuanZQ=0;
                var D15= this.caigou.erQiKuan=D5;
                var F15= this.caigou.erKuanZQ=30;
                var D16= this.caigou.weiKuan=D6;
                var F16= this.caigou.weiKuanZQ=360;
                this.caigou.huipiaoZQ='现金支付';
                var D18= 0;
                if(this.tapIndex==0){
                    D18=this.caigou.fuWuFY=D13*0.05;
                }else if(this.tapIndex==1){
                    F14 = this.caigou.shouKuanZQ = 30;
                    D18=this.caigou.fuWuFY=D13*0.05;
                }else if(this.tapIndex==2){
                    F14 = this.caigou.shouKuanZQ = 30;
                    D18=this.caigou.fuWuFY=D13*0.05;
                }
                var D19= D8;  //资金利率
                this.caigou.ziJinLiLv=this.yuanyou.ziJinLiLv;    //显示用
                var D20=0;
                if(this.tapIndex==0){
                    D20= D14*(F14/360)*D19+D15*(F15/360)*D19+D16*(F16/360)*D19;
                }else{
                    D20= D14*(F14/360)*D19+D16*(F16/360)*D19;
                }
                this.caigou.resultSet.xuFuLiXi=this.toMoney(D20);
                var D21= F13+D18+D20;
                this.caigou.resultSet.zongCB=this.toMoney(D21);
                this.caigou.resultSet.qiYeSY=this.toMoney(D13-D21);


                //供应链金融模式
                var D23= this.gongyinglian.heTongE=D3;
                var F23= this.gongyinglian.jinHuoCB=F3;
                var D24= this.gongyinglian.shouKuan=D4;
                var F24= this.gongyinglian.shouKuanZQ=0;
                var D25= this.gongyinglian.erQiKuan=D5;
                var F25= this.gongyinglian.erKuanZQ=30;
                var D26= this.gongyinglian.weiKuan=D6;
                var F26=this.gongyinglian.weiKuanZQ=360;
                this.gongyinglian.huipiaoZQ='现金支付';
                var D28= 0;
                if(this.tapIndex==0){
                    D28=this.gongyinglian.fuWuFY=D23*0.05;
                }else if(this.tapIndex==1){
                    D28=this.gongyinglian.fuWuFY=D23*0.05;
                }else if(this.tapIndex==2){
                    D28=this.gongyinglian.fuWuFY=D23*0.05;
                }
                var D29=0.12;   //资金利率
                this.gongyinglian.ziJinLiLv='12';   //显示用
                var D30=0;
                if(this.tapIndex==0){
                    D30= D24*(F24/360)*D29+D25*(F25/360)*D29+D26*(F26/360)*D29;
                }else{
                    F24 = this.gongyinglian.shouKuanZQ = 30;
                    D30= D24 *(F24/360)*D29+D26*(F26/360)*D29;
                }
                this.gongyinglian.resultSet.xuFuLiXi=this.toMoney(D30);
                var D31= F23+D28+D30;
                this.gongyinglian.resultSet.zongCB=this.toMoney(D31);
                var D32= this.gongyinglian.resultSet.qiYeSY =this.toMoney( D23-D31);



            },
            goSum: function(){
                this.calculation();
                if(this.success){
                    console.log(JSON.stringify(this.yuanyou.resultSet));
                    console.log(JSON.stringify(this.caigou.resultSet));
                    console.log(JSON.stringify(this.gongyinglian.resultSet));


                    var form = document.createElement('form');
                    form.action = '${ctx}/mb/calculator/evaluateSum.html';
                    form.method = 'post';
                    var yuanyouIput = document.createElement('input');
                    yuanyouIput.type = 'hidden';
                    yuanyouIput.name = 'yuanyou';
                    yuanyouIput.value = JSON.stringify(this.yuanyou);
                    form.appendChild(yuanyouIput);


                    var caigouIput = document.createElement('input');
                    caigouIput.type = 'hidden';
                    caigouIput.name = 'caigou';
                    caigouIput.value = JSON.stringify(this.caigou);
                    form.appendChild(caigouIput);


                    var gongyinglianIput = document.createElement('input');
                    gongyinglianIput.type = 'hidden';
                    gongyinglianIput.name = 'gongyinglian';
                    gongyinglianIput.value = JSON.stringify(this.gongyinglian);
                    form.appendChild(gongyinglianIput);


                    var indexInput = document.createElement('input');
                    indexInput.type = 'hidden';
                    indexInput.name = 'tapIndex';
                    indexInput.value = this.tapIndex;
                    form.appendChild(indexInput);

                    $(document.body).append(form);
                    form.submit();


                    <%--location.href = '${ctx}/mb/calculator/evaluateSumMore.html?yuanyou=' + JSON.stringify(this.yuanyou) + '&caigou=' + JSON.stringify(this.caigou) + '&gongyinglian=' + JSON.stringify(this.gongyinglian) + '&tapIndex=' + this.tapIndex;--%>
                };

//
            },
            check: function(){
                if(!this.yuanyou.heTongE){
                    this.error('合同额不能为空');
                    this.success=false;
                    return;
                }
                if(!this.yuanyou.jinHuoCB){
                    this.error('进货成本不能为空');
                    this.success=false;
                    return;
                }
                if(!this.yuanyou.shouKuan){
                    this.error('首款不能为空');
                    this.success=false;
                    return;
                }
                if(!this.yuanyou.shouKuanZQ){
                    this.error('首款周期不能为空');
                    this.success=false;
                    return;
                }

                if(!this.yuanyou.weiKuan){
                    this.error('尾款不能为空');
                    this.success=false;
                    return;
                }

                if(this.tapIndex==0){
                    if(!this.yuanyou.erQiKuan){
                        this.error('二期款不能为空');
                        this.success=false;
                        return;
                    }
                    if(!this.yuanyou.erKuanZQ){
                        this.error('二期付款周期不能为空');
                        this.success=false;
                        return;
                    }
                }

                if(!this.yuanyou.weiKuanZQ){
                    this.error('尾款周期不能为空');
                    this.success=false;
                    return;
                }
                if(!this.yuanyou.huipiaoZQ){
                    this.error('汇票周期不能为空');
                    this.success=false;
                    return;
                }
                if(!this.yuanyou.tieXianCB){
                    this.error('贴现成本不能为空');
                    this.success=false;
                    return;
                }
                if(!this.yuanyou.ziJinLiLv){
                    this.error('资金利率不能为空');
                    this.success=false;
                    return;
                }
                if((new Number(this.yuanyou.shouKuan) +new Number(this.yuanyou.erQiKuan) + new Number(this.yuanyou.weiKuan) )!=this.yuanyou.heTongE){
                    this.error('合同分期款项总额不等于合同额');
                    this.success=false;
                    return ;
                }

                this.success=true;
            },

            error:function(msg){
                layer.msg(msg);
            },


            toMoney:function(val){
                return val.toFixed(2);
            },

            choose:function(index){
                console.log(index);


                if(index==0){
                    this.title='设备、大型部件贸易';
                    this.yuanyou.erQiKuan=600;
                    this.yuanyou.shouKuan=300;
                }else if(index==1){
                    this.title='配件贸易';
                    this.yuanyou.shouKuan=900;
                    this.yuanyou.erQiKuan=0;
                    this.yuanyou.erKuanZQ=0;
                }else if(index==2){
                    this.title='耗材贸易'
                    this.yuanyou.shouKuan=900;
                    this.yuanyou.erQiKuan=0;
                    this.yuanyou.erKuanZQ=0;
                }
                this.tapIndex=index;

                $(".mask").hide();
                $(".tab-con").animate({"bottom":"-100%"},500);
            }

        }
    });






</script>

</body>
</html>
