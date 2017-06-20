<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">
      
	    <link href="assets/css/bootstrap.css" rel="stylesheet" />
	     <!-- FONTAWESOME STYLE CSS -->
	    <link href="assets/css/font-awesome.css" rel="stylesheet" />
	    <!-- CUSTOM STYLE CSS -->
	    <link href="assets/css/style.css" rel="stylesheet" />
		<script src="assets/js/jquery-1.11.1.js"></script>
	    <!-- BOOTSTRAP SCRIPTS  -->
	    <script src="assets/js/bootstrap.js"></script>
	    <!-- CUSTOM SCRIPTS  -->
	    <script src="assets/js/custom.js"></script>

    
    <title>新学说-激活成功</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

  </head>
  
  <body>
    <br><br><br><br>
		  <div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<div class="jumbotron">
						<h1>
							邮箱激活成功
						</h1>
						<p>
							请等待后台审核，审核通过后您就可以登陆了
						</p>
						<br><br>
						<p>
							 <a class="btn btn-primary btn-large" href="http://47.92.84.36:8080/nsi-0.8/">登 录</a>
						</p>
					</div>
				</div>
			</div>
		</div>
  </body>
</html>