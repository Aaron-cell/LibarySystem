<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
		<meta name="format-detection" content="telephone=no, email=no, date=no, address=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta http-equiv="Pragma"  content="no-cache">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="format-detection" content="telephone=no" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta content="black" name="apple-mobile-web-app-status-bar-style">
		<link href="css/bksystem.css" rel="stylesheet" type="text/css" />
		<link href="css/module.css" rel="stylesheet" type="text/css" />
		<link href="css/loaders.css" rel="stylesheet" type="text/css" />
		<link href="skin/black/skin.css" rel="stylesheet" type="text/css" id="skin" />
		<link href="font/iconfont.css" rel="stylesheet" type="text/css" />
		<title>图书借阅系统后台</title>
		<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
		<script src="js/jquery.cookie.js" type="text/javascript"></script>
		<script src="js/jquery.nicescroll.js" type="text/javascript"></script>
		<script src="js/BKframe.js" type="text/javascript"></script>
		<script src="js/layer/layer.js" type="text/javascript"></script>
		<!--[if lt IE 9]>
          <script src="js/html5shiv.js" type="text/javascript"></script>
          <script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
        <![endif]-->
	</head>
	<body>
		<div class="" id="situation">
			<!--顶部样式-->
			<div class="bk-herder relative header-section">
				<div class="bk-herder-logo">后台管理系统</div>
				<div class="operate-header">
					<div class="" id="dropdown_menu">
						<ul class="clearfix">
							<li></li>
						</ul>
					</div>
					<div class="bk-settings-section">
						<div class="headerUser">
							<a class="user-info clickBombbox" href="javascript:void(0)" data-position="bottom" data-type="arrow"> 欢迎你，${username } <i class="iconfont icon-iconfonticontrianglecopy"></i></a>
							<div class="Bombbox">
								<ul class="usercz menulist">
									<li class="column-name">
										<a href="javascript:void(0)" title="个人信息" class="menuUl_title" name="${pageContext.request.contextPath }/administrators" data-id="111"><i class="iconfont icon-guanliyuan"></i>个人信息</a>
									</li>
									<li class="column-name">
										<a href="javascript:void(0)" title="修改密码" class="menuUl_title" name="${pageContext.request.contextPath }/changePassword" data-id="46"><i class="iconfont icon-system-copy"></i>修改密码</a>
									</li>
									<li>
										<a href="javascript:void(0)" class="" onclick="dropout()"><i class="iconfont ">&#xe64f</i>退出登录</a>
									</li>
									<li>
										<a href="javascript:void(0)" class="" id='Lock'><i class="iconfont">&#xe612</i>锁屏</a>
									</li>
								</ul>
							</div>
						</div>
						<div class="skin-section">
							<a href="javascript:void(0)" class="skin-btn clickBombbox iconfont icon-pifushezhi" id="skin-btn"></a>
							<div class="Bombbox">
								<ul class="skin-list">
									<li>
										<a class="colorpick-btn" href="javascript:void(0)" data-val="black" id="default" style="background-color:#222A2D"></a>
									</li>
									<li>
										<a class="colorpick-btn" href="javascript:void(0)" data-val="blue" style="background-color:#438EB9;"></a>
									</li>
									<li>
										<a class="colorpick-btn" href="javascript:void(0)" data-val="green" style="background-color:#72B63F;"></a>
									</li>
									<li>
										<a class="colorpick-btn" href="javascript:void(0)" data-val="gray" style="background-color:#41a2ff;"></a>
									</li>
									<li>
										<a class="colorpick-btn" href="javascript:void(0)" data-val="red" style="background-color:#FF6868;"></a>
									</li>
									<li>
										<a class="colorpick-btn" href="javascript:void(0)" data-val="purple" style="background-color:#6F036B;"></a>
									</li>
									<li>
										<a class="colorpick-btn" href="javascript:void(0)" data-val="white" style="background-color:#FFFFFF;border: 1px solid #DDDDDD; color: #333333;"></a>
									</li>
								</ul>
							</div>
						</div>

						<a href="javascript:void(0)" class="radius roll-right fullscreen" id="fullscreen"><i class="iconfont icon-msnui-fullscreen"></i></a>
					</div>
				</div>
			</div>
			<!--内容显示区-->
			<div class="bk-contents content-section">
				<!--栏目显示区-->
				<div class="bk-con-menu" id="bk-con-menu">
					<div class="menubtn">
						<span class="close_btn samebtn"><i>隐藏</i></span>
						<span class="show_btn samebtn"><i>显示</i></span>
					</div>
					<a id="js-tabNav-prev" class="radius btn-default left_roll" href="javascript:void(0);"><i class="iconfont icon-zuoshuangjiantou"></i></a>
					<div class="breadcrumb" id="breadcrumb">
						<ul class="clearfix menu-section menulist" id="menu-section"></ul>
					</div>
					<a id="js-tabNav-next" class="radius btn-default right_roll" href="javascript:void(0);"><i class="iconfont icon-youshuangjiantou"></i></a>
				</div>
				<!--内容显示区-->
				<div class="bk-con-message message-section" id="iframe_box">
                 
				</div>
			</div>
			<!--底部显示区-->
			<div class="bk-footer footer-section">
				<div class="tab-column clearfix" id="tab-column">
					<ul class="tab-navigation " id="tab-navigation">
					<!--菜单地址快捷操作-->
					</ul>
				</div>
				<div class="inte-operation" id="operation">
					<a href="javascript:void(0)" class="dropdown iconfont icon-iconfonticontrianglecopy"></a>
					<div class="dropdown-menu dropdown-menu-right tab-menu-list" >
						<div class="title-name">选项卡操作</div>
						<ul class="tabslist" id="dropdown_menu">
							<li>
								<a class="tabReload" href="javascript:void(0);">刷新当前</a>
							</li>
							<li>
								<a class="tabCloseCurrent" href="javascript:void(0);">关闭当前</a>
							</li>
							<li>
								<a class="tabCloseAll" href="javascript:void(0);">全部关闭(首页)</a>
							</li>
							<li>
								<a class="tabCloseOther" href="javascript:void(0);">除此之外全部关闭</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
