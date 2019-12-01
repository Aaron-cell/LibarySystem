<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
      <% String path = request.getContextPath();
	// 获得项目完全路径（假设你的项目叫MyApp，那么获得到的地址就是http://localhost:8080/MyApp/）:
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	 %>
<!DOCTYPE HTML>
<html>
    
    <head>
     <base href="<%=basePath%>">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>
            关于我们 > 图书在线借阅
        </title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
		<meta name="generator" content="" data-variable="/,cn,10001,,10001,res032"/>
              <link rel="stylesheet" href="<%=basePath%>/css/home.css">
        <script src="${pageContext.request.contextPath }/js/jquery-1.9.1.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/index.js"></script>
          <script type="text/javascript" src="${pageContext.request.contextPath }/js/index.js"></script>
    </head>
    
    <body class="met-navfixed">
        <header id="header" class="header-fixed">
            <div class="container">
                <ul class="head-list">
                    <li class="left tel">
                        <img src="images/picture/1514354107.png" alt="">
                        <span>
                            商院咨询热线：
                        </span>
                        <em>
                           400-123-4567
                        </em>
                    </li>
                   <li class="right">
                        <ul>
                            <li>
                                <img src="images/picture/1514355047.png" alt="用心创造快乐">
                                <span>
                                    用心创造快乐
                                </span>
                            </li>
                            <li>
                                <img src="images/picture/1514354461.png" alt="卓越的品质">
                                <span>
                                    卓越的品质
                                </span>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </header>
        <nav class="navbar navbar-default met-nav navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="row">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle hamburger hamburger-close collapsed"
                        data-target="#navbar-default-collapse" data-toggle="collapse">
                            <span class="sr-only">
                                Toggle navigation
                            </span>
                            <span class="hamburger-bar">
                            </span>
                        </button>
                        <a href="#"​ class="navbar-brand navbar-logo vertical-align" title="图书在线借阅">
                            <h1 class='hide'>
                                图书在线借阅
                            </h1>
                            <div class="vertical-align-middle">
                                <img src="images/picture/tushu.png" alt="图书在线借阅" title="图书在线借阅"
                                />
                            </div>
                        </a>
                        <h2 class='hide'>
                        </h2>
                    </div>
                    <div class="collapse navbar-collapse navbar-collapse-toolbar" id="navbar-default-collapse">
                        <ul class="nav navbar-nav navbar-right navlist">
                            <li>
                                <a href="fore/home"​ title="网站首页" class="link">
                                    网站首页
                                </a>
                            </li>
                            <li class="dropdown margin-left-20">
                                <a class="dropdown-toggle link active" data-toggle="dropdown" data-hover="dropdown" aria-expanded="false" href="fore/about">
                                    关于我们
                                    <span class="caret">
                                    </span>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-right bullet">
                                    <li>
                                        <a href="fore/about"​ class="" title="小组简介">
                                            小组简介
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="dropdown margin-left-20">
                                <a class="dropdown-toggle link " data-toggle="dropdown" data-hover="dropdown" aria-expanded="false" href="fore/productcate">
                                    图书分类
                                    <span class="caret">
                                    </span>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-right bullet">
                                    <li>
                                        <a href="fore/productcate"​ class="" title="军事">
                                            军事
                                        </a>
                                    </li>
                                    <li>
                                        <a href="fore/productcate"​ class="" title="艺术">
                                            艺术
                                        </a>
                                    </li>
                                    <li>
                                        <a href="fore/productcate"​ class="" title="文学">
                                            文学
                                        </a>
                                    </li>
                                    <li>
                                        <a href="fore/productcate"​ class="" title="经济">
                                           经济
                                        </a>
                                    </li>
                          
                                </ul>
                            </li>
                             <li class="dropdown margin-left-20">
                                <a class=" link " href="fore/honor">
                                    资质荣誉
                                </a>
                                <ul class="dropdown-menu dropdown-menu-right bullet">
                                </ul>
                            </li>
                            <li class="dropdown margin-left-20">
                                <a class="dropdown-toggle link " data-toggle="dropdown" data-hover="dropdown" aria-expanded="false" href="javascript:void(0);">
                                    畅销中心
                                    <span class="caret">
                                    </span>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-right bullet">
                                    <li>
                                        <a href="fore/PopularBooks?start=0"​ class="" title="热销书籍">
                                            热门书籍
                                        </a>
                                    </li>
                                    <li>
                                        <a href="fore/LatestBooks?start=0"​ class="" title="最新书籍">
                                           最新书籍
                                        </a>
                                    </li>
                                </ul>
                            </li>
                          <li class="dropdown margin-left-20">
                                <a class=" link " href="fore/contact">
                                    联系我们
                                </a>
                                <ul class="dropdown-menu dropdown-menu-right bullet">
                                </ul>
                            </li>
                            <li class="dropdown margin-left-20">
                            		<c:if test="${sessionScope.person==null }">
		                                <a class=" link "  href="fore/about/login"​ title="登录" class="link  active">
		                                    登&nbsp;&nbsp;&nbsp;&nbsp;录
		                                </a>
	                               </c:if>
	                               <c:if test="${sessionScope.person!=null }">
		                                <a class=" link "  href="fore/personalCenter"​ title="个人中心" class="link  active">
		                                    个人中心
		                                </a>
	                               </c:if>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
        <div class="met-banner banner-ny-h" data-height='' style=''>
            <div class="slick-slide">
                <img class="cover-image" src="images/picture/index1.jpg" sizes="(max-width: 767px) 767px" alt="小组简介">
            </div>
        </div>
        <div class="met-column-nav ">
            <div class="container">
                <div class="row">
                    <div class="sidebar-tile">
                        <ul class="met-column-nav-ul invisible-xs">
                            <li>
                                <a href="fore/about"class='link active'>
                                    小组简介
                                </a>
                            </li>
                          
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <section class="met-show animsition">
            <div class="container">
                <div class="row">
                    <div class="met-editor lazyload clearfix">
                        <div>
                         <p style="text-align: center;">
                                <span style="font-size:14px;">
                                    <img alt="" src="images/picture/index.jpg" style="width: 1250px; height: 550px;"
                                    />
                                </span>
                            </p>
                            <p>
	                            <span style="font-size:14px;">
	                             	图书在线借阅系统：
	                                <br>此项目分为前台后台，前台提供用户在线借阅书籍 查看该用户借阅信息 以及修改密码等简单操作，后台提供管理员对用户，书籍，借阅记录的管理以及学生用户的信息导入，书籍访问量和个人借阅量排名的导出<br>
	                                 小组及成员： <br>&nbsp;&nbsp;&nbsp;小组:第八组 组长（丁星）
	                                 <br>&nbsp;&nbsp;&nbsp;成员：
	                                 	<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;丁星——书籍管理
	                                 	<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;李虎——借阅系统前台实现，用户登录拦截器，
	                                 	<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;谢玉峰——前台个人中心，文件管理
	                                 	<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;杨艳琴——用户管理，管理员信息修改
	                                 	<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;卢莹——图书借阅管理
	                                 <br>项目历时5天：
	                                 <br>&nbsp;&nbsp;&nbsp;统一框架（SSM）及配置文件；pojo文件，mybatis文件均采用逆向工程生成，统一定制service接口
	                            </span>
                            </p>
                             <p style="text-align: center;">
                             	
                                <span style="font-size:14px;">
                                设计图
                                    <img alt="" src="images/design.png" style="width: 1250px; height: 550px;"
                                    />
                                </span>
                            </p>
                           
                             <p>
                                <span style="font-size:14px;">
                                    项目亮点：
                                    	<br>&nbsp;&nbsp;&nbsp;后台登录——拦截器
                                    	<br>&nbsp;&nbsp;&nbsp;用户管理——批量删除（事务管理），用户添加（ajax），分页插件
                                    	<br>&nbsp;&nbsp;&nbsp;书籍管理——批量删除（事务管理），添加书籍（图片上传），分页插件
                                    	<br>&nbsp;&nbsp;&nbsp;图书借还——分页插件，借还状态变更（springmvc定时任务）
                                    	<br>&nbsp;&nbsp;&nbsp;文件管理——excel导入和导出
                                    	<br>&nbsp;&nbsp;&nbsp;前台实现——图书访问量实现，ajax，分页插件，jquery-pager
                                </span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div class="met-footnav text-center">
            <div class="container">
                <div class="row mob-masonry">
                    <div class="col-md-2 col-sm-3 col-xs-6 list masonry-item">
                        <h4>
                            <a href="fore/about"​ title="关于我们">
                                关于我们
                            </a>
                        </h4>
                        <ul>
                            <li>
                                 <a href="fore/about"​ class="" title="小组简介">
                                            小组简介
                                        </a>
                            </li>
                            <li>
                                <a href="fore/message"​ class="" title="在线留言">
                                            在线留言
                                        </a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-2 col-sm-3 col-xs-6 list masonry-item">
                        <h4>
                            <a href="fore/productcate"​ title="图书分类">
                                图书分类
                            </a>
                        </h4>
                        <ul>
                            <li>
                                <a href="fore/productcate"​ title="军事" target='_self'>
                                    军事
                                </a>
                            </li>
                            <li>
                                <a href="fore/productcate"​ title="艺术" target='_self'>
                                    艺术
                                </a>
                            </li>
                            <li>
                                <a href="fore/productcate"​ title="文学" target='_self'>
                                    文学
                                </a>
                            </li>
                            <li>
                                <a href="fore/productcate"​ title="经济" target='_self'>
                                    经济
                                </a>
                            </li>
                        </ul>
                    </div>
                    
                    <div class="col-md-2 col-sm-3 col-xs-6 list masonry-item">
                        <h4>
                            <a href="javascript:void(0);"​ title="畅销中心">
                               畅销中心
                            </a>
                        </h4>
                        <ul>
                            <li>
                                <a href="fore/PopularBooks?start=0"​ title="热销书籍" target='_self'>
                                    热销书籍
                                </a>
                            </li>
                            <li>
                                <a href="fore/LatestBooks?start=0"​ title="最新书籍" target='_self'>
                                    最新书籍
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-3 col-ms-12 col-xs-12 info masonry-item">
                        <em>
                            <a href="fore/contact"​ title="027-84791393" target='_self'>
                                商院咨询热线：
                            </a>
                        </em>
                        <p>
                            027-84791393
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <footer>
            <div class="container text-center">
                <p>
                    CopyRight &copy; 2019-2029 第八组织 版权所有
                </p>
                <p>
                    ICP备11003517号-8 
                </p>
                <div class="powered_by_metinfo">
                    友情链接：
                    <a href="http://www.mycodes.net/"​ target="_blank">
                        网站模板
                    </a>
                </div>
            </div>
        </footer>
        <button type="button" class="btn btn-icon btn-primary btn-squared met-scroll-top hide">
            <i class="icon wb-chevron-up" aria-hidden="true">
            </i>
        </button>
   
    </body>

</html>