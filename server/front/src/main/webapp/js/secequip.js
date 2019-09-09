String.prototype.trim = function () {
    return this.replace(/(^\s*)|(\s*$)/g, '');
}

$(document).ready(function () {

    /**
     * 点击条件选中并出发查询事件
     */
    $("ul#scommodityname").on('click','a',function () {

        $(this).parent().siblings().each(function () {
            $(this).find("a").removeClass('supmarket-content');
        });

        $(this).addClass('supmarket-content');

        $("#mainForm").find("input[data-name='scommodityname']").val($(this).text());

        loadQueryWhere(null);
    });

    $("ul#sspec").on('click','a',function () {

        $(this).parent().siblings().each(function () {
            $(this).find("a").removeClass('supmarket-content');
        });

        $(this).addClass('supmarket-content');

        $("#mainForm").find("input[data-name='sspec']").val($(this).text());

        loadQueryWhere(null);
    });

});


/**
 * 查询条件检索
 */
function loadQueryWhere(options) {

    $("#mainForm").submit();

}