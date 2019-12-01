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
   			<form action="rangking" method="post">
   				<select name="type">
                    <option value="0" ${rank.type==0?'selected':'' } >借阅量</option>
                    <option value="1" ${rank.type==1?'selected':'' } >访问量</option>
                </select>
                <select name="count">
                    <option value="50" ${rank.count==50?'selected':'' }>前50</option>
                    <option value="100" ${rank.count==100?'selected':''} >前100</option>
                </select>
                 <input type="submit" value="查看" style="color:blue ;width:50px; height:35px ">
                 <button><a href="ExcelExport"  onclick="return confirm('确认导出该表格？')"><span style="color:blue;font-size:17px">数据导出</span></a></button>
   			</form>
			<br>
			<span  style="color:blue ;font-size:15px">${hint }</span>
			<%
				int i=1;
			%>
           	<table class="gallery table table_list table_striped table-bordered " id="">
           		<thead>
           				<c:if test="${rank.type==0 }">
           					<tr>
           						<th>排名</th>
	           					<th>用户名</th>
	           					<th>借阅量</th>
           					</tr>
           					<c:forEach items="${list }" var="sss">
					     		<tr>
					     			<td><%=i++ %></td>
					     			<td>${sss.username }</td>
					     			<td>${sss.total }</td>
					     		</tr>
     						</c:forEach>
           				</c:if>
           				<c:if test="${rank.type==1 }">
           					<tr>
           						<th>排名</th>
           						<th>书名</th>
           						<th>作者</th>
           						<th>出版社</th>
           						<th>是否可借阅</th>
           						<th>访问量</th>
           					</tr>
           					<c:forEach items="${list }" var="book">
					     		<tr>
					     			<td><%=i++ %></td>
					     			<td>${book.name }</td>
					     			<td>${book.author }</td>
					     			<td>${book.publish }</td>
					     			<td>${book.borrow==0?'可借阅':'不可借阅' }</td>
					     			<td>${book.visit }</td>
					     		</tr>
     						</c:forEach>
           				</c:if>
		       			
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
