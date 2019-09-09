String.prototype.trim=function() {
    return this.replace(/(^\s*)|(\s*$)/g,'');
}

$(document)
    .ready(
        function() {

            /** 调用查询条件的数据 */
            loadQueryWhere(null);

            $(".supermarket-sorting-content")
                .on(
                    'mouseover',
                    'ul li table td .supermarket-icon em,.supermarket-icon-xia em',
                    function() {
                        $(this).siblings("i.tiaojia ").show();
                    });
            $(".supermarket-sorting-content")
                .on(
                    'mouseout',
                    'ul li table td .supermarket-icon em,.supermarket-icon-xia em',
                    function() {
                        $(this).siblings("i.tiaojia ").hide();
                    });

            /** 点击条件进行选中，并触发事件。 */
            $(".supermarket-search")
                .on(
                    'click',
                    'a',
                    function() {

                        $(this).parents(".supermarket-content")
                            .siblings("p").removeClass(
                            "all");
                        if ($(this).parents(
                                ".supermarket-content")
                                .siblings("i").hasClass(
                                    "multi-select")) {
                            $(this).toggleClass("hover");
                            $(this).parents(
                                ".supermarket-content")
                                .find(".queding").addClass(
                                "hover");
                        } else {
                            $(this).addClass("hover");
                            $(this).parent().siblings().find(
                                "a").removeClass("hover");

                            loadQueryWhere(this);
                        }
                    });

            // 更多事件
            $(".supermarket-search span").click(
                function() {
                    var spanht = $(this).html();
                    if (spanht == "更多") {
                        $(this).siblings(".supermarket-content")
                            .addClass("ht");
                        $(this).html("收起");
                    }
                    if (spanht == "收起") {
                        $(this).siblings(".supermarket-content")
                            .removeClass("ht");
                        $(this).html("更多");
                    }
                });

            // 多选事件
            $(".supermarket-search i").click(
                function() {
                    var _temp = $(this).html();
                    if (_temp.trim() == "+多选") {
                        $(this).html(' 单选');
                        $(this).addClass("multi-select");
                        $(this).siblings(".supermarket-content")
                            .addClass("ht");
                        $(this).siblings(".supermarket-content")
                            .find(".supermarket-content-qx")
                            .show();
                        $(this).siblings("span").addClass("hover");
                        $(this).siblings("span").html("收起");
                        $(this)
                            .siblings(
                                ".supermarket-content-pic")
                            .find(".img_list_content")
                            .removeClass("img_list_height");

                        // 有数据的时候增加样式，没有数据的时候不加样式！
                        if ($(this)
                                .siblings('.supermarket-content')
                                .find('.img_list_content div li')
                                .is(':visible')) {
                            $(this).siblings(
                                ".supermarket-content-pic")
                                .find(".img_list_content>div")
                                .addClass("mg_list_border");
                        }
                    } else {
                        $(this).html(' +多选');
                        $(this).removeClass("multi-select");
                        $(this).siblings(".supermarket-content")
                            .removeClass("ht");
                        $(this).siblings(".supermarket-content")
                            .find(".supermarket-content-qx")
                            .hide();
                        $(this).siblings("span").removeClass(
                            "hover");
                        $(this).siblings("span").html("更多");
                        $(this)
                            .siblings(
                                ".supermarket-content-pic")
                            .find(".img_list_content")
                            .addClass("img_list_height");
                    }
                });
            // 取消事件
            $(".supermarket-content-qx input.qxiao").click(
                function() {
                    $(this).parent().hide();
                    $(this).parents(".supermarket-content")
                        .removeClass("ht");
                    $(this).parents(".supermarket-content")
                        .siblings("span").removeClass("hover");
                    $(this).parents(".supermarket-content")
                        .siblings("span").html("更多");
                    $(this).parents(".supermarket-content")
                        .siblings("p").addClass("all");
                    $(this).parents(".supermarket-content").find(
                        "a").removeClass("hover");
                    $(this).parents(".supermarket-content")
                        .siblings("i").removeClass(
                        "multi-select");
                    $(this).siblings().removeClass("hover");

                    $(this).parents(".supermarket-content").siblings("i").removeClass("multi-select");
                    $(this).parents(".supermarket-content").siblings("i").html("+多选");
                });
            // 点击a事件
            // $(".supermarket-content ul").on('click', 'li a',
            // function(){
            //
            // $(this).parents(".supermarket-content").siblings("p").removeClass("all");
            // if($(this).parents(".supermarket-content").siblings("i").hasClass("multi-select"))
            // {
            // //多选
            // $(this).toggleClass("hover");
            // $(this).parents(".supermarket-content").find(".queding").addClass("hover");
            // } else {
            // //单选
            // $(this).addClass("hover");
            // $(this).parent().siblings().find("a").removeClass("hover");
            //
            // loadQueryWhere(this);
            // }
            // });
            // 全部事件
            $(".supermarket-search>p")
                .click(
                    function() {
                        $(this).addClass("all");
                        $(this)
                            .siblings(
                                ".supermarket-content")
                            .removeClass("ht");
                        $(this).siblings("span").removeClass(
                            "hover");
                        $(this).siblings("span").html("更多");
                        $(this)
                            .siblings(
                                ".supermarket-content")
                            .find(".queding").removeClass(
                            "hover");
                        $(this).siblings("i").removeClass(
                            "multi-select");
                        $(this)
                            .siblings(
                                ".supermarket-content")
                            .find("a").removeClass("hover");
                        $(this)
                            .siblings(
                                ".supermarket-content")
                            .find(".supermarket-content-qx")
                            .hide();
                        $(this)
                            .siblings(
                                ".supermarket-content")
                            .find("input.queding")
                            .removeClass("hover");

                        loadQueryWhere($(this).siblings(
                            '.supermarket-content').find(
                            'ul li a'));
                    });

            // 确定事件
            $(".supermarket-content-qx input.queding").click(
                function() {
                    if ($(this).hasClass('hover')) {
                        $(this).parent().hide();
                        $(this).removeClass("hover");
                        $(this).parents(".supermarket-content")
                            .siblings("i").removeClass(
                            "multi-select");

                        // 加载查询条件
                        loadQueryWhere($(this).parent().parent()
                            .find('ul li a'));
                    }
                });

            // 搜索
            $(".ss input").click(function() {
                loadQueryDate(0);
            });

            // 清空
            $(".st input").click(function() {
                $("#commodityname").val('');
                $("#spec").val('');
                $("#material").val('');
                $("#producer").val('');
                $("#warehouse").val('');
                $("#searchwords").val('');
                $("#skeywords").val('');
                $("#scommodityid").val("");
                //loadQueryDate(0);
            });

        });

