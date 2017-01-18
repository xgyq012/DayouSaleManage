<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ include file="/WEB-INF/views/common/common.jsp" %>


<div class="bjui-pageHeader bjui-pageTool">
    <ul>
        <li><button type="button" class="btn-default" data-icon="plus" onclick="ResourceManage.formController.add()">新增同级</button></li>
        <li><button type="button" class="btn-default" data-icon="plus" onclick="ResourceManage.formController.addNext()">新增下级</button></li>
        <li><button type="button" class="btn-default" data-icon="save" onclick="ResourceManage.formController.save()">保存</button></li>
        <li><button  type="button" class="btn-red" data-icon="remove" onclick="ResourceManage.formController.del()">删除</button></li>
    </ul>
</div>

<div class="bjui-pageContent" >

    <div style="float:left; width:230px;">
        <ul id="tree" class="ztree" style="overflow:auto;height: 99.9%"></ul>
    </div>
    <div style="margin-left:240px; height:99.9%; overflow:hidden;">
        <form   id="j_custom_form" >
            <input type="hidden" name="id" value="">
            <input type="hidden" name="fullpath" value="">
            <input type="hidden" name="createTime" value="">
            <div class="bjui-row col-2">
                <label class="row-label">上级名称</label>
                <div class="row-input">
                    <input type="hidden" name="parentResourceId" value="" >
                    <input readonly type="text" name="parentResourceName" value="" >
                </div>
                <label class="row-label">资源编码</label>
                <div class="row-input required">
                    <input type="text" name="resourceCode" value="" data-rule="required">
                </div>
                <label class="row-label">资源名称</label>
                <div class="row-input required">
                    <input type="text" name="resourceName" value="" data-rule="required" >
                </div>
                <label class="row-label">资源标题</label>
                <div class="row-input required">
                    <input type="text" name="resourceLabel" value="" data-rule="required" >
                </div>
                <label class="row-label">图标路径</label>
                <div class="row-input">
                    <input type="text" name="imagePath" value="" >
                </div>
                <label class="row-label">显示顺序</label>
                <div class="row-input ">
                    <input type="text" name="seq" value="" data-rule="digits" >
                </div>
                <label class="row-label">URL地址</label>
                <div class="row-input">
                    <input type="text" name="url" value="" >
                </div>
                <label class="row-label">是否有效</label>
                <div class="row-input required">
                    <select name="enable" data-toggle="selectpicker" data-rule="required" data-width="100%">
                        <option value=""></option>
                        <option selected value="Y">有效</option>
                        <option value="N">无效</option>
                    </select>
                </div>
                <label class="row-label">资源类型</label>
                <div class="row-input required">
                    <select name="resourceType" data-toggle="selectpicker" data-rule="required" data-width="100%">
                        <option value=""></option>
                        <option value="menu">菜单</option>
                        <option value="button">按钮</option>
                        <option value="module">模块</option>
                    </select>
                </div>
                <br>
                <label class="row-label">资源描述</label>
                <div class="row-input">
                    <textarea name="resourceDesc"  data-toggle="autoheight" cols="52" rows="5"></textarea>
                </div>
                <br>
                <label class="row-label">备注</label>
                <div class="row-input">
                    <textarea name="remark"  data-toggle="autoheight" cols="52" rows="5"></textarea>
                </div>
            </div>
        </form>
    </div>
</div>

<script>

    var ResourceManage

    $(function () {

        var ctx = GlobalConfig.ctx;

        var zTree;

        ResourceManage = {

            config : {
                formId:"#j_custom_form"
            },

            setting : {
                view: {
                    dblClickExpand: false,
                    showLine: true,
                    selectedMulti: false
                },
                data: {
                    key: {
                        name: "resourceName",
                        url: "xUrl"
                    },
                    simpleData: {
                        enable:true,
                        idKey: "id",
                        pIdKey: "parentResourceId",
                        rootPId: ""
                    }
                },
                callback: {
                    onClick:function(){

                        return false;
                    },
                    beforeClick: function(treeId, treeNode) {
                        var id = treeNode.id;
                        BJUI.ajax('doajax', {
                            url:  ctx + '/resource/get/' + id,
                            loadingmask: true,
                            okCallback: function(data, options) {
                                setform(ResourceManage.config.formId,data);
                                var parentNode =  treeNode.getParentNode()
                                if(parentNode){
                                    $.CurrentNavtab.find("input[name='parentResourceName']").val(parentNode.resourceName);//获取父节点名称
                                }
                            }
                        })
                    }
                }
            }
        };


        formController = {

            add :function () {
                clearForm(config.formId);
                var nodes = zTree.getSelectedNodes()[0];
                if(nodes){
                    $.CurrentNavtab.find("input[name='parentResourceId']").val(nodes.parentResourceId);
                    $.CurrentNavtab.find("input[name='parentResourceName']").val(nodes.parentResourceName);
                }else{
                    $.CurrentNavtab.find("input[name='parentResourceId']").val('');
                    $.CurrentNavtab.find("input[name='parentResourceName']").val('');
                }
            },

            //新增下级
            addNext :function () {
                clearForm(config.formId);
                var nodes = zTree.getSelectedNodes()[0];
                if(nodes){
                    $.CurrentNavtab.find("input[name='parentResourceId']").val(nodes.id);
                    $.CurrentNavtab.find("input[name='parentResourceName']").val(nodes.resourceName);
                }else{
                    BJUI.alertmsg('warn', '请选择节点名称！',{autoClose:true});
                }
            },

            save:function () {
                BJUI.ajax('ajaxform', {
                    url: ctx + '/resource/save',
                    type:"post",
                    form: $.CurrentNavtab.find("#j_custom_form"),
                    validate: true,
                    loadingmask: true,
                    okCallback: function(json, options) {
                        var data = json.data;
                        var id = $.CurrentNavtab.find("input[name='id']").val();
                        setform(GoodsType.config.formId,data);
                        if(id){
                            var nodes = zTree.getSelectedNodes()[0];
                            for(var a in data){
                                nodes[a] = data[a];
                            }
                            zTree.updateNode(nodes);
                        }else{
                            var parentZNode = zTree.getNodeByParam("id", data.parentResourceId, null);
                            zTree.addNodes(parentZNode ,data, true);
                            var node = zTree.getNodeByTId(data.id);
                            zTree.selectNode(node);
                        }
                    }
                });
            },

            del:function () {
                var nodes = zTree.getSelectedNodes()[0];
                if(nodes){
                    BJUI.alertmsg('confirm', '确认删除？', {
                        okCall: function() {
                            BJUI.ajax('doajax', {
                                url: ctx + "/resource/del/"+nodes.id,
                                okCallback: function(json, options) {
                                    if(json.status==0){
                                        zTree.removeNode(nodes);
                                    }
                                }
                            })
                        }
                    })
                }else{
                    BJUI.alertmsg('warn', '请选择删除的信息！',{autoClose:true});
                }
            }

        };


        ResourceManage.formController = formController;


        var t = $("#tree");

        $.ajax({
            type: 'post',
            url: ctx +'/resource/getMenu',
            success: function (result) {
                if(status==0){
                    t = $.fn.zTree.init(t, ResourceManage.setting,result.data);
                }
                zTree = $.fn.zTree.getZTreeObj("tree");
            },
            error: function (msg) {
                alert(" 数据加载失败！" + msg);
            }
        });

    });


</script>
