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
            <div class="panel-heading">用户信息</div>
            <div class="row data-type">

                <div class="col-md-2 title">用户ID</div>
                <div class="col-md-4 data">
                    <input type="text" class="form-control" placeholder="wait..." value="" disabled  id="userIdDiv" name="userId">
                </div>

                <div class="col-md-2 title">用户昵称</div>
                <div class="col-md-4 data">
                    <input type="text" class="form-control" placeholder="wait..." value="" id="nameDiv" name="name">
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

                <div class="col-md-2 title">用户名</div>
                <div class="col-md-4 data">
                    <input type="text" class="form-control" placeholder="wait..." value="" id="usernameDiv" name="username">
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
                <div class="col-md-2 title">密码</div>
                <div class="col-md-4 data">
                    <input type="text" class="form-control" placeholder="wait..." value="" id="passwrodDiv" name="password">
                </div>

                <div class="col-md-2 title">性别</div>
                <div class="col-md-4 data">
                    <select class="form-control select2" style="width: 100%;" id="sexSelect" name="sex">
<%--                        <option value="" selected="selected">男</option>--%>
                        <option value="1">男</option>
                        <option value="2">女</option>
                    </select>
                </div>


                <div class="col-md-2 title">邮箱</div>
                <div class="col-md-4 data">
                    <input type="text" class="form-control" placeholder="等待用户绑定..." value="" disabled id="emailDiv" name="email">
                </div>

                <div class="col-md-2 title">账户启用状态</div>
                <div class="col-md-4 data">
                    <select class="form-control select2" style="width: 100%;" id="statusSelect" name="status">
                        <option value="1">启用</option>
                        <option value="0">停封</option>
                    </select>
                </div>

                <div class="col-md-2 title">是否管理员账户</div>
                <div class="col-md-4 data">
                    <select class="form-control select2" style="width: 100%;" id="adminSelect" name="admin">
                        <option value="1">是</option>
                        <option value="0">否</option>
                    </select>
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
        //从服务端取得新生成的userId
        $.get("/userManageServlet?do=createUser",function (data) {
            $(data).each(function () {
                $("#userIdDiv").val(this.userId);
            });
        },"json");
    }

    function check() {
        let name = $("#nameDiv").val();
        let username = $("#usernameDiv").val();
        let password = $("#passwrodDiv").val();
        if(name == "" || username == "" || password == ""){
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
            let username = $("#usernameDiv").val();
            let password = $("#passwrodDiv").val();
            let sex = $("#sexSelect").val();
            let email = $("#emailDiv").val();
            let status = $("#statusSelect").val();
            let admin = $("#adminSelect").val();
            let jsonMsg = new Object();
            jsonMsg.userId = userId;
            jsonMsg.name = name;
            jsonMsg.username = username;
            jsonMsg.password = password;
            jsonMsg.sex = parseInt(sex);
            jsonMsg.email = email;
            jsonMsg.status = parseInt(status);
            jsonMsg.admin = parseInt(admin);
            //let json = "{"+"\"newUser\""+":"+JSON.stringify(jsonMsg)+"}";
            let json = JSON.stringify(jsonMsg);
            $.post("../userManageServlet?do=createUser",json,function () {
                //重新加载数据
                initNums();
            },"json");
            // $("#my-submit-button-1").attr("data-content","请刷新界面查看结果，如果结果未修改，请查看格式是否正确");
            // $('#my-submit-button-1').popover('toggle');
            window.location.href = "admin.jsp?index=2";
        }
    }
</script>
