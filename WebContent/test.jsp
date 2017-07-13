<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
		<link href="/nsi-0.8/assets/css/bootstrap.css" rel="stylesheet" />
	     <!-- FONTAWESOME STYLE CSS -->
	    <link href="/nsi-0.8/assets/css/font-awesome.css" rel="stylesheet" />
	    <!-- CUSTOM STYLE CSS -->
	    <link href="/nsi-0.8/assets/css/style.css" rel="stylesheet" />
	    
	    <link href="/nsi-0.8/assets/css/MyCss.css" rel="stylesheet" />
	    <script src="assets/js/jquery-1.11.1.js"></script>
	    <!-- BOOTSTRAP SCRIPTS  -->
	    <script src="assets/js/bootstrap.js"></script>
	    <!-- CUSTOM SCRIPTS  -->
	    <script src="assets/js/custom.js"></script>
	    
<body>

<!-- 实验详情表 设计 -->
	<div class="container"style="background-color:#c7d0d5; height:950px;width:1300px;" >
	<div style="background-color:#fff;height:980px;width:850px;margin-left:6%;
				padding: 20px;border:1px solid #666;float:left;">
<!-- 页眉  -->
			<div style="background-color:#eee;height:30px;width:810px;padding:6px;margin-bottom:5px;">
				<span class="DT-header">新学说机构库</span>
				<span class="DT-header" style="text-align:right;float:right;">ID:新学说</span>
			</div>
<!-- 				第一块div -->				
			<div style="background-color:#fff;height:150px;width:810px;">
				<div style="background-color:#75a3d1;height:150px;width:150px;float:left;border-radius:5px">
					<img src="/nsi-0.8/assets/img/school-icon.png" alt="Pulpit rock" width="150" height="150">				
				</div>	
				<div style="background-color:#fff;height:150px;width:658px;float:left;">
						<div style="background-color:#fff;height:20%;">				
							<div style="width:67%;text-align:center;float:left;">
								<span class="font-title01" >新学说</span>	 						
							</div>
							<div style="width:33%;text-align:center;float:left;border-left:1px dashed #666;">
								<span class="font-title03">新学说</span>
							</div>						
						</div>	
						<div style="height:40%; background-color:#fff;border-top:1px dashed #666;">
							<div style="width:30%;text-align:center;margin-top:1%;float:left;"><span class="font-title03">业务类型：新学说</span></div>						
							<div style="width:70%;text-align:center;margin-top:1%;float:left;"><span class="font-title03">业务：新学说</span></div>															
						</div>
						<div style="height:50%; background-color:#fff;border-top:1px dashed #666;">
						
						</div>	
				</div>
			</div>
<!-- 			第二段div -->
			<br>
			<div style="background-color:#fff;height:150px;width:810px;border:1px solid #999;padding:10px;">
				<div style="height:30%; background-color:#fff;">
					<div style="width:100%;text-align:center;float:left;background-color:#eee;"><span class="font-title02">基本信息</span></div>
				</div>
				<div style="height:35%; background-color:#fff;border-top:1px dashed #666;">
					<div style="width:50%;text-align:center;margin-top:1%;float:left;"><span class="font-title03">CEO：新学说</span></div>
					<div style="width:50%;text-align:center;margin-top:1%;float:left;"><span class="font-title03">邮箱：新学说</span></div>
				</div>
				<div style="height:35%; background-color:#fff;border-top:1px dashed #666;">
					<div style="width:50%;text-align:center;margin-top:1%;float:left;"><span class="font-title03">电话：新学说</span></div>
					<div style="width:50%;text-align:center;margin-top:1%;float:left;"><span class="font-title03">通讯地址：新学说</span></div>		
				</div>	
			
			</div>
