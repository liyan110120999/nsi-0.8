<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date.*" import="java.text.SimpleDateFormat" %>
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>新增机构信息</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />	  			  
		    <!-- BOOTSTRAP CORE STYLE CSS -->
		    <link href="/nsi-0.8/assets/css/bootstrap.css" rel="stylesheet" />
		     <!-- FONTAWESOME STYLE CSS -->
		     <link href="/nsi-0.8/assets/css/font-awesome.css" rel="stylesheet" />
		    <!-- CUSTOM STYLE CSS -->
		    <link href="/nsi-0.8/assets/css/style.css" rel="stylesheet" />
		    <!--     	自定义css -->
			<link href="/nsi-0.8/assets/css/MyCss.css" rel="stylesheet" />
		    
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
	            <div class="navbar-header l-h-001">  
	                <button type="button" class="navbar-toggle" data-toggle="collapse" 
	                 data-target="#example-navbar-collapse"> 
	                   	<span class="icon-bar"></span> 
                     	<span class="icon-bar"></span> 
                  	 	<span class="icon-bar"></span> 
	                </button>  
	                <a class="navbar-brand l-f24" href="#"><strong>新学说</strong></a>  
	            </div>  
	            <div class="collapse navbar-collapse l-f20" id="example-navbar-collapse">  
	                <ul class="nav navbar-nav navbar-right l-h-002">  
		                <li><a href="/nsi-0.8/list.jsp"><b>学校</b></a></li>
	                    <li><a href="/nsi-0.8/institution/Institution_list.jsp"><b>机构</b></a></li>
	                   	<li><a href="/nsi-0.8/people/People_list.jsp"><b>人员</b></a></li>
	                    <li><a href="/nsi-0.8/about.jsp"><b>关于</b></a></li>
	                    <li><a href="/nsi-0.8/login.jsp" class="active-menu-item"><b>登录</b></a></li>
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
					 <a class="btn btn-primary btn-large" href="Institution_list.jsp">返回查询页面</a>
				</p>
			</div>
			
			<form class="form-horizontal" role="form" action="/nsi-0.8/Institution_servlet" name="myform" method="post" >
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">机构名</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="userid" onblur="checkUserid()" name="Institution_name" />
					</div>
					<div class="col-sm-5"> <span id="useridSpan" style=" color:#999"><h5>请输入机构名称</h5></span>  </div>								
				</div>
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">地区</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="inputEmail3" name="Institution_Areas"/>
					</div>					
				</div>	
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">CEO</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="inputEmail3" name="Institution_CEO"/>
					</div>
				</div>
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">法人</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="inputEmail3" name="Institution_LegalPerson"/>
					</div>
				</div>
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">机构类型</label>
					<div class="col-sm-5">
<!-- 						<input type="text" class="form-control" id="inputEmail3" name="Institution_Type"/> -->				
							<select class="form-control" name="Institution_Type">
								<option value="教育">教育</option>
								<option value="投资">投资</option>
								<option value="服务商">服务商</option>							
								<option value="其他">其他</option>
							</select>
					</div>
				</div>	
		
				<div>	
	                <div class="form-group">
						 <label for="inputEmail3" class="col-sm-2 control-label">业务类型</label>
						<div class="col-sm-5">
	 						<input type="text" class="form-control" id="ServiceTypeID" name="Institution_ServiceType"/>		
						</div>
						<div class="col-sm-5"> <span id="useridSpan" style="color:#999"><h5>仅教育类机构填写</h5></span>  </div>
					</div>
					<div class="form-group">   
						<label for="inputEmail3" class="col-sm-2 control-label"></label>
		                 <div >
							<div class="col-sm-5">
	                            <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert05('ServiceTypeID','营地;')" value="营地" />
		                        <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert05('ServiceTypeID','升学辅导;')" value="升学辅导" />
		                        <input type="button" class="btn btn-default" style="cursor:hand" onclick="javascript:Insert05('ServiceTypeID','艺术与体育;')" value="艺术与体育" />
							</div>
		                  </div>
					</div>	
				</div>
				
				<div>	
	                <div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">公司业务</label>
						<div class="col-sm-5">
	 						<input type="text" class="form-control" name="Institution_Service"/>
						</div>
						<div class="col-sm-5"> <span id="useridSpan" style=" color:#999"><h5>一句话简述</h5></span>  </div>
					</div>	
				</div>	
     			<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">电话</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="inputEmail3" name="Institution_Telephone"/>
					</div>
				</div>
<!-- 				//省市选择 -->
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">通讯地址</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="inputEmail3" name="Institution_Address"/>
					</div>
				</div>	
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">邮箱</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="inputEmail3" name="Institution_Mail"/>
					</div>
				</div>	
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">官网</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="inputEmail3" name="Institution_Website"/>
					</div>
				</div>	
				
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">详细介绍</label>
					<div class="col-sm-5">					
						<textarea class="form-control" id="id_remark" name="Institution_Introduction" rows="3"></textarea>
					</div>
				</div>	
				
<!-- 				提交人、提交时间  隐式提交   div隐藏-->
					<div class="form-group" style="display:none;">
						<div class="col-sm-5">
							<input type="hidden" class="form-control" id="inputEmail3" name="Institution_loadPeople" value="<%=username%>"/>
						</div>
					</div>	
					<div class="form-group" style="display:none;">
						<div class="col-sm-5">
							<input type="hidden" class="form-control" id="inputEmail3" name="Institution_loadTime" value="<%=SubmitDate%>"/>
						</div>
					</div>	
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">投资信息</label>
					<div class="col-sm-5">
						<textarea class="form-control" id="id_remark" name="Institution_Investment" rows="3"></textarea>
					</div>
				</div>		
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">备注</label>
					<div class="col-sm-5">
						<textarea class="form-control" id="id_remark" name="Institution_Remark" rows="3"></textarea>
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