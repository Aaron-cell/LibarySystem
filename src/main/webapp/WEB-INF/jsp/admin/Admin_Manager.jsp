<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<title>用户管理</title>
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
           	<table class="gallery table table_list table_striped table-bordered " id="">
           		<thead>
		        <tr>
				<th width="20%">用户名</th>
				<th width="15%">用户类型</th>
				<th width="15%">姓名</th>
				<th width="15%">性别</th>
				<th width="20%">联系方式</th>
				<th width="15%" >用户状态</th>                
		       </tr>
		       </thead>
		       <tbody>
		       <c:forEach items="${list }" var="user">
		       	<tr>
           			<td>${user.username }</td>
           			<td>管理员</td>
           			<td>${user.name }</td>
           			<td>${user.sex }</td>
           			<td>${user.phone }</td>
           			<td>${user.flag==0?"有效":"无效" }</td>
           		</tr>			
				</c:forEach>
		       </tbody>
           	</table>
           	<div style="text-align:center">
		        <a href="?start=0"><span style="color:blue ;font-size:15px">首  页</span></a>
		        <c:if test="${page.start>0 }">
		        	<a href="?start=${page.start-page.count}"><span style="color:blue ;font-size:15px">上一页</span></a>
		        </c:if>
		        <span style="color:blue ;font-size:15px">第${page.currentPage }页</span>
		        <span style="color:blue ;font-size:15px">共${page.lastPage }页</span>
		        <a href="?start=${page.start+page.count}"><span style="color:blue ;font-size:15px">下一页</span></a>
		        <a href="?start=${page.last}"><span style="color:blue ;font-size:15px">末  页</span></a>
		        <span style="color:blue ;font-size:15px;float:right">共${page.total }记录</span>
		    </div>
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
