<%--
  Created by IntelliJ IDEA.
  User: jdassd@163.com
  Date: 2019/12/10
  Time: 15:31
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <!-- 页面meta /-->
    <%@ include file="../modules/admin-meta.jsp" %>
    <!-- 页面css /-->
    <style>
        .dataTable{
            text-align: center;
        }
    </style>
</head>
<body class="hold-transition skin-purple sidebar-mini">
    <div class="wrapper">
        <!-- 页面头部 /-->
        <%@ include file="../modules/admin-header.jsp" %>
        <!-- 导航侧栏 /-->
        <%@ include file="../modules/admin-sidebar.jsp" %>
        <!-- 内容区域 /-->
        <%
            String index = request.getParameter("index");
            int a = Integer.MIN_VALUE;
            try{
                a = Integer.parseInt(index);
            }catch (Exception e){
                out.print("请求参数错误！");
                e.printStackTrace();
            }
        %>
        <c:choose>
            <c:when test='${param.index == 0}'>
                <%@ include file="./contentPages/main.jsp" %>
            </c:when>
            <c:when test="${param.index == 1}">
                <%@ include file="./contentPages/goods-mannger.jsp" %>
            </c:when>
            <c:when test="${param.index == 2}">
                <%@ include file="./contentPages/users-mannger.jsp" %>
            </c:when>
            <c:when test="${param.index == 3}">
                <%@ include file="./contentPages/feedback-mannger.jsp" %>
            </c:when>
            <c:when test="${param.index == 4}">
                <%@ include file="./contentPages/orders-mannger-finish.jsp" %>
            </c:when>
            <c:when test="${param.index == 5}">
                <%@ include file="./contentPages/orders-mannger-unfinish.jsp" %>
            </c:when>
            <c:when test="${param.index == 6}">
                <%@ include file="./contentPages/orders-mannger-argue.jsp" %>
            </c:when>
<%--            用户编辑界面--%>
            <c:when test="${param.index == 7}">
                <%@ include file="contentPages/user-manage-edit.jsp" %>
            </c:when>
<%--            商品编辑界面--%>
            <c:when test="${param.index == 8}">
                <%@ include file="./contentPages/goods-manage-edit.jsp" %>
            </c:when>
<%--            投诉建议反馈编辑界面--%>
            <c:when test="${param.index == 9}">
                <%@ include file="./contentPages/feedback-manage-edit.jsp" %>
            </c:when>
<%--            订单编辑界面--%>
            <c:when test="${param.index == 10}">
                <%@ include file="./contentPages/orders-manage-edit.jsp" %>
            </c:when>
<%--            新增用户界面--%>
            <c:when test="${param.index == 11}">
                <%@ include file="./contentPages/create-user-edit.jsp" %>
            </c:when>
<%--            支付管理界面--%>
            <c:when test="${param.index == 12}">
                <%@ include file="./contentPages/payments-mannger.jsp" %>
            </c:when>
<%--            支付编辑界面--%>
            <c:when test="${param.index == 13}">
                <%@ include file="./contentPages/payments-manage-edit.jsp" %>
            </c:when>
            <c:otherwise>
                <%@ include file="./contentPages/admin-404.jsp" %>
            </c:otherwise>
        </c:choose>
        <!-- 底部版权 /-->
        <%@ include file="../modules/admin-footer.jsp" %>
    </div>
    <!-- 页面js /-->
</body>
</html>
