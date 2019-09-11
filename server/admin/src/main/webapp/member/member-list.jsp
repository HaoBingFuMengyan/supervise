<%@ taglib prefix="jj" uri="http://www.frogsing.com/tags/jj" %>
<%@ taglib prefix="member" uri="http://www.frogsing.com/tags/member" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<html>
<head>
    <title>会员管理</title>
    <meta name="decorator" content="jj"/>
</head>
<body class="">
<div class="wrapper wrapper-content">
    <form id="searchForm">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">企业编号</label>
                <div class="layui-input-inline">
                    <input id="susername" name="search_like_smemberno" value="${search_like_smemberno}"
                           class="layui-input" maxlength="50"/>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">企业名称</label>
                <div class="layui-input-inline" style="width: 200px!important;">
                    <input id="search_like_scnname" name="search_like_scnname" value="${search_like_scnname}"
                           class="layui-input" maxlength="50"/>
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">会员类型</label>
                <div class="layui-input-inline">
                    <jj:select name="search_eq_imembertype" items="${member:MemberTypeMap()}"/>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">认证类型</label>
                <div class="layui-input-inline">
                    <jj:select name="search_eq_iauthtype" items="${member:AuthenticateTypeMap()}"/>
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">手机号</label>
                <div class="layui-input-inline">
                    <input name="search_eq_smobile" value="${search_eq_smobile}" class="layui-input" maxlength="50"/>
                </div>
            </div>


            <div class="layui-inline">
                <label class="layui-form-label">注册日期</label>
                <div class="layui-input-inline">
                    <input type="text" id="dadddatestart" name="search_gtetime_dadddate" class="layui-input"
                           value="${search_gtetime_dadddate}">
                </div>
                <div class="layui-form-mid layui-word-aux">-</div>
                <div class="layui-input-inline">
                    <input type="text" id="dadddateend" name="search_ltetime_dadddate" class="layui-input"
                           value="${search_ltetime_dadddate}">
                </div>

            </div>
        </div>

    </form>

    <table class="layui-hide" id="stable" lay-filter="stable"></table>
    <script>
        layui.use(['table', 'layer', 'laytpl', 'laydate'], function () {
            $('#search_like_scnname').bigAutocomplete({
                url: "${ctx}/hy/member/searchMember.json",
                click: 'true',
                select: true,
                callback: function (data) {

                }
            });
            $("#imembertype").change(function () {
                alert(s);
            });
            var laydate = layui.laydate;
            laydate.render({
                elem: '#dadddatestart',
                event: 'focus'
            });
            laydate.render({
                elem: '#dadddateend',
                event: 'focus'
            });
            jj.table = layui.table;
            jj.url = "${ctx}/jj/member/list.json";
            jj.cols = [[
                {type: 'checkbox'}
                , {field: 'smemberno', title: '会员编号', width: 100, sort: true}
                , {field: 'scnname', title: '企业名称', width: 170, sort: true}
                <%--, {field: 'icompanytype', title: '企业类型',width:90,sort: true,templet:function (d) {--%>
                <%--return ${Member:CompanyType()}[d.icompanytype];--%>
                <%--}}--%>
                , {field: 'sbusinessmode', title: '企业类型', width: 90, sort: true}
                , {
                    field: 'imembertype', title: '类型', width: 100, sort: true, templet: function (d) {
                        return ${member:MemberType()}[d.imembertype];
                    }
                }
                , {
                    field: 'iauthype', title: '认证', width: 100, sort: true, templet: function (d) {
                        return ${member:AuthenticateType()}[d.iauthtype];
                    }
                }
                , {field: 'slinkman', title: '联系人', width: 110}
                , {field: 'smobile', title: '手机号', width: 120,}
                , {
                    field: '', title: '企业地址', width: 250, templet: function (d) {
                        return d.sprovince + d.scity + d.sregion + d.sbusaddress;
                    }
                }
                , {
                    field: 'iauthype', title: '注册日期', width: 120, sort: true, templet: function (d) {
                        return tt.toDate(d.dapplydate);
                    }
                }
                , {
                    field: 'dcheckdate', title: '审核日期', width: 120, sort: true, templet: function (d) {
                        return tt.toDate(d.dcheckdate);
                    }
                }
                , {fixed: 'right', width: 265, align: 'left', toolbar: '#barDemo'} //这里的toolbar值是模板元素的选择器

            ]];
            jj.render({
                initSort: {
                    field: "dapplydate",
                    type: "desc"
                },
                page: true,
                done: function (res) {


                }
            });


            jj.edit = function (obj) {

                var i = jj.xopen({
                    area: ['90%', '90%'],
                    content: "${ctx}/hy/member/detail.shtml?id=" + obj.id
                });

            };

            jj.detail = function (obj) {

                var i = jj.xview({
                    area: ['90%', '90%'],
                    content: "${ctx}/hy/member/detail.shtml?id=" + obj.id
                });


            };
            jj.width = 900;
            jj.height = 700;


        });
    </script>
    <script type="text/html" id="barDemo">

        <div class="layui-btn-group" data-rowid="{{d.id}}">
            <jj:listbtn name="查看" event="detail" css=""/>


        </div>
    </script>
    <script type="text/html" id="xtoolbar">

	</script>

</div>
</body>
</html>