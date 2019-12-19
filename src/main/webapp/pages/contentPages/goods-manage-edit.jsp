<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="content-wrapper">

    <!-- 内容头部 -->
    <section class="content-header">
        <h1>
            全局管理
            <small>表单</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="admin.jsp?index=0"><i class="fa fa-dashboard"></i> 首页</a></li>
            <li><a href="#">全局管理</a></li>
            <li class="active">表单</li>
        </ol>
    </section>
    <!-- 内容头部 /-->

    <!-- 正文区域 -->
    <section class="content">

        <!--用户信息-->
        <div class="panel panel-default">
            <div class="panel-heading">商品信息</div>
            <div class="row data-type">

                <div class="col-md-2 title">用户ID</div>
                <div class="col-md-4 data">
                    <input type="text" class="form-control" placeholder="wait..." value="" disabled  id="userIdDiv" name="userId">
                </div>

                <div class="col-md-2 title">商品ID</div>
                <div class="col-md-4 data">
                    <input type="text" class="form-control" placeholder="wait..." value="" disabled id="goodsIdDiv" name="goodsId">
                </div>

<%--                <div class="col-md-2 title">下单时间</div>--%>
<%--                <div class="col-md-4 data">--%>
<%--                    <div class="input-group date">--%>
<%--                        <div class="input-group-addon">--%>
<%--                            <i class="fa fa-calendar"></i>--%>
<%--                        </div>--%>
<%--                        <input type="text" class="form-control pull-right" id="datepicker-a3">--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <script>--%>
<%--                    $(document).ready(function() {--%>
<%--                        $('#datepicker-a3').datepicker({--%>
<%--                            autoclose: true,--%>
<%--                            language: 'zh-CN'--%>
<%--                        });--%>
<%--                    });--%>
<%--                </script>--%>

                <div class="col-md-2 title">商品名称</div>
                <div class="col-md-4 data">
                    <input type="text" class="form-control" placeholder="wait..." value="" id="nameDiv" name="name">
                </div>

                <div class="col-md-2 title">商品价格</div>
                <div class="col-md-4 data">
                    <input type="text" class="form-control" placeholder="wait..." value="" id="priceDiv" name="price">
                </div>

<%--                <div class="col-md-2 title">出发城市</div>--%>
<%--                <div class="col-md-4 data">--%>
<%--                    <select class="form-control select2" style="width: 100%;">--%>
<%--                        <option value="" selected="selected">Alabama</option>--%>
<%--                        <option value="">Alaska</option>--%>
<%--                        <option value="">California</option>--%>
<%--                        <option value="">Delaware</option>--%>
<%--                        <option value="">Tennessee</option>--%>
<%--                        <option value="">Texas</option>--%>
<%--                        <option value="">Washington</option>--%>
<%--                    </select>--%>
<%--                </div>--%>
                <div class="col-md-2 title">商品新旧程度</div>
                <div class="col-md-4 data">
                    <input type="text" class="form-control" placeholder="wait..." value="" id="goodsLevelDiv" name="goodsLevel">
                </div>

                <div class="col-md-2 title">上架状态</div>
                <div class="col-md-4 data">
                    <select class="form-control select2" style="width: 100%;" id="upStatusSelect" name="upStatus">
                        <option value="1">已上架</option>
                        <option value="0">下架</option>
                    </select>
                </div>

                <div class="col-md-2 title">可用状态</div>
                <div class="col-md-4 data">
                    <select class="form-control select2" style="width: 100%;" id="useStatusSelect" name="useStatus">
                        <option value="1">可用</option>
                        <option value="0">不可用</option>
                    </select>
                </div>

                <div class="col-md-2 title">热度信息</div>
                <div class="col-md-4 data">
                    <input type="text" class="form-control" placeholder="wait..." value="" id="hotDiv" name="hot">
                </div>

                <div class="col-md-2 title rowHeight2x">商品介绍信息</div>
                <div class="col-md-10 data rowHeight2x">
                    <textarea class="form-control" rows="3" placeholder="wait..." id="dscripDiv" name="dscrip"></textarea>
                </div>