/**
 * 查询条件检索
 */
function loadQueryWhere(options) {
    $("#winlayy,.jzz").show();

    var levl = 10;
    if (null != options) {
        levl = $(options).parent().parent().attr('levl');
    }

    var parames = getParames(levl);

    $.ajax({
        url : ctx + "/supermarket/ajaxWhereData"
        + (null == options ? "?caseme=5" : ""),
        type : "POST",
        dataType : "json",
        contentType: "application/x-www-form-urlencoded;charset=UTF-8",
        data : parames,
        success : function(data) {
            dataAnalysis(data.obj, levl);
            loadQueryDate(0, null == options ? "f" : "");
        },
        error : function(data) {

        }
    });
}

/**
 * 填充查询条件
 *
 * @param data
 * @param levl
 */
function dataAnalysis(data, levl) {

    // 品种
    if (levl > 5) {

        //品种扩展属性
        var cphtmls = "";
        var categoryPropertyList = data.categoryPropertyList;

        for(var item in categoryPropertyList){
            var categoryProperty=categoryPropertyList[item];//key所对应的value
            if(categoryProperty.ipropertytype==10){ //select
                cphtmls += "<li>"+categoryProperty.spropertyname+"&nbsp;&nbsp;";
                cphtmls += "<select id="+categoryProperty.senname+"  name="+categoryProperty.senname+">";
                cphtmls +="<option value=\"\">请选择</option>";;
                var spropertySetList =categoryProperty.spropertySetList;
                if (undefined != spropertySetList && spropertySetList.length > 0) {
                    for (var index = 0; spropertySetList.length > index; index++) {
                        cphtmls += "<option value="+spropertySetList[index]+">"+spropertySetList[index]+"</option>";
                    }
                }
                cphtmls += "</select>";
                cphtmls += "</li>";
            }
            if(categoryProperty.ipropertytype==11){ //text
                cphtmls += "<li>"+categoryProperty.spropertyname+"&nbsp;&nbsp;<input type=\"text\" id="+categoryProperty.senname+" name="+categoryProperty.senname+" style=\"width:90px;\"></li>";
            }
        }
        cphtmls += "<li class=\"ss\" style=\"margin-top: 9px;right:0;\"><input type=\"button\" onclick=\"loadQueryDate(0)\" value=\"搜索\">&nbsp;<input type=\"button\" onclick=\"clearIndex()\" id=\"clearall\" value=\"清空\"></li>";

        $("#categoryProperty").html(cphtmls);

    }

    // 品名
    if (levl > 4) {
        var commondityList = data.commondityList;
        var htmls = "";
        var isHas = true;
        if (undefined != commondityList && commondityList.length > 0) {
            for (var index = 0; commondityList.length > index; index++) {
                if (data.scommoditynames != null
                    && data.scommoditynames.length > 0
                    && data.scommoditynames == commondityList[index]) {
                    var _html = '<li><a title="' + commondityList[index]
                        + '"  class="hover">' + commondityList[index]
                        + '</a></li>';
                    htmls = _html + htmls;
                    isHas = false;
                } else {
                    htmls += '<li><a title="' + commondityList[index] + '">'
                        + commondityList[index] + '</a></li>';
                }
            }
            if (data.scommoditynames != null && data.scommoditynames.length > 0
                && isHas) {
                var _html = '<li><a title="' + data.scommoditynames
                    + '" class="hover">' + data.scommoditynames
                    + '</a></li>';
                htmls = _html + htmls;
            }
        }
        $("#scommodityname").parent().siblings("i").removeClass('multi-select');
        $("#scommodityname").siblings().hide();
        $("#scommodityname").html(htmls);

        if (undefined != commondityList && commondityList.length <= 12) {
            $("#scommodityname").parent().siblings('span').hide();
            $("#scommodityname").parent().removeClass('ht');
        } else {
            $("#scommodityname").parent().siblings("span").removeClass("hover");
            $("#scommodityname").parent().siblings("span").html("更多");

            $("#scommodityname").parent().siblings('span').show();
        }

        if (data.scommoditynames != null
            && data.scommoditynames.length == 0
            && isHas
            && !$("#scommodityname").parent().parent().find('p').hasClass(
                "all")) {
            $("#scommodityname").parent().parent().find('p').addClass('all');
        }
    }

    // 仓库
    if (levl > 3) {
        var warehoseList = data.warehoseList;
        var htmls = "";
        var isHas = true;
        if (undefined != warehoseList && warehoseList.length > 0) {
            for (var index = 0; warehoseList.length > index; index++) {
                htmls += '<li><a title="' + warehoseList[index] + '">'
                    + warehoseList[index] + '</a></li>';
            }
        }
        $("#swarehousename").parent().siblings("i").removeClass('multi-select');
        $("#swarehousename").siblings().hide();
        $("#swarehousename").html(htmls);

        if (undefined != warehoseList && warehoseList.length <= 12) {
            $("#swarehousename").parent().siblings('span').hide();
            $("#swarehousename").parent().removeClass('ht');
        } else {
            $("#swarehousename").parent().siblings("span").removeClass("hover");
            $("#swarehousename").parent().siblings("span").html("更多");

            $("#swarehousename").parent().siblings('span').show();
        }

        if (data.sgcname != null && data.sgcname.length == 0 && isHas
            && !$("#swarehousename").parent().parent().find('p').hasClass("all")) {
            $("#swarehousename").parent().parent().find('p').addClass('all');
        }
    }


}

