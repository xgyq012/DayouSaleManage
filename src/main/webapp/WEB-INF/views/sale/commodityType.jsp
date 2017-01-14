<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ include file="/WEB-INF/views/common/common.jsp" %>



<div class="bjui-pageHeader bjui-pageTool">
    <ul>
        <li><button type="button" class="btn-default" data-icon="add" onclick="formController.add()">新增</button></li>
        <li><button type="button" class="btn-default" data-icon="save" onclick="formController.save()">保存</button></li>
        <li><button  type="button" class="btn-red" data-icon="fa-remove" onclick="formController.del()">删除</button></li>
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
                    <input type="text" name="parentResourceName" value="" >
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
                    <input type="text" name="seq" value="" >
                </div>
                <label class="row-label">URL地址</label>
                <div class="row-input">
                    <input type="text" name="url" value="" >
                </div>
                <label class="row-label">是否有效</label>
                <div class="row-input required">
                    <select name="enable" data-toggle="selectpicker" data-rule="required" data-width="100%">
                        <option selected value="Y">有效</option>
                        <option value="N">无效</option>
                    </select>
                </div>
                <label class="row-label">资源类型</label>
                <div class="row-input required">
                    <select name="resourceType" data-toggle="selectpicker" data-rule="required" data-width="100%">
                        <option selected value="menu">菜单</option>
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

    var config= {
        ctx : '${ctx}',
        formId:"#j_custom_form"
    }

    var zTree;

    var setting = {
        view: {
            dblClickExpand: false,
            showLine: true,
            selectedMulti: false
        },
        data: {
            key: {
                name: "resourceName"
            },
            simpleData: {
                enable:true,
                idKey: "id",
                pIdKey: "parentResourceId",
                rootPId: ""
            }
        },
        callback: {
            beforeClick: function(treeId, treeNode) {
                var id = treeNode.id;
                BJUI.ajax('doajax', {
                    url: config.ctx + '/resource/get/' + id,
                    loadingmask: true,
                    okCallback: function(json, options) {
                        setform(config.formId,json)
                    }
                })

            }
        }
    };


    $(document).ready(function(){

        var t = $("#tree");

        $.ajax({
            type: 'post',
            url: config.ctx +'/resource/getMenu',
            success: function (result) {
                if(status==0){
                    t = $.fn.zTree.init(t, setting,result.data);
                }
                zTree = $.fn.zTree.getZTreeObj("tree");
            },
            error: function (msg) {
                alert(" 数据加载失败！" + msg);
            }
        });

    });

    var formController = {

        add :function () {
            clearForm(config.formId);
        },

        save:function () {
            BJUI.ajax('ajaxform', {
                url: config.ctx + '/resource/save',
                type:"post",
                form: $.CurrentNavtab.find("#j_custom_form"),
                validate: true,
                loadingmask: true,
                okCallback: function(json, options) {
                    console.log(JSON.stringify(json));
                }
            });
        },

        del:function () {
            var nodes = zTree.getSelectedNodes()[0];
            if(nodes){
                BJUI.alertmsg('confirm', '确认删除？', {
                    okCall: function() {
                        BJUI.ajax('doajax', {
                            url: config.ctx + "/resource/del/"+nodes.id,
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

    }



</script>