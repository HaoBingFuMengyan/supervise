<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ include file="/include/taglib.jsp"%>


    jj.sign=function (obj) {
        var load_index= layer.load();
        $.get("${ctx}/sign/checkbinding.json",{ssqAccount:'18939745787'}, function(result){
            if(result.success){
                if(!result.obj.isbinding){
                    layer.close(load_index);
                    layer.confirm('您尚未绑定上上签账号，前去绑定?', function(index){
                        location="/hy/member/qmacount.shtml";
                    },function () {
                        //短信签署
                        <%--$.get("${ctx}/sign/sms_sign.shtml?contractid="+obj.id, function(result){--%>
                            <%--layer.close(load_index);--%>
                            <%--if(result.success){--%>
                                <%--jj.msg(result.msg,1);--%>
                                <%--return ;--%>
                            <%--}--%>
                            <%--jj.error("签署失败");--%>
                        <%--});--%>

                    });
                }else{
                    //跳转到合同签署页面
                    $.get("${ctx}/sign/pc_sign.shtml?contractid="+obj.id, function(result){
                        layer.close(load_index);
                        if(result.success){
                            openNew(result.obj);
                            return ;
                        }
                        jj.error(result.msg);
                    });
                }
            }else{
                jj.error(result.msg);
            }
        });
    }


    jj.downloadContract=function(obj){
        location='${ctx}/sign/download.shtml?contractid='+obj.id;

    }


    //防止新窗口被屏蔽
    function openNew(url){
        var a = document.createElement('a');
        a.target="_blank";
        a.href=url;
        a.click();
    }



