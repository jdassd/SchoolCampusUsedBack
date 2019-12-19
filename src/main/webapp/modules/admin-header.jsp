<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!-- 页面头部 -->
<header class="main-header">


    <!-- Logo -->
    <a href="all-admin-index.html" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>吉首大学校园二手</b></span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>吉首大学校园二手</b></span>
    </a>


    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>

        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <!-- User Account: style can be found in dropdown.less -->
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="https://i.loli.net/2019/12/10/Sj72plHJzMIkgYo.jpg" class="img-circle" alt="User Image" style="max-width: 20px;">
                        <span class="hidden-xs">${sessionScope.user.name}</span>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- User image -->
                        <li class="user-header">
                            <img src="https://i.loli.net/2019/12/10/Sj72plHJzMIkgYo.jpg" class="img-circle" alt="User Image">

                            <p>
                                ${sessionScope.user.name} - 管理员
                            </p>
                        </li>
                        <!-- Menu Body
                        <li class="user-body">
                            <div class="row">
                                <div class="col-xs-4 text-center">
                                    <a href="#">Followers</a>
                                </div>
                                <div class="col-xs-4 text-center">
                                    <a href="#">Sales</a>
                                </div>
                                <div class="col-xs-4 text-center">
                                    <a href="#">Friends</a>
                                </div>
                            </div>
                        </li>-->
                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <div class="pull-left">
                                <a href="/pages/admin.jsp?index=7&id=${sessionScope.user.userId}" class="btn btn-default btn-flat">修改个人信息</a>
                            </div>
                            <div class="pull-right">
                                <button class="btn btn-default btn-flat" onclick="out()">注销</button>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>
<!-- 页面头部 /-->
<script>
    function out() {
        $.post("/loginServlet?do=out");
        window.location.reload();
    }
</script>
