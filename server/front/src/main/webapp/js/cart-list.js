/**
 * Created by wangjianglin on 2017/10/25.
 */
$(document).ready(function(){

    //全选
    $("#all_chk").click(function(){
        var flag = $(this).is(':checked');
        if(flag==true){
            $("input[type='checkbox']").prop("checked",true);
        }else{
            $("input[type='checkbox']").prop("checked",false);
        }
        calculateTotal();
    });

});


//Firefox, Google Chrome, Opera, Safari, Internet Explorer from version 9
function OnInput (event) {
    calculateTotal();//计算总价
}
// Internet Explorer
function OnPropChanged (event) {
    calculateTotal();//计算总价
}

//选择店铺的资源
function doChoiceShopChk(shopid){
    var flag = $("#shop_chk_"+shopid).is(':checked');
    if(flag==true){
        $("#"+shopid).find("input[type='checkbox']").each(function(){
            $(this).prop("checked",true);
        });
    }else{
        $("#"+shopid).find("input[type='checkbox']").each(function(){
            $(this).prop("checked",false);
        })
    }
    calculateTotal();
}
function checkall(){
	var flag = $("#checkall").is(':checked');
	if(flag==true){
        $(".ibar_plugin_content").find("input[type='checkbox']").each(function(){
            $(this).prop("checked",true);
        });
    }else{
        $(".ibar_plugin_content").find("input[type='checkbox']").each(function(){
            $(this).prop("checked",false);
        })
    }
	
	calculateTotal();
}
function checkallcart(_id){
	var flag = $("#"+_id).is(':checked');
	if(flag==true){
        $("#main").find("input[type='checkbox']").each(function(){
            $(this).prop("checked",true);
        });
    }else{
        $("#main").find("input[type='checkbox']").each(function(){
            $(this).prop("checked",false);
        })
    }
	
	calculateTotal();
}
function doChoiceResChek(shopid,cartid){
    var flag;

    for (var i=0;i<$("#"+shopid).find("input[type='checkbox']").length-1;i++)
    {
        flag = false;
        if($("#cart-chk_"+$($("#"+shopid).find("input[type='checkbox']")[(i+1)]).attr("data-val")).is(':checked')){
            flag=true;
        }else{
            flag=false;
            break;
        }
    }
    if(flag){
        $("#shop_chk_"+shopid).prop("checked",true);
    }else{
        $("#shop_chk_"+shopid).prop("checked",false);
    }
    calculateTotal();
}




//计算总价
function calculateTotal(){
    var allCash = 0;
    var totalCount = 0;
    var list = $(".order-tb").find("tr[class='infor']").get();
    for(var i=0;i<list.length;i++){
        var selected = $(list[i]).find("td[class='intro']>:checkbox").is(":checked");
        var cash = $(list[i]).find("input[name='fprice']").val();//取单价
        var count = $(list[i]).find("input[class='goods_weight']").val();//取数量
        if(selected){//如果选中的就计算选中的总金额
            allCash += Number(cash)*Number(count);
            totalCount++;
        }
        var productMoney = Number(cash)*Number(count);//单个商品的价格
        $(list[i]).find("p[id='productMoney']").html(fmt(getRoundValue(productMoney,2),"#,##0.00"));
    }

    allCash = Math.round(Number(allCash)*100)/100;
    var pos_decimal = allCash.toString().indexOf('.');
    if (pos_decimal < 0)
    {
        allCash += '.00';
    }
    $("#totalPrice").html(allCash);
    $("#totalCount").html(totalCount);
}

function deleteCart(sid){
	$.ajax({
        type: "post",
        url: c_gtx+"/cart/deleteCart.json",
        data: {"id":sid},
        success: function(data) {
        	if(data.success){
        		
        		if($("#cart-chk_"+sid).parent().parent().find("li").length<2){
        			$("#cart-chk_"+sid).parent().parent().prev().remove();
        			$("#cart-chk_"+sid).parent().parent().remove();
        		}
        		$("#cart-chk_"+sid).parent().remove();	
        	}else{
        		alertx(data.obj);
        	}
        	
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
        	alertx("系统出错，请联系管理员");
        }
    });
	calculateTotal();
}
//结算页面
function doSubmitBalance(){
    var list = $(".order-tb").find("tr[class='infor']").get();
    var cartList = new Array();
    var oldshopid = null;
    for(var i=0;i<list.length;i++){
        var selected = $(list[i]).find("td[class='intro']>:checkbox").is(":checked");
        if(selected){
            var shopid = $(list[i]).find("input[name='shopid']").val();
            var fusableweight= $(list[i]).find("input[name='fusableweight']").val();//可用量
            var scarid = $(list[i]).find("input[name='scarid']").val();
            var inumber = $(list[i]).find("input[class='goods_num']").val();//取件数
            var fweight = $(list[i]).find("input[class='goods_weight']").val();//取数量

            if(parseFloat(fusableweight)<parseFloat(fweight)){
                alert("第"+(i+1)+"条资源的购买量不能大于可用量！");
                return;
            }
            if(parseFloat(fweight)<=0){
                alert("第"+(i+1)+"条资源的购买量不能小于零！");
                return;
            }
            if(fweight==""||fweight==null){
                alert("请输入第"+(i+1)+"条资源的购买量！");
                return;
            }
            if(oldshopid!=null&&oldshopid!=shopid){
                alert("请选中同一个店铺的资源生成合同！");
                return;
            }
            oldshopid = shopid;
            cartList.push({scarid: scarid,inumber: inumber,fweight:fweight});
        }
    }

    if(cartList.length==0){
        alert("请选择资源！");
        return;
    }


    $("#cartjson").val(JSON.stringify(cartList));
    $("#inputForm").submit();
}