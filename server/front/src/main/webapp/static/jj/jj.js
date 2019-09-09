(function (jj) {
    jj.searchForm = 'searchForm';
    jj.stable="stable";
    jj.xtable="xtable";
    jj.toolBar="xtoolbar";
    jj.showtoolbar=true;
    jj.limit=15;
    jj.height =600;
    jj.width =1000;
    jj.limits=[15,20,25,30,50,100,200];

    jj.init = function () {
        var frm= $("#"+jj.searchForm);
        frm.submit(function () {
            return false;
        });

        var moreopfunc=function(){
            var id=$(this).parent().data('rowid');
            if(id)
                var a=$('div.layui-btn-group[data-rowid='+id+']').first();
            var event=$(this).attr('lay-event');
            $(a).find('a[lay-event='+event+']').trigger('click');
        };

        $(document).delegate('.layui-table-tips a','click', moreopfunc);
        $(document).delegate('.moreop a','click',moreopfunc);
        $(document).delegate('.layui-table-grid-down','mouseenter',function(){

            if(!jj.documentclick){
                $(document).click(function () {
                    layer.closeAll('tips');
                });
                jj.documentclick=true;
            }

            var btns=$(this).parent('td').find('.layui-btn-group');
            if(btns.length!=1){
                var txt="<span style='color: #666666;'>"+$(this).parent('td').text()+"</span>";
                layer.tips(txt, this, {
                    tips: [4, '#ffffff'],
                    time: 10000
                });
                return;
            }


            layer.closeAll('tips');

            var div=btns.clone();
            div.addClass('moreop');
            div.css('text-align','left');
            layer.tips(div.prop("outerHTML"), this, {
                tips: [4, '#ffffff'],
                time: 10000
            });
        });

    };
    jj.validate=function (form,v) {

        if(typeof form =="undefined")
            form="form";
        jj.formname=form;
        $("docunment").ready(function(){

            jj.validateconfig=$(form).validate($.extend({
               // focusInvalid:true,
                focusCleanup:false,
                submitHandler: function(form){
                    //这个窗口是子窗口
                    var r=jj.validateconfig.settings;
                    if(r.check){
                        var msg=r.check();
                        if(msg){
                            jj.error(msg);
                            return;
                        }
                    }
                    jj.submit(form);

                },
                errorPlacement: function(error, element) {
                    // if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
                    //     error.appendTo(element.parent().parent());
                    // } else {
                    //     error.insertAfter(element);
                    // }
                },
                showErrors:function(errorMap,errorList){

                    if(errorList.length!=0){

                        layui.layer.tips(errorList[0].message,errorList[0].element );
                       // jj.error(errorList[0].message);


                    }
                }
            },v||{}));
        });
    };
    jj.where = function () {
        var  rs=tt.where(jj.searchForm);
        var conf=$.extend({},top.triggerConfig||{});

        if(window.location.href.indexOf(conf.url)>0){
            top.triggerConfig={};
            var wh=conf.where||{};
            for(var i in wh){
                var obj= $("#"+jj.searchForm).find('[name="'+i+'"]');
                obj.val(wh[i]);
                rs[i]=wh[i];
            }
        }

        return rs;
    };
    jj.render=function (config) {
        var toolBarhtml=false;
        if (jj.showtoolbar) {
            var toolb="";
            if ($("#"+jj.toolBar).length>0)
                toolb=$("#"+jj.toolBar).html();
            var toolBarhtml="<div class=\"layui-btn-container\">\n" +toolb+
                "            <div class='layui-table-tool-right'><button class=\"layui-btn layui-btn-sm\" lay-event=\"reload\">查询</button>\n" +
                "            <button class=\"layui-btn layui-btn-sm\" lay-event=\"reset\">重置</button>\n" +
                "            </div></div>";
        }
        var x = $.extend(config, {
            elem: "#"+jj.stable,
            id:jj.xtable,
            //  cellMinWidth: 80,
            method: 'post',
            size: 'sm',
            text:{
                none:'抱歉，没有加载到任何数据！'
            },
            toolbar:toolBarhtml,
            defaultToolbar: ['filter', 'print', 'exports'],
            limit:jj.limit,
            limits:jj.limits
        });

        x.url=jj.url;
        x.cols=jj.cols;
        var w=jj.where();
        jj.initWhere=$.extend({},x.where);
        x.where=$.extend(jj.initWhere,w,tt.initSort(x));
        jj.table.render(x);
        jj.initPage=x.page;
        jj.initDone=x.done;
        if(x.page){
            jj.remoteSort();
        }

        jj.table.on("tool("+jj.stable+")",function(obj){
            var type = obj.event;
            jj.title=$(this).text();
            jj[type] ? jj[type].call(this,obj.data) : '';
        });

        jj.table.on('toolbar('+jj.stable+')', function(obj){
            var checkStatus = jj.table.checkStatus(obj.config.id);
            if (obj.event == "reload" || obj.event == "reset" || obj.event == "refresh")
                jj[obj.event] ? jj[obj.event].call(this) : '';
            else
                jj[obj.event] ? jj[obj.event].call(this,checkStatus.data) : '';

        });

    };
    jj.ids=function(key){
        if(!key){
            key="id";
        }
        var s = jj.table.checkStatus(jj.xtable); //test即为基础参数id对应的值
        var rs=[];
        for(var i in s.data){
            rs.push(s.data[i][key]);
        }
        return rs;
    };
    jj.remoteSort=function(){
        jj.table.on('sort('+jj.stable+')', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
//            console.log(obj.field); //当前排序的字段名
//            console.log(obj.type); //当前排序类型：desc（降序）、asc（升序）、null（空对象，默认排序）
//            console.log(this); //当前排序的 th 对象

            //尽管我们的 table 自带排序功能，但并没有请求服务端。
            //有些时候，你可能需要根据当前排序的字段，重新向服务端发送请求，从而实现服务端排序，如：
            jj.reload(obj);
        });
    };

    jj.openWindow=function(url,data,target) {
        var pams = [];
        if (data) {
            for(var i in data){
                pams.push($('<input>', {name: i, value: data[i]}));
            }
        }

       var form= $('<form>', {
            target: target?'_blank':"_self",
            method: 'post',
            action: url
        }).append(pams);

        $('body').append(form);
        form.submit();

    };
    jj.reset=function(){
        window.location.reload();
    };
    jj.export=function(no_ask){
        if(!no_ask){
            layer.confirm("确定要导出吗?", {icon: 3, title:'系统提示'},function(index){
                jj.closeAll();
                jj.export(true);
            });
            return;
        }
        var  exportname=$(document).attr("title")?$(document).attr("title"):tt.toDatetime();
        if(jj.exportname)
            exportname=jj.expotname;

        $('.layui-table').tableExport({
            type : 'csv',
            ignoreColumn: [
                0,jj.cols[0].length-1
            ],
            fileName:exportname,
            worksheetName: exportname
        });

    };
    jj.exportAll=function(){

        layer.confirm("确定要导出全部吗?如果导出数据太多,请耐心等待,它由您电脑的性能决定!", {icon: 3, title:'系统提示'},function(index){
            jj.closeAll();
            var wh=jj.where();
            jj.table.reload(jj.xtable, {
                where: wh
                ,page: {
                    curr: 0, //重新从第 1 页开始
                    limit:100000
                },
                done:function(){
                    jj.export(true);
                    jj.reload();
                }
            });

        });


    };
    jj.msg_reload=function(msg){
        jj.closeChild();
        jj.closeAll('loading');
        jj.msg(msg);
        jj.refresh();

    };
    /**
     * reload 第一页开始重新加载
     * @param x
     */
    jj.reload=function (x) {//x是排序对象

        var wh=jj.where();
        if(x&&x.field&&x.type){
            wh=$.extend(wh,{sort:x.type+"_"+x.field.replace("_",".")});
        }
        jj.table.reload(jj.xtable, {
            initSort:x?x:{},
            where: $.extend(jj.initWhere||{},wh)
            ,page: jj.initPage?{
                curr: 1 ,//重新从第 1 页开始,
                limit:jj.limit
            }:false,
            done:jj.initDone?jj.initDone:function(){}
        });
    };//搜索从1开始显示
    /**
     * 刷新当前页
     */
    jj.refresh=function () {
        jj.table.reload(jj.xtable, {
            where: jj.where(),
            page: jj.initPage?{
                limit:jj.limit
            }:false,
            done:jj.initDone?jj.initDone:function(){}
        });
    };

    jj.post=function(url,data,callback){
        $.ajax({
            type: 'POST',
            url: url,
            data: data,
            traditional: true,
            success: function(rs){
                jj.closeAll('loading');
                if(!rs)
                {
                    jj.error("返回消息格式不正确!!");
                    return ;
                }

                if(callback){
                    callback(rs);
                }
                else{
                    if(rs.success){
                        jj.refresh();
                        if(rs.msg){
                            jj.msg(rs.msg);
                        }
                        else {
                            jj.msg("操作成功!");
                        }

                    }
                    else {
                        jj.msg(rs.msg,5,3);
                    }
                }
            },
            error:function (textStatus) {//请求失败后调用的函数
                var rs;
                try{
                    rs=eval("("+textStatus.responseText.trim()+")");
                }
                catch (e) {
                    alert(textStatus.responseText.trim());
                    return;
                }
                this.success(rs);
            },
            dataType: "json"
        });
        jj.loading();

    };

    jj.loading=function(){
        var layer=layui.layer;
        if(top.layer)
            layer=top.layer;
        layer.load(1);
    };
    jj.closeChild=function(){
        if(jj.openlayer)
            jj.openlayer.close(jj.openindex);
    };
    jj.closeAll=function(type){

        var layer=layui.layer;
        if(top.layer)
            layer=top.layer;
        layer.closeAll(type);
        if(layui.layer)
             layui.layer.closeAll(type);
        if(parent.layui&&parent.layui.layer)
            parent.layui.layer.closeAll(type);

    };
    jj.msg=function(msg,icon,sec){

        var layer=top.layer;
        if(!layer){
            layer=layui.layer;
        }
        layer.msg(msg, {icon:icon?icon:1,time:sec?sec*1000:2000});
    };
    jj.error=function (msg) {
        jj.msg(msg,5,3);
    };
    jj.submit=function(form){

        var data= tt.where($(form));
        if (!$(form).attr("action")){
            if(jj.parent&&jj.parent.jj)
                jj.form(jj.parent.jj.getUrl("save.json"),data);
        }else{
            jj.form($(form).attr("action"),data);
        }

    };
    //子页面的表单提交
    jj.form=function(url,data,callback){

        jj.post(url,data,function(rs){
            if(callback){
                callback(rs);
            }
            else{
                if(rs.success){
                    var msg="操作成功!";
                    if(rs.msg)
                        msg=rs.msg;
                    if(jj.parent)
                        jj.parent.jj.msg_reload(msg);
                    else{
                        jj.closeAll();
                        jj.msg(rs.msg);
                    }
                }
                else {
                    jj.msg(rs.msg,5,3);
                }
            }
        });
    };

    jj.yes=function(index, layero){
        var iframeWin = layero.find('iframe')[0]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
        var $;
        try{
            $=iframeWin.contentWindow.$;
        }
        catch (e) {
            return;
        }


        var doc=$(iframeWin.contentWindow.document);
        if(iframeWin.contentWindow.jj)
            iframeWin.contentWindow.jj.parent=window;
        doc.find('form').first().submit();
        $(iframeWin.contentWindow).bind('beforeunload', function(e) {
            // jj.loading();
        });
    };
    //打开对话框(添加修改)   弹窗
    jj.btn=['确定', '关闭'];
    //可以关闭的对话框
    jj.xopen=function (config) {
        var x={
            closeBtn: 1
        };
        jj.open($.extend(x,config||{}));
    };

    jj.open=function(config){
        var yes=jj.yes;
        var btn=jj.btn;
        if(config.yes)
            yes=config.yes;
        if(config.btn)
            btn=config.btn;

        var index=jj.view($.extend(config,{
            btn:btn,
            yes: yes
        }));
        return index;
    };
    jj.xview=function (config) {
        var x={
            closeBtn: 1
        };
        jj.view($.extend(x,config||{}));
    };

    jj.view=function(config){
        if (navigator.userAgent.match(/(iPhone|iPod|Android|ios)/i)) {//如果是移动端，就使用自适应大小弹窗
            config.area = ['auto','auto'];
        }
        var target=top;
        var lay = top.layer?top.layer:top.layui.layer;
        if(!lay)
            lay=layui.layer;
        if (config.target){
            if(config.target.layer)
                lay = config.target.layer;
            else if(config.target.layui)
                lay=config.target.layui.layer;
            target=config.target;
        }
        var height=(config.height?config.height:(jj.height))+"px";
        var index=lay.open($.extend({
            closeBtn: 0,
            type: 2,
            title: jj.title,
            area:[(config.width?config.width:(jj.width))+"px",height],
            maxmin: false, //开启最大化最小化按钮
            btn: ['关闭'],
            cancel: function(index){},
            success: function(layero, index){
                var iframeWin = layero.find('iframe')[0]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
                if(iframeWin.contentWindow.jj)
                    iframeWin.contentWindow.jj.parent=window;
                target.jjer=window;
            },
            end:function(){
            }
        },config));
        if(config.full){
            lay.full(index);
        }
        jj.openlayer=lay;
        jj.openindex=index;
        return index;

    };


})(window.jj = {});

