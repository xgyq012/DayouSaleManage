<%@ page contentType="text/html; charset=utf-8" language="java" %>

<div class="bjui-pageHeader bjui-pageTool">
    <form data-toggle="ajaxsearch" data-options="{searchDatagrid:$.CurrentNavtab.find('#datagrid-test-filter')}">
        <fieldset>
            <legend style="font-weight:normal;">搜索内容：</legend>
            <div style="margin:0; padding:1px 5px 5px;">
                <span>门诊号：</span>
                <input type="text" name="obj.code" class="form-control" size="15">
                <span>姓名：</span>
                <input type="text" name="obj.name" class="form-control" size="15">
                <div class="btn-group">
                    <button type="submit" class="btn-green" data-icon="search">搜索</button>
                    <button type="reset" class="btn-orange" data-icon="times">重置</button>
                </div>
            </div>
        </fieldset>
    </form>
</div>

<div class="bjui-pageContent" >
    <table id="goods_datagrid" class="table table-bordered"></table>
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


    $.CurrentNavtab.find("#goods_datagrid").datagrid({
        height: '100%',
        tableWidth:'100%',
        toolbarCustom: toolbar,
        showToolbar: true,
        local: 'local',
        dataUrl: ctx + '/goods/list',
        columns: [
            {
                name: 'goodsName',
                label: '商品名称',
                align: 'center',
                width: 70
            },{
                name: 'goodsCode',
                label: '商品编号',
                align: 'center',
                width: 70
            },{
                name: 'units',
                label: '计量单位',
                align: 'center',
                width: 70
            },{
                name: 'retailPrice',
                label: '零售价',
                align: 'center',
                width: 70
            },{
                name: 'inventoryNum',
                label: '库存数量',
                align: 'center',
                width: 70
            }
        ],
        paging: {pageSize:20, pageCurrent:10},
        linenumberAll: true
    });


    var formController = {

        add:function () {

        },

        del:function () {

        }

    }


    GoodsManage.formController = formController ;


    function toolbar(){
          var html = "<div class=\"btn-group\">"+
                        "<button onclick='GoodsManage.formController.add()' type=\"button\" class=\"btn-green\" data-icon=\"plus\">新增</button>"+
                        "<button onclick='GoodsManage.formController.del()' type=\"button\" class=\"btn-orange\" data-icon=\"remove\">删除</button>"+
                    "</div>";
        return html;
    }


});


</script>