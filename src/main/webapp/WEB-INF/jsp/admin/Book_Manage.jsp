<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
	<meta name="format-detection" content="telephone=no, email=no, date=no, address=no">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta http-equiv="Pragma" content="no-cache">
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
	<title>书籍管理</title>
	<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="js/jquery.nicescroll.js" type="text/javascript"></script>
	<script src="js/HUpages.js" type="text/javascript"></script>
	<script src="js/template.js" type="text/javascript"></script>
	<!--[if lt IE 9]>
	<script src="js/html5shiv.js" type="text/javascript"></script>
	<script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
	<![endif]-->
</head>

<script type="text/javascript">
	function CheckAll(elementsA, elementsB) {
		for (i = 0; i < elementsA.length; i++) {
			elementsA[i].checked = true;
		}
		if (elementsB.checked === false) {
			for (j = 0; j < elementsA.length; j++) {
				elementsA[j].checked = false;
			}
		}
	}
	//判断用户是否选择了要删除的记录，如果是，则提示“是否删除”；否则提示“请选择要删除的记录”
	function checkdel(delid, formname) {
		var flag = false;
		for (i = 0; i < delid.length; i++) {
			if (delid[i].checked) {
				flag = true;
				break;
			}
		}
		if (!flag) {
			alert("请选择要删除的记录！");
			return false;
		} else {
			if (confirm("确定要删除吗？")) {
				formname.submit();
			}
		}
	}
</script>

