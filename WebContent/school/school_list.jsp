<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	
	<link href="/nsi-0.8/assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLE CSS -->
    <link href="/nsi-0.8/assets/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLE CSS -->
    <link href="/nsi-0.8/assets/css/style.css" rel="stylesheet" />
    
    <link href="/nsi-0.8/assets/css/pagination.css" rel="stylesheet" />
    <script src="/nsi-0.8/assets/js/jquery-1.11.1.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="/nsi-0.8/assets/js/bootstrap.js"></script>
    <!-- CUSTOM SCRIPTS  -->
    <script src="/nsi-0.8/assets/js/custom.js"></script>
    
    <script src="/nsi-0.8/assets/js/jquery.pagination.js"></script>
    
    <!-- 	模块-复选框 -->
	<link rel="stylesheet" href="../assets/Modular/checkbox/jquery-labelauty.css">
	<script src="../assets/Modular/checkbox/jquery-labelauty.js"></script>

<title>Insert title here</title>
</head>
	<script>  
		function aaa(number){
// 			if ( this.checked == ture){
			var x =document.getElementById('textId01');
			x.value=x.value+number;	
			
		}
	</script>  
<body>
	
	<!-- 高级搜索选择框 -->
	<form action="../School_servlet" method="post">
		<button type="button" class="btn btn-primary" onclick='aaa(001)'>01</button>	
  		<button type="button" class="btn btn-primary" onclick="aaa(002)">01</button>
  		<button type="button" class="btn btn-primary" onclick="aaa(003)">01</button>
  		
  		<label><input name="Fruit" type="checkbox" onclick='aaa(004)' value="04," />苹果 </label> 
		<label><input name="Fruit" type="checkbox" onclick='aaa(005)' value="05," />桃子 </label> 
		<label><input name="Fruit" type="checkbox" onclick='aaa(006)' value="06," />香蕉 </label> 
		<label><input name="Fruit" type="checkbox" onclick='aaa(007)' value="07," />梨 </label> 
		
  		<input type="text" id="textId01" value="000" name="tempString"/>
  
		<button type="submit" class="btn btn-primary" id="AdvanceSubmitID">提交</button>
	</form>
	
<!-- 	搜索区 -->
	<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> 
						 <span class="sr-only">Toggle navigation</span>
						 <span class="icon-bar"></span>
						 <span class="icon-bar"></span>
						 <span class="icon-bar"></span>
					 </button> <a class="navbar-brand" href="http://www.xinxueshuo.cn">新学说</a>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="dropdown">
							 <a href="insert.jsp">新增</a>				 
						</li>
						<li>
							 <a href="show/map_show.html">地图分布</a>
						</li>
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">可视化<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									 <a href="show/histogram.jsp">条形图</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="#">echart</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="#">echart</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="#">echart</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="#">echart</a>
								</li>
							</ul>
						</li>
					</ul>
						<form class="navbar-form navbar-left" role="search" action="servlet" name="myform" method="post">
							<div class="form-group">
<!-- 								防止搜索框出现null -->
<%-- 								<%if(School_name!=null){%> --%>
<%-- 									<input type="text" value="<%=School_name%>" style="width:300px" class="form-control" name="School_name" /> --%>
<%-- 								<%}else{%> --%>
<!-- 									<input type="text" class="form-control" style="width:300px" name="School_name" /> -->
<%-- 									<%}%>							 --%>
								<input type="hidden" name="whereFrom" value="search">
							</div> 
							<button type="submit" name="submit" class="btn btn-primary">搜索</button>
						</form>
						
<!-- 						高级搜索 -->
						<form class="navbar-form navbar-left" style="padding:0;" role="search" action="servlet" name="myform" method="post">
							<div class="form-group">
<!-- 								<input type="text" class="form-control" style="width:300px" name="School_name" />												 -->
								<input type="hidden" name="whereFrom" value="search">
							</div> 
							<button type="button" name="submit" class="btn btn-primary" onclick="showAdvancedSearch()">高级搜索</button>
<!-- 							<button type="button" name="submit" class="btn btn-primary">高级搜索</button> -->
						</form>
						
						
					<ul class="nav navbar-nav navbar-right">
						<li>
							 <a href="#" data-toggle="modal" data-target="#myModal">用户：</a>
						</li>
						
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">菜单<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									 <a href="#" data-toggle="modal" data-target="#myModal">用户信息</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="#" data-toggle="modal" data-target="#myModal02">修改密码</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="#">null</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="#">null</a>
								</li>
							</ul>
						</li>
						
					</ul>
				</div>
			</nav>
		</div>
	</div>
	<br>
</div>
<!-- 表格区 -->

</body>
</html>