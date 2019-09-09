<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/include/taglib.jsp" %>
<%@ include file="/include/head.jsp" %>
<html>
<head>
    <title>聊天用户管理</title>
    <meta name="decorator" content="default"/>

    <link rel="stylesheet" type="text/css" href="${ctxStatic}/iview/css/iview.css">
    <script type="text/javascript" src="${ctxStatic}/iview/js/vue.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/iview/js/iview.min.js"></script>
    <script src="${ctxStatic}/iview/js/vue-resource.min.js"></script>

</head>
<body>
<form id="inputForm" onsubmit="return main.onSubmit()" action="${ctx}/group/save.shtml" method="post" class="form-horizontal">
    <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
        <tbody>
        <tr>
            <td class="active col-md-1"><label class="pull-right"><font color="red">*</font>群名称:</label></td>
            <td class="col-md-11">
                <i-input v-model="name" name="name" placeholder="请输入群名称" style="width: 100%"></i-input>
            </td>
        </tr>

        <%--        <tr>--%>
        <%--            <td class="active col-md-1"><label class="pull-right"><font color="red">*</font>群头像:</label></td>--%>
        <%--            <td class="col-md-11">--%>
        <%--                <Upload--%>
        <%--                        type="drag"--%>
        <%--                        action=${ctx}/file/upload.json">--%>
        <%--                    <div style="padding: 20px 0">--%>
        <%--                        <Icon type="ios-cloud-upload" size="52" style="color: #3399ff"></Icon>--%>
        <%--                        <p>点击或将文件拖拽到这里上传</p>--%>
        <%--                    </div>--%>
        <%--                </Upload>--%>
        <%--                <img src="" ref="uploadImg">--%>
        <%--            </td>--%>
        <%--        </tr>--%>


        <tr>
            <td class="active col-md-2"><label class="pull-right"><font color="red">*</font>群组类型:</label></td>
            <td class="col-md-4">
                <i-select v-model="groupType" style="width:100%;" placeholder="请选择群组类型">
                    <i-option v-for="(value,key) in groupTypeMap" :value="key">{{value}}</i-option>
                </i-select>
            </td>
        </tr>

        <tr>
            <td class="active col-md-2"><label class="pull-right"><font color="red">*</font>群用户:</label></td>
            <td class="col-md-4">
                <i-select v-model="groupUsersList" filterable multiple style="width:100%;" placeholder="请选择群用户">
                    <i-option v-for="item in usersList" :value="item.id">{{item.nickname}}({{ item.phone }})</i-option>
                </i-select>
            </td>
        </tr>

        <tr>
            <td class="active col-md-2"><label class="pull-right">群公告:</label></td>
            <td class="col-md-4">
                <i-input name="bulletin" type="textarea" :rows="4" v-model="bulletin" placeholder="请输入群公告" style="width: 100%"></i-input>
        </tr>

        <tr>
            <td class="active col-md-1"><label class="pull-right">群头像:</label></td>
            <td class="col-md-11">
                <img style="height: 106px" :src="portraitUri" v-show="portraitUri">
                <a @click="reUpload" v-show="portraitUri">重新上传</a>
                <Spin fix v-show="uploading">
                    <Icon type="ios-loading" size=18></Icon>
                    <div>正在上传..</div>
                </Spin>

                <Upload
                        :on-progress="onProgress"
                        :on-success="uploadSuccess"
                        :show-upload-list="false"
                        :format="['jpg','jpeg','png']"
                        type="drag"
                        name="upfile"
                        action="${ctx}/file/upload.json"
                        v-show="!portraitUri"
                        ref="upFile"
                >
                    <div style="padding: 20px 0">
                        <Icon type="ios-cloud-upload" size="52" style="color: #3399ff"></Icon>
                        <p>点击或将文件拖拽到这里上传</p>
                    </div>
                </Upload>
                <img src="" ref="uploadImg">
            </td>
        </tr>

        <tr>
            <td class="active col-md-2"><label class="pull-right">排序号:</label></td>
            <td class="col-md-4">
                <Input-number name="isort" v-model="isort" placeholder="请输入排序" style="width: 100%"></Input-number>
        </tr>
        </tbody>
    </table>
    <input type="hidden" name="groupUsersList" v-model="groupUsersList">
    <input type="hidden" name="id" v-model="id">
    <input type="hidden" name="igroupType" v-model="groupType">
    <input type="hidden" name="portraitUri" v-model="portraitUri">
</form>


<script>

    let main = new Vue({
        el: '#inputForm',
        data: {
            id: '${id}' === '' ? 0 : '${id}',
            name: '${name}',
            bulletin: '${bulletin}',
            usersList: ${usersList},
            groupUsersList: [${groupUsersList}],
            groupTypeMap: ${groupTypeMap},
            groupType: '${igroupType}',
            portraitUri: '${portraitUri}',
            uploading: false,
            isort: 99
        },
        methods: {
            onSubmit: function () {
                if (this.name.trim() == "") {
                    this.$Message.info('请输入群名称');
                    return false;
                }
                if (this.groupUsersList.length < 2) {
                    this.$Message.info("群用户至少要选择两个");
                    return false;
                }
                return true;
            },
            uploadSuccess(res, file) {
                this.uploading = false;
                if (res.state == "SUCCESS") {
                    this.portraitUri = res.url;
                }
            },
            reUpload() {
                // this.$refs.upFile.clearFiles();
                this.uploading = false;
                this.portraitUri = false;
            },
            onProgress() {
                this.uploading = true;
            }
        }
    })
</script>
</body>


</html>