<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!-- 底部导航 -->
<footer class="main-footer">
    <div class="pull-right hidden-xs">
        <b>
            <%
                Date dNow = new Date( );
                SimpleDateFormat ft = new SimpleDateFormat("MM月dd日 HH:mm:ss");
                out.print(ft.format(dNow));
            %>
        </b>
    </div>
    <strong>&copy; 2019 吉首大学校园二手 版权所有
</footer>
<!-- 底部导航 /-->
