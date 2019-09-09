<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include/taglib.jsp" %>
<%@ taglib prefix="contract" uri="http://www.frogsing.com/tags/contract" %>
<%@ taglib prefix="mv" uri="http://www.frogsing.com/tags/frogsing" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>合同列表</title>
    <link href="${ctx}/css/salelist.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/css/main.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/css/common.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
        $(function () {
            $("#membername").bigAutocomplete({
                url: "${ctx}/hy/member/searchMember.json",
                click: 'true',
                select: true
            });
        });
    </script>
</head>
<body>
<form id="searchForm" class="layui-form">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">合同编号</label>
            <div class="layui-input-inline">
                <input type="text" name="search_like_scontractsellerno" placeholder="" autocomplete="off"
                       class="layui-input"/>
            </div>
        </div>
    </div>
</form>
<table class="layui-hide" id="stable" lay-filter="stable"></table>


<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    var g_ProjectType = ${project:ProjectType()};
    layui.use(['table', 'layer', 'laydate'], function () {
        var laydate = layui.laydate;

        jj.table = layui.table;
        jj.url = "${ctx}/report/contractreport/list.json";

        jj.cols = [[
            //{type:'checkbox'}
            {
                field: 'itype', title: '项目类型', width: 150, sort: true, templet: function (d) {
                return g_ProjectType[d.project.itype];
            }
            }
            , {field: 'scontractsellerno', title: '合同编号', width: 180, sort: true}
            , {
                field: '', title: '合同主体', width: 200, sort: true, templet: function (d) {
                    if (d.icontracttype == 0)
                        return d.ssellermembername;
                    else
                        return d.sbuyermembername;
                }
            }
            , {field: 'ftotalamount', title: '合同金额(元)', width: 120, sort: true, align: 'right'}
            , {
                field: '', title: '已收发票(元)', width: 120, sort: true, align: 'right', templet: function (d) {
                    if (d.icontracttype == 0)
                        return d.finvoiceamount;
                    else
                        return '';
                }
            }
            , {
                field: '', title: '已开发票(元)', width: 120, sort: true, align: 'right', templet: function (d) {
                    if (d.icontracttype == 1)
                        return d.finvoiceamount;
                    else
                        return '';
                }
            }
            , {
                field: '', title: '未收发票(元)', width: 120, sort: true, align: 'right', templet: function (d) {
                    if (d.icontracttype == 0)
                        return d.fbuyerpayable - d.finvoiceamount;
                    else
                        return '';
                }
            }
            , {
                field: '', title: '未开发票(元)', width: 120, sort: true, align: 'right', templet: function (d) {
                    if (d.icontracttype == 1)
                        return d.fbuyerpayable - d.finvoiceamount;
                    else
                        return '';
                }
            }
            , {
                field: '', title: '已收款(元)', width: 120, sort: true, align: 'right', templet: function (d) {
                    if (d.icontracttype == 1)
                        return d.fbuyerpaid;
                    else
                        return '';
                }
            }
            , {
                field: '', title: '已付款(元)', width: 120, sort: true, align: 'right', templet: function (d) {
                    if (d.icontracttype == 0)
                        return d.fbuyerpaid;
                    else
                        return '';
                }
            }
            , {
                field: '', title: '剩余未收(元)', width: 120, sort: true, align: 'right', templet: function (d) {
                    if (d.icontracttype == 1)
                        return d.fbuyerpayable - d.fbuyerpaid;
                    else
                        return '';
                }
            }
            , {
                field: '', title: '剩余未付(元)', width: 120, sort: true, align: 'right', templet: function (d) {
                    if (d.icontracttype == 0)
                        return d.fbuyerpayable - d.fbuyerpaid;
                    else
                        return '';
                }
            }
            , {fixed: 'right', align: 'left', title: '操作', toolbar: '#barDemo', width: 150} //这里的toolbar值是模板元素的选择器

        ]];

        jj.render({
            initSort: {
                field: "dadddate",
                type: "desc"
            },
            cellMinWidth: 80,
            page: true
        });

        jj.receiptInfoDetail = function (d) {
            layer.open({
                type: 2,
                title: "合同发票详情",
                area: ['90%', '90%'],
                content: '${ctx}/report/contractreport/index_' + d.id + '.shtml?type=0',
                btn: ['关闭'],
                cancel: function (index) {
                }
            });
        };
        jj.billpayDetail = function (d) {
            layer.open({
                type: 2,
                title: "合同收付款详情",
                area: ['90%', '90%'],
                content: '${ctx}/report/contractreport/index_' + d.id + '.shtml?type=1',
                btn: ['关闭'],
                cancel: function (index) {
                }
            });
        }
    });

</script>

<script type="text/html" id="barDemo">

    <div class="layui-btn-group" data-rowid="{{d.id}}">
        <jj:listbtn name="查看发票" event="receiptInfoDetail" type="a" purview=""/>
        <jj:listbtn name="查看收付款" event="billpayDetail" type="a" purview=""/>
    </div>


</script>
</body>
</html>


