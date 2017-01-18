<%@ page contentType="text/html; charset=utf-8" language="java" %>

<div class="bjui-pageHeader bjui-pageTool">
    <ul>
        <li><button type="button" class="btn-default" data-icon="plus" onclick="GoodsType.formController.add()">新增同级</button></li>
        <li><button type="button" class="btn-default" data-icon="plus" onclick="GoodsType.formController.addNext()">新增下级</button></li>
        <li><button type="button" class="btn-default" data-icon="save" onclick="GoodsType.formController.save()">保存</button></li>
        <li><button type="button" class="btn-red" data-icon="remove" onclick="GoodsType.formController.del()">删除</button></li>
    </ul>
</div>

<div class="bjui-pageContent" >

    <div style="float:left; width:230px;">
        <ul id="goodsType" class="ztree" style="overflow:auto;height: 99.9%"></ul>
    </div>
    <div style="margin-left:240px; height:99.9%; overflow:hidden;">
        <form id="j_custom_form" >
            <input type="hidden" name="typeId" value="">
            <input type="hidden" name="fullpath" value="">
            <input type="hidden" name="createTime" value="">
            <div class="bjui-row col-2">
                <label class="row-label">上级名称</label>
                <div class="row-input">
                    <input type="hidden" name="parentTypeId" value="" >
                    <input readonly type="text" name="parentTypeName" value="" >
                </div>
                <label class="row-label">资源编码</label>
                <div class="row-input required">
                    <input type="text" name="typeCode" value="" data-rule="required">
                </div>
                <label class="row-label">资源名称</label>
                <div class="row-input required">
                    <input type="text" name="typeName" value="" data-rule="required" >
                </div>
                <label class="row-label">显示顺序</label>
                <div class="row-input ">
                    <input type="text" name="seq" value="" data-rule="digits" >
                </div>
                <label class="row-label">是否有效</label>
                <div class="row-input required">
                    <select name="enable" data-toggle="selectpicker" data-rule="required" data-width="100%">
                        <option value=""></option>
                        <option selected value="Y">有效</option>
                        <option value="N">无效</option>
                    </select>
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

    var GoodsType;

    $(function (){

        var ctx = GlobalConfig.ctx;

        var zTree;

        GoodsType =  {

           config : {
                formId:"#j_custom_form",
                zTree:null
            },

            setting : {

                view: {
                    dblClickExpand: false,
                    showLine: true,
                    selectedMulti: false
                },
                data: {
                    key: {
                        name: "typeName"
                    },
                    simpleData: {
                        enable:true,
                        idKey: "typeId",
                        pIdKey: "parentTypeId",
                        rootPId: ""
                    }
                },
                callback: {
                    onClick:function(){

                        return false;
                    },
                    beforeClick: function(treeId, treeNode) {
                        var id = treeNode.typeId;
                        BJUI.ajax('doajax', {
                            url: ctx + '/saleGoodsType/get/' + id,
                            loadingmask: true,
                            okCallback: function(data, options) {
                                setform(GoodsType.config.formId,data);
                                var parentNode =  treeNode.getParentNode()
                                if(parentNode){
                                    $.CurrentNavtab.find("input[name='parentTypeName']").val(parentNode.typeName);//获取父节点名称
                                }
                            }
                        })
                    }
                }
            }

        }


        var formController = {

            add :function () {
                clearForm(GoodsType.config.formId);
                var nodes = zTree.getSelectedNodes()[0];
                if(nodes){
                    $.CurrentNavtab.find("input[name='parentResourceId']").val(nodes.parentTypeId);
                    $.CurrentNavtab.find("input[name='parentTypeName']").val(nodes.parentTypeName);
                }else{
                    $.CurrentNavtab.find("input[name='parentTypeId']").val('');
                    $.CurrentNavtab.find("input[name='parentTypeName']").val('');
                }
            },

            //新增下级
            addNext :function () {
                clearForm(GoodsType.config.formId);
                var nodes = zTree.getSelectedNodes()[0];
                if(nodes){
                    $.CurrentNavtab.find("input[name='parentTypeId']").val(nodes.typeId);
                    $.CurrentNavtab.find("input[name='parentTypeName']").val(nodes.typeName);
                }else{
                    BJUI.alertmsg('warn', '请选择节点名称！',{autoClose:true});
                }
            },

            save:function () {
                BJUI.ajax('ajaxform', {
                    url: ctx + '/saleGoodsType/save',
                    type:"post",
                    form: $.CurrentNavtab.find("#j_custom_form"),
                    validate: true,
                    loadingmask: true,
                    okCallback: function(json, options) {
                        var data = json.data;
                        var typeId = $.CurrentNavtab.find("input[name='typeId']").val();
                        setform(GoodsType.config.formId,data);
                        if(typeId){
                            var nodes = zTree.getSelectedNodes()[0];
                            for(var a in data){
                                nodes[a] = data[a];
                            }
                            zTree.updateNode(nodes);
                        }else{
                            var parentZNode = zTree.getNodeByParam("typeId", data.parentTypeId, null);
                            zTree.addNodes(parentZNode ,data, true);
                            var node = zTree.getNodeByTId(data.typeId);
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
                                url: ctx + "/saleGoodsType/del/"+nodes.typeId,
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


        GoodsType.formController = formController;

        $.ajax({
            type: 'post',
            url: ctx +'/saleGoodsType/getTypes',
            success: function (result) {
                if(status==0){
                    var t = $("#goodsType");
                    $.fn.zTree.init(t, GoodsType.setting,result.data);
                }
                zTree = $.fn.zTree.getZTreeObj("goodsType");
            },
            error: function (msg) {
                alert(" 数据加载失败！" + msg);
            }
        });


    });


</script>