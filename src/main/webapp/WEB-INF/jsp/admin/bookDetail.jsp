<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
    <meta name="format-detection" content="telephone=no, email=no, date=no, address=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta http-equiv="Pragma" content="no-cache">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="format-detection" content="telephone=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <link href="css/bksystem.css" rel="stylesheet" type="text/css" />
    <link href="font/iconfont.css" rel="stylesheet" type="text/css" />
    <link href="css/module.css" rel="stylesheet" type="text/css" />
    <link href="css/pages.css" rel="stylesheet" type="text/css" />
    <title>查看书籍详情</title>
    <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="js/HUpages.js" type="text/javascript"></script>
    <script src="js/template.js" type="text/javascript"></script>
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js" type="text/javascript"></script>
    <script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
    <![endif]-->
</head>

<body id="pagestyle">
<div class="pages-style">
    <!--右侧内容-->
    <div class="bk-con-message message-section" id="iframe_box">
        <!--列表内容-->
        <div style="text-align:center">

            <table align="center">
                <tr>
                    <td><img src="${book.image }" width="366" height="500" alt="书籍图片"/></td>
                    <td>
                        <table>
                            <tr><p><strong>书号：</strong><span>${book.bid }</span></p></tr>
                            <tr><p><strong>书籍名称：</strong><span>${book.name }</span></p></tr>
                            <tr><p><strong>作者：</strong><span>${book.author }</span></p></tr>
                            <tr><p><strong>出版社：</strong><span>${book.publish }</span></p></tr>
                            <tr><p><strong>价格：</strong><span>${book.price }</span></p></tr>
                            <tr><p><strong>类别：</strong><span>${book.type }</span></p></tr>
                            <tr><p><strong>是否可借阅：</strong><span>${book.borrow }</span></p></tr>
                            <tr><p><strong>库存量：</strong><span>${book.inventory }</span></p></tr>
                            <tr><p><strong>剩余量：</strong><span>${book.residue }</span></p></tr>
                            <tr><p><strong>添加时间：</strong><span>${book.createtime }</span></p></tr>
                            <tr><p><strong>访问量：</strong><span>${book.visit }</span></p></tr>
                            <tr><p><strong>操作人：</strong><span>${book.username }</span></p></tr>
                        </table>
                    </td>
                </tr>

            </table>
            <a href="bookCommon?start=0"><img src="images/fanhui.png" width="35" height="30" alt="返回"></a>
        </div>
    </div>

</div>
</body>

</html>

<%--
<script>
    $(function() {
        $("#pagestyle").Hupage({
            slide: '#breadcrumb',
            scrollbar:function(e){
                e.niceScroll({
                    cursorcolor: "#dddddd",
                    cursoropacitymax: 1,
                    touchbehavior: false,
                    cursorwidth: "3px",
                    cursorborder: "0",
                    cursorborderradius: "3px",
                });
            },
            expand: function(thisBox, settings) {
                settings.scrollbar(thisBox);//设置当前页滚动样式
            }
        })
    })
</script>--%>
