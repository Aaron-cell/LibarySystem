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
		<title>用户注册</title>
		<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
		<script src="js/jquery.cookie.js" type="text/javascript"></script>
		<script src="js/jquery.nicescroll.js" type="text/javascript"></script>
		<script src="js/HUpages.js" type="text/javascript"></script>
	</head>
<script>
	$(function(){
		$(":input[name='username']").change(function(){
			//获取name=“username”节点的值
			var val=$(this).val();
			//除去前后空格 然后不为空
			val=$.trim(val);
			if(val !=""){
				var url="${pageContext.request.contextPath }/VerifyUsername"
				var args={"username":val,"time":new Date()};
				$.post(url,args,function(data){
					$("#message").html(data);
				});
			}
		});
	});
</script>
	<body id="pagestyle" class="backgrounddd">
		 <div class="bk-con-message message-section" id="iframe_box">
			<div class="box-module height100b margin0">
				<div class="box-title">用户注册</div>
				<div class="box-content padding15">
					<div class="Promp_plate btn-green "><b>提示：</b>填写信息保存即可！
						<span  class="iconfont PrompClose">&#xe627</span>
					</div>
					<div class="clearfix ptb20">
					<span  style="color:blue ;font-size:15px">${hint }</span>
					<h3><div id="message"></div></h3>
						<form action="${pageContext.request.contextPath }/addUser" method="post">
							<table align="center">
								<tr align="right">
										<td ><span style="color:blue">用户名：</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td ><input type="text"  name="username" required></td>
								</tr>
								<tr align="right">
										<td ><span style="color:blue">密码：</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td ><input type="password"  name="password" required></td>
								</tr>
								<tr align="right">
										<td ><span style="color:blue">确认密码：</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td ><input type="password"  name="rpassword" required></td>
								</tr>
								<tr >
										<td align="right"><span style="color:blue">类别：</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="center">
												<input type="radio" name="type" value="1" checked/>学生
                    							<input type="radio" name="type" value="0" />管理员
                   						 </td>
								</tr>
								<tr align="right" >
										<td><span style="color:blue">姓名：</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td><input type="text"  name="name"  required></td>
								</tr>
								<tr align="right" >
										<td><span style="color:blue">性别：</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td><input type="text"  name="sex"  required></td>
								</tr>
								<tr align="right">
										<td><span style="color:blue">电话：</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td><input type="text"  name="phone"  required></td>
								</tr>
								<tr>
										<td align="right"><span style="color:blue">是否有效：</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="center">
												<input type="radio" name="flag" value="0" checked/>有效
                    							<input type="radio" name="flag" value="1" />无效
										</td>
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