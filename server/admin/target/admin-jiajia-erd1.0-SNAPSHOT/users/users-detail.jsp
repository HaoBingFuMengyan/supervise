<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="jj" uri="http://www.frogsing.com/tags/jj" %>
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
<form id="inputForm" onsubmit="return main.onSubmit()" action="${ctx}/users/save.shtml" method="post" class="form-horizontal">
    <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
        <tbody>
        <tr>
            <td class="active col-md-1"><label class="pull-right"><font color="red">*</font>呢称:</label></td>
            <td class="col-md-11">
                <i-input v-model="nickname" name="nickname" placeholder="请输入呢称" style="width: 100%"></i-input>
            </td>
        </tr>

        <tr>
            <td class="active col-md-1"><label class="pull-right"><font color="red">*</font>手机:</label></td>
            <td class="col-md-11">
                <i-input v-model="phone" name="phone" placeholder="请输入手机" style="width: 100%"></i-input>
            </td>
        </tr>


        <tr>
            <td class="active col-md-2"><label class="pull-right">密码:</label></td>
            <td class="col-md-4">
                <i-input name="password" v-model="password" style="width: 100%"></i-input>
                <c:if test="${not empty data.id}"><span class="help-inline">若不修改密码，请留空。</span></c:if>
        </tr>

        <tr>
            <td class="active col-md-1"><label class="pull-right">用户头像:</label></td>
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
            <td class="active col-md-2"><label class="pull-right">加入群组:</label></td>
            <td class="col-md-4">
                <i-select v-model="selectGroups" filterable multiple style="width:100%;" placeholder="选择要加入的群组">
                    <i-option v-for="item in groups" :value="item.id">{{item.name}}</i-option>
                </i-select>

            </td>
        </tr>

        <tr>
            <td class="active col-md-2"><label class="pull-right">用户类型</label></td>
            <td class="col-md-4">
                <i-select v-model="isBoss" style="width:100%;" placeholder="">
                    <i-option  value="0">交易员</i-option>
                    <i-option  value="1">领导</i-option>
                </i-select>

            </td>
        </tr>

        </tbody>
    </table>
    <input type="hidden" name="selectGroups" v-model="selectGroups">
    <input type="hidden" name="id" v-model="id">
</form>
<style>
    .demo-spin-icon-load{
        animation: ani-demo-spin 1s linear infinite;
    }
</style>

<script>

    let main = new Vue({
        el: '#inputForm',
        data: {
            id: '${data.id}' === '' ? 0 : '${data.id}',
            phone: '${data.phone}',
            nickname: '${data.nickname}',
            password: '',
            groups: ${groups},
            selectGroups:${selectGroups},
            portraitUri: '${data.portraitUri}',
            uploading: false,
            isBoss: '${data.isBoss}'
        },
        methods: {
            onSubmit: function () {
                this.$Spin.show({
                    render: (h) => {
                        return h('div', [
                            h('Icon', {
                                'class': 'demo-spin-icon-load',
                                props: {
                                    type: 'ios-loading',
                                    size: 18
                                }
                            }),
                            h('div', '正在处理数据..')
                        ])
                    }
                });
                this.$http.post('${ctx}/users/save.shtml',
                    {
                        id: this.id,
                        phone: this.phone,
                        nickname: this.nickname,
                        passwordSalt: this.password,
                        selectGroups: this.selectGroups.join(),
                        portraitUri: this.portraitUri,
                        isBoss: this.isBoss,
                    },
                    {emulateJSON: true}).then(function (res) {
                    console.log(res);
                    if (res.status === 200 && res.data.success) {
                        window.parent.layer.msg("保存成功了", {icon: 1, time: 2000});
                        window.parent.layer.closeAll();

                    } else {
                        this.$Spin.hide();
                        this.$Message.error(res.data.msg);
                    }


                }, function (res) {
                    this.$Spin.hide();
                    this.$refs.addPortModal.buttonLoading = false
                    this.$Message.error(res.body);
                });
                return false;
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