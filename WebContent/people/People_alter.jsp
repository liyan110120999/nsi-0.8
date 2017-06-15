<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="people.People_model"%>
<%@ page import="java.util.Date.*" import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8"> 
 	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<title>修改</title>

<link href="assets/css/bootstrap.css" rel="stylesheet" />
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
		function ConfirmDelete(){
			var x;
			var r=confirm("确定要删除本条记录吗？");
			if (r==true){
				document.getElementById("deleteForm").submit();
			}
			else{
				x="你按下了\"取消\"按钮!";
			}			
		}
	</script>

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
    <!--HOME SECTION END-->
<section>
  <div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
		
			<div class="jumbotron">
				<h1>
					修改数据
				</h1>
				<p>
					请按照标准格式录入数据
				</p>
				<p>
					 <a class="btn btn-primary btn-large" href="people/People_list.jsp">返回查询页面</a>
				</p>
			</div>	
		
		
		<%
		    	//   获取session用户		     		
		String username ="空";
		if(session.getAttribute("Session_user")==null){
				//	 登录超时,跳转到login
			response.sendRedirect("/nsi-0.8/login.jsp");
		}else{
			username = session.getAttribute("Session_user").toString();
		}
		
			//   获取当前时间
		java.util.Date currentTime = new java.util.Date(); 
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String SubmitDate = formatter.format(currentTime);					

	
	List<People_model> list = (List<People_model>)request.getAttribute("list");

		if(list == null || list.size() < 1){
			out.print("没有数据！");
		}else{
			People_model people=list.get(0);

	%>	
		
			<form class="form-horizontal" role="form" action="/nsi-0.8/People_servlet" name="myform" method="post">
				
				
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">姓名</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="userid" value="<%=people.getPeople_name()%>" onblur="checkUserid()" name="People_name" />
					</div>
					<div> <span id="useridSpan" style=" color:#999"><h5>请输入人员名称</h5></span>  </div>								
				</div>
				<div>
					<div class="form-group">
						 <label for="inputEmail3" class="col-sm-2 control-label">会员类型</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="People_member_id" value="<%=people.getPeople_member()%>" name="People_member"/>
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
						<input type="text" class="form-control" id="inputEmail3" value="<%=people.getPeople_dueTime()%>" name="People_dueTime"/>
					</div>
					<div> <span id="useridSpan" style=" color:#999"><h5>例如：2020-03-20</h5></span>  </div>
				</div>	
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">工作单位</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="inputEmail3" value="<%=people.getPeople_work()%>" name="People_work"/>
					</div>
				</div>	
				
				<div>	
	                <div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">职位</label>
						<div class="col-sm-5">
	 						<input type="text" class="form-control" id="People_position_id" value="<%=people.getPeople_position()%>" name="People_position"/>
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
						<input type="text" class="form-control" id="inputEmail3" value="<%=people.getPeople_phone()%>" name="People_phone"/>
					</div>
				</div>
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">邮箱</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="inputEmail3" value="<%=people.getPeople_mail()%>" name="People_mail"/>
					</div>
				</div>	
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">座机</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="inputEmail3" value="<%=people.getPeople_telephone()%>" name="People_telephone"/>
					</div>
				</div>	
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">微信</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="inputEmail3" value="<%=people.getPeople_wechat()%>" name="People_wechat"/>
					</div>
				</div>	
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">通讯地址</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="inputEmail3" value="<%=people.getPeople_address()%>" name="People_address"/>
					</div>
				</div>	
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">简介</label>
					<div class="col-sm-5">					
						<textarea class="form-control" id="id_remark" name="People_introduction" rows="3"><%=people.getPeople_introduction()%></textarea>
					</div>
				</div>	
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">备注</label>
					<div class="col-sm-5">
						<textarea class="form-control" id="id_remark" name="People_remark" rows="3"><%=people.getPeople_remark()%></textarea>
					</div>
				</div>	
				
                
                					
                	<div class="form-group">
						<div class="col-sm-offset-6 col-sm-10">															
							<input type="hidden" name="whereFrom" value="alter">
							<input type="hidden" name="alter_people_id" value="<%=people.getPeople_id()%>">	
							<input type="hidden" name="username" value="<%=username%>">		
							<input type="hidden" name="SubmitDate" value="<%=SubmitDate%>">									
							<button  type="submit" class="btn btn-primary">提交</button>
						</div>																											
					</div>
			</form>
			
			<br>
			<!-- 	删除按钮 -->
			<form class="form-horizontal" role="form" action="People_servlet" id="deleteForm" name="myform02" method="post">
					<div class="form-group">
						<div class="col-sm-offset-6 col-sm-10 ">	
							<!-- 隐式表单标记位 -->
							<input type="hidden" name="whereFrom" value="delete">
							<input type="hidden" name="delete_people_id" value='<%=people.getPeople_id()%>'>
							<input type="button" class="btn btn-danger" onclick="ConfirmDelete()" value="删除本条记录" />		

						</div>
					</div>
			</form>
			
		<%}%>
			

		</div>
	</div>
</div>
    </section>
    
	<!--     导入底栏jsp文件 -->
	<div>
		<jsp:include page="/modular/bottomBar.jsp"/>
	</div>
    <!-- COPY TEXT SECTION END-->
    <!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
    <!-- CORE JQUERY  -->
<!--     <script src="assets/js/jquery-1.11.1.js"></script> -->
<!--     BOOTSTRAP SCRIPTS  -->
<!--     <script src="assets/js/bootstrap.js"></script> -->
<!--     CUSTOM SCRIPTS  -->
<!--     <script src="assets/js/custom.js"></script> -->
    
</body>
</html>
																										

	
