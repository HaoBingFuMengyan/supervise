<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="member" uri="http://www.frogsing.com/tags/member" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jj" uri="http://www.frogsing.com/tags/jj" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="decorator" charset="" content="jj">

    <style>
        *{
            -webkit-box-sizing: inherit;
            -moz-box-sizing: inherit;
            box-sizing: inherit;
        }

        body, .layui-tab{
            overflow: hidden;
            margin-left: 0!important;
            margin-right: 0!important;
            margin-bottom: 0!important;
        }
        .layui-tab-content{
            padding-left: 0!important;
            padding-right: 0!important;
            padding-bottom: 0!important;
        }

    </style>

    <title></title>
</head>
<body>
<div class="layui-tab" lay-filter="demo">
    <ul class="layui-tab-title">
    </ul>
    <div class="layui-tab-content">

    </div>
</div>

<script>

    $(document).ready(function(){



    });
    var urls=[
        ["风险检测报告结果", "${ctx}/hy/authapplywarn/report_detail.shtml?id=${data.id}"]
    ];

    function setSrc(i){
        var f1=$('#iframe'+i);
        // if(f1.prop('src')&&i>1)
        // 	 return;

        f1.height($(window).height()-65)
        f1.prop('src', f1.data('url'));


    }
    layui.use(['form','element', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,element=layui.element
            ,laydate = layui.laydate;

        element.on('tab(demo)', function(data){
            setSrc(data.index);
        });
        function addPage(id,title,url) {
            element.tabAdd('demo', {
                title: title
                ,content:'<iframe data-url="' +url+
                '" id="' +id+'" style="border: 0;width:100%;height:100%;" ></iframe>'
                ,id: id
            });
        }
        for(var i=0;i<urls.length;i++ ){
            var row=urls[i];
            addPage("iframe"+i,row[0],row[1]);

        }
        element.tabChange("demo","iframe0");
    });
    jj.validate();

</script>


</div>
</div>

</body>
</body>
</html>