$(document).ready(jj.init);

(function (tt) {
    tt.initSort=function (x) {
        if(x.initSort && x.initSort.type && x.initSort.field){
            return {sort:x.initSort.type+"_"+x.initSort.field};
        }
        else return {};
    };
    tt.where = function (frm) {
        var rs = {};

        if(typeof frm =="string")
            frm=$("#"+frm);
        var ps = frm.serializeArray();
        for (var p in ps) {
            if (rs[ps[p].name]){
                if (Array.isArray(rs[ps[p].name])) {
                    rs[ps[p].name].push(ps[p].value);
                }else{
                    rs[ps[p].name]=[rs[ps[p].name],ps[p].value];
                }
            } else{
                rs[ps[p].name] = ps[p].value;
            }
        }
        var checks= frm.find('input[type=checkbox]:not(:checked)');
        checks.each(function(){
            var name=$(this).prop('name');
            if(name){
                if (!$(this).val())
                    rs[name]=0;
            }
        });
        checks= frm.find('input[type=checkbox]:checked');
        checks.each(function(){
            var name=$(this).prop('name');
            if(name){
                if (!$(this).val())
                    rs[name]=1;
            }
        });

        return rs;
    };
    /**
     * 格式化数字
     *
     * @param num
     *            需要格式化的数字
     * @param pattern
     *            需要格式化的位数2位就0.00 4位就0.0000
     * @returns
     */
    tt.fmt=function(num, pattern) {
        if (!isNaN(num)) {
            if (num > 0) {
                // if(pattern.lengh<4)
                num = num + 0.000001;
            }
            if (num < 0) {
                // if(pattern.lengh<4)
                num = num - 0.000001;
            }
            var strarr = num ? parseFloat(num).toFixed(20).toString().split('.')
                : [ '0' ];
            var fmtarr = pattern ? pattern.split('.') : [ '' ];
            var retstr = '';
            // 整数部分
            var str = strarr[0];
            var fmt = fmtarr[0];
            var i = str.length - 1;
            var comma = false;
            for ( var f = fmt.length - 1; f >= 0; f--) {
                switch (fmt.substr(f, 1)) {
                    case '#':
                        if (i >= 0)
                            retstr = str.substr(i--, 1) + retstr;
                        break;
                    case '0':
                        if (i >= 0)
                            retstr = str.substr(i--, 1) + retstr;
                        else
                            retstr = '0' + retstr;
                        break;
                    case ',':
                        comma = true;
                        retstr = ',' + retstr;
                        break;
                }
            }
            if (i >= 0) {
                if (comma) {
                    var l = str.length;
                    for (; i >= 0; i--) {
                        retstr = str.substr(i, 1) + retstr;
                        if (i > 0 && ((l - i) % 3) == 0)
                            retstr = ',' + retstr;
                    }
                } else
                    retstr = str.substr(0, i + 1) + retstr;
            }
            retstr = retstr + '.';
            // 处理小数部分
            str = strarr.length > 1 ? strarr[1].replace(/0+$/, '') : '';
            fmt = fmtarr.length > 1 ? fmtarr[1] : '';
            i = 0;
            for ( var f = 0; f < fmt.length; f++) {
                switch (fmt.substr(f, 1)) {
                    case '#':
                        if (i < str.length)
                            retstr += str.substr(i++, 1);
                        break;
                    case '0':
                        if (i < str.length)
                            retstr += str.substr(i++, 1);
                        else
                            retstr += '0';
                        break;
                }
            }
            return retstr.replace(/^,+/, '').replace(/\.$/, '');
        } else {
            return "";
        }
    };
    tt.toDate=function (sdate){


        if(!sdate)
            sdate=new Date();
        if(typeof  sdate == "object" )
        {
            sdate= tt.toDatetime(sdate);
        }
        var rs=sdate.split(" ");
        if(rs.length>0)
            return rs[0];
        return "";

    };
    tt.toDatetime=function (sdate){

        if(!sdate)
            sdate=new Date();
        var datetime = new Date();
        datetime.setTime(sdate.getTime());
        var year = datetime.getFullYear();
        var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
        var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
        var hour = datetime.getHours()< 10 ? "0" + datetime.getHours() : datetime.getHours();
        var minute = datetime.getMinutes()< 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
        var second = datetime.getSeconds()< 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();
        return year + "-" + month + "-" + date +" "+hour+":"+minute+":"+second;

    };


    tt.ext_rs=function(rs) {
        if (rs.success) {
            var msg = "操作成功!";
            if (rs.msg)
                msg = rs.msg;
            jj.msg(msg);
        }
        else {
            jj.msg(rs.msg, 5, 3);
        }
    };
    tt.readonly=function(){
        $(document).ready(function () {
            $('input[type="text"]').css('width','auto').css('border',0).each(function(){
                $(this).val($(this).val()+$(this).parent().next().text());
                $(this).parent().next().text('');
            }).prop('readonly',true).css('height','36px');
            $('textarea').css('border',0).prop('readonly',true).prop('placeholder','');

            //  $('form').find('.layui-inline').css('margin-button',0).prop('placeholder','').css('height','30px');

        });
    };
    tt.cn_time=function(d){
        var rs="";
        if(d<60)
        {
            rs=d.toFixed(0)+"秒";
            return rs;
        }
        d=d/60;
        if(d<60){
            rs=d.toFixed(0)+"分钟";
            return rs;
        }
        d=d/60;
        if(d<24){
            rs=d.toFixed(0)+"小时";
            return rs;
        }
        d=d/24;
        rs=d.toFixed(0)+"天";
        return rs;

    };
    tt.isNumber=function(_str){
        return (_str == "" || parseFloat(_str,10)==(_str*1));
    };


})(window.tt = {});
