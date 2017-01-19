<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" language="java" %>

<div class="bjui-pageHeader bjui-pageTool">
    <ul>
        <li><button type="button" class="btn-default" data-icon="save" onclick="Goods.formController.save()">保存</button></li>
        <c:if test="${!empty goodsId}">
            <li><button type="button" class="btn-red" data-icon="remove" onclick="Goods.formController.del()">删除</button></li>
        </c:if>
    </ul>
</div>

<div class="bjui-pageContent" >
        <form id="Goods_form" >
            <input id="goodsId" type="hidden" name="goodsId" value="${goodsId}">
            <input type="hidden" name="createTime" value="">
            <input type="hidden" name="fileId" value="">

            <div class="bjui-row col-2">
                <label class="row-label">是否上架</label>
                <div class="row-input required">
                    <select name="" data-toggle="selectpicker" data-rule="required" data-width="100%">
                        <option value=""></option>
                        <option selected value="Y">已上架</option>
                        <option value="N">未上架</option>
                    </select>
                </div>
                <label class="row-label">类型</label>
                <div class="row-input" >
                    <input  type="text" name="goodsType" value="">
                </div>
                <label class="row-label">商品名称</label>
                <div class="row-input required" >
                    <input  type="text" name="goodsName" value="" data-rule="required" >
                </div>
                <label class="row-label">商品编号</label>
                <div class="row-input">
                    <input type="text" name="goodsCode" value="" >
                </div>
                <label class="row-label">零售价</label>
                <div class="row-input">
                    <input type="text" name="retailPrice"   data-rule="number" >
                </div>
                <label class="row-label">成本价</label>
                <div class="row-input ">
                    <input type="text" name="costPrice" value=""   data-rule="number" >
                </div>
                <label class="row-label">计量单位</label>
                <div class="row-input ">
                    <input type="text" name="units" value=""  >
                </div>
                <label class="row-label">规格</label>
                <div class="row-input ">
                    <input type="text" name="specification" value=""  >
                </div>

                <label class="row-label">默认折扣</label>
                <div class="row-input ">
                    <input type="text" name="defaultDiscount" value="" placeholder="例如:9折=0.9;95折=0.95" data-rule="defaultDiscount"
                                                data-rule-defaultDiscount="[/^(0\.(?!0+$)\d{1,2}|1(\.0{1,2})?)$/, '请填写从0.00到1.00之间的小数']" >
                </div>

                <label class="row-label">最低折扣</label>
                <div class="row-input ">
                    <input type="text" name="lowestDiscount" value=""  placeholder="例如:9折=0.9;95折=0.95" data-rule="lowestDiscount"
                                                 data-rule-lowestDiscount="[/^(0\.(?!0+$)\d{1,2}|1(\.0{1,2})?)$/, '请填写从0.00到1.00之间的小数']">
                </div>

                <label class="row-label">库存数量</label>
                <div class="row-input ">
                    <input type="text" name="inventoryNum" value="" data-rule="number"  >
                </div>

                <label class="row-label">是否热销</label>
                <div class="row-input">
                    <select name="isHot" data-toggle="selectpicker"  data-width="100%">
                        <option value=""></option>
                        <option value="hot">热销</option>
                        <option value="ordinary">一般</option>
                    </select>
                </div>
                <label class="row-label">是否打折</label>
                <div class="row-input">
                    <select name="isDiscount" data-toggle="selectpicker"  data-width="100%">
                        <option value=""></option>
                        <option selected value="N">不打折</option>
                        <option  value="Y">可打折</option>
                    </select>
                </div>
                <label class="row-label">是否有效</label>
                <div class="row-input required">
                    <select name="enable" data-toggle="selectpicker" data-width="100%">
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

    var Goods;

    $(function (){

        var ctx = GlobalConfig.ctx;


        Goods =  {

            config : {
                formId: "#Goods_form"
            },

            init:function () {
                var goodsId = $("#goodsId").val();
                if(goodsId){
                    BJUI.ajax('doajax', {
                        url:  ctx + '/goods/get/' + goodsId,
                        loadingmask: true,
                        okCallback: function(data, options) {
                            setNativeform(Goods.config.formId,data);
                        }
                    })
                }
            }
        }



        var formController = {

            add :function () {
                clearForm(Goods.config.formId);
            },


            save:function () {
                BJUI.ajax('ajaxform', {
                    url: ctx + '/goods/save',
                    type:"post",
                    form: $("#Goods_form"),
                    validate: true,
                    loadingmask: true,
                    okCallback: function(json, options) {

                    }
                });
            },

            del:function () {
                var goodsId = $("#goodsId").val();
                if(goodsId){
                    BJUI.alertmsg('confirm', '确认删除？', {
                        okCall: function() {
                            BJUI.ajax('doajax', {
                                url: ctx + "/goods/del/"+goodsId,
                                okCallback: function(json, options) {

                                }
                            })
                        }
                    });
                }
            }

        }

        Goods.formController = formController;


    });

    Goods.init();

</script>