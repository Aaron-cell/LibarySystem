<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
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
		<title>修改密码</title>
		<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
		<script src="js/jquery.cookie.js" type="text/javascript"></script>
		<script src="js/jquery.nicescroll.js" type="text/javascript"></script>
		<script src="js/HUpages.js" type="text/javascript"></script>
	</head>
	<body id="pagestyle" class="backgrounddd">
		 <div class="bk-con-message message-section" id="iframe_box">
			<div class="box-module height100b margin0">
				<div class="box-title">修改密码</div>
				<div class="box-content padding15">
					<div class="Promp_plate btn-green "><b>提示：</b>修改信息保存即可！
						<span  class="iconfont PrompClose">&#xe627</span>
					</div>
					<div class="clearfix ptb20">
					<span  style="color:blue ;font-size:15px">${hint }</span>
						<form action="${pageContext.request.contextPath }/updatePassword" method="post">
							<table align="center">
								<tr align="right">
										<td><span style="color:blue">新密码：</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td><input type="password"  name="npassword" placeholder="请输入新密码"  required></td>
								</tr>
								<tr align="right">
										<td><span style="color:blue">确认新密码：</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td><input type="password"  name="rpassword"  placeholder="请确认新密码"  required></td>
								</tr>
								<tr align="center">
									<td colspan="2">
										<input type="submit" value="保存"  style="color:blue ;font-size:15px"  >
									</td>
								</tr>
							</table>
						</form>
					</div>	
				</div>
			</div>
	    </div>
	</body>
</html>
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
</script>