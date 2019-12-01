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
		<title>用户管理</title>
		<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
		<script src="js/jquery.nicescroll.js" type="text/javascript"></script>
		<script src="js/HUpages.js" type="text/javascript"></script>
		<script src="js/common.js" type="text/javascript"></script>
	</head>
<script type="text/javascript">
    function CheckAll(elementsA, elementsB) {
        for (i = 0; i < elementsA.length; i++) {
            elementsA[i].checked = true;
        }
        if (elementsB.checked == false) {
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
<body id="situation">
<div class="pages-style" >

				
	<!--右侧内容-->
	<div class="bk-con-message message-section" id="iframe_box">
           <!--编辑内容-->
           <div class="operation  mb15">
          
           	<button class="btn button_btn btn-danger" type="button" onClick="checkdel(frm.delid,frm)"><i class="iconfont"></i>&nbsp;批量删除</button>
           	 <a href="addUserInterface" class="btn button_btn bg-deep-blue" >&nbsp;添加用户</a>
           	<form action="Student_Manager" method="post">
           		<input type="text" name="information" value="${search.username==null? '':search.username }" placeholder="请输入用户名" >
           		<select name="flag">
					<option value="2" ${search.flag==null?'selected':' ' }>全部</option>
                    <option value="0" ${search.flag==0?'selected':' ' }>有效</option>
                    <option value="1" ${search.flag==1?'selected':' ' }>无效</option>
                </select>
                <input type="submit" value="搜索" style="color:blue ;width:60px; height:40px ">
           	</form>
           </div>
           <!--列表内容-->
           <div class="page_content clearfix mb15 table-module ">
           <form action="deleteUser" method="post" name="frm">
           <!--设置一个隐藏按钮 因为上边js中方法传入的是一个数组 所以当一页只有一行数据时也能是数组  -->
           <input type="checkbox" name="delid" value="0"  style="display:none">
           <span  style="color:blue ;font-size:15px">${hint }</span>
           	<table class="gallery table table_list table_striped table-bordered " id="">
           		<thead>
		        <tr>
				<th width="10%"><label><input type="checkbox" name="checkbox"  onClick="CheckAll(frm.delid,frm.checkbox)" class="ace"><span class="lbl"></span></label></th>
				<th width="20%">用户名</th>
				<th width="10%">用户类型</th>
				<th width="10%">姓名</th>
				<th width="10%">性别</th>
				<th width="20%">联系方式</th>
				<th width="10%" >用户状态</th>                
				<th width="10%">是否启用</th>
		       </tr>
		       </thead>
		       <tbody>
		       <c:forEach items="${list }" var="user">
		       	<tr>
           			<td><label><input type="checkbox" name="delid" value="${user.username }" class="ace"><span class="lbl"></span></label></td>
           			<td>${user.username }</td>
           			<td>学生</td>
           			<td>${user.name }</td>
           			<td>${user.sex }</td>
           			<td>${user.phone }</td>
           			<td>${user.flag==0?"有效":"无效" }</td>
           			<td>
           				 <c:if test="${user.flag==0 }">
	                        	 <a href="AlterUserFlag?username=${user.username }&flag=${user.flag}" onclick="return confirm('确认不启用该用户？')"><img src="images/bukaixing.png"width="30px" height="30px"   alt="不启用" title="不启用"/></a>
	                     </c:if>
	                     <c:if test="${user.flag==1 }">
	                        	 <a href="AlterUserFlag?username=${user.username }&flag=${user.flag}" onclick="return confirm('确认启用该用户？')"><img src="images/kaixing.png" width="30px" height="30px" alt="更改用户状态" title="更改用户状态"/></a>
	                     </c:if>
           			</td>
           		</tr>			
				</c:forEach>
		       </tbody>
           	</table>
           	</form>
           	<div style="text-align:center">
		        <a href="common?start=0"><span style="color:blue ;font-size:15px">首  页</span></a>
		        <c:if test="${page.start>0 }">
		        	<a href="common?start=${page.start-page.count}"><span style="color:blue ;font-size:15px">上一页</span></a>
		        </c:if>
		        <span style="color:blue ;font-size:15px">第${page.currentPage }页</span>
		        <span style="color:blue ;font-size:15px">共${page.lastPage }页</span>
		        <a href="common?start=${page.start+page.count}"><span style="color:blue ;font-size:15px">下一页</span></a>
		        <a href="common?start=${page.last}"><span style="color:blue ;font-size:15px">末  页</span></a>
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