function clearIndex() {
    // 去除所有页面数据
    $("#sgcname").val("");
    $("#scategoryname").val("");
    $("#smembername").val("");
    $("#scommoditynames").val("");
    $("#scommodityid").val("");
    $("#hide_smaterial").val("");
    $("#keywords").val("");
    $("#ssspec").val("");
    $("#searchwords").val("");
    $("#skeywords").val("");

    $("#hanshuilv").val("");
    $("#sspec").val("");
    $("#sgaodu").val("");
    $("#skuandu").val("");
    $("#smadeby").val("");
    $("#slevel").val("");
}

/**
 * 获取参数
 *
 * @returns {___anonymous3456_3711}
 */
function getParames(levl) {
    var parames = {
        'categoryid':$("#categoryid").val(),
        'scommodityname' : encodeURI(getData('scommodityname', levl)),
        'swarehousename' : encodeURI(getData('swarehousename', levl)),
        'keywords':encodeURI($("#skeywords").val()),
        'smemberid':$("#smemberid").val(),
        'scommodityid' : $("#scommodityid").val(),
        'type' : levl,
        'sextparams':getExtParames()
    };
    return parames;
}

/**
 * 获取扩展属性的查询条件
 */
function getExtParames(){
    var extParamMap = {};
    //select
    $("#categoryProperty input[type='text']").each(function(){
        if($(this).val()!=""){
            extParamMap[$(this).attr("name")]=$(this).val();
        }
    });
    //text
    $("#categoryProperty select").each(function(){
        if($(this).val()!=""){
            extParamMap[$(this).attr("name")]=$(this).val();
        }
    });
    return JSON.stringify(extParamMap);
}

