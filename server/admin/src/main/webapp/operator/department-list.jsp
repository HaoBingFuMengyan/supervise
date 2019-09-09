<%@ taglib prefix="jj" uri="http://www.frogsing.com/tags/jj" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
	<title>菜单管理</title>
	<%@include file="/include/treetable.jsp" %>
</head>
<body class="">
<div class="wrapper wrapper-content">
	<ul class="layui-nav layui-bg-blue">
		<li class="layui-nav-item ">&nbsp;</li>

	</ul>

			<form id="searchForm">
			</form>

			<table class="layui-hide" id="stable" lay-filter="stable"></table>
			<script>
                layui.use(['table','layer','laytpl'],function(){
                    jj.table =layui.table;
                    jj.url="${ctx}/jj/department/list.json?search_eq_sparentid=${sparentid}";
                    jj.cols= [[
                        {type:'checkbox'}
                        ,{field:'sname',  title: '部门名称', sort: true}
                        ,{field:'sremark', title: '备注',sort: true}
                        ,{fixed: 'right', width:250, align:'center', toolbar: '#barDemo'} //这里的toolbar值是模板元素的选择器

                    ]];
                    jj.render({
                        initSort:{
                            field:"sname",
                            type:"desc"
                        },
                        page: true,
						done:function(res){
                           layui.laytpl('<li class="layui-nav-item">\n' +
                               '\t\t\t<a href="" style="">{{d.parent.sname}}<span class="layui-badge">{{d.count}}</span></a>\n' +
                               '\t\t</li>').render(res,function(str){
                               $('.layui-nav').html(str);
						   });

						}
                    });

                    jj.add=function(){

                        var i=jj.open({
                            content: "${ctx}/jj/department/detail.shtml?sparentid=${sparentid}"
                        });
                        layui.layer.full(i);
                    };


                    jj.detail=function(obj){

                        var i=jj.view({
                            content: "${ctx}/jj/department/detail.shtml?id="+obj.id+"&sparentid="+obj.sparentid
                        });
                        layui.layer.full(i);

                    };
                    jj.addnext=function(obj){
                        var i=jj.open({
                            type: 2,
                            title: "",
                            maxmin: false, //开启最大化最小化按钮
                            content: "${ctx}/jj/department/detail.shtml?sparentid="+obj.id,
                            btn: ['确定', '关闭'],
                            yes: function(index, layero){
                                var iframeWin = layero.find('iframe')[0]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
                                var $=iframeWin.contentWindow.$;
                                var doc=$(iframeWin.contentWindow.document);
                                doc.find('form').first().submit();

                                //setTimeout(function(){lay.close(index);}, 100);//延时0.1秒，对应360 7.1版本bug
                                // sortOrRefresh();
                            },
                            cancel: function(index){}
                        });
                        layui.layer.full(i);


                    }
                    jj.delete=function (obj) {
                        location= "${ctx}/dt/department/delete.shtml?id="+obj.id

                    }
                });
			</script>
			<script type="text/html" id="barDemo">
				<div class="layui-btn-group" data-rowid="{{d.id}}">

				<a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
				<shiro:hasPermission name="department:edit">
					<a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
				</shiro:hasPermission>
				</div>
			</script>
				<script type="text/html" id="xtoolbar">
					<shiro:hasPermission name="department:edit">
						<jj:btn name="添加" event="add"></jj:btn>
						<jj:btn name="删除" event="deleteAll"></jj:btn>
					</shiro:hasPermission>
				</script>



</body>
</html>