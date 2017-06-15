<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="java.util.Date.*" import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8"> 
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
		   <title>新增人员数据</title>			  
		    <!-- BOOTSTRAP CORE STYLE CSS -->
		    <link href="/nsi-0.8/assets/css/bootstrap.css" rel="stylesheet" />
		     <!-- FONTAWESOME STYLE CSS -->
		     <link href="/nsi-0.8/assets/css/font-awesome.css" rel="stylesheet" />
		    <!-- CUSTOM STYLE CSS -->
		    <link href="/nsi-0.8/assets/css/style.css" rel="stylesheet" />
		    
		    <script src="/nsi-0.8/assets/js/jquery-1.11.1.js"></script>
		    <!-- BOOTSTRAP SCRIPTS  -->
		    <script src="/nsi-0.8/assets/js/bootstrap.js"></script>
		    <!-- CUSTOM SCRIPTS  -->
		    <script src="/nsi-0.8/assets/js/custom.js"></script>
		    
		   <script src="/nsi-0.8/assets/js/user.js"></script>
<!-- 		   文件上传 -->

	
		
		<title>新增数据</title>

</head>

	<style>
		body{background-color:#c7d0d5}
	</style>

<!-- 	顶栏滚动透明 -->
 	<style type="text/css">  
	        html, body {width:100%;height:100%;} /*非常重要的样式让背景图片100%适应整个屏幕*/  
	        .bg {display: table;width: 100%;height: 100%;padding: 100px 0;text-align: center;color: #fff;background: url(http://www.xiandanke.cn/Image/intro-bg.jpg) no-repeat bottom center;background-color: #000;background-size: cover;}  
	        .my-navbar {padding:20px 0;transition: background 0.5s ease-in-out, padding 0.5s ease-in-out;}  
	        .my-navbar a{background:transparent !important;color:#fff !important}  
	        .my-navbar a:hover {color:#45bcf9 !important;background:transparent;outline:0}  
	        .my-navbar a {transition: color 0.5s ease-in-out;}/*-webkit-transition ;-moz-transition*/  
	        .top-nav {padding:0;background:#455a64;}  
	        button.navbar-toggle {background-color:#fbfbfb;}/*整个背景都是transparent透明的，会看不到，所以再次覆盖一下*/  
	        button.navbar-toggle > span.icon-bar {background-color:#dedede}  
	 </style>

<script type="text/javascript">
	    //移动光标到最后
	 var setPos=function(o){
	        if(o.setSelectionRange){//W3C
	            setTimeout(function(){
	                o.setSelectionRange(o.value.length,o.value.length);
	                o.focus();
	            },0);
	        }else if(o.createTextRange){//IE
	            var textRange=o.createTextRange();
	            textRange.moveStart("character",o.value.length);
	            textRange.moveEnd("character",0);
	            textRange.select();
	        }
	    };
      

	        
	function checkUserid(){  
	    var ueridObj=document.getElementById("userid");  
	    var userid=trim(ueridObj.value);  
	    var msg ="   <img src='/nsi-0.8/assets/img/true.jpg' style='width:27px'>";  
	    if(!userid)  
	        msg ="<font color='red'><h5>名称不能为空！</h5></font>";  
	    var span = document.getElementById("useridSpan");  
	    span.innerHTML = msg;  
	    return msg == "   <img src='assets/img/true.jpg' style='width:27px'>";  
	    }  
	function trim(s){  
	   return s.replace(/^\s+|\s+$/g,"");  
	}  
// 	文件上传
	
	
</script>
		<%     	//   获取session用户		     		
			String username ="空";
			if(session.getAttribute("Session_user")==null){
// 				登录超时,跳转到login
				response.sendRedirect("/nsi-0.8/login.jsp");
			}else{
				username = session.getAttribute("Session_user").toString();
			}
					//   获取当前时间
				java.util.Date currentTime = new java.util.Date(); 
		    	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		    	String SubmitDate = formatter.format(currentTime);					
    	%>
<body>   
    <!-- 		顶栏 -->
		<nav class="navbar navbar-fixed-top my-navbar" role="navigation">  
	        <div class="container-fluid">  
	            <div class="navbar-header">  
	                <button type="button" class="navbar-toggle" data-toggle="collapse" 
	                 data-target="#example-navbar-collapse"> 

	                   	<span class="icon-bar"></span> 
                     	<span class="icon-bar"></span> 
                  	 	<span class="icon-bar"></span> 
	                </button>  
	                <a class="navbar-brand" href="#"><strong>新 学 说</strong></a>  
	            </div>  
	            <div class="collapse navbar-collapse" id="example-navbar-collapse">  
	                <ul class="nav navbar-nav navbar-right">  
		                <li><a href="/nsi-0.8/list.jsp"><b>学 校</b></a></li>
	                    <li><a href="/nsi-0.8/null.jsp"><b>机 构</b></a></li>
	                   	<li><a href="/nsi-0.8/people/People_list.jsp"><b>人 员</b></a></li>
	                    <li><a href="/nsi-0.8/about.jsp"><b>关 于</b></a></li>
	                    <li><a href="/nsi-0.8/login.jsp" class="active-menu-item"><b>登 录</b></a></li>
		                <li></li>
	                </ul>  
	            </div>  
	        </div>  
	    </nav> 

	    
		<script>  
		        $(window).scroll(function () {  
		            if ($(".navbar").offset().top > 50) {$(".navbar-fixed-top").addClass("top-nav");  
		            }else {$(".navbar-fixed-top").removeClass("top-nav");}  
		        })
	    </script> 
	
	<br><br><br><br>
<section>
 <div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
		
			<div class="jumbotron">
				<h1>
					新增数据
				</h1>
				<p>
					请按照标准格式录入数据
				</p>
				<p>
					 <a class="btn btn-primary btn-large" href="People_list.jsp">返回查询页面</a>
				</p>
			</div>

			
			<form class="form-horizontal" role="form" action="/nsi-0.8/People_servlet" name="myform" method="post" >
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">姓名</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="userid" onblur="checkUserid()" name="People_name" />
						
<!-- 						<input type="file" name="files"> -->
					</div>
					<div> <span id="useridSpan" style=" color:#999"><h5>请输入人员名称</h5></span>  </div>								
				</div>
				<div>
					<div class="form-group">
						 <label for="inputEmail3" class="col-sm-2 control-label">会员类型</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="People_member_id" name="People_member"/>
						</div>
					</div>
					<div>    
		                 <div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label"> </label>
							<div class="col-sm-5">
	                              <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert03('个人会员;')" value="个人会员" />
	                              <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert03('企业普通会员;')" value="企业普通会员" />
	                              <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert03('企业高级会员;')" value="企业高级会员" />	                    
							</div>
		                  </div>	              
					</div>	
				</div>	
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">会员到期时间</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="inputEmail3" name="People_dueTime"/>
					</div>
					<div> <span id="useridSpan" style=" color:#999"><h5>例如：2020-03-20</h5></span>  </div>
				</div>	
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">工作单位</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="inputEmail3" name="People_work"/>
					</div>
				</div>	
				
				<div>	
	                <div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">职位</label>
						<div class="col-sm-5">
	 						<input type="text" class="form-control" id="People_position_id" name="People_position"/>
						</div>
						<div> <span id="useridSpan" style=" color:#999"><h5>注意：以分号结尾</h5></span>  </div>
					</div>
					<div>    
		                 <div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label"> </label>
							<div class="col-sm-5">
		                              <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert04('校长;')" value="校长" />
		                              <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert04('副校长;')" value="副校长" />
		                              <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert04('招生总监;')" value="招生总监" />
		                              <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert04('助理;')" value="助理" />
		                              <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert04('投资人;')" value="投资人" />
		                              <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert04('运营;')" value="运营" />
							</div>
		                  </div>	              
					</div>	
				</div>	
     			<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">手机号</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="inputEmail3" name="People_phone"/>
					</div>
				</div>
<!-- 				//省市选择 -->
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">邮箱</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="inputEmail3" name="People_mail"/>
					</div>
				</div>	
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">座机</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="inputEmail3" name="People_telephone"/>
					</div>
				</div>	
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">微信</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="inputEmail3" name="People_wechat"/>
					</div>
				</div>	
				
<!-- 				提交人、提交时间  隐式提交   div隐藏-->
					<div class="form-group" style="display:none;">
						<div class="col-sm-5">
							<input type="hidden" class="form-control" id="inputEmail3" name="People_loadPeople" value="<%=username%>"/>
						</div>
					</div>	
					<div class="form-group" style="display:none;">
						<div class="col-sm-5">
							<input type="hidden" class="form-control" id="inputEmail3" name="People_loadTime" value="<%=SubmitDate%>"/>
						</div>
					</div>	
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">通讯地址</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="inputEmail3" name="People_address"/>
					</div>
				</div>	
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">简介</label>
					<div class="col-sm-5">					
						<textarea class="form-control" id="id_remark" name="People_introduction" rows="3"></textarea>
					</div>
				</div>	
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">备注</label>
					<div class="col-sm-5">
						<textarea class="form-control" id="id_remark" name="People_remark" rows="3"></textarea>
					</div>
				</div>	
						
                <div class="form-group">
					<div class="col-sm-offset-6 col-sm-10">
						<input type="hidden" name="whereFrom" value="insert">
						 <button type="submit" class="btn btn-primary">提交</button>
					</div>
				</div>
			</form>
		
		
		</div>
	</div>
</div>
</section>
    
  <!--     导入底栏jsp文件 -->
<div>
	<jsp:include page="/modular/bottomBar.jsp"/>
</div>
    
</body>
</html>
																										

	
