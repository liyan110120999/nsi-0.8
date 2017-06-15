<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新学说-注册</title>

		<link href="../assets/css/bootstrap.css" rel="stylesheet" />
	     <!-- FONTAWESOME STYLE CSS -->
	    <link href="../assets/css/font-awesome.css" rel="stylesheet" />
	    <!-- CUSTOM STYLE CSS -->
	    <link href="../assets/css/style.css" rel="stylesheet" />
		<!--     	自定义css -->
	    <link href="../assets/css/MyCss.css" rel="stylesheet" />
		<script src="../assets/js/jquery-1.11.1.js"></script>
	    <!-- BOOTSTRAP SCRIPTS  -->
	    <script src="../assets/js/bootstrap.js"></script>
	    <!-- CUSTOM SCRIPTS  -->
	    <script src="../assets/js/custom.js"></script>
</head>
	<style>
		#registerMainID{
			background-color: #fff;
			width:960px;
			height:708px;
			margin: 50px auto 120px auto;
			border: #E0E0E0 1px solid;
		}
		#headerID{
			height: 36px;
			background-color: #6495C6;
		    border: #5B88B8 1px solid;
		    border-radius: 3px 3px 0 0;
		}
		.header h1{
		    font-size: 14px;
		    line-height: 36px;
		    font-weight: normal;
		    color: #FFF;
		    text-indent: 20px;
		    margin:0;
		}
		.leftDiv{
				background-color: #fff;
			    width: 60%;
			    float: left;
			    padding: 50px 0 36px 10px;
			    zoom: 1;
		}
		.rightDiv{
				background-color: #fff;
				float: left;
				width: 40%;
				height:89%;
		}
		.form{
				padding-top:0;
		}
/* 		提示条 */
		#infoID01{
			background-color:#f50057;
			border-radius:5px;
			margin: 0 20px 0 20px;
		}
	</style>
	
	<script>
			function verification(str)
		{
			  var xmlhttp;    
			  if (str=="")
			  {
			    document.getElementById("myDiv").innerHTML="";
			    return;
			  }
				  if (window.XMLHttpRequest)
				  {
				    // IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
				    xmlhttp=new XMLHttpRequest();
				  }
				  else
				  {
				    // IE6, IE5 浏览器执行代码
				    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
				  }
				  xmlhttp.onreadystatechange=function()
				  {
				    if (xmlhttp.readyState==4 && xmlhttp.status==200)
				    {
				      document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
				    }
				  }
				var Emailv = document.getElementById("EmailID").value;
			  xmlhttp.open("POST","/nsi-0.8/register",true);
			  xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			  xmlhttp.send("registerEmail="+Emailv+"&whereFrom="+str+"");	
			  
// // 			  提交注册信息表单
// 			  var form01=document.getElementById("registerFormID");
// 			  xmlhttp.send(serialize(form01));  
		}
			
			

// 			jq Ajax
		$(function() {
		    $('#submitFromID').click(function() {
		    	fcheck();
		    	if(fcheck()==true){  
			        $.ajax({
			            url: '/nsi-0.8/register',
			            type: 'post',
			            dataType:'json',
			            data: $("#registerFormID").serializeArray(),
			            success: function(msg) {
			            }
			        });	
// 			        添加选项卡02  的链接 ，使之可用
			        $("#tab02ID").attr("href","#tab02");
			        
			        $('#myTab a:last').tab('show')
		    	} 
		    });
		});
		//表单校验	
	
		  function fcheck(){  
			
			EmailID=document.getElementById("EmailID").value;  
		  password01=document.getElementById("PasswdID01").value;  
		  password02=document.getElementById("PasswdID02").value; 
			  
			if(EmailID==""){  
			document.getElementById("infoDiv").innerHTML="<font color='red'>邮箱不能为空！</font>";  
			return false;  
			}  
			else if(password01==""){  
			document.getElementById("infoDiv").innerHTML="<font color='red'>密码不能为空！</font>";  
			return false;  
			}  
			else if(password01.length<6){  
			document.getElementById("infoDiv").innerHTML="<font color='red'>密码不能少于6位！</font>";  
			return false;  
			}  
			else if(password01!=password02){  
			document.getElementById("infoDiv").innerHTML="<font color='red'>两次输入的密码不一致！</font>";  
			return false;  
			}  
			else {  
	 			clear();  
				return true;  
			}  
			}