<script>
	var data = [{
			id: 2,//默认设置显示页时该值必须保持为2,不为2时将出错
			pid: 0,
			url: "${pageContext.request.contextPath }/index_home", //地址自定义 但需要和homepage保持一致
			icon: 'iconfont icon-home',
			name: '系统首页',
		},
		{
			id: 5,
			pid: 0,
			url: "",
			icon: 'iconfont icon-yonghuguanli',
			name: '用户管理',
		},
		{
			id: 3,
			pid: 5,
			url: "${pageContext.request.contextPath }/Student_Manager",
			icon: ' ',
			name: '学生管理',
		},
		{
			id: 6,
			pid: 5,
			url: "${pageContext.request.contextPath }/Admin_Manager?start=0",
			icon: ' ',
			name: '管理员管理',
		},
		
		{
			id: 1,
			pid: 0,
			url: "${pageContext.request.contextPath }/Book_Manage",
			icon: 'iconfont icon-iconsp2',
			name: '书籍管理',
		},
		{
			id: 4,
			pid: 0,
			url: "${pageContext.request.contextPath }/Record_Manage",
			icon: 'iconfont icon-xiangmuguanli',
			name: '图书借还',
		},
		{
			id: 7,
			pid: 0,
			url: "",
			icon: 'iconfont icon-wenzhang',
			name: '文件管理',
		},
		{
			id: 8,
			pid: 7,
			url: "${pageContext.request.contextPath }/batchAdd_Manager",
			icon: '',
			name: '用户导入',
		},
		{
			id: 9,
			pid: 7,
			url: "${pageContext.request.contextPath }/ranking_Manager",
			icon: '',
			name: '排名导出',
		}
	]
	$(function() {
		$("#situation").BKframe({
			data: data, //数据,支持API传输但需要保证数据格式一样
			menuopt: 'click', //点击菜单栏显示模式'click'和'hover'
			boxname: '.Bombbox', //弹框模块
			bkposition: "left",//菜单栏显示的方式，现有左侧列表展示和顶部列表展示方式两种
			slide: '#breadcrumb',//设置菜单栏目样式属性
			cookieDate:7,//设置皮肤显示时间（天单位）
			rightclick: false, //是否启用右键功能(为true是右键失效，为false时右键显示)
			minStatue:false,//设置默认是否显示菜单栏（true为隐藏/false为显示）
			homepage:"index_home.jsp", // 设置默认显示页（id值必须为2，否则将出错）
			scrollbar:function(e){
				e.niceScroll({
					    cursorcolor: "#dddddd",
					    cursoropacitymax: 1,
					    touchbehavior: false,
					    cursorwidth: "3px",
					    cursorborder: "0",
					    cursorborderradius: "3px",
				 });						
			},//自定义滚动样式(可以自己写也可以用第三方插件)
			expand:function(thisBox,settings){						
			    settings.scrollbar($(settings.slide));	//设置显示弹框模块是否需要滚动（自定义）
                settings.loading=('<div class="loader-inner ball-spin-fade-loader"><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div></div>'); //定义加载动画   	
			}//自定义方法
		});
	});
//退出系统
function dropout(){
    layer.confirm('是否确定退出系统？', {
     btn: ['是','否'] ,//按钮
	 icon:1,
    }, 
	function(){
	  location.href="login.jsp";
   });
}
</script>