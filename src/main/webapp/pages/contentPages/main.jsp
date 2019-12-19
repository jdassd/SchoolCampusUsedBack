<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- @@master = admin-layout.html-->
<!-- @@block = content -->

<!-- 内容区域 -->
        <div class="content-wrapper">

            <!-- 内容头部 -->
            <section class="content-header">
                <h1>
                    控制面板
                    <small>首页</small>
                </h1>
            </section>
            <!-- 内容头部 /-->

            <!-- 正文区域 -->
            <section class="content">


                <!-- 统计数值 -->
                <div class="row">
                    <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-aqua">
                            <div class="inner">
                                <h3 id="goodsNum">wait</h3>

                                <p>商品数</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-bag"></i>
                            </div>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-green">
                            <div class="inner">
                                <h3 id="ordersNum">wait</h3>

                                <p>订单数</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-stats-bars"></i>
                            </div>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-yellow">
                            <div class="inner">
                                <h3 id="usersNum">wait</h3>

                                <p>用户数</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-person-add"></i>
                            </div>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-red">
                            <div class="inner">
                                <h3 id="feedbackNum">wait</h3>

                                <p>投诉、建议、反馈数</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-pie-graph"></i>
                            </div>
                        </div>
                    </div>
                    <!-- ./col -->
                </div>
                <!-- /.row -->

                <!-- 待处理投诉、建议、反馈 -->
                <div class="box box-success">
                    <div class="box-header with-border">
                        <i class="fa fa-book"></i>
                        <h3 class="box-title">待处理投诉、建议、反馈</h3>
                    </div>

                    <div class="box-body">

                        <!-- 数据表格 -->
                        <div class="table-box">

                            <!--数据列表-->
                            <table id="dataList" class="table table-bordered table-striped table-hover dataTable" style="text-align: center">
                                <thead>
                                    <tr>
                                        <th class="text-center">用户ID</th>
                                        <th class="text-center">用户昵称</th>
                                        <th class="text-center">类型</th>
                                        <th class="text-center">时间</th>
                                        <th class="text-center">操作</th>
                                    </tr>
                                </thead>
                                <tbody id="dataListBody">

<%--                                <c:forEach items="${list}" var="item">--%>
<%--                                    <tr>--%>
<%--                                        <td class="text-center">${item.userId}</td>--%>
<%--                                        <td class="text-center">${item.name}</td>--%>
<%--                                        <td class="text-center">${item.feedbacksStatus}</td>--%>
<%--                                        <td class="text-center">${item.feedbacksTime}</td>--%>
<%--                                        <td class="text-center">--%>
<%--                                            <button type="button" class="btn bg-olive btn-xs" onclick='location.href="all-travellog-manage-edit.html"'>详情</button>--%>
<%--                                            <button type="button" class="btn bg-olive btn-xs" onclick='location.href="all-travellog-manage-edit.html"'>处理</button>--%>
<%--                                        </td>--%>
<%--                                    </tr>--%>
<%--                                </c:forEach>--%>

                                </tbody>
                            </table>
                            <!--数据列表/-->

                        </div>
                        <!-- 数据表格 /-->

                    </div>
                    <!-- /.box-body -->

                </div>
                <!-- 待处理游记 /-->

            </section>
            <!-- 正文区域 /-->

        </div>
        <!-- 内容区域 /-->

<script>
    $(document).ready(function() {

        // 激活导航位置
        //setSidebarActive("admin-datalist");

        // 列表按钮
        $("#dataList td input[type='checkbox']").iCheck({
            checkboxClass: 'icheckbox_square-blue',
            increaseArea: '20%'
        });
        // 全选操作
        $("#selall").click(function() {
            var clicks = $(this).is(':checked');
            if (!clicks) {
                $("#dataList td input[type='checkbox']").iCheck("uncheck");
            } else {
                $("#dataList td input[type='checkbox']").iCheck("check");
            }
            $(this).data("clicks", !clicks);
        });

        initNums();
    });

    // 加载数据
    function initNums() {
        $.get("/mainFrameServlet",function (data) {
            $("#usersNum").html(data.usersNum);
            $("#ordersNum").html(data.ordersNum);
            $("#goodsNum").html(data.goodsNum);
            $("#feedbackNum").html(data.feedbackNum);

            $(data.list).each(function () {
                let feedbacksStatus;
                if(this.feedbacksStatus == 0)
                    feedbacksStatus = "建议";
                else if(this.feedbacksStatus == 1)
                    feedbacksStatus = "投诉";
                else
                    feedbacksStatus = "反馈";
                let htm = "<tr><td class=\"text-center\">"+this.userId+"</td><td class=\"text-center\">"+this.name+"</td><td class=\"text-center\">"+feedbacksStatus+"</td><td class=\"text-center\">"+this.feedbacksTime+"</td><td class=\"text-center\"><button type=\"button\" class=\"btn bg-olive btn-xs\" onclick='location.href=\"admin.jsp?index=9&id="+this.feedbacksId+"\"'>编辑</button></td>";
                $("#dataListBody").append(htm);
            });
        },"json");
    }
</script>

<!-- @@close -->