/**
 * 获取条件数据
 *
 * @param IDName
 * @returns {Array}
 */
function getData(IDName, levl) {
    var result = [];
    var _levl = $("#" + IDName).attr('levl');
    if (_levl >= levl) {
        $("#" + IDName + " li a.hover").each(function() {
            result.push($(this).html());
        });
        return result.join(",");
    }
    return result.join(",");
}

function loadQueryDate(pageSize, first) {
    //$("#winlayy,.jzz").show();

    var parames = getParames(0);
    var url = ctx + "/supermarket/filter.json?next=false&"
        + ('f' == first ? "caseme=5&" : "") + "pageNo=" + pageSize;
    $.ajax({
        url : url,
        type : "POST",
        cache : false,
        async:false,
        data : parames,
        success : function(data) {
            $("#supermarket-sorting-li").empty(); //先删除原来的数据

            $("#supermarket-sorting-li").append(data);
        },
        error : function(data) {

        }
    });
}

function jumpPage(pageNo) {
    loadQueryDate(pageNo,1);
}

function next(pageNo){
    loadQueryDate(pageNo,1);
}


// 数据分页分析
var _temp_pagesize = -100;

function pageselectCallback(page_index, jq) {
    loadQueryDate(parseInt(page_index) + 1);
    return false;
}

function getOptionsFromForm(current_page) {
    var opt = {
        callback : pageselectCallback
    };
    _temp_pagesize = parseInt(current_page) + 1;
    opt["current_page"] = current_page;
    opt["items_per_page"] = '20';
    opt["num_display_entries"] = '5';
    opt["num_edge_entries"] = '1';
    opt["prev_text"] = '上一页';
    opt["next_text"] = '下一页';
    return opt;
}