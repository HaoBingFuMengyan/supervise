<%--
  Created by IntelliJ IDEA.
  User: fanyijie
  Date: 2017/9/25
  Time: 下午4:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp"%>

<html>
<head>
<title>煤亮子</title>
<link href="${ctx}/css/common.css" rel="stylesheet" type="text/css">
<link href="${ctx}/of/css/setup.css" rel="stylesheet" type="text/css">
<script src="${ctx}/js/jquery.timer.dev.js" type="text/javascript"></script>
<script src="${ctx}/js/sendmobile.js" type="text/javascript"></script>
<script type="text/javascript">
	
	$(document).ready(function (){
        $("#inputForm").validate();

	});


    doSubmit=function () {
        var loadIndex= layer.load();
        var ssqAcount=$('#ssqAcount').val();

        $.get("${ctx}/sign/ssqstatus.shtml",{'ssqAccount':ssqAcount},function(result){
            layer.close(loadIndex);
            if (!result.success||!result.obj) {
                //自定页

                layer.alert('上上签平台暂时没有还没维护该账号，请先联系管理员');
            }else{

                $.get("${ctx}/sign/checkbinding.json",{'ssqAccount':ssqAcount},function(result){

                    if(!result.success){
                        layer.msg(result.msg);
                        return;
                    }
                    if (result.obj.isbinding) {
                        layer.confirm('检测到本公司已与上上签绑定，是否重新绑定?', {icon: 3, title:'提示'}, function(index){
                            location="${ctx}/sign/relievebinding.shtml";
                        });
                    }else{
                        $('#jump').attr('href',result.obj.bingdingUrl);
                        document.getElementById('jump').click();
                        layer.confirm('已经在新窗口中完成绑定了吗?', {icon: 3, title:'提示'}, function(index){
                            $.get("${ctx}/sign/checkbinding.json",{'ssqAccount':ssqAcount},function(result){
                                if (result.obj.isbinding) {
                                    $.post("${ctx}/hy/member/saveqmacount.shtml",$("#inputForm").serialize(),function(result){
                                        if (result.success) {
                                            location.reload();
                                        }else{
                                            layer.msg(result.msg);
                                        }
                                    });
                                }else{
                                    layer.msg('未与上上签进行绑定');
                                }
                            });

                            layer.close(index);
                        });

                    }
                });

            }


        });



    }




</script>
</head>
<body>
	<sys:message content="${message}"></sys:message>
	<div class="ac top10" style="background: #fff;padding:30px 0">
		<form id="inputForm" action="${ctx}/hy/user/password.shtml" method="post">
            <c:choose>
            <c:when test="${member.bisbestsign eq 0}">
			<div class="sqcon top30" style="width: 660px;">

                    <div class="input_group input_group_lg bottom20 left120">
                        <label>上上签账号：</label><input name="ssqAcount" id="ssqAcount"  class="form_control" placeholder="要绑定的手机号" required  />
                    </div>
                    <div class="input_group input_group_lg bottom20 left120 top50">
                        <label></label>
                        <input onclick="doSubmit()" type="button" class="form_control comfir" style="width:356px;" value="确定" />
                    </div>


			</div>
            </c:when>
            <c:otherwise>
                <div>
                    已绑定的账号：${member.ssignaccount}<a href="${ctx}/sign/relievebinding.shtml">解除绑定</a>
                </div>
            </c:otherwise>
            </c:choose>
        </form>
	</div>

	<a target="_blank" id="jump" href="#"></a>
</body>
</html>
