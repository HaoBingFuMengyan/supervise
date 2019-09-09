$(function () {
    new condition_selection(); //导入条件选择，导入模板选择
});

function condition_selection() {
    //说明：在form表单里面放两个隐藏的input的目的是为了表单提交时，能把选择的情况提交到后台
    //因为jquery.form.js只能提交表单数据，不能由自己指定提交什么数据

    $("#template_type").bind("change", function () {
        var html;
        if ($(this).children("option:selected").val() == "0") {
            //更换模板样表下载地址
            $("#sample_table").html("[正品、打包模板样表]");

            $("#sample_table").attr("href", package);

            //$(".btn_upload_mask").show(); //把真正的上传按钮显示起来

            //#region 更换表头
            html = "<th>品名</th>"
                + "<th>钢卷号</th>"
                + "<th>材质</th>"
                + "<th>表面</th>"
                + "<th>材质表面</th>"
                + "<th>规格</th>"
                + "<th>参考厚度</th>"
                + "<th>件重(吨)</th>"
                + "<th>件重(公斤)</th>"
                + "<th>件数</th>"
                + "<th>张数</th>"
                + "<th>等级</th>"
                + "<th>边部</th>"
                + "<th>生产厂家</th>"
                + "<th>交货库</th>"
                + "<th>起价</th>"
                + "<th>加价幅度</th>"
                + "<th>备注</th>"
                + "<th>入库时间</th>";


                html += "<th>包装</th>" +
                    "<th>交货期</th>";


            $("#import_success_product thead").empty().append("<tr>" + html + "</tr>"); //更换表头
            $("#import_error_product thead").empty().append("<tr><th>错误提示</th>" + html + "</tr>"); //更换表头
            $("#pass").empty()
            $("#reject").empty()
            //#endregion
        }
        else if ($(this).children("option:selected").val() == "2") {
            //更换模板样表下载地址
            $("#sample_table").html("[可利用材模板样表]");

            $("#sample_table").attr("href", usematerial);

            //$(".btn_upload_mask").show(); //把真正的上传按钮显示起来

            //#region 更换表头
            html = "<th>批号</th>"
                + "<th>品名</th>"
                + "<th>材质</th>"
                + "<th>生产厂家</th>"
                + "<th>交货库</th>"
                + "<th>件重(吨)</th>"
                + "<th>件重(公斤)</th>"
                + "<th>件数</th>"
                + "<th>起价</th>"
                + "<th>加价幅度</th>"
                + "<th>备注</th>"
                + "<th>交货期</th>";


            $("#import_success_product thead").empty().append("<tr>" + html + "</tr>"); //更换表头
            $("#import_error_product thead").empty().append("<tr><th>错误提示</th>" + html + "</tr>"); //更换表头
            $("#reject").empty()
            $("#pass").empty()
            //#endregion
        }
        else {
            //更换模板样表下载地址
            $("#sample_table").html("[请先选择条件]");
            $("#sample_table").attr("href", "javascript:no_select_prompt();");
            //$(".btn_upload_mask").hide(); //把真正的上传按钮隐藏起来
            $("#import_success_product thead").empty(); //更换表头
            $("#import_error_product thead").empty(); //更换表头
        }
    });
}

function no_select_prompt() {
    zAlert("请选择货品拍卖分类之后再下载相对应的模板样表！");
    return;
}
