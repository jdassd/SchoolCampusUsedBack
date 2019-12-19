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
            <div class="panel-heading">投诉、建议、反馈信息</div>
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

                <div class="col-md-2 title">支付ID</div>
                <div class="col-md-4 data">
                    <input type="text" class="form-control" placeholder="wait..." value="" id="payIdDiv" name="payId" disabled>
                </div>

                <div class="col-md-2 title">订单ID</div>
                <div class="col-md-4 data">
                    <input type="text" class="form-control" placeholder="wait..." value="" id="ordersIdDiv" name="ordersId" disabled>
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

                <div class="col-md-2 title">反馈ID</div>
                <div class="col-md-4 data">
                    <input type="text" class="form-control" placeholder="wait..." value="" id="feedbacksIdDiv" name="feedbacksId" disabled>
                </div>
                <div class="col-md-2 title">时间</div>
                <div class="col-md-4 data">
                    <input type="text" class="form-control" placeholder="wait..." value="" id="feedbacksTimeDiv" name="feedbacksTime" disabled>
                </div>

                <div class="col-md-2 title">类型</div>
                <div class="col-md-4 data">
                    <input type="text" class="form-control" placeholder="wait..." value="" id="feedbacksStatusDiv" name="feedbacksStatus" disabled>
                </div>

                <div class="col-md-2 title">用户昵称</div>
                <div class="col-md-4 data">
                    <input type="text" class="form-control" placeholder="wait..." value="" id="nameDiv" name="name" disabled>
                </div>

                <div class="col-md-2 title">管理员处理状态</div>
                <div class="col-md-4 data">
                    <select class="form-control select2" style="width: 100%;" id="solveStatusSelect" name="solveStatus">
                        <option value="1">已处理</option>
                        <option value="0">未处理</option>
                        <option value="-1">不予处理</option>
                    </select>
                </div>

                <div class="col-md-6 data">
                    <!--留空-->
                </div>

                <div class="col-md-2 title rowHeight2x">反馈信息</div>
                <div class="col-md-10 data rowHeight2x">
                    <textarea class="form-control" rows="3" placeholder="wait..." id="valueDiv" name="value" disabled></textarea>
                </div>

                <div class="col-md-2 title rowHeight2x">管理员处理结果信息</div>
                <div class="col-md-10 data rowHeight2x">
                    <textarea class="form-control" rows="3" placeholder="" id="solveValueDiv" name="solveValue"></textarea>
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
        $.get("/feedbackManageServlet",{"id":id[id.length-1]},function (data) {
            $(data).each(function () {
                $("#userIdDiv").val(this.userId);
                $("#goodsIdDiv").val(this.goodsId);
                $("#payIdDiv").val(this.payId);
                $("#valueDiv").val(this.value);
                $("#feedbacksTimeDiv").val(this.feedbacksTime);
                $("#ordersIdDiv").val(this.ordersId);
                $("#feedbacksIdDiv").val(this.feedbacksId);
                $("#solveValueDiv").val(this.solveValue);
                $("#nameDiv").val(this.name);
                if(this.feedbacksStatus == 1){
                    $("#feedbacksStatusDiv").val("投诉");
                }else if(this.feedbacksStatus == 2){
                    $("#feedbacksStatusDiv").val("建议");
                }else{
                    $("#feedbacksStatusDiv").val("反馈");
                }
                if(this.solveStatus == 1){
                    $("#solveStatusSelect>option:first-child").attr("selected","selected");
                    $("#select2-solveStatusSelect-container").html("已处理");
                }else if(this.solveStatus == 0){
                    $("#solveStatusSelect>option:nth-child(2)").attr("selected","selected");
                    $("#select2-solveStatusSelect-container").html("未处理");
                }else{
                    $("#solveStatusSelect>option:last-child").attr("selected","selected");
                    $("#select2-solveStatusSelect-container").html("不予处理");
                }
            });
        },"json");
    }

    // function check() {
    //     let name = $("#nameDiv").val();
    //     let dscrip = $("#dscripDiv").val();
    //     let price = $("#priceDiv").val();
    //     let goodsLevel = $("#goodsLevelDiv").val();
    //     let hot = $("#hotDiv").val();
    //     if(name == "" || dscrip == "" || price == "" || goodsLevel == "" || hot == ""){
    //         $("#my-submit-button-1").attr("data-content","当前表单不能有空项！");
    //         $('#my-submit-button-1').popover('toggle');
    //         return false;
    //     }
    //     return true;
    // }

    function update() {
        // if(check()){
        let userId = $("#userIdDiv").val();
        let name = $("#nameDiv").val();
        let goodsId = $("#goodsIdDiv").val();
        let payId = $("#payIdDiv").val();
        let value = $("#valueDiv").val();
        let feedbacksTime = $("#feedbacksTimeDiv").val();
        let feedbacksStatus = $("#feedbacksStatusDiv").val();
        if(feedbacksStatus == "投诉"){
            feedbacksStatus = 1;
        }else if(feedbacksStatus == "建议"){
            feedbacksStatus = 2;
        }else{
            feedbacksStatus = 3;
        }
        let ordersId = $("#ordersIdDiv").val();
        let feedbacksId = $("#feedbacksIdDiv").val();
        let solveStatus = $("#solveStatusSelect").val();
        let solveValue = $("#solveValueDiv").val();
        let jsonMsg = new Object();
        jsonMsg.userId = userId;
        jsonMsg.name = name;
        jsonMsg.goodsId = goodsId;
        jsonMsg.payId = payId;
        jsonMsg.value = value;
        jsonMsg.feedbacksTime = feedbacksTime;
        jsonMsg.feedbacksId = feedbacksId;
        jsonMsg.solveStatus = parseInt(solveStatus);
        jsonMsg.solveValue = solveValue;
        jsonMsg.ordersId = ordersId;
        jsonMsg.feedbacksStatus = parseInt(feedbacksStatus);
        let json = JSON.stringify(jsonMsg);
        $.post("../feedbackManageServlet",json,function () {
            //重新加载数据
            initNums();
        },"json");
        $("#my-submit-button-1").attr("data-content","请刷新界面查看结果，如果结果未修改，请查看格式是否正确");
        $('#my-submit-button-1').popover('toggle');
        //}
    }
</script>