// 			清除错误信息
		  function clear(){  
			  document.getElementById("infoDiv").innerHTML="";  
		  }		
	</script>
<body>
<!-- 	主窗体 -->
	<div id="registerMainID">
		<header id="headerID"class="header">
		<h1>欢迎注册新学说数据系统</h1>
		</header>	
		
		
		<ul id="myTab" class="nav nav-tabs">
			<li class="active"><a href="#tab01" data-toggle="tab"> 用户基本信息</a></li>
			<li><a id="tab02ID" data-toggle="tab">邮箱验证</a></li>
<!-- 			<li><a id="tab02ID" href="#tab02" data-toggle="tab">邮箱验证</a></li> -->
		</ul>

		
		
<!-- 		左侧表单区 -->
		<div class="leftDiv">
				<div class="container">
					<div class="row clearfix tab-content">
<!-- 			tab01 -->
						<div class="col-md-6 column tab-pane fade in active" id="tab01">
							<form class="form-horizontal form" role="form" id="registerFormID" name="myform">
								<div class="form-group" id="infoID01">
									 <label for="inputEmail3" class="control-label" style="padding-left:20%;">仅对学校机构开放，请使用学校邮箱注册</label>
									 <label for="inputEmail3" class="control-label" style="padding-left:20%;">163、QQ等个人邮箱不能通过审核。</label>									
								</div>
								<br>
								<div class="form-group">
									 <label for="inputEmail3" class="col-sm-4 control-label">邮箱账号</label>
									<div class="col-sm-6">
										<input type="email" class="form-control" id="EmailID" name="Email" />
									</div>			
								</div>
								<div class="form-group">
									 <label for="inputEmail3" class="col-sm-4 control-label">姓名</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="NameID" name="Name" />
									</div>			
								</div>
								<div class="form-group">
									 <label for="inputEmail3" class="col-sm-4 control-label">所属机构</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="companyID" name="company" />
									</div>			
								</div>
								<div class="form-group">
									 <label for="inputEmail3" class="col-sm-4 control-label">职位</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="positionID" name="position" />
									</div>			
								</div>
								<div class="form-group">
									 <label for="inputEmail3" class="col-sm-4 control-label">手机号码</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="phoneID" name="phone"/>
									</div>			
								</div>
								<div class="form-group">
									 <label for="inputEmail3" class="col-sm-4 control-label">密码</label>
									<div class="col-sm-6">
										<input type="password" class="form-control" id="PasswdID01" name="Passwd01" />
									</div>			
								</div>
								<div class="form-group">
									 <label for="inputEmail3" class="col-sm-4 control-label">确认密码</label>
									<div class="col-sm-6">
										<input type="password" class="form-control" id="PasswdID02" name="PasswdID02" />
									</div>			
								</div>
									<div id="infoDiv" class="form-group" style="padding-left:40%;"></div>								
									<div class="col-sm-6" style="margin-left:33%;">
<!-- 										<button type="button" href="#tab02" data-toggle="tab" id="submitFromID" class="btn btn-primary form-control" >下一步</button> -->
										<button type="button" id="submitFromID" class="btn btn-primary form-control" >下一步</button>
									</div>								
						</form>
			</div>
			
<!-- 			tab02 -->
						<div class="col-md-6 column tab-pane fade" id="tab02">
								<h4>正在审核您的信息，审核通过后将会发送激活邮件到您的信箱</h4>
								<h4>请注意查收邮件</h4>
								<h4>完成激活后，您就可以登录了</h4>
								<div class="col-sm-6">
<!-- 									<button type="button" class="btn btn-primary form-control" onclick="">登录</button> -->
									<h4><a href="../login.jsp">登录</a></h4>
								</div>
						</div>		
					</div>
				</div>	
			</div>
				
<!-- 		右侧条幅区域 -->
		<div class="rightDiv">
			
		</div>
		
	</div>
	
</body>
</html>