String.prototype.trim = function () {
    return this.replace(/(^\s*)|(\s*$)/g, '');
}

$(document).ready(function () {

    /** 调用查询条件的数据 */
    loadQueryWhere(null);

    /** 点击条件选中并触发事件 */
    $("ul.clearfix").on('click','a',function () {
        $(this).parent().siblings().each(function () {
            $(this).find("a").removeClass('supmarket-content');
        });
        $(this).addClass('supmarket-content');

        loadQueryWhere($(this));
    });

    /** 确定事件 */
    $("#formSubmit").click(function() {
        loadQueryDate(0);
    });

    /** 清空事件 */
    $("#cleanForm").click(function () {
        $('#skeywords').val('');
        $('#shostmodel').val('');
        $('#sspec').val('');
        $('#smembername').val('');
        $('#wuzi').val('');

        loadQueryDate(0);
    });
});


/**
 * 查询条件检索
 */
function loadQueryWhere(options) {

    var levl = 10;
    if (null != options) {
        levl = $(options).parent().parent().attr('levl');
    }
    var parames = getParames(levl);

    $.ajax({
        url : ctx + "/supermarket/ajaxWhereData.json",
        type : "POST",
        dataType : "json",
        contentType: "application/x-www-form-urlencoded;charset=UTF-8",
        data : parames,
        success : function(data) {
            dataAnalysis(data.obj, levl);

            loadQueryDate(0);
        },
        error : function(data) {
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
        'skeywords' : $("#skeywords").val(),
        'shostname' : encodeURI(getData('shostname', levl)),
        'shostbrand' : encodeURI(getData('shostbrand', levl)),
        'swarehousename' : encodeURI(getData('swarehousename', levl)),
        'shostmodel':$('#shostmodel').val(),
        'sspec':$('#sspec').val(),
        'smembername':$('#smembername').val(),
        'type' : levl
    };

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
    var _levl = $("#" + IDName).attr('levl');
    if (_levl >= levl) {
        $("#" + IDName + " li a.supmarket-content").each(function() {
            result.push($(this).html());
        });
        return result.join(",");
    }
    return result.join(",");
}

/**
 * 查询新数据
 * @param pageSize
 * @param first
 */
function loadQueryDate(pageSize, first) {
    var parames = getParames(0);
    var url = ctx + "/supermarket/filter.json?pageNo=" + pageSize;
    $.ajax({
        url : url,
        type : "POST",
        cache: false,
        async: false,
        data : parames,
        success : function(data) {
            $("#supermarket-sorting-li").empty(); //先删除原来的数据

            $("#supermarket-sorting-li").append(data);
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
    //主机名称
    if (levl > 5) {
        var shostnamelist = data.shostnameList;
        var htmls = "";
        var isHas = true;
        if (undefined != shostnamelist && shostnamelist.length > 0) {
            for (var index = 0; shostnamelist.length > index; index++) {
                if(shostnamelist[index] != '' && shostnamelist[index] != null)
                    htmls += '<li><a title="' + shostnamelist[index] + '">'
                        + shostnamelist[index] + '</a></li>';
            }
        }
        $("#shostname").html(htmls);

        if (undefined != shostnamelist && shostnamelist.length <= 12) {
            $("#shostname").siblings('button').hide();
        } else {
            $("#shostname").siblings('button').show();
        }
    }
    //主机厂商
    if (levl > 4) {
        var shostbrandlist = data.shostbrandList;
        var htmls = "";
        var isHas = true;
        if (undefined != shostbrandlist && shostbrandlist.length > 0) {
            for (var index = 0; shostbrandlist.length > index; index++) {
                if(shostbrandlist[index] != '' && shostbrandlist[index] != null)
                    htmls += '<li><a title="' + shostbrandlist[index] + '">'
                        + shostbrandlist[index] + '</a></li>';
            }
        }
        $("#shostbrand").html(htmls);

        if (undefined != shostbrandlist && shostbrandlist.length <= 12) {
            $("#shostbrand").siblings('button').hide();
        } else {
            $("#shostbrand").siblings('button').show();
        }
    }
    //仓库名称
    if (levl > 3) {
        var swarehousenamelist = data.swarehousenameList;
        var htmls = "";
        var isHas = true;
        if (undefined != swarehousenamelist && swarehousenamelist.length > 0) {
            for (var index = 0; swarehousenamelist.length > index; index++) {
                htmls += '<li><a title="' + swarehousenamelist[index] + '">'
                    + swarehousenamelist[index] + '</a></li>';
            }
        }
        $("#swarehousename").html(htmls);
    }
}