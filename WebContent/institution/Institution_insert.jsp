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
		    
		    <script src="/nsi-0.8/assets/js/jquery-1.11.1.js"></script>
		    <!-- BOOTSTRAP SCRIPTS  -->
		    <script src="/nsi-0.8/assets/js/bootstrap.js"></script>
		    <!-- CUSTOM SCRIPTS  -->
		    <script src="/nsi-0.8/assets/js/custom.js"></script>
		    
		   	<script src="/nsi-0.8/assets/js/user.js"></script>

</head>
	
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
					 <a class="btn btn-primary btn-large" href="Institution_list.jsp">返回查询页面</a>
				</p>
			</div>
			
			<form class="form-horizontal" role="form" action="/nsi-0.8/Institution_servlet" name="myform" method="post" >
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">公司名</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="userid" onblur="checkUserid()" name="Institution_name" />
					</div>
					<div> <span id="useridSpan" style=" color:#999"><h5>请输入公司名称</h5></span>  </div>								
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
				
				<div>	
	                <div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">公司业务</label>
						<div class="col-sm-5">
	 						<input type="text" class="form-control" name="Institution_Service"/>
						</div>
						<div> <span id="useridSpan" style=" color:#999"><h5>一句话描述</h5></span>  </div>
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
					 <label for="inputEmail3" class="col-sm-2 control-label">介绍</label>
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
						<input type="text" class="form-control" id="inputEmail3" name="Institution_Investment"/>
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