String.prototype.trim = function () {
    return this.replace(/(^\s*)|(\s*$)/g, '');
}

$(document).ready(function () {

    $(".shop-tab ul li").click(function () {
        var index = $(this).index();
        $(this).addClass('cur').siblings().removeClass('cur');
    })

    /** 调用查询条件的数据 */
    loadQueryWhere(null);

    //搜索本店回车事件
    $("#shopKey").keydown(function (event) {
        var e = event || window.event;//兼容ie
        switch (e.keyCode) {
            case 13: // enter 键
                if (!window.buttonIsFocused) searchShop();
                break;
        }
    });

});

/** 点击条件选中并触发事件 */
function selectQuery(is) {
    var str = $(is).text().trim();
    if (str == '全部' || str == '现货' || str == '资源')
        $("#switch").text(str);

    $(is).siblings().each(function () {
        $(this).removeClass('now');
    });
    $(is).addClass('now');

    loadQueryWhere($(is));
}


/**
 * 查询条件检索
 */
function loadQueryWhere(options) {

    var levl = 10;
    if (null != options) {
        levl = $(options).parent().parent().parent().attr('levl');
    }

    var parames = getParames(levl);

    $.ajax({
        url: ctx + "/member/shop/ajaxWhereData.json",
        type: "POST",
        dataType: "json",
        contentType: "application/x-www-form-urlencoded;charset=UTF-8",
        data: parames,
        success: function (data) {
            dataAnalysis(data.obj, levl);

            var sort = getSortParam();
            loadQueryDate(0, sort);
        },
        error: function (data) {
        }
    });
}

/**
 * 查询新数据
 * @param pageSize
 * @param first
 */
function loadQueryDate(pageSize, sort) {
    var parames = getParames(0);
    if (sort != null)
        parames.sort = sort;
    var url = ctx + "/shop/filter.json?pageNo=" + pageSize;
    $.ajax({
        url: url,
        type: "POST",
        cache: false,
        async: false,
        data: parames,
        success: function (data) {
            $("#content").empty(); //先删除原来的数据

            $("#content").append(data);

            var highdemo = $(".shop-con .shop-le").height();
            console.log(highdemo);
            $(".shop-con .shop-rg").height(highdemo);
        },
        error: function (data) {

        }
    });
}

/**
 * 获取参数
 *
 * @returns {___anonymous3456_3711}
 */
function getParames(levl) {
    var parames = {
        'keywords': $("#shopKey").val(),
        'type': $("#saleresource").find("span[class='searchListBtn now']").data("type"),
        'scode':$("#product_scode").val(),
        'scommodityname': encodeURI(getData('scommodityname900', levl)),
        'swarehousename': encodeURI(getData('swarehousename900', levl)),
      /*  'smemberid': smemberid,*/
        'shopid': $("#shopid").val() ,
        'levl': levl
    }

    return parames;
}

/**
 * 获取条件数据
 *
 * @param IDName
 * @returns {Array}
 */
function getData(IDName, levl) {
    var result = [];
    var _levl = $("#" + IDName).parent().parent().attr('levl');
    if (_levl >= levl) {
        $("#" + IDName + "").find("span[class='searchListBtn now']").each(function () {
            result.push($(this).text()=='全部'?'':$(this).text());
        });
        return result.join(",");
    }
    return result.join(",");
}

/**
 * 排序
 * @param sort
 * @param is
 */
function reOrder(sort, is) {
    $(is).siblings().each(function (i) {
        $(this).removeClass('active');
    });
    $(is).addClass('active');
    loadQueryDate(0, sort);
}

/**
 * 分页
 * @param pageNo
 */
function jumpPage(pageNo) {
    var sort = getSortParam();
    loadQueryDate(pageNo, sort);
}
/**
 * 获取排序参数
 * @returns {*|jQuery}
 */
function getSortParam() {
    return $("#searchOrder span[class='active']").data('sort');
}

/**
 * 搜本店
 */
function searchShop() {
    loadQueryWhere(null);
    var sort = getSortParam();
    loadQueryDate(0, sort);
}
/**
 * 填充查询条件
 *
 * @param data
 * @param levl
 */
function dataAnalysis(data, levl) {
    //品名名称
    if (levl > 8) {
        var scommoditynamelist = data.scommoditynameList;
        var htmls = '<span id="scommodityname0" class="searchListBtn now" onclick="selectQuery(this)">全部</span>';
        if (undefined != scommoditynamelist && scommoditynamelist.length > 0) {
            for (var index = 0; scommoditynamelist.length > index; index++) {
                if (scommoditynamelist[index] != '' && scommoditynamelist[index] != null)
                    htmls += '<span id="scommodityname'+[index + 1]+'" class="searchListBtn" onclick="selectQuery(this)">' + scommoditynamelist[index] + '</span>';
            }
        }
        $("#scommodityname900").html(htmls);

        //隐藏展开按钮
        if (undefined != scommoditynamelist && scommoditynamelist.length <= 9) {
            $("#scommodityname900").siblings('a').hide();
        } else {
            $("#scommodityname900").siblings('a').show();
        }
    }

    //仓库名称
    if (levl > 6) {
        var swarehousenamelist = data.swarehousenameList;
        var htmls = '<span id="swarehousename0" class="searchListBtn now" onclick="selectQuery(this)">全部</span>'
        if (undefined != swarehousenamelist && swarehousenamelist.length > 0) {
            for (var index = 0; swarehousenamelist.length > index; index++) {
                htmls += '<span id="swarehousename'+[index + 1]+'" class="searchListBtn" onclick="selectQuery(this)">' + swarehousenamelist[index] + '</span>';
            }
        }
        $("#swarehousename900").html(htmls);
    }


}
//筛选条件收缩
function shrink(is){
    if($(is).hasClass('close')){
        console.log('in');
        $(is).removeClass('close');
        $(is).find('span').text('收缩');
        $(is).parent('td').find(".showDetail").css({"height":"auto"})
    }else {
        $(is).addClass('close');
        $(is).find('span').text('展开');
        $(is).parent('td').find(".showDetail").css({"height":"25px"})
    }
}

//查看摄像头
function camera(id) {
    layer.open({
        type: 2,
        title: '在线监控查看',
        shadeClose: true,
        shade: 0.8,
        offset: 'auto',
        area: ['80%', '80%'],
        content: '' + ctx + '/wms/warehouse/cameralist.html?storeid=' + id //iframe的url
    });
}

//产品分类查询
function treeQuery(treeNode){
    $("#product_scode").val(treeNode.scode);

    loadQueryWhere(null);
}

//清空查询条件
function empty(){
    var shopid = $("#shopid").val();
    window.location.href=""+ctx+"/shop.html?id="+shopid;
}