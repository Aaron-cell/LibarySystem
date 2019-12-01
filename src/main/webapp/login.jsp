<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <% String path = request.getContextPath();
	// 获得项目完全路径（假设你的项目叫MyApp，那么获得到的地址就是http://localhost:8080/MyApp/）:
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	 %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
 <base href="<%=basePath%>">
<title>我的“书屋”</title>
<link rel="stylesheet" href="<%=basePath%>/css/index.css" />

</head>

<body>
<img src="images/bgImg.jpg" class="bgImg" />
<div class="content">
		
<form action="${pageContext.request.contextPath }/login" method="post">
<div class="bidTitle">我的“书屋”登录</div>
		<div class="logCon">
			<div class="line"><span>账号:</span>
			<input class="bt_input" type="text" name="username" placeholder="请输入用户名"  required/></div>
			<div class="line"><span>密码:</span>
			<input class="bt_input" type="password" name="password" placeholder="请输入密码"  required  /></div>
			<h3><p style="color:red">${error }</p></h3>
			<button type="submit" class="logingBut">登录</button>	
			</div>
</div>
</form>

<div style="text-align:center;">
</div>
</body>

</html>