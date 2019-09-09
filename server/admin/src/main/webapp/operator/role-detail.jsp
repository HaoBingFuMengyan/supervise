<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/include/taglib.jsp"%>
<html>
<head>
	<title>角色管理</title>
	<meta name="decorator" content="default" />
	<%@include file="/include/treeview.jsp"%>
	<script type="text/javascript">
        var validateForm;
        function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
            if(validateForm.form()){
                loading('正在提交，请稍等...');
                $("#inputForm").submit();
                return true;
            }

            return false;
        }
        $(document).ready(function(){
            focusmenu('角色管理');
            $("#srolename").focus();

            /* 	validateForm= $("#inputForm").validate({
                    rules: {
                        name: {remote: "${ctx}/sys/role/checkName?oldName=" + encodeURIComponent("${role.srolename}")}//设置了远程验证，在初始化时必须预先调用一次。
				},
				messages: {
					name: {remote: "角色名已存在"}
				},
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			}); */

        });

	</script>
	<script type="text/javascript">


        $(document).ready(function(){
            $("#name").focus();
            validateForm = $("#inputForm").validate({

                submitHandler: function(form){
                    var ids = [], nodes = tree.getCheckedNodes(true);
                    for(var i=0; i<nodes.length; i++) {
                        if(!nodes[i].children)
                            ids.push(nodes[i].id);
                    }
                    $("#spurviewIds").val(ids);
                    loading('正在提交，请稍等...');
                    form.submit();
                },
                errorContainer: "#messageBox",
                errorPlacement: function(error, element) {
                    $("#messageBox").text("输入有误，请先更正。");
                    if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
                        error.appendTo(element.parent().parent());
                    } else {
                        error.insertAfter(element);
                    }
                }
            });

            var setting = {check:{enable:true,nocheckInherit:true},view:{selectedMulti:false},
                data:{simpleData:{enable:true}},callback:{beforeClick:function(id, node){
                    tree.checkNode(node, !node.checked, true, true);
                    return false;
                }}};

            // 用户-菜单
            var zNodes=[
                    <c:forEach items="${menuList}" var="menu">{id:"${menu.id}", pId:"${not empty menu.sparentid?menu.sparentid:0}", name:"${not empty menu.sparentid?menu.sname:'权限列表'}"},
                </c:forEach>];
            // 初始化树结构
            var tree = $.fn.zTree.init($("#menuTree"), setting, zNodes);
            // 不选择父节点
            tree.setting.check.chkboxType = { "Y" : "ps", "N" : "s" };
            // 默认选择节点
            var ids = "${not empty olddata?data.spurviewIds:rolePurStr}".split(",");
            for(var i=0; i<ids.length; i++) {
                var node = tree.getNodeByParam("id", ids[i]);
                try{tree.checkNode(node, true, false);}catch(e){}
            }
            // 默认展开全部节点
            tree.expandAll(true);

        });

	</script>
</head>
<body class="">
<div class="wrapper wrapper-content">

	<form:form id="inputForm" modelAttribute="data"
			   action="${ctx}/jj/role/save.shtml" method="post"
			   class="form-horizontal form-group">
		<form:hidden path="id" />
		<input type="hidden" name="iroletype" value="1">
		<sys:message content="${message}" />
		<div class="control-group">
			<div class="row">
				<div class="col-sm-6">
					<label class="col-sm-3 control-label"><font color="red">*</font>角色名称:</label>
					<div class="controls">
						<form:input path="srolename" htmlEscape="false" maxlength="50"
									class="form-control  max-width-250 required" />
					</div>
					<label class="col-sm-3 control-label">角色说明:</label>
					<div class="controls">
						<form:textarea path="sremark" htmlEscape="false" rows="1"
									   maxlength="200" class="form-control  max-width-250 " />
					</div>

					<label class="col-sm-3 control-label">权限:</label>
					<form:hidden path="spurviewIds" />
					<div id="menuTree" class="ztree"
						 style="margin-top: 3px; float: left;"></div>
				</div>
			</div>
		</div>
	</form:form>
</div>




</body>
</html>