<%--                <div class="col-md-2 title rowHeight2x">其他信息</div>--%>
<%--                <div class="col-md-10 data rowHeight2x">--%>
<%--                    <textarea class="form-control" rows="3" placeholder="其他信息"></textarea>--%>
<%--                </div>--%>

            </div>

            <!--工具栏-->
            <div class="box-tools text-center" style="margin-top: 20px;padding-bottom: 10px;">
                <button type="button" class="btn bg-maroon" style="margin-right: 10px;" onclick="update()" data-toggle="popover" data-placement="bottom" id="my-submit-button-1" data-trigger="focus">保存</button>
                <button type="button" class="btn bg-default" onclick="history.back(-1);">返回</button>
            </div>
            <!--工具栏/-->

        </div>
        <!--用户信息/-->

    </section>
    <!-- 正文区域 /-->

</div>

<script>
    $(document).ready(function() {
        // 激活导航位置
        //setSidebarActive("order-manage");

        //加载数据
        initNums();
    });

    //加载数据
    function initNums() {
        //取得goodsId
        let id = (window.location.href).split("=");
        $.get("/goodsManageServlet",{"id":id[id.length-1]},function (data) {
            $(data).each(function () {
                $("#userIdDiv").val(this.userId);
                $("#goodsIdDiv").val(this.goodsId);
                $("#dscripDiv").val(this.dscrip);
                $("#priceDiv").val(this.price);
                $("#goodsLevelDiv").val(this.goodsLevel);
                $("#hotDiv").val(this.hot);
                $("#nameDiv").val(this.name);
                if(this.upStatus == 1){
                    $("#upStatusSelect>option:first-child").attr("selected","selected");
                    $("#select2-upStatusSelect-container").html("已上架");
                }else{
                    $("#upStatusSelect>option:last-child").attr("selected","selected");
                    $("#select2-upStatusSelect-container").html("下架");
                }
                if(this.useStatus == 1){
                    $("#useStatusSelect>option:first-child").attr("selected","selected");
                    $("#select2-useStatusSelect-container").html("可用");
                }else{
                    $("#useStatusSelect>option:last-child").attr("selected","selected");
                    $("#select2-useStatusSelect-container").html("不可用");
                }
            });
        },"json");
    }

    function check() {
        let name = $("#nameDiv").val();
        let dscrip = $("#dscripDiv").val();
        let price = $("#priceDiv").val();
        let goodsLevel = $("#goodsLevelDiv").val();
        let hot = $("#hotDiv").val();
        if(name == "" || dscrip == "" || price == "" || goodsLevel == "" || hot == ""){
            $("#my-submit-button-1").attr("data-content","当前表单不能有空项！");
            $('#my-submit-button-1').popover('toggle');
            return false;
        }
        return true;
    }

    function update() {
        if(check()){
            let userId = $("#userIdDiv").val();
            let name = $("#nameDiv").val();
            let dscrip = $("#dscripDiv").val();
            let price = $("#priceDiv").val();
            let goodsLevel = $("#goodsLevelDiv").val();
            let hot = $("#hotDiv").val();
            let goodsId = $("#goodsIdDiv").val();
            let upStatus = $("#upStatusSelect").val();
            let useStatus = $("#useStatusSelect").val();
            let jsonMsg = new Object();
            jsonMsg.userId = userId;
            jsonMsg.name = name;
            jsonMsg.dscrip = dscrip;
            jsonMsg.price = parseFloat(price);
            jsonMsg.goodsLevel = parseFloat(goodsLevel);
            jsonMsg.hot = parseFloat(hot);
            jsonMsg.goodsId = goodsId;
            jsonMsg.upStatus = parseInt(upStatus);
            jsonMsg.useStatus = parseInt(useStatus);
            let json = JSON.stringify(jsonMsg);
            $.post("../goodsManageServlet",json,function () {
                //重新加载数据
                initNums();
            },"json");
            $("#my-submit-button-1").attr("data-content","请刷新界面查看结果，如果结果未修改，请查看格式是否正确");
            $('#my-submit-button-1').popover('toggle');
        }
    }
</script>
