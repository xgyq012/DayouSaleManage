<%@ page contentType="text/html; charset=utf-8" language="java" %>

<div class="bjui-pageHeader bjui-pageTool">
    <form data-toggle="ajaxsearch" data-options="{searchDatagrid:$.CurrentNavtab.find('#goods_datagrid')}">
        <fieldset>
            <legend style="font-weight:normal;">搜索内容：</legend>
            <div style="margin:0; padding:1px 5px 5px;">
                <span>门诊号：</span>
                <input type="text" name="obj.code" class="form-control" size="15">
                <span>姓名：</span>
                <input type="text" name="obj.name" class="form-control" size="15">
                <div class="btn-group">
                    <button type="search" class="btn-green" data-icon="search">搜索</button>
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

    //新增
    GoodsManage.addGoods = function () {
        BJUI.dialog({
            fresh:true,
            width:800,
            height:500,
            mask:true,
            id:'add_goods',
            url:ctx + '/goods/add',
            title:'新增商品'
        })
    };

    GoodsManage.editBook=function () {
        var array= $.CurrentNavtab.find("#goods_datagrid").data('selectedDatas');
        if(array && array.length>0){
            var trData = array[0];
            BJUI.dialog({
                fresh:true,
                width:800,
                height:500,
                mask:true,
                id:'add_goods',
                data:{goodsId:trData.goodsId},
                url: ctx + '/goods/add/',
                title:'编辑商品'
            })
        }else{
            BJUI.alertmsg('info', '请选择表格行！');
        }
    };

    GoodsManage.delGoods=function () {

    };


    GoodsManage.toolbar =  function (){
        var html = "<div class=\"btn-group\">"+
                "<button onclick='GoodsManage.addGoods()' type=\"button\" class=\"btn-green\" data-icon=\"plus\">新增</button>"+
                "<button onclick='GoodsManage.editBook()' type=\"button\" class=\"btn-green\" data-icon=\"edit\">编辑</button>"+
                "<button onclick='GoodsManage.delGoods()' type=\"button\" class=\"btn-green\" data-icon=\"remove\">删除</button>"+
                "</div>";
        return html;
    }


    $.CurrentNavtab.find("#goods_datagrid").datagrid({
        height: '100%',
        tableWidth:'100%',
        toolbarCustom: GoodsManage.toolbar,
        showToolbar: true,
        local: 'local',
        dataUrl: ctx + '/goods/search',
        filterThead:false,
        hScrollbar:false,
        columns: [
            {
                name: 'goodsName',
                label: '商品名称',
                align: 'center',
                width: 70
            }, {
                name: 'goodsType',
                label: '商品类型',
                align: 'center',
                width: 50
            },{
                name: 'goodsCode',
                label: '商品编号',
                align: 'center',
                width: 50
            },{
                name: 'units',
                label: '计量单位',
                align: 'center',
                width: 20
            },{
                name: 'retailPrice',
                label: '零售价',
                align: 'center',
                width: 20
            },{
                name: 'inventoryNum',
                label: '库存数量',
                align: 'center',
                width: 20
            }
        ],
        showLinenumber:true,
        paging: {pageSize:20, pageCurrent:10},
        linenumberAll: false

    });




});


</script>