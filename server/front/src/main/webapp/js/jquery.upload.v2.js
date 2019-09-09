$.fn.uploadfiles = function (options) {
    options = options || {};
    options.dom = this;
    $.uploadfiles(options);
}

$.uploadfiles = function (options) {
    var settings = {
        dom: "",
        action: "",
        fileName: "file",
        id:"_uploadFile",
        params: {},
        accept: ".jpg,.png",
        ieSubmitBtnText: "上传",
        complete: function () {
        },
        submit: function () {

        }
    }
    settings = $.extend(settings, options);
    var ele = settings.dom;

    var iframeName = "leunpha_iframe_v" + Math.random() * 100;
    var width = ele.outerWidth();
    var height = ele.outerHeight();
    var iframe = $("<iframe></iframe>");
    iframe.attr({
        "name": iframeName,
        id: iframeName
    }).css({
           display: "none"
        });
    var form = $("<form></form>");
    form.attr({
        target: iframeName,
        action: settings.action,
        method: "post",
        "class": "ajax_form",
        enctype: "multipart/form-data"
    }).css({
    	display: "none"
        });
    var input = $("<input type='file'/>");
    input.attr({
        accept: settings.accept,
        name: settings.fileName,
        id: settings.id
    }).css({
    	display: "none"
        });
    //input.css("z-index",20000);
    input.change(function () {
        if(settings.submit.call(form)){
        	$(this).parent("form").submit();
        }
    });
    form.append(input);
    $("body").append(iframe);
    iframe.after(form);
    for (var param in settings.params) {
        var div = $("<input type='hidden'/>").attr({name: param, value: settings.params[param]});
        input.after(div);
        div = null;
        delete div;
    }
    iframe.load(function () {
        var im = document.getElementById(iframeName);
        var text = $(im.contentWindow.document.body).text();
        if (text) {
            settings.complete.call(null, text);
        }
    });
}