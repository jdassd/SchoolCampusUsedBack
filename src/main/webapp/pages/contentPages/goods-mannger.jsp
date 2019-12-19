<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- @@master = admin-layout.html-->
<!-- @@block = content -->

<div class="content-wrapper">

    <!-- 内容头部 -->
    <section class="content-header">
        <h1>
            商品管理
            <small>数据列表</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="admin.jsp?index=0"><i class="fa fa-dashboard"></i> 首页</a></li>
            <li><a href="#">商品管理</a></li>
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
<%--                                <button type="button" class="btn btn-default" title="新增"><i class="fa fa-file-o"></i> 新增</button>--%>
<%--                                管理员不需要新增商品--%>
                                <button type="button" class="btn btn-default" title="删除" onclick="deleteGoods()"><i class="fa fa-trash-o"></i> 删除</button>
                                <button type="button" class="btn btn-default" title="上架" onclick="changeUpStatus(1)"><i class="fa fa-check"></i> 上架</button>
                                <button type="button" class="btn btn-default" title="下架" onclick="changeUpStatus(0)"><i class="fa fa-ban"></i> 下架</button>
                                <button type="button" class="btn btn-default" title="刷新" onclick="window.location.reload()"><i class="fa fa-refresh"></i> 刷新</button>
                            </div>
                        </div>
                    </div>
<%--                    <div class="box-tools pull-right">--%>
<%--                        <div class="has-feedback">--%>
<%--                            <input type="text" class="form-control input-sm" placeholder="搜索商品ID">--%>
<%--                            <span class="glyphicon glyphicon-search form-control-feedback"></span>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                    <!--工具栏/-->

                    <!--数据列表-->
                    <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                        <thead>
                            <tr>
                                <th class="" style="padding-right:0px;">
                                    <input id="selall" type="checkbox" class="icheckbox_square-blue">
                                </th>
                                <th class="text-center">商品名称</th>
                                <th class="text-center">商品ID</th>
                                <th class="text-center">用户ID</th>
                                <th class="text-center">商品新旧程度</th>
                                <th class="text-center">上架状态</th>
                                <th class="text-center">可用状态</th>
                                <th class="text-center">操作</th>
                            </tr>
                        </thead>
<%--                        <tbody id="dataListBody">--%>

<%--                            <tr class="text-center">--%>
<%--                                <td class="text-center"><input name="ids" type="checkbox"></td>--%>
<%--                                <td class="text-center"></td>--%>
<%--                                <td class="text-center"></td>--%>
<%--                                <td class="text-center"></td>--%>
<%--                                <td class="text-center"></td>--%>
<%--                                <td class="text-center"></td>--%>
<%--                                <td class="text-center"></td>--%>
<%--                                <td class="text-center">--%>
<%--                                    <button type="button" class="btn bg-olive btn-xs">订单</button>--%>
<%--                                    <button type="button" class="btn bg-olive btn-xs">详情</button>--%>
<%--                                    <button type="button" class="btn bg-olive btn-xs">编辑</button>--%>
<%--                                </td>--%>
<%--                            </tr>--%>
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
        $.get("/goodsFrameServlet",function (data) {
            $("#dataList").DataTable({
                "data": data,
                "columns":[
                    {
                        "data":"goodsId",
                        "render":function (data,type,row) {
                            return "<input name=\"ids\" type=\"checkbox\" value=\""+data+"\">";
                        }
                    },
                    {"data":"name"},
                    {"data":"goodsId"},
                    {"data":"userId"},
                    {"data":"goodsLevel"},
                    {
                        "data":"upStatus",
                        "render":function (data,type,row) {
                            return data == 1 ? "已上架" : "下架";
                        }
                    },
                    {
                        "data":"useStatus",
                        "render":function (data,type,row) {
                            return data == 1 ? "可用" : "不可用";
                        }
                    },
                    {
                        "data":"goodsId",
                        "render":function (data,type,row) {
                            return "<button type=\"button\" class=\"btn bg-olive btn-xs\" onclick='location.href=\"admin.jsp?index=8&id="+data+"\"'>编辑</button>";
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
            // $(data).each(function () {
            //     let upStatus,useStatus;
            //     if(this.upStatus == 0)
            //         upStatus = "下架";
            //     else
            //         upStatus = "已上架";
            //     if(this.useStatus == 0)
            //         useStatus = "不可用";
            //     else
            //         useStatus = "可用";
            //     let htm = "<tr class=\"text-center\">\n" +
            //         "                                <td class=\"text-center\"><input name=\"ids\" type=\"checkbox\" value=\""+this.goodsId+"\"></td>\n" +
            //         "                                <td class=\"text-center\">"+this.name+"</td>\n" +
            //         "                                <td class=\"text-center\">"+this.goodsId+"</td>\n" +
            //         "                                <td class=\"text-center\">"+this.userId+"</td>\n" +
            //         "                                <td class=\"text-center\">"+this.goodsLevel+"</td>\n" +
            //         "                                <td class=\"text-center\">"+upStatus+"</td>\n" +
            //         "                                <td class=\"text-center\">"+useStatus+"</td>\n" +
            //         "                                <td class=\"text-center\">\n" +
            //         "                                    <button type=\"button\" class=\"btn bg-olive btn-xs\" onclick='location.href=\"admin.jsp?index=8&id="+this.goodsId+"\"'>编辑</button>\n" +
            //         "                                </td>\n" +
            //         "                            </tr>";
            //     $("#dataListBody").append(htm);
            // });
        },"json");
    }

    //更改商品上架下架状态
    function changeUpStatus(status) {
        let ids = document.getElementsByName("ids");
        $(ids).each(function () {
            if($(this).is(':checked')){
                let value = $(this).val();
                let jsonMsg = new Object();
                jsonMsg.goodsId = value;
                jsonMsg.upStatus = status;
                let json = JSON.stringify(jsonMsg);
                $.post("../goodsManageServlet?do=changeUpStatus",json,function () {

                },"json");
            }
        });
        window.location.reload();
    }

    //删除商品
    function deleteGoods() {
        let ids = document.getElementsByName("ids");
        $(ids).each(function () {
            if($(this).is(':checked')){
                let value = $(this).val();
                let jsonMsg = new Object();
                jsonMsg.goodsId = value;
                let json = JSON.stringify(jsonMsg);
                $.post("../goodsManageServlet?do=deleteGoods",json,function () {

                },"json");
            }
        });
        window.location.reload();
    }
</script>

<!-- @@close -->
