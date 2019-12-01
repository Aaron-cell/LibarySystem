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
        <title>图书在线借阅</title>
        <meta name="keywords" content="图书在线借阅" />
        <meta name="description" content="图书在线借阅" /> 
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
		<meta name="generator" content="" data-variable="/,cn,10001,,10001,res032"/>
        <link rel="stylesheet" href="<%=basePath%>/css/home.css">
        <script src="${pageContext.request.contextPath }/js/jquery-1.9.1.min.js" type="text/javascript"></script>
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
                                <img src="images/picture/tushu.png" alt="图书在线借阅" title="图书在线借阅"  />
                            </div>
                        </a>
                        <h2 class='hide'>
                        </h2>
                    </div>
                    <div class="collapse navbar-collapse navbar-collapse-toolbar" id="navbar-default-collapse">
                        <ul class="nav navbar-nav navbar-right navlist">
                            <li>
                                <a href="fore/home"​ title="网站首页" class="link  active">
                                    网站首页
                                </a>
                            </li>
                            <li class="dropdown margin-left-20">
                                <a class="dropdown-toggle link " data-toggle="dropdown" data-hover="dropdown" aria-expanded="false" href="fore/about">
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
                                        <a href="fore/PopularBooks"​ class="" title="热销书籍">
                                            热门书籍
                                        </a>
                                    </li>
                                    <li>
                                        <a href="fore/LatestBooks"​ class="" title="最新书籍">
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
		                                <a class=" link "  href="fore/home/login"​ title="登录" class="link  active">
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
        <div class="met-banner" data-height='' style=''>
            <div class="slick-slide">
                <img class="cover-image" src="images/homepage1.jpg" sizes="(max-width: 767px) 767px" alt="幻灯一">
            </div>
            <div class="slick-slide">
                <img class="cover-image" src="images/homepage2.jpg" sizes="(max-width: 767px) 767px" alt="幻灯二">
            </div>
        </div>
        <div class="met-index-hot met-index-body" id="hot">
            <div class="title">
                <h2 class="">
                    热门书籍
                </h2>
                <div class="home-line" style="background:url(images/1514365123.png)center no-repeat;">
                </div>
                <p class="desc">
                    我们用心为您做的更好
                </p>
            </div>
            <div class="container">
                <ul class="blocks-100 blocks-sm-2 blocks-md-4 blocks-xlg-4 " data-scale='' >
                	
                    <c:forEach items="${books1 }" var="books">
                 
                        <li class="">
                         <div class="widget widget-article widget-shadow">
                         	 <div class="widget-header cover overlay overlay-hover">
                                <img class="cover-image overlay-scale" src="${books.image }" height="250"
                                alt="${books.name }">
                            </div>
                                   <div class="widget-body">
                                <h3 class="widget-title">
                                    ${books.name }
                                </h3>
                                <div class="widget-body-footer">
                                    <a class="btn btn-info waves-effect waves-light" href="fore/productshow?bid=${books.bid }">
                                        查看详情
                                    </a>
                                    <div class="widget-actions pull-right" >
                                            关注人数：${books.visit }
                                    </div>
                                </div>
                            </div>
                            </div>
                            </li>
                        </c:forEach>
                          </ul>
                    </div>
                <div class="hot-btns">
                    <a href="fore/PopularBooks?start=0"​>
                        查看更多
                    </a>
                </div>
            </div>
         <div class="met-index-product met-index-body" id='product'>
            <div class="title">
                <h2 class="">
                    最新书籍
                </h2>
                <div class="home-line" style="background:url(images/1514365123.png)center no-repeat;">
                </div>
                <p class="desc">
                    我们用心为您做的更好
                </p>
            </div>
            <div class="container">
                <ul class="blocks-100 blocks-sm-2 blocks-md-4 blocks-xlg-4 " data-scale=''>
                    <c:forEach items="${books2 }" var="books">
                        <li class="">
                         <div class="widget widget-article widget-shadow">
                         	 <div class="widget-header cover overlay overlay-hover">
                                <img class="cover-image overlay-scale" src="${books.image }" height="250"
                                alt="${books.name }">
                            </div>
                                   <div class="widget-body">
                                <h3 class="widget-title">
                                    ${books.name }
                                </h3>
                                <div class="widget-body-footer">
                                    <a class="btn btn-info waves-effect waves-light" href="fore/productshow?bid=${books.bid }">
                                        查看详情
                                    </a>
                                    <div class="widget-actions pull-right" >
                                            关注人数：${books.visit }
                                    </div>
                                </div>
                            </div>
                             </li>
                        </c:forEach>
                </ul>
             <div class="container">
                <div class=''>
                    <ul class="nav nav-tabs">
                        <li>
                            <a href="fore/LatestBooks?start=0" title="查看更多">
                                <h3>
                                    查看更多
                                </h3>
                            </a>
                        </li>
                        </ul>
                  </div>
                </div>
            </div>
        </div>
                <!--string(4) "news" string(4) "news" -->
        <div class="met-index-imgnews met-index-body" id="news">
            <div class="title">
                <h2 class="">
                    关注我们
                </h2>
            </div>
            
            <div class="container">
                <div class="news-bg">
                    <div class="bg" style="background:url(images/beijing.jpg)">
                        <div class="text">
                            <h3>
                                扫一扫关注微信！
                            </h3>
                            <p>
                                定期我们会通过微信给您推送热门书籍 最新书籍，让您随时随地掌握最新动态。您也可以通过微信与我们交流，分享您在阅读时的心德。
                            </p>
                            <img src="images/picture/weixin.jpg" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
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
                                <a href="fore/PopularBooks"​ title="热销书籍" target='_self'>
                                    热销书籍
                                </a>
                            </li>
                            <li>
                                <a href="fore/LatestBooks"​ title="最新书籍" target='_self'>
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