<!-- 			第三段 -->
			<br>
			<div style="background-color:#fff;height:540px;width:810px;border:1px solid #999;padding:15px;">
				<div style="height:10%; background-color:#fff;">
					<div style="width:100%;text-align:center;float:left;background-color:#eee;"><span class="font-title02">详细信息</span></div>
				</div>
				<div style="height:10%; background-color:#fff;border-top:1px dashed #666;">
					<div style="width:50%;text-align:center;margin-top:1%;float:left;"><span class="font-title03">法人：新学说</span></div>
					<div style="width:50%;text-align:center;margin-top:1%;float:left;"><span class="font-title03">官网：<a href="http:\\新学说" target="_blank">新学说</a></span></div>
				</div>
				<div style="height:10%; background-color:#fff;border-top:1px dashed #666;">
					<div style="width:50%;text-align:center;margin-top:1%;float:left;"><span class="font-title03">提交者：新学说</span></div>
					<div style="width:50%;text-align:center;margin-top:1%;float:left;"><span class="font-title03">提交时间：新学说</span></div>
				</div>
				<div style="height:70%; background-color:#fff;">
					<div style="width:100%;text-align:center;">
						<span class="font-title03">介绍</span>
						<textarea class="form-control" id="" name="" rows="4">新学说</textarea>
					</div>
					<div style="width:100%;text-align:center;">
						<span class="font-title03">投资信息</span>
						<textarea class="form-control" id="" name="" rows="4">新学说</textarea>
					</div>
					<div style="width:100%;text-align:center;">
						<span class="font-title03">备注</span>
						<textarea class="form-control" id="" name="" rows="4">新学说</textarea>
					</div>		
				</div>			
			</div>	
			
			
			<div>
					<!-- 	修改按钮的表单 -->
					<form class="" role="form" action="Institution_servlet" id="alterForm" name="myform01" method="post">
							<div class="form-group">
								<div class="col-sm-offset-6 col-sm-10 ">													
									<input type="hidden" name="whereFrom" value="alterButton">																					
									<input type="hidden" name="alter_institution_id" value='新学说'>	
								</div>
							</div>
					</form>
					<!-- 	删除按钮的表单 -->
					<form class="" role="form" action="Institution_servlet" id="deleteForm" name="myform02" method="post">
							<div class="form-group">
								<div class="col-sm-offset-6 col-sm-10 ">													
									<input type="hidden" name="whereFrom" value="deleteButton">																					
									<input type="hidden" name="alter_Institution_id" value='新学说'>	
								</div>
							</div>
					</form>
<!-- 					上传图片按钮	 -->
					<form class="" role="form" action="/nsi-0.8/people/People_UpImage.jsp" id="UpImageForm" name="myform03" method="post">
							<div class="form-group">
								<div class="col-sm-offset-6 col-sm-10 ">													
									<input type="hidden" name="whereFrom" value="UpImage">																					
									<input type="hidden" name="UpImage_people_id" value='<%%>'>	
								</div>
							</div>
					</form>
			</div>
		</div>

<!-- 		右侧工具栏 -->
		<div class="col-xs-6 col-sm-3 sidebar-offcanvas noprint" id="sidebar" style="float:left; width:200px;margin-left:5%;">
          <div class="list-group">
            <a href="#" class="list-group-item active">工具栏</a>
            <a href="javascript:void(0)" class="list-group-item text-center" onclick="SubmitAlter()">修改</a>
            <a href="javascript:void(0)" class="list-group-item text-center" onclick="ConfirmDelete()">删除</a>
            <a href="javascript:void(0)" class="list-group-item text-center" onclick="javascript:window.print()">打印</a>
<!--             <a href="javascript:void(0)" class="list-group-item text-center" onclick="UpImageSubmit()">上传机构logo图片</a> -->
            <a href="javascript:void(0)" class="list-group-item text-center">其他</a>
        	<a href="javascript:void(0)" class="list-group-item text-center">其他</a>
          </div>
        </div><!--/.sidebar-offcanvas-->
</div>
</body>
</html>