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
            图书分类
        </title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
		<meta name="generator" content="" data-variable="/,cn,10001,,10001,res032"/>
         <link rel="stylesheet" href="<%=basePath%>/css/home.css">
         <link rel="stylesheet"  href="<%=basePath%>/js/Pager.css" type="text/css"/>
        <script src="js/jquery-1.3.2.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/index.js"></script>
          <script type="text/javascript" src="js/jquery.pager.js"></script>
    </head>
    <script type="text/javascript" language="javascript" >
			//设置分页数	
			var recordCount="";
			var sid="";
			//得到此类型数据应该分页的页数
		    function getPageCount(id) {
				sid=id;
		        var url="fore/getPageCount";
				var args={"sid":id,"time":new Date()};
				$.post(url,args,function(data){
					var Count = eval(data);
					recordCount=(Count-Count%4)/4+1;
					 $("#pager").pager({ pagenumber: 1, pagecount:recordCount, buttonClickCallback: PageClick });
					 args={"currentPage": 1,"time":new Date()};
				});
				send(1,id);
		    };
		    
	        PageClick = function(pageclickednumber) {
	            $("#pager").pager({ pagenumber: pageclickednumber, pagecount: recordCount, buttonClickCallback: PageClick });
	   			send(pageclickednumber,sid);
	   		 };
	   		 
	   		 function send(page,id){
			    	$.ajax({
						 type:"POST",
						 url:"fore/getBooks",
						 data:{currentPage :page ,sid : id},
						 dataType:"json",
						 success : function(data){
							 var html="&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;";
							 var item="";
							 //清空里面所有内容
								$('#show').empty();
								$('#show1').empty();
							 	$('#show').append(html);
			                    $.each(data,function(i,result){  
			                       item='<img src="'+result['image'] +' " height="250" width="250">&emsp;&emsp;&emsp;';
			                        $('#show').append('<a href="fore/productshow?bid='+result['bid']+' ">'+item+'</a>');
			                    });   
						 },
						 error: function (XMLHttpRequest, textStatus, errorThrown) {
			                    alert("程序异常!");
			                }
					 });
			    }
	</script>
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
		                                <a class=" link "  href="fore/productcate/login"​ title="登录" class="link  active">
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
                <img class="cover-image" src="images/homepage1.jpg" sizes="(max-width: 767px) 767px" alt="书籍分类">
            </div>
        </div>
        <div class="met-column-nav bordernone">
            <div class="container">
                <div class="row">
                    <div class="sidebar-tile">
                        <ul class="met-column-nav-ul invisible-xs">
                            <!--循环输出  -->
                            <c:forEach items="${list }"  var="sort">
                            		<li>
                                		<a href="javascript:void(0);" id="${sort.sid }" onclick="javascript:getPageCount(this.id)" class="link ">
                                   			${sort.name }
                               		 	</a>
                           		 </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="product-search">
                        <form name="formsearch" action="fore/searchBook">
                            <div class="form-group">
                                <div class="input-search">
                                    <button type="submit" class="input-search-btn">
                                        <i class="icon wb-search" aria-hidden="true">
                                        </i>
                                    </button>
                                    <input type="text" class="form-control" name="bookName" value="${bookName==null?'':bookName }" placeholder="Search">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div id="show1">
          <div class="container">
                <ul class="blocks-100 blocks-sm-2 blocks-md-4 blocks-xlg-4 " data-scale='' >
                    <c:forEach items="${books }" var="books">
                        <li class="">
                         <div class="widget widget-article widget-shadow">
                         	 <div class="widget-header cover overlay overlay-hover">
                                <a href="fore/productshow?bid=${books.bid }"><img class="cover-image overlay-scale" src="${books.image }" height="250"></a> 
                            </div>
                         </div>
                         </li>
                          </c:forEach>
                          </ul>
                </div>
         </div>
		<div id="show">	
 		</div>
   			<div id="pager" >	
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