<style>
	header
	{
		font-family: 'Lobster', cursive;
		text-align: center;
		font-size: 25px;
	}

	.scrollbar
	{
		margin-left: 0;
		float: left;
		height: 559px;
		width: 200px;
		background: #F5F5F5;
		overflow-y: scroll;
		margin-bottom: 25px;
	}

	.force-overflow
	{
		min-height: 450px;
	}

	#wrapper
	{
		text-align: center;
		width: 500px;
		margin: auto;
	}

	#style-15::-webkit-scrollbar-track
	{
		-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.1);
		background-color: #F5F5F5;
		border-radius: 10px;
	}

	#style-15::-webkit-scrollbar
	{
		width: 10px;
		background-color: #F5F5F5;
	}

	#style-15::-webkit-scrollbar-thumb
	{
		border-radius: 10px;
		background-color: #FFF;
		background-image: -webkit-gradient(linear,
		40% 0%,
		75% 84%,
		from(#4D9C41),
		to(#19911D),
		color-stop(.6,#54DE5D))
	}

</style>

<body id="pagestyle">
	<div class="pages-style">
		<!--左侧菜单栏-->
		<div class="bk-con-menu" id="bk-con-menu">
			<div class="title-menu">书籍分类</div>
			<div class="breadcrumb" id="breadcrumb">
				<div id="wrapper">
					<div class="scrollbar" id="style-15">
						<div class="force-overflow">
							<ul class="clearfix menu-section menulist" id="brandsort">
								<c:forEach var="sort" items="${sortList}">
									<li>
										<a href="showSortBook?sortname=${sort.name }">${sort.name}</a><hr>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!--右侧内容-->
		<%--<div class="bk-con-message message-section" id="iframe_box">
			<!--编辑内容-->
			<div class="operation  mb15">
				<button class="btn button_btn btn-danger" type="button" onclick=""><i class="iconfont">&#xe601</i>&nbsp;批量删除</button>
			</div>
			<div class="page_content clearfix mb15 table-module ">
				<div class="brandlist" id="brandlist">
				</div>
			</div>
		</div>--%>

		<!--右侧内容-->
		<div class="bk-con-message message-section" id="iframe_box">
			<!--编辑内容-->
			<div class="operation  mb15">
				<%--批量删除--%>
				<button class="btn button_btn btn-danger" type="button" onClick="checkdel(frm.delid,frm)"><i class="iconfont"></i>&nbsp;批量删除</button>

				<a href="addBookUI" class="btn button_btn bg-deep-blue" >&nbsp;添加书籍</a>

				<%--搜索框--%>
				<form action="searchBook" method="post">
					<input type="text" name="information" value="${flag==1?info:'' }" placeholder="请输入书名或作者名" >
					<select name="condition">
						<option value="1" ${flag==1?'selected':'' }>书籍名称</option>
						<option value="0" ${flag==0?'selected':'' }>作者名称</option>
					</select>
					<input type="submit" value="搜索" style="color:blue ;width:60px; height:40px ">
				</form>

			</div>

			<!--列表内容-->
			<div class="page_content clearfix mb15 table-module ">
				<form action="deleteBook" method="post" name="frm">
					<!--设置一个隐藏按钮 因为上边js中方法传入的是一个数组 所以当一页只有一行数据时也能是数组  -->
					<input type="checkbox" name="delid" value="0"  style="display:none">
					<span  style="color:blue ;font-size:15px">${hint }</span>
					<table class="gallery table table_list table_striped table-bordered " id="">
						<thead>
						<tr>
							<th width="5%">
								<label><input type="checkbox" name="checkbox"  onClick="CheckAll(frm.delid,frm.checkbox)" class="ace"><span class="lbl"></span></label></th>
							<th width="5%">书号</th>
							<th width="10%">书籍名称</th>
							<th width="10%">作者</th>
							<th width="10%">出版社</th>
							<%--<th width="5%">价格</th>--%>
							<th width="10%">类别</th>
							<%--<th width="10%">库存量</th>--%>
							<%--<th width="5%">图片</th>--%>
							<%--<th width="5%">访问量</th>--%>
							<th width="5%">剩余量</th>
							<%--<th width="10%">添加时间</th>--%>
							<th width="5%">操作人</th>
							<th width="10%" >是否可借阅</th>
                            <th width="10%" >操作</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="book" items="${booksList}">
							<tr>
								<td>
									<label><input type="checkbox" name="delid" value="${book.bid }" class="ace"><span class="lbl"></span></label></td>
								<td>${book.bid }</td>
								<td>${book.name }</td>
								<td>${book.author }</td>
								<td>${book.publish }</td>
								<%--<td>${book.type }</td>--%>
								<td>${map[book.type] }</td>
								<td>${book.residue }</td>
								<%--<td>${book.createtime }</td>--%>
								<td>${book.username }</td>
								<%--<td>${book.borrow==0?"可借阅":"不可借阅" }</td>--%>
								<td>
									<c:if test="${book.borrow==0 }">
										<a href="setBorrowStatus?bid=${book.bid}&borrow=${book.borrow}" onclick="return confirm('确认设置不可借阅？')">
											<img src="images/guanbi.png" width="35" height="35" alt="不可借阅" title="不可借阅"/>
										</a>
									</c:if>
									<c:if test="${book.borrow==1 }">
										<a href="setBorrowStatus?bid=${book.bid}&borrow=${book.borrow}" onclick="return confirm('确认设置可借阅？')">
											<img src="images/kaiqi.png" width="25" height="25" alt="可借阅" title="可借阅"/>
										</a>
									</c:if>
								</td>

                                <%--<td><input type="button" value="${book.borrow==0?"可借阅":"不可借阅"}" onclick="javascript:window.location='setBorrowStatusbookId?bookId=${book.bid}'"></td>--%>
                                <td><a href="showBookDetail?bookId=${book.bid}"><img src="images/showDetail.png" width="20" height="20" alt="查看" title="查看"/></a></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</form>

				<div style="text-align:center">
					<a href="bookCommon?start=0"><span style="color:blue ;font-size:15px">首  页</span></a>
					<c:if test="${page.start>0 }">
						<a href="bookCommon?start=${page.start-page.count}"><span style="color:blue ;font-size:15px">上一页</span></a>
					</c:if>
					<span style="color:blue ;font-size:15px">第${page.currentPage }页</span>
					<span style="color:blue ;font-size:15px">共${page.lastPage }页</span>
					<a href="bookCommon?start=${page.start+page.count}"><span style="color:blue ;font-size:15px">下一页</span></a>
					<a href="bookCommon?start=${page.last}"><span style="color:blue ;font-size:15px">尾  页</span></a>
					<span style="color:blue ;font-size:15px;float:right">共${page.total }记录</span>
				</div>

			</div>
		</div>

	</div>
</body>

</html>

<script>
	$(function() {
		//内页框架结构编辑
		$("#pagestyle").Hupage({
			slide: '#breadcrumb',
			padding: 15,
			menuModule: '#bk-con-menu', //菜单模块
			pagecontent: '.page_content', //自定义属性
			operation: '.operation', //自定义属性
			scrollbar: function(e) {
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
				var pc = "";
				$(settings.pagecontent).css("margin-bottom") != null ? pc = parseInt($(settings.pagecontent).css("margin-bottom").replace("px", "")) : '';
				$(settings.pagecontent).css({
					height: $(window).height() - $(settings.operation).outerHeight() - pc - (settings.padding * 2)
				})
				settings.scrollbar($(settings.slide) && $(settings.pagecontent));
			} //自定义方法
		});
		//获取数据
		function Brandlist() {
			var loadMore = function(callback) {
				$.ajax({
					url: "json/brand.json",
					type: "GET",
					dataType: 'json',
					success: function(ret) {
						typeof callback == 'function' && callback(ret);
					},
				});
			};
			loadMore(function(listArr) {
				var listhtml = $('#brandlist');
				var sorthtml=$("#brandsort");	
				var html = template('brandhtml', {
					list: listArr.brandlist,
					sort: listArr.brandSort
				});
				var shtml = template('brandsorthtml', {
					sort: listArr.brandSort
				});
				listhtml.append(html);
				sorthtml.append(shtml);
				var status = listhtml.find('.brand-info');
				for(var i = 0; i < status.length; i++) {
					var statusid = listhtml.find('.name_status').eq(i).attr('data-id');
					if(statusid != 1) {
						listhtml.find('.name_status').eq(i).addClass('statusNO');
					}
				}
			});
		}
		Brandlist();
		//启用状态
		function clickstatus(e) {

		};
		//删除
		function deleteBrand(e){
			
			
		}
		//修改
		function modifyBrand(e){
			
		}	
	});
</script>