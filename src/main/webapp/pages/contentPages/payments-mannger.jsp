<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- @@master = admin-layout.html-->
<!-- @@block = content -->

<div class="content-wrapper">

    <!-- 内容头部 -->
    <section class="content-header">
        <h1>
            支付管理
            <small>数据列表</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="admin.jsp?index=0"><i class="fa fa-dashboard"></i> 首页</a></li>
            <li><a href="#">支付管理</a></li>
            <li class="active">数据列表</li>
        </ol>
    </section>
    <!-- 内容头部 /-->

    <!-- 正文区域 -->
    <section class="content">

        <!-- .box-body -->
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">列表</h3>
            </div>

            <div class="box-body">

                <!-- 数据表格 -->
                <div class="table-box">

                    <!--工具栏-->
                    <div class="pull-left">
                        <div class="form-group form-inline">
                            <div class="btn-group">
                                <button type="button" class="btn btn-default" title="刷新" onclick="window.location.reload()"><i class="fa fa-refresh"></i> 刷新</button>
                            </div>
                        </div>
                    </div>
<%--                    <div class="box-tools pull-right">--%>
<%--                        <div class="has-feedback">--%>
<%--                            <input type="text" class="form-control input-sm" placeholder="搜索订单ID">--%>
<%--                            <span class="glyphicon glyphicon-search form-control-feedback"></span>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                    <!--工具栏/-->

                    <!--数据列表-->
                    <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                        <thead>
                        <tr>
<%--                            <th class="" style="padding-right:0px;">--%>
<%--                                <input id="selall" type="checkbox" class="icheckbox_square-blue">--%>
<%--                            </th>--%>
                            <th class="text-center">用户ID</th>
                            <th class="text-center">支付ID</th>
                            <th class="text-center">费用</th>
                            <th class="text-center">费用状态</th>
                            <th class="text-center">支付时间</th>
                            <th class="text-center">商品ID</th>
                            <th class="text-center">支付状态</th>
                        </tr>
                        </thead>
<%--                        <tbody id="dataListBody">--%>

<%--                        <tr class="text-center">--%>
<%--                            <td class="text-center"><input name="ids" type="checkbox"></td>--%>
<%--                            <td class="text-center"></td>--%>
<%--                            <td class="text-center"></td>--%>
<%--                            <td class="text-center"></td>--%>
<%--                            <td class="text-center"></td>--%>
<%--                            <td class="text-center"></td>--%>
<%--                            <td class="text-center"></td>--%>
<%--                            <td class="text-center">--%>
<%--                                <button type="button" class="btn bg-olive btn-xs">详情</button>--%>
<%--                                <button type="button" class="btn bg-olive btn-xs">编辑</button>--%>
<%--                            </td>--%>
<%--                        </tr>--%>
<%--                        </tbody>--%>
                        <!--
                            <tfoot>
                            <tr>
                            <th>Rendering engine</th>
                            <th>Browser</th>
                            <th>Platform(s)</th>
                            <th>Engine version</th>
                            <th>CSS grade</th>
                            </tr>
                            </tfoot>-->
                    </table>
                    <!--数据列表/-->

                </div>
                <!-- 数据表格 /-->


            </div>
            <!-- /.box-body -->

            <!-- .box-footer-->
<%--            <div class="box-footer">--%>
<%--                <div class="pull-left">--%>
<%--                    <div class="form-group form-inline">--%>
<%--                        总共2 页，共14 条数据。--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <div class="box-tools pull-right">--%>
<%--                    <ul class="pagination">--%>
<%--                        <li>--%>
<%--                            <a href="#" aria-label="Previous">首页</a>--%>
<%--                        </li>--%>
<%--                        <li><a href="#">上一页</a></li>--%>
<%--                        <li><a href="#">1</a></li>--%>
<%--                        <li><a href="#">2</a></li>--%>
<%--                        <li><a href="#">3</a></li>--%>
<%--                        <li><a href="#">4</a></li>--%>
<%--                        <li><a href="#">5</a></li>--%>
<%--                        <li><a href="#">下一页</a></li>--%>
<%--                        <li>--%>
<%--                            <a href="#" aria-label="Next">尾页</a>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                </div>--%>

<%--            </div>--%>
            <!-- /.box-footer-->
        </div>

    </section>
    <!-- 正文区域 /-->
</div>

<script>
    $(document).ready(function() {

        // 激活导航位置
        // setSidebarActive("admin-datalist");

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
        $.get("/paymentsFrameServlet",function (data) {
            $("#dataList").DataTable({
                "data": data,
                "columns":[
                    // {
                    //     "data":"goodsId",
                    //     "render":function (data,type,row) {
                    //         return "<input name=\"ids\" type=\"checkbox\" value=\""+data+"\">";
                    //     }
                    // },
                    {"data":"userId"},
                    {"data":"payId"},
                    {"data":"price"},
                    {
                        "data":"status",
                        "render":function (data,type,row) {
                            if(data == 1){
                                return "已经转给卖家";
                            }else if(data == 0){
                                return "费用在平台";
                            }else{
                                return "已经退回买家";
                            }
                        }
                    },
                    {"data":"payTime"},
                    {"data":"goodsId"},
                    {
                        "data":"payStatus",
                        "render":function (data,type,row) {
                            if(data == 1){
                                return "已完成";
                            }else if(data == 0){
                                return "未完成";
                            }else{
                                return "有异议";
                            }
                        }
                    },
                    {
                        "data":"payId",
                        "render":function (data,type,row) {
                            return "<button type=\"button\" class=\"btn bg-olive btn-xs\" onclick='location.href=\"admin.jsp?index=13&id="+data+"\"'>编辑</button>";
                        }
                    }
                ],
                "paging": true,
                "lengthChange": true,
                "searching": true,
                "ordering": true,
                "info": true,
                "autoWidth": false,
                "language": {
                    "search": "搜索",
                    "lengthMenu": '每页 _MENU_ 件',
                    "paginate": {
                        "first": "第一页",
                        "last": "最后一页",
                        "next": "下一页",
                        "previous": "上一页"
                    },
                    "info": "第 _PAGE_ 页 / 总 _PAGES_ 页",
                    "infoFiltered": "(过滤总件数 _MAX_ 条)"
                },
                "sZeroRecords": "没有可展示的数据"
            });
        },"json");
    }
</script>

<!-- @@close -->
