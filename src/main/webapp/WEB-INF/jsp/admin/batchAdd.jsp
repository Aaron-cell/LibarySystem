<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
		<meta name="format-detection" content="telephone=no, email=no, date=no, address=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
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
		<title>用户导入</title>
		<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
		<script src="js/jquery.nicescroll.js" type="text/javascript"></script>
		<script src="js/HUpages.js" type="text/javascript"></script>
		<script src="js/common.js" type="text/javascript"></script>
	</head>

<body id="situation">
<div class="pages-style" >
	<!--右侧内容-->
	<div class="bk-con-message message-section" id="iframe_box">
           <!--列表内容-->
           <div class="page_content clearfix mb15 table-module ">
           <center><font size="4" color="blue"><a href="DownExcelTemplet">下载Excel模板</a></font></center>
           <br><br>
           <center>
				 <!-- enctype默认情况下只能上传文本格式文件，multipart/form-date将文件以二进制文件上传，可支持多种类型文件传输 -->
				 <form method="post" action="ExcelImport" enctype="multipart/form-data">
				       <font size="4" color="blue"> <input type="file" id="excelFile" name="file"/></font>
				       <font size="4" color="blue"> <button type="submit">开始导入</button></font>
			    </form>
			</center>
			<br>
           	<table class="gallery table table_list table_striped table-bordered " id="">
           		<center><font size="4" color="red">${hint }</font></center>     
           		<thead>
           			<tr>
           				<th>错误id</th>
           				<th>错误原因</th>
           			</tr>
		       			<c:forEach items="${list1}" var="error">
				     		<tr>
				     			<td>${error.id }</td>
				     			<td>${error.hint }</td>
				     		</tr>
     				</c:forEach>
		       </thead>
           	</table>
           </div>
    </div>
  </div>
 </body>
</html>
<script>
$(function(){
	//内页框架结构编辑
	$("#situation").Hupage({
		slide: '#breadcrumb',
		padding:15,
		menuModule:'#bk-con-menu', //菜单模块
		pagecontent:'.page_content',//自定义属性
		operation:'.operation',//自定义属性
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
		expand:function(thisBox,settings){	
			var pc="";
			$(settings.pagecontent).css("margin-bottom")!=null? pc=parseInt($(settings.pagecontent).css("margin-bottom").replace("px","")):'';
		    $(settings.pagecontent).css({height:$(window).height()-$(settings.operation).outerHeight()-pc-(settings.padding*2)})
		    settings.scrollbar($(settings.slide) && $(settings.pagecontent));		    
		}//自定义方法
	});
 });
</script>
