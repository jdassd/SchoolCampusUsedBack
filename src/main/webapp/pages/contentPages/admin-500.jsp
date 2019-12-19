<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            500 错误页面
        </h1>

        <ol class="breadcrumb">
            <li><a href="all-admin-index.html"><i class="fa fa-dashboard"></i> 首页</a></li>
            <li class="active">500 错误</li>
        </ol>

    </section>

    <!-- Main content -->
    <section class="content">
        <div class="error-page">
            <h2 class="headline text-red"> 500</h2>

            <div class="error-content">
                <h3><i class="fa fa-warning text-red"></i> Oops! 页面程序有错误.</h3>

                <p>
                    你访问的页面发生错误, 你可以 <a href="all-admin-index.html">返回到后台首页</a> 或者通过搜索查询
                </p>

                <form class="search-form">
                    <div class="input-group">
                        <input type="text" name="search" class="form-control" placeholder="搜索">

                        <div class="input-group-btn">
                            <button type="submit" name="submit" class="btn btn-warning btn-flat"><i class="fa fa-search"></i>
                </button>
                        </div>
                    </div>
                    <!-- /.input-group -->
                </form>
            </div>
            <!-- /.error-content -->
        </div>
        <!-- /.error-page -->
    </section>
    <!-- /.content -->
</div>


<script>
    $(document).ready(function() {
        //setSidebarActive("admin-500");
    });
</script>
