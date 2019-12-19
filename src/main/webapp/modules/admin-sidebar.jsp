<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!-- 导航侧栏 -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="https://i.loli.net/2019/12/10/Sj72plHJzMIkgYo.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>${sessionScope.user.name}</p>
                <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
            </div>
        </div>

        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="header">菜单</li>

            <li id="admin-index"><a href="admin.jsp?index=0"><i class="fa fa-dashboard"></i> <span>首页</span></a></li>

            <li id="good-mannger"><a href="admin.jsp?index=1"><i class="fa fa-edit"></i> <span>商品管理</span></a></li>

            <li id="good-mannger"><a href="admin.jsp?index=2"><i class="fa fa-edit"></i> <span>用户管理</span></a></li>

            <li id="good-mannger"><a href="admin.jsp?index=3"><i class="fa fa-edit"></i> <span>投诉、反馈、建议管理</span></a></li>

            <li id="good-mannger"><a href="admin.jsp?index=12"><i class="fa fa-edit"></i> <span>支付管理</span></a></li>

            <li class="treeview">
                <a href="#">
                    <i class="fa fa-edit"></i> <span>订单管理</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">

                    <li id="order-manage">
                        <a href="admin.jsp?index=4">
                            <i class="fa fa-circle-o"></i> 已完成订单
                        </a>
                    </li>

                    <li id="order-cancel">
                        <a href="admin.jsp?index=5">
                            <i class="fa fa-circle-o"></i> 未完成订单
                        </a>
                    </li>

                    <li id="order-cancel">
                        <a href="admin.jsp?index=6">
                            <i class="fa fa-circle-o"></i> 有异议订单
                        </a>
                    </li>

                </ul>
            </li>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
<!-- 导航侧栏 /-->
