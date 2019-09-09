<%@ taglib prefix="jj" uri="http://www.frogsing.com/tags/jj" %>
<%@ taglib prefix="Member" uri="http://www.frogsing.com/tags/member" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
	<title>会员管理</title>
	<link href="${ctx}/css/common.css" rel="stylesheet" type="text/css">
</head>
<body class="">
	<form id="searchForm" class="layui-form">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">手机号</label>
				<div class="layui-input-inline">
					<input id="susername" name="search_like_susername" value="${search_like_smobile}" class="layui-input"  maxlength="50"/>
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">姓名</label>
				<div class="layui-input-inline">
					<input id="sname" name="search_like_sname" value="${search_like_sname}" class="layui-input"  maxlength="50"/>
				</div>
			</div>
		</div>

	</form>

	<table class="layui-hide" id="stable" lay-filter="stable"></table>
	<script>
        layui.use(['table','layer','laytpl','laydate'],function(){

            jj.table =layui.table;
            jj.url="${ctx}/hy/user/list.json";
            jj.cols= [[
                 {type:'checkbox'}
                ,{field:'sname',  title: '姓名', sort: true}
                ,{field:'smobile',  title: '手机号', sort: true}
                ,{title: '角色',templet:function(d){
                         if(d.bisadmin)
						 {
						     return "超级管理员";

						 }
						  var s=""
                          for(var i=0;i<  d.role.length;i++){
                              var x=d.role[i];
                              s+=x +" ";
						  }
						  return s;
                    }}
                ,{field:'bisvalid', title: '状态',sort: true,templet:function(d){
                        return d.bisvalid?'有效':'禁用';
                    }}
                ,{field:'dadddate', title: '注册日期',sort: true,templet:function(d){
                        return tt.toDate(d.dadddate);
                }}
                ,{fixed: 'right', width:200, align:'left', toolbar: '#barDemo'} //这里的toolbar值是模板元素的选择器

            ]];
            jj.limit=1000;
            jj.render({
                initSort:{
                    field:"dadddate",
                    type:"desc"
                },
                page: false,
                done:function(res){


                }
            });


            jj.add=function(obj){

                jj.height=500;
                jj.width=600;
                var i=jj.xopen({
					title:'添加子账号',
                    content: "${ctx}/user/addChild.shtml"
                });

            };

            jj.edit=function(obj){

                jj.height=300;
                jj.width=600;
                var i=jj.xopen({
                    content: "${ctx}/user/useredit.shtml?id="+obj.id
                });

            };
            jj.width=900;
            jj.height=700;
            jj.userlist=function(d){

                jj.xview({
                    area: ['90%', '90%'],
					content:'${ctx}/hy/user/list.shtml?search_eq_smemberid='+d.id
				});
            }

        });
	</script>
	<script type="text/html" id="barDemo">

		<div class="layui-btn-group" data-rowid="{{d.id}}">
			<jj:listbtn  name="编辑" event="edit" />

		</div>
	</script>
	<script type="text/html" id="xtoolbar">
		<jj:btn name="添加" event="add" purview="user:edit"/>
	</script>



</body>
</html>