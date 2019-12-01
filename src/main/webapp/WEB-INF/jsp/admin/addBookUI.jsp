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
    <title>添加书籍</title>
    <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="js/jquery.cookie.js" type="text/javascript"></script>
    <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="js/HUpages.js" type="text/javascript"></script>
</head>

<%--<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery/2.0.0/jquery.min.js"></script>--%>
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

        <div class="box-title">添加书籍</div>
        <div class="box-content padding15">
            <div class="Promp_plate btn-green "><b>提示：</b>填写信息保存即可！
                <span  class="iconfont PrompClose">&#xe627</span>
            </div>
            <div class="clearfix ptb20">
                <span  style="color:blue ;font-size:15px">${hint }</span>
                <h3><div id="message"></div></h3>

                <%--enctype="multipart/form-data"--%>
                <form action="${pageContext.request.contextPath }/addBook" method="post"
                      enctype="multipart/form-data">
                    <table align="center">
                        <tr align="right">
                            <td ><span style="color:blue">书名：</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td ><input type="text" name="name" required></td>
                        </tr>
                        <tr align="right">
                            <td ><span style="color:blue">作者：</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td ><input type="text" name="author" required></td>
                        </tr>
                        <tr align="right">
                            <td ><span style="color:blue">出版社：</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td ><input type="text" name="publish" required></td>
                        </tr>
                        <%--<tr align="right" >
                            <td><span style="color:blue">类别：</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td><input type="text" name="type" value="1"  required></td>
                        </tr>--%>
                        <tr align="right" >
                            <td><span style="color:blue">类别：</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td align="center">
                                <select name="type">
                                    <option value="1" selected>政治军事</option>
                                    <option value="2">哲学宗教</option>
                                    <option value="3">社会科学总论</option>
                                    <option value="4">政治法律</option>
                                    <option value="5">航空航天</option>
                                    <option value="6">交通运输</option>
                                    <option value="7">综合性</option>
                                    <option value="8">环科安全</option>
                                    <option value="9">工业技术</option>
                                    <option value="10">生物科学</option>
                                    <option value="11">数理科学与化学</option>
                                    <option value="12">天文地球</option>
                                    <option value="13">自然科学总论</option>
                                    <option value="14">历史地理</option>
                                    <option value="15">文学</option>
                                    <option value="16">经济</option>
                                    <option value="17">文化科学教育与体育</option>
                                    <option value="18">语言文字</option>
                                    <option value="19">农业科学</option>
                                    <option value="20">艺术</option>
                                    <option value="21">医药卫生</option>
                                    <option value="22">经典理论</option>
                                </select>
                            </td>
                        </tr>

                        <tr align="right">
                            <td ><span style="color:blue">价格：</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td ><input type="text"  name="price" required></td>
                        </tr>
                        <tr >
                            <td align="right"><span style="color:blue">是否可借阅：</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td align="center">
                                <input type="radio" name="borrow" value="0" checked/>可借阅
                                <input type="radio" name="borrow" value="1" />不可借阅
                            </td>
                        </tr>
                        <tr align="right" >
                            <td><span style="color:blue">库存量：</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td><input type="text"  name="inventory"   required></td>
                        </tr>
                        <tr align="right">
                            <td><span style="color:blue">剩余库存量：</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td><input type="text"  name="residue"  required></td>
                        </tr>
                        <tr align="right">
                            <td><span style="color:blue">书籍图片：</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td><input type="file" name="bookImage"  /></td><%--accept="image/jpg"--%>
                        </tr>
                        <%--<tr align="right">
                            <td><span style="color:blue">访问量：</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td><input type="text"  name="visit"  required></td>
                        </tr>--%>

                        <%--创建时间--%>
                        <%--<tr align="right">
                            &lt;%&ndash;<td><span style="color:blue">创建时间：</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>&ndash;%&gt;
                            <td><input type="hidden"  name="createtime" ></td>
                        </tr>--%>
                        <%--操作人自动填写为当前登录用户--%>
                        <%--<tr align="right">
                            &lt;%&ndash;<td><span style="color:blue">操作人：</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>&ndash;%&gt;
                            <td><input type="hidden"  name="username" ></td>
                        </tr>--%>
                        <tr align="center">
                            <td colspan="2">
                                <input type="submit" value="提交" style="color:blue;font-size:15px"  >
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