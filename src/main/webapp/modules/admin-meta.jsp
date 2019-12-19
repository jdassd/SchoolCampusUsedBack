<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>吉首大学校园二手系统 后台</title>
<meta name="description" content="AdminLTE2定制版">
<meta name="keywords" content="AdminLTE2定制版">

<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="../../../plugins/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="../../../plugins/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="../../../plugins/ionicons/css/ionicons.min.css">
<!-- iCheck -->
<link rel="stylesheet" href="../../../plugins/iCheck/square/blue.css">
<!-- Morris chart -->
<link rel="stylesheet" href="../../../plugins/morris/morris.css">
<!-- jvectormap -->
<link rel="stylesheet" href="../../../plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<!-- Date Picker -->
<link rel="stylesheet" href="../../../plugins/datepicker/datepicker3.css">
<!-- Daterange picker -->
<link rel="stylesheet" href="../../../plugins/daterangepicker/daterangepicker.css">
<!-- Bootstrap time Picker -->
<!--<link rel="stylesheet" href="../../../plugins/timepicker/bootstrap-timepicker.min.css">-->
<!-- bootstrap wysihtml5 - text editor -->
<link rel="stylesheet" href="../../../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<!--数据表格-->
<link rel="stylesheet" href="../../../plugins/datatables/dataTables.bootstrap.css">
<!-- 表格树 -->
<link rel="stylesheet" href="../../../plugins/treeTable/jquery.treetable.css">
<link rel="stylesheet" href="../../../plugins/treeTable/jquery.treetable.theme.default.css">
<!-- select2 -->
<link rel="stylesheet" href="../../../plugins/select2/select2.css">
<!-- Bootstrap Color Picker -->
<link rel="stylesheet" href="../../../plugins/colorpicker/bootstrap-colorpicker.min.css">
<!-- bootstrap wysihtml5 - text editor -->
<link rel="stylesheet" href="../../../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<!--bootstrap-markdown-->
<link rel="stylesheet" href="../../../plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">

<!-- Theme style -->
<link rel="stylesheet" href="../../../plugins/adminLTE/css/AdminLTE.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="../../../plugins/adminLTE/css/skins/_all-skins.min.css">

<link rel="stylesheet" href="../../../assets/css/style.css">

<!-- Ion Slider -->
<link rel="stylesheet" href="../../../plugins/ionslider/ion.rangeSlider.css">
<!-- ion slider Nice -->
<link rel="stylesheet" href="../../../plugins/ionslider/ion.rangeSlider.skinNice.css">
<!-- bootstrap slider -->
<link rel="stylesheet" href="../../../plugins/bootstrap-slider/slider.css">
<!-- bootstrap-datetimepicker -->
<link rel="stylesheet" href="../../../plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->


<!-- jQuery 2.2.3 -->
<script src="../../../plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="../../../plugins/jQueryUI/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.6 -->
<script src="../../../plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- Morris.js charts -->
<script src="../../../plugins/raphael/raphael-min.js"></script>
<script src="../../../plugins/morris/morris.min.js"></script>
<!-- Sparkline -->
<script src="../../../plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="../../../plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="../../../plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- jQuery Knob Chart -->
<script src="../../../plugins/knob/jquery.knob.js"></script>
<!-- daterangepicker -->
<script src="../../../plugins/daterangepicker/moment.min.js"></script>
<script src="../../../plugins/daterangepicker/daterangepicker.js"></script>
<script src="../../../plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
<!-- datepicker -->
<script src="../../../plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="../../../plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="../../../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Slimscroll -->
<script src="../../../plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="../../../plugins/fastclick/fastclick.js"></script>
<!-- iCheck -->
<script src="../../../plugins/iCheck/icheck.min.js"></script>
<!-- AdminLTE App -->
<script src="../../../plugins/adminLTE/js/app.min.js"></script>
<!-- 表格树 -->
<script src="../../../plugins/treeTable/jquery.treetable.js"></script>
<!-- select2 -->
<script src="../../../plugins/select2/select2.full.min.js"></script>
<!-- bootstrap color picker -->
<script src="../../../plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<!-- bootstrap time picker -->
<!--<script src="../../../plugins/timepicker/bootstrap-timepicker.min.js"></script>-->
<!-- Bootstrap WYSIHTML5 -->
<script src="../../../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="../../../plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<!--bootstrap-markdown-->
<script src="../../../plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script src="../../../plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
<script src="../../../plugins/bootstrap-markdown/js/markdown.js"></script>
<script src="../../../plugins/bootstrap-markdown/js/to-markdown.js"></script>
<!-- CK Editor -->
<script src="../../../plugins/ckeditor/ckeditor.js"></script>
<!-- InputMask -->
<script src="../../../plugins/input-mask/jquery.inputmask.js"></script>
<script src="../../../plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="../../../plugins/input-mask/jquery.inputmask.extensions.js"></script>

<!-- DataTables -->
<script src="../../../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../../../plugins/datatables/dataTables.bootstrap.min.js"></script>

<!-- ChartJS 1.0.1 -->
<script src="../../../plugins/chartjs/Chart.min.js"></script>

<!-- FLOT CHARTS -->
<script src="../../../plugins/flot/jquery.flot.min.js"></script>
<!-- FLOT RESIZE PLUGIN - allows the chart to redraw when the window is resized -->
<script src="../../../plugins/flot/jquery.flot.resize.min.js"></script>
<!-- FLOT PIE PLUGIN - also used to draw donut charts -->
<script src="../../../plugins/flot/jquery.flot.pie.min.js"></script>
<!-- FLOT CATEGORIES PLUGIN - Used to draw bar charts -->
<script src="../../../plugins/flot/jquery.flot.categories.min.js"></script>

<!-- jQuery Knob -->
<script src="../../../plugins/knob/jquery.knob.js"></script>
<!-- Sparkline -->
<script src="../../../plugins/sparkline/jquery.sparkline.min.js"></script>

<!-- Morris.js charts -->
<script src="../../../plugins/raphael/raphael-min.js"></script>
<script src="../../../plugins/morris/morris.min.js"></script>

<!-- Ion Slider -->
<script src="../../../plugins/ionslider/ion.rangeSlider.min.js"></script>
<!-- Bootstrap slider -->
<script src="../../../plugins/bootstrap-slider/bootstrap-slider.js"></script>
<!-- bootstrap-datetimepicker -->
<script src="../../../plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
<script src="../../../plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>

<script>
    $(document).ready(function () {
        // 选择框
        $(".select2").select2();

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale: 'zh-CN'
        });
    });
</script>
