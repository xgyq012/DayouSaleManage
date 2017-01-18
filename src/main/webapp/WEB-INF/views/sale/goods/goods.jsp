<%@ page contentType="text/html; charset=utf-8" language="java" %>

<div class="bjui-pageHeader bjui-pageTool">
    <ul>
        <li><button type="button" class="btn-default" data-icon="save" onclick="GoodsType.formController.save()">保存</button></li>
        <li><button type="button" class="btn-red" data-icon="remove" onclick="GoodsType.formController.del()">删除</button></li>
    </ul>
</div>

<div class="bjui-pageContent" >
        <form id="Goods_form" >
            <input type="hidden" name="goodsId" value="">
            <input type="hidden" name="createTime" value="">
            <div class="bjui-row col-2">
                <label class="row-label">是否上架</label>
                <div class="row-input required">
                    <select name="enable" data-toggle="selectpicker" data-rule="required" data-width="100%">
                        <option value=""></option>
                        <option selected value="Y">可上架</option>
                        <option value="N">不可上架</option>
                    </select>
                </div>
                <label class="row-label">商品名称</label>
                <div class="row-input">
                    <input type="hidden" name="parentTypeId" value="" >
                    <input readonly type="text" name="parentTypeName" value="" >
                </div>
                <label class="row-label">商品编号</label>
                <div class="row-input required">
                    <input type="text" name="typeCode" value="" data-rule="required">
                </div>
                <label class="row-label">零售价</label>
                <div class="row-input required">
                    <input type="text" name="typeName" value="" data-rule="required" >
                </div>
                <label class="row-label">成本价</label>
                <div class="row-input ">
                    <input type="text" name="seq" value="" data-rule="digits" >
                </div>
                <label class="row-label">计量单位</label>
                <div class="row-input ">
                    <input type="text" name="seq" value="" data-rule="digits" >
                </div>
                <label class="row-label">规格</label>
                <div class="row-input ">
                    <input type="text" name="seq" value="" data-rule="digits" >
                </div>

                <label class="row-label">默认折扣</label>
                <div class="row-input ">
                    <input type="text" name="seq" value="" data-rule="digits" >
                </div>

                <label class="row-label">最低折扣</label>
                <div class="row-input ">
                    <input type="text" name="seq" value="" data-rule="digits" >
                </div>

                <label class="row-label">库存数量</label>
                <div class="row-input ">
                    <input type="text" name="seq" value="" data-rule="digits" >
                </div>

                <label class="row-label">是否热销</label>
                <div class="row-input required">
                    <select name="enable" data-toggle="selectpicker" data-rule="required" data-width="100%">
                        <option value=""></option>
                        <option selected value="hot">热销</option>
                        <option value="ordinary">一般</option>
                    </select>
                </div>
                <label class="row-label">是否打折</label>
                <div class="row-input required">
                    <select name="enable" data-toggle="selectpicker" data-rule="required" data-width="100%">
                        <option value=""></option>
                        <option selected value="Y">可打折</option>
                        <option value="N">不打折</option>
                    </select>
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
                <label class="row-label">描述</label>
                <div class="row-input">
                    <textarea name="remark"  data-toggle="autoheight" cols="52" rows="5"></textarea>
                </div>
            </div>
        </form>
</div>


<script>

    var GoodsManage;

    $(function (){

        var ctx = GlobalConfig.ctx;


        GoodsManage =  {

            config : {
                formId: "#Goods_form"
            }
        }


        var formController = {

            add :function () {
                clearForm(GoodsType.config.formId);
            },


            save:function () {
                BJUI.ajax('ajaxform', {
                    url: ctx + '/goods/save',
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
                                url: ctx + "/goods/del/"+nodes.typeId,
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


        GoodsManage.formController = formController;

        $.ajax({
            type: 'post',
            url: ctx +'/goods/getTypes',
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