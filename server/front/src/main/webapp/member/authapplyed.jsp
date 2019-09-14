<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="sys" uri="http://www.frogsing.com/tags/frontsys" %>
<%@ taglib prefix="member" uri="http://www.frogsing.com/tags/member" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="keywords" content="基金协同监管系统"/>
    <meta name="description" content="基金协同监管系统"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="decorator" charset="" content="jj">
    <title>基金协同监管系统</title>
    <style>
        .layui-form-item .layui-input-inline {
            width: 270px;
        }

        .layui-textarea {
            width: 89%;
        }

        .layui-input-sm {
            height: 30px;
        }
    </style>
    <script type="text/javascript">

        $().ready(function () {


        });

        jj.validate("#formx");

    </script>
</head>
<body>
<div class="mbody">
    <mw:msg/>
    <form class="layui-form" action="${ctx }/hy/member/authapply.json" method="post" id="formx"
          onkeydown="if(event.keyCode==13) return false;"
          enctype="multipart/form-data" autocomplete="on">
        <div class="layui-tab layui-tab-card">
            <div class="layui-tab-content" style="height: 100%;">
                <div id="projectInfo" class="layui-tab-item layui-show">
                    <%--<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">--%>
                        <%--<legend>企业参数</legend>--%>
                    <%--</fieldset>--%>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">注册资本(万元)<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" id="iregmoney" name="iregmoney" placeholder="(必填项)" class="layui-input required" autocomplete="off"/>
                            </div>
                        </div>
                    </div>

                    <legend>填写执行董事信息</legend>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">姓名<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" id="slegalperson" name="slegalperson" placeholder="(必填项)" class="layui-input required" autocomplete="off"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">证件类型<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <%--<member:MemberCardType op="select" name="ilegaltype" defname="请选择证件类型" defval="999" option="class='layui-input required'"/>--%>
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">邮箱<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="" value="" placeholder="(必填项)" class="layui-input required" autocomplete="off"/>
                            </div>
                        </div>
                    </div>

                    <legend>企业联系人信息</legend>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">姓名<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="" value="" placeholder="(必填项)" class="layui-input required" autocomplete="off"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">手机号<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="" value="" placeholder="(必填项)" class="layui-input required" autocomplete="off"/>
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">邮箱<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="" value="" placeholder="(必填项)" class="layui-input required" autocomplete="off"/>
                            </div>
                        </div>
                    </div>

                    <legend>实际控制人联系信息</legend>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">姓名<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="" value="" placeholder="(必填项)" class="layui-input required" autocomplete="off"/>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">手机号<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="" value="" placeholder="(必填项)" class="layui-input required" autocomplete="off"/>
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">邮箱<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="" value="" placeholder="(必填项)" class="layui-input required" autocomplete="off"/>
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">通讯地址<em class="red">*</em></label>
                        <div class="layui-input-block">
                            <input type="text" name="" value="" placeholder="(必填项)" class="layui-input required" autocomplete="off"/>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">营业执照<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <a id="addFile" class="layui-btn layui-btn-sm"
                                   style="margin-left: 20px;">添加附件</a>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">承诺函<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="" value="" placeholder="(必填项)" class="layui-input required" autocomplete="off"/>
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">控制人关系图<em class="red">*</em></label>
                            <div class="layui-input-inline">
                                <input type="text" name="" value="" placeholder="(必填项)" class="layui-input required" autocomplete="off"/>
                            </div>
                        </div>
                    </div>

                </div>


            </div>

        </div>
    </form>

</div>
</body>
</html>