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
	<title>图书借还</title>
	<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="js/jquery.nicescroll.js" type="text/javascript"></script>
	<script src="js/HUpages.js" type="text/javascript"></script>
	<script src="js/common.js" type="text/javascript"></script>
</head>

<body id="situation">
<div class="pages-style" >
	<!--右侧内容-->
	<div class="bk-con-message message-section" id="iframe_box">
		<!--编辑内容-->
		<div class="operation  mb15">
			<%--搜索--%>
			<form action="searchRecord" method="post">
				<select name="status">
					<option value="0" ${flag==0?'selected':'' }>预借</option>
					<option value="1" ${flag==1?'selected':'' }>待还</option>
					<option value="2" ${flag==2?'selected':'' }>即将到期</option>
					<option value="3" ${flag==3?'selected':'' }>超时</option>
					<option value="4" ${flag==4?'selected':'' }>已归还</option>
				</select>
				<input type="submit" value="搜索" style="color:blue ;width:60px; height:40px ">
			</form>
		</div>

		<!--列表内容-->
		<div class="page_content clearfix mb15 table-module ">
			<table class="gallery table table_list table_striped table-bordered " id="">
				<thead>
				<tr>
					<th width="5%">记录号</th>
					<th width="15%">学号</th>
					<th width="15%">图书编号</th>
					<th width="15%">图书名称</th>
					<th width="20%">借阅时间</th>
					<th width="15%" >到期时间</th>
					<th width="10">借阅状态</th>
					<th width="10">操作</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="record" items="${recordsList }">
					<tr>
						<td>${record.rid }</td>
						<td>${record.username }</td>
						<td>${record.bid }</td>
						<td>${record.name }</td>
						<td>${record.borrowtime}</td>
						<td>${record.returntime}</td>
						<td>
							<c:if test="${record.status==0}">
								<span style="color:black;font-size:15px">预借</span>
							</c:if>
							<c:if test="${record.status==1}">
								<span style="color:orange;font-size:15px">待还</span>
							</c:if>
							<c:if test="${record.status==2}">
								<span style="color:orangered;font-size:15px">即将到期</span>
							</c:if>
							<c:if test="${record.status==3}">
								<span style="color:red;font-size:15px">超时</span>
							</c:if>
							<c:if test="${record.status==4}">
								<span style="color:green;font-size:15px">已归还</span>
							</c:if>
						</td>
						<td>
							<c:if test="${record.status==0 }">
								<%--点击出借，状态改为待还1--%>
								<a href="setRecordStatus?rid=${record.rid}&status=${record.status}" onclick="return confirm('确认书籍借出？')">
									<img src="images/light-off-50.png" width="30" height="30" alt="出借" title="出借"/>
								</a>
							</c:if>
							<c:if test="${record.status==1 || record.status==2 || record.status==3}">
								<%--点击出借后，状态改为待还1，图片显示为归还;
								点击归还，状态改为已归还4--%>
								<a href="setRecordStatus?rid=${record.rid}&status=${record.status}" onclick="return confirm('确认书籍归还？')">
									<img src="images/light-on-50.png" width="30" height="30" alt="归还" title="归还"/>
								</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>

			<div style="text-align:center">
				<a href="recordCommon?start=0"><span style="color:blue ;font-size:15px">首  页</span></a>
				<c:if test="${page.start>0 }">
					<a href="recordCommon?start=${page.start-page.count}"><span style="color:blue ;font-size:15px">上一页</span></a>
				</c:if>
				<span style="color:blue ;font-size:15px">第${page.currentPage }页</span>
				<span style="color:blue ;font-size:15px">共${page.lastPage }页</span>
				<a href="recordCommon?start=${page.start+page.count}"><span style="color:blue ;font-size:15px">下一页</span></a>
				<a href="recordCommon?start=${page.last}"><span style="color:blue ;font-size:15px">末  页</span></